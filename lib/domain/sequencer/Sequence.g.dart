// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sequence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sequence _$SequenceFromJson(Map<String, dynamic> json) {
  return Sequence(
    (json['steps'] as List)
        ?.map((e) =>
            e == null ? null : SequenceStep.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['name'] as String,
  )
    ..id = json['id'] as int
    ..currentStep = json['currentStep'] as int
    ..isSoloed = json['isSoloed'] as bool
    ..isMuted = json['isMuted'] as bool;
}

Map<String, dynamic> _$SequenceToJson(Sequence instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'steps': instance.steps?.map((e) => e?.toJson())?.toList(),
      'currentStep': instance.currentStep,
      'isSoloed': instance.isSoloed,
      'isMuted': instance.isMuted,
    };
