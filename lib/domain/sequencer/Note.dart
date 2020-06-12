import 'package:json_annotation/json_annotation.dart';
part 'Note.g.dart';

@JsonSerializable()
class Note {
  int midiNote;

  Note(this.midiNote);

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
