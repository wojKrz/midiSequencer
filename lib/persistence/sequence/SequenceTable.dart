import 'package:moor/moor.dart';

class SequenceTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  /// Foreign key, id of the song sequence belongs to.
  IntColumn get songId => integer()();

  /// Serialized sequence data.
  TextColumn get sequenceSteps => text()();
}
