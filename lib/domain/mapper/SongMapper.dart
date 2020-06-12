import 'package:fluttermidisequencer/domain/song/Song.dart';
import 'package:fluttermidisequencer/persistence/MainDatabase.dart';

Song mapSongPersistenceToDomain(SongTableData tableData) =>
  Song(tableData.id, tableData.title);
