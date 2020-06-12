import 'package:fluttermidisequencer/persistence/sequence/SequenceTable.dart';
import 'package:fluttermidisequencer/persistence/sequence/SequenceDao.dart';
import 'package:fluttermidisequencer/persistence/song/SongDao.dart';
import 'package:fluttermidisequencer/persistence/song/SongTable.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:moor/moor.dart';
import 'dart:io';
part 'MainDatabase.g.dart';

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(tables: [SequenceTable, SongTable], daos: [SequenceDao, SongDao])
class MainDatabase extends _$MainDatabase {
  MainDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

}
