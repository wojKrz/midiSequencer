import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermidisequencer/domain/mapper/SongMapper.dart';
import 'package:fluttermidisequencer/domain/song/Song.dart';
import 'package:fluttermidisequencer/persistence/song/SongDao.dart';

//region Event

abstract class SongListEvent extends Equatable {}

class LoadSongListEvent extends SongListEvent {
  @override
  List<Object> get props => [];
}

class NewSongListEvent extends SongListEvent {
  final List<Song> _list;

  NewSongListEvent(this._list);

  @override
  List<Object> get props => [_list];
}

class CreateSongEvent extends SongListEvent {

  @override
  List<Object> get props => [];
}

class DeleteSongEvent extends SongListEvent {
  final _songId;

  DeleteSongEvent(this._songId);

  @override
  List<Object> get props => [_songId];
}

//endregion

//region State

abstract class BaseSongListState extends Equatable {}

class LoadingSongListState extends BaseSongListState {
  @override
  List<Object> get props => [];
}

class SongListState extends BaseSongListState {
  final List<Song> songList;

  SongListState(this.songList);

  @override
  List<Object> get props => [songList];
}

//endregion

//region Bloc

class SongListBloc extends Bloc<SongListEvent, BaseSongListState> {
  final SongDao _songDao;
  StreamSubscription songListSubscription;

  SongListBloc(this._songDao) : super() {
    songListSubscription?.cancel();
    songListSubscription = _songDao
        .observeAllSongs()
        .map((songList) => songList.map((song) => mapSongPersistenceToDomain(song)).toList())
        .listen((event) => add(NewSongListEvent(event)));
  }

  @override
  get initialState => LoadingSongListState();

  @override
  Stream<BaseSongListState> mapEventToState(SongListEvent event) async* {
    if(event is CreateSongEvent) {
      _songDao.createSong();
    }
    if(event is DeleteSongEvent) {
      _songDao.deleteSong(event._songId);
    }
    if (event is NewSongListEvent) {
      // State with songs list.
      yield SongListState(event._list);
    }
  }

  @override
  Future<Function> close() {
    songListSubscription?.cancel();
    return super.close();
  }
}

//endregion
