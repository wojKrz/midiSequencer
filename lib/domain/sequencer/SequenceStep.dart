import 'package:json_annotation/json_annotation.dart';
import 'Note.dart';

part 'SequenceStep.g.dart';

@JsonSerializable(explicitToJson: true)
class SequenceStep {
  Note note;
  /// How long does the gate is on during this step.
  double gateLength;
  int velocity;
  bool isOn;

  SequenceStep(this.note, this.gateLength, this.velocity, this.isOn);

  factory SequenceStep.fromJson(Map<String, dynamic> json) => _$SequenceStepFromJson(json);
  Map<String, dynamic> toJson() => _$SequenceStepToJson(this);
}