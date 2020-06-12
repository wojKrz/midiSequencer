import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttermidisequencer/domain/song/SongBloc.dart';
import 'package:fluttermidisequencer/domain/song/SongListBloc.dart';
import 'package:fluttermidisequencer/persistence/DatabaseProvider.dart';
import 'widget/song/SongViewScreen.dart';
import 'widget/songlist/SongListScreen.dart';

final databaseProvider = DatabaseProvider();

class AppRoutes {

  static final home = "/";
  static final songView = "/songView";
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: (settings) {
          if(settings.name == AppRoutes.songView) {
            final songId = settings.arguments as int;
            return MaterialPageRoute(builder: (context) => BlocProvider.value(
                value: SongBloc(songId, databaseProvider.provideSequenceDao()),
                child: SongViewScreen())
            );
          }
          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
        routes: {
          AppRoutes.home: (context) => BlocProvider.value(
              value: SongListBloc(databaseProvider.provideSongDao()),
              child: SongListScreen()),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      );
}
