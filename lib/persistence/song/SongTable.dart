import 'package:moor/moor.dart';

class SongTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}