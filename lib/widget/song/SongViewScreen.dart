import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermidisequencer/domain/sequencer/Sequence.dart';
import 'package:fluttermidisequencer/domain/song/SongBloc.dart';

class SongViewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _onAddSequenceClicked(context),
        ),
        body: BlocBuilder<SongBloc, BaseSongState>(builder: (context, state) {
          if (state is SequencesListState) {
            return ListView.builder(
              itemCount: state.sequencerList.length,
              itemBuilder: (context, index) => _buildSequenceItem(
                  context, state.sequencerList[index].getSequence()),
            );
          }
          return Center();
        }),
      );

  Widget _buildSequenceItem(BuildContext context, Sequence sequence) => Card(
        child: InkWell(
          onTap: () =>_onSequenceItemClicked(context),
          child: Row(
            children: [
              Text(sequence.name),
              Column(children: <Widget>[
                FlatButton(onPressed: () => _onMuteSequenceClicked(sequence.id), child: Text("M")),
                FlatButton(onPressed: () => _onSoloSequenceClicked(sequence.id), child: Text("S"),)
              ],)
            ]),
      ));

  void _onAddSequenceClicked(BuildContext context) =>
      context.bloc<SongBloc>().add(AddNewSequenceEvent());

  void _onSequenceItemClicked(BuildContext context) {}

  void _onMuteSequenceClicked(int sequenceId) {

  }

  void _onSoloSequenceClicked(int sequenceId) {

  }
}
