import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermidisequencer/domain/mapper/SequenceMapper.dart';
import 'package:fluttermidisequencer/domain/sequencer/Sequence.dart';
import 'package:fluttermidisequencer/domain/sequencer/SequenceStep.dart';
import 'package:fluttermidisequencer/domain/sequencer/Sequencer.dart';
import 'package:fluttermidisequencer/persistence/sequence/SequenceDao.dart';

//region Event

abstract class SongEvent extends Equatable {}

class AddNewSequenceEvent extends SongEvent {
  @override
  List<Object> get props => [];
}

//endregion

//region State

abstract class BaseSongState extends Equatable {}

class SequencesListState extends BaseSongState {
  final List<Sequencer> sequencerList;

  SequencesListState(this.sequencerList);

  @override
  List<Object> get props => [sequencerList.hashCode];
}

//endregion

//region Bloc

class SongBloc extends Bloc<SongEvent, BaseSongState> {
  final int _songId;

  final SequenceDao _sequenceDao;

  List<Sequencer> _sequencerList = List();

  SongBloc(this._songId, this._sequenceDao);

  @override
  BaseSongState get initialState => SequencesListState(_sequencerList);

  @override
  Stream<BaseSongState> mapEventToState(SongEvent event) async* {
    if (event is AddNewSequenceEvent) {
      final sequence = Sequence.createDefault(8, "New sequence");

      final newSequence = await _sequenceDao
          .addSequenceToSong(mapSequenceDomainToPersistence(_songId, sequence));

      List steps =
          jsonDecode(newSequence.sequenceSteps, reviver: (k, v) {
        if (v is Map) {
          return new SequenceStep.fromJson(v);
        }
        return v;
      });

      _sequencerList.add(SimpleStepSequencer(Sequence(steps.cast(), "")));

      yield SequencesListState(List.of(_sequencerList));
    }
  }
}

//endregion
