import 'dart:convert';
import 'package:fluttermidisequencer/domain/mapper/Util.dart';
import 'package:fluttermidisequencer/domain/sequencer/Sequence.dart';
import 'package:fluttermidisequencer/persistence/MainDatabase.dart';
import 'package:moor/moor.dart';

Sequence mapSequencePersistenceToDomain(SequenceTableData tableData) =>
    Sequence(jsonDecode(tableData.sequenceSteps), tableData.name);

SequenceTableCompanion mapSequenceDomainToPersistence(int songId, Sequence sequence) =>
    SequenceTableCompanion(
      id: objectToDbValueOrAbsent(sequence.id),
      sequenceSteps: Value(jsonEncode(sequence.steps)),
      name: Value(sequence.name),
      songId: Value(songId)
    );
