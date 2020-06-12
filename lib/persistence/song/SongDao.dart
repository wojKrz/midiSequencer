import 'package:fluttermidisequencer/persistence/MainDatabase.dart';
import 'package:fluttermidisequencer/persistence/song/SongTable.dart';
import 'package:moor/moor.dart';

part 'SongDao.g.dart';

@UseDao(tables: [SongTable])
class SongDao extends DatabaseAccessor<MainDatabase> with _$SongDaoMixin {
  final String defaultSongName = "New song";

  SongDao(MainDatabase db) : super(db);

  Stream<List<SongTableData>> observeAllSongs() => select(songTable).watch();

  Future<void> createSong() {
    SongTableCompanion newSong =
        SongTableCompanion(title: Value(defaultSongName));

    return into(songTable).insert(newSong);
  }

  Future<void> deleteSong(int songId) =>
      (delete(songTable)..where((tbl) => tbl.id.equals(songId))).go();
}
