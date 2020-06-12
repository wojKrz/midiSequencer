import 'package:fluttermidisequencer/persistence/MainDatabase.dart';
import 'package:fluttermidisequencer/persistence/sequence/SequenceTable.dart';
import 'package:moor/moor.dart';

part 'SequenceDao.g.dart';

@UseDao(tables: [SequenceTable])
class SequenceDao extends DatabaseAccessor<MainDatabase>
    with _$SequenceDaoMixin {
  SequenceDao(MainDatabase db) : super(db);

  Stream<List<SequenceTableData>> observeSequencesInSong(int songId) =>
      (select(sequenceTable)
        ..where((tbl) => tbl.songId.equals(songId)))
          .watch();

  Future<SequenceTableData> addSequenceToSong(SequenceTableCompanion sequence) {

    /// Insert sequence into database and get that entry by result id.
    return into(sequenceTable).insertOnConflictUpdate(sequence).then(
            (resultId) =>
            (select(sequenceTable)
              ..where((tbl) => tbl.id.equals(resultId)))
                .getSingle());
  }
}
