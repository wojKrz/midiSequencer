import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermidisequencer/domain/song/Song.dart';
import 'package:fluttermidisequencer/domain/song/SongListBloc.dart';
import 'package:fluttermidisequencer/main.dart';

class SongListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: () => _onAddSongClicked(context)),
        body: BlocBuilder<SongListBloc, BaseSongListState>(
            builder: (context, state) {
          if (state is LoadingSongListState) {
            // Display progress on loading.
            return Center(child: CircularProgressIndicator());
          }
          if (state is SongListState) {
            if (state.songList.length == 0) {
              // Display placeholder for empty list.
              return Text("You don't have any songs yet");
            } else {
              // Display recycled list when data is available.
              return ListView.builder(
                  itemCount: state.songList.length,
                  itemBuilder: (context, index) => _createSongListView(
                      context, state.songList[index], _onSongItemClicked));
            }
          }
          return Center();
        }),
      );

  Widget _createSongListView(
          BuildContext context, Song song, Function onClick) =>
      Card(
          child: InkWell(
              onTap: () => onClick(context, song.id),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(song.title),
                    FlatButton(
                      onPressed: () => _onDeleteSongClicked(context, song.id),
                      child: Icon(Icons.delete_forever),
                    )
                  ],
                ),
              )));

  void _onSongItemClicked(BuildContext context, int songId) {
    Navigator.of(context).pushNamed(AppRoutes.songView, arguments: songId);
  }

  void _onAddSongClicked(BuildContext context) {
    context.bloc<SongListBloc>().add(CreateSongEvent());
  }

  void _onDeleteSongClicked(BuildContext context, int songId) {
    context.bloc<SongListBloc>().add(DeleteSongEvent(songId));
  }
}
