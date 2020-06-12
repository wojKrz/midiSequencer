// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SequenceStep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SequenceStep _$SequenceStepFromJson(Map<String, dynamic> json) {
  return SequenceStep(
    json['note'] == null
        ? null
        : Note.fromJson(json['note'] as Map<String, dynamic>),
    (json['gateLength'] as num)?.toDouble(),
    json['velocity'] as int,
    json['isOn'] as bool,
  );
}

Map<String, dynamic> _$SequenceStepToJson(SequenceStep instance) =>
    <String, dynamic>{
      'note': instance.note?.toJson(),
      'gateLength': instance.gateLength,
      'velocity': instance.velocity,
      'isOn': instance.isOn,
    };
