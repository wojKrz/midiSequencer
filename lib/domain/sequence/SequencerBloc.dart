import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttermidisequencer/domain/sequencer/Note.dart';
import 'package:fluttermidisequencer/domain/sequencer/Sequence.dart';
import 'package:fluttermidisequencer/domain/sequencer/SequenceStep.dart';
import 'package:fluttermidisequencer/domain/sequencer/Sequencer.dart';

//region Event

abstract class SequencerEvent extends Equatable {}

class ToggleSequencerEvent extends SequencerEvent {
  @override
  List<Object> get props => [];
}

class StepSequenceForwardEvent extends SequencerEvent {
  @override
  List<Object> get props => [];
}

class ToggleStepActiveEvent extends SequencerEvent {
  final int stepToToggle;

  ToggleStepActiveEvent(this.stepToToggle);

  @override
  List<Object> get props => [stepToToggle];
}

class SetSequenceTitle extends SequencerEvent {
  final String newTitle;

  SetSequenceTitle(this.newTitle);

  @override
  List<Object> get props => [newTitle];
}

//endregion

//region State

class SequencerStepState extends Equatable {
  final bool isOn;

  SequencerStepState(this.isOn);

  @override
  List<Object> get props => [isOn];
}

class SequencerState extends Equatable {
  final bool running;
  final int currentStep;
  final int tempo;
  final List<SequencerStepState> steps;
  final String title;

  SequencerState(
      {this.running, this.currentStep, this.tempo, this.steps, this.title});

  SequencerState copyWith(
          {bool running,
          int currentState,
          int tempo,
          List<SequenceStep> steps,
          String title}) =>
      SequencerState(
          running: running ?? this.running,
          currentStep: currentState ?? this.currentStep,
          tempo: tempo ?? this.tempo,
          steps: steps
                  ?.map((step) => SequencerStepState(step.isOn))
                  ?.toList(growable: false) ??
              this.steps,
          title: title ?? this.title);

  @override
  List<Object> get props => [running, currentStep, tempo, steps, title];
}

//endregion

class SequencerPlayerBloc extends Bloc<SequencerEvent, SequencerState> {
  Sequencer _sequencer;

  Timer _currentTimer;

  SequencerPlayerBloc(Sequence sequence) {
    this._sequencer = SimpleStepSequencer(sequence);
  }

  @override
  SequencerState get initialState {
    final steps = _sequencer
        .getSteps()
        .map((step) => SequencerStepState(step.isOn))
        .toList(growable: false);

    return SequencerState(
        running: false, currentStep: 0, tempo: 120, steps: steps, title: "New Sequence");
  }

  @override
  Stream<SequencerState> mapEventToState(SequencerEvent event) async* {
    if (event is ToggleSequencerEvent) {
      final resolvedIsRunning = !state.running;

      if (resolvedIsRunning) {
        _startTimer();
      } else {
        _stopTimer();
      }

      yield state.copyWith(running: resolvedIsRunning);
    } else if (event is StepSequenceForwardEvent) {
      // Play current step and then proceed with the sequence.
      _sequencer.playCurrentStep();
      _sequencer.stepForward();

      // State with current step changed.
      yield state.copyWith(currentState: _sequencer.getCurrentStepIndex());
    } else if (event is ToggleStepActiveEvent) {

      _sequencer.toggleStepOn(event.stepToToggle);

      // State with new set of steps data.
      yield state.copyWith(steps: _sequencer.getSteps());
    } else if (event is SetSequenceTitle) {

      // State with new title.
      yield state.copyWith(title: event.newTitle);
    } else {

      // Event was not found.
      print("Event " +
          event.toString() +
          " cannot be handled by " +
          this.toString());
    }
  }

  void _startTimer() {
    // Stop timer just in case.
    _stopTimer();

    // Calculate step duration.
    final stepDurationMilis = (60 / _sequencer.bpm * 1000).toInt();

    // Send init step event as timer will fire off after given duration.
    add(StepSequenceForwardEvent());

    // Setup timer.
    _currentTimer =
        Timer.periodic(Duration(milliseconds: stepDurationMilis), (_) {
      // On event, fire off step.
      add(StepSequenceForwardEvent());
    });
  }

  void _stopTimer() {
    _currentTimer?.cancel();
  }

  void setNoteOnStep(Note note, int step) {
    _sequencer.setStep(note, step);
  }

  void toggleStepOn(int step) {
    _sequencer.toggleStepOn(step);
  }
}
