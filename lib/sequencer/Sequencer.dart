import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_midi_command/flutter_midi_command_messages.dart';
import 'package:fluttermidisequencer/sequencer/Note.dart';

class SequenceStep {
  Note note;

  /// How long does the gate is on during this step.
  double gateLength;
  int velocity;

  bool isOn;

  SequenceStep(this.note, this.gateLength, this.velocity, this.isOn);
}

class Sequence {
  Sequence(int stepCount) {
    steps = List.generate(stepCount, (_) => SequenceStep(null, .5, 127, true));
  }

  List<SequenceStep> steps;
  int currentStep = 0;
}

abstract class Sequencer {

  int bpm;

  void stepForward();

  SequenceStep getCurrentStep();

  List<SequenceStep> getSteps();

  int getCurrentStepIndex();

  void setStep(Note note, int step);

  void playCurrentStep();

  void toggleStepOn(int step);
}

class SimpleStepSequencer implements Sequencer {
  Sequence _sequence;

  int bpm = 120;

  SimpleStepSequencer(int stepCount) {
    _sequence = Sequence(stepCount);
  }

  @override
  void stepForward() {
    _sequence.currentStep = ++_sequence.currentStep % _sequence.steps.length;
  }

  @override
  SequenceStep getCurrentStep() => _sequence.steps[_sequence.currentStep];

  @override
  List<SequenceStep> getSteps() => _sequence.steps;

  @override
  int getCurrentStepIndex() => _sequence.currentStep;

  @override
  void setStep(Note note, int step) {
    if (_sequence.steps[step] == null) {
      _sequence.steps[step] = SequenceStep(note, .5, 127, true);
    } else {
      _sequence.steps[step].note = note;
    }
  }

  @override
  void toggleStepOn(int step) {
    _sequence.steps[step].isOn = !_sequence.steps[step].isOn;
  }

  @override
  void playCurrentStep() {
    final channel = 1;
    final note = _sequence.steps[_sequence.currentStep]?.note?.midiNote;
    final velocity = _sequence.steps[_sequence.currentStep].velocity;

    if(note == null) return;

    if(!_sequence.steps[_sequence.currentStep].isOn ?? false) return;

    NoteOnMessage(channel: channel, note: note, velocity: velocity).send();

    Timer(Duration(milliseconds: (60 / bpm * 1000 * 0.5).toInt()), () {
      NoteOffMessage(channel: channel, note: note, velocity: velocity).send();
    });
  }
}
