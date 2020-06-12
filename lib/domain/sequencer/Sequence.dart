import 'package:json_annotation/json_annotation.dart';

import 'SequenceStep.dart';

part 'Sequence.g.dart';

@JsonSerializable(explicitToJson: true)
class Sequence {

  Sequence.createDefault(int stepCount, this.name) {
    steps = List.generate(stepCount, (_) => SequenceStep(null, .5, 127, true));
  }

  Sequence(this.steps, this.name);

  int id;
  String name;

  List<SequenceStep> steps;
  int currentStep = 0;
  bool isSoloed = false;
  bool isMuted = false;

  factory Sequence.fromJson(Map<String, dynamic> json) => _$SequenceFromJson(json);
  Map<String, dynamic> toJson() => _$SequenceToJson(this);

}