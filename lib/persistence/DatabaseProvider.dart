import 'package:fluttermidisequencer/persistence/MainDatabase.dart';
import 'package:fluttermidisequencer/persistence/sequence/SequenceDao.dart';
import 'package:fluttermidisequencer/persistence/song/SongDao.dart';

class DatabaseProvider {

  static final MainDatabase _databaseInstance = MainDatabase();

  MainDatabase provideDatabase() => _databaseInstance;

  static final SongDao _songDao  = SongDao(_databaseInstance);

  SongDao provideSongDao() => _songDao;

  static final SequenceDao _sequenceDao = SequenceDao(_databaseInstance);

  SequenceDao provideSequenceDao() => _sequenceDao;
}