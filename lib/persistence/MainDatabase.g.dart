// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainDatabase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class SequenceTableData extends DataClass
    implements Insertable<SequenceTableData> {
  final int id;
  final String name;
  final int songId;
  final String sequenceSteps;
  SequenceTableData(
      {@required this.id,
      @required this.name,
      @required this.songId,
      @required this.sequenceSteps});
  factory SequenceTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return SequenceTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      songId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}song_id']),
      sequenceSteps: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}sequence_steps']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || songId != null) {
      map['song_id'] = Variable<int>(songId);
    }
    if (!nullToAbsent || sequenceSteps != null) {
      map['sequence_steps'] = Variable<String>(sequenceSteps);
    }
    return map;
  }

  SequenceTableCompanion toCompanion(bool nullToAbsent) {
    return SequenceTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      songId:
          songId == null && nullToAbsent ? const Value.absent() : Value(songId),
      sequenceSteps: sequenceSteps == null && nullToAbsent
          ? const Value.absent()
          : Value(sequenceSteps),
    );
  }

  factory SequenceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SequenceTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      songId: serializer.fromJson<int>(json['songId']),
      sequenceSteps: serializer.fromJson<String>(json['sequenceSteps']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'songId': serializer.toJson<int>(songId),
      'sequenceSteps': serializer.toJson<String>(sequenceSteps),
    };
  }

  SequenceTableData copyWith(
          {int id, String name, int songId, String sequenceSteps}) =>
      SequenceTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        songId: songId ?? this.songId,
        sequenceSteps: sequenceSteps ?? this.sequenceSteps,
      );
  @override
  String toString() {
    return (StringBuffer('SequenceTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('songId: $songId, ')
          ..write('sequenceSteps: $sequenceSteps')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(songId.hashCode, sequenceSteps.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SequenceTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.songId == this.songId &&
          other.sequenceSteps == this.sequenceSteps);
}

class SequenceTableCompanion extends UpdateCompanion<SequenceTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> songId;
  final Value<String> sequenceSteps;
  const SequenceTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.songId = const Value.absent(),
    this.sequenceSteps = const Value.absent(),
  });
  SequenceTableCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int songId,
    @required String sequenceSteps,
  })  : name = Value(name),
        songId = Value(songId),
        sequenceSteps = Value(sequenceSteps);
  static Insertable<SequenceTableData> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> songId,
    Expression<String> sequenceSteps,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (songId != null) 'song_id': songId,
      if (sequenceSteps != null) 'sequence_steps': sequenceSteps,
    });
  }

  SequenceTableCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<int> songId,
      Value<String> sequenceSteps}) {
    return SequenceTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      songId: songId ?? this.songId,
      sequenceSteps: sequenceSteps ?? this.sequenceSteps,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<int>(songId.value);
    }
    if (sequenceSteps.present) {
      map['sequence_steps'] = Variable<String>(sequenceSteps.value);
    }
    return map;
  }
}

class $SequenceTableTable extends SequenceTable
    with TableInfo<$SequenceTableTable, SequenceTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SequenceTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _songIdMeta = const VerificationMeta('songId');
  GeneratedIntColumn _songId;
  @override
  GeneratedIntColumn get songId => _songId ??= _constructSongId();
  GeneratedIntColumn _constructSongId() {
    return GeneratedIntColumn(
      'song_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _sequenceStepsMeta =
      const VerificationMeta('sequenceSteps');
  GeneratedTextColumn _sequenceSteps;
  @override
  GeneratedTextColumn get sequenceSteps =>
      _sequenceSteps ??= _constructSequenceSteps();
  GeneratedTextColumn _constructSequenceSteps() {
    return GeneratedTextColumn(
      'sequence_steps',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, songId, sequenceSteps];
  @override
  $SequenceTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sequence_table';
  @override
  final String actualTableName = 'sequence_table';
  @override
  VerificationContext validateIntegrity(Insertable<SequenceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('song_id')) {
      context.handle(_songIdMeta,
          songId.isAcceptableOrUnknown(data['song_id'], _songIdMeta));
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('sequence_steps')) {
      context.handle(
          _sequenceStepsMeta,
          sequenceSteps.isAcceptableOrUnknown(
              data['sequence_steps'], _sequenceStepsMeta));
    } else if (isInserting) {
      context.missing(_sequenceStepsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SequenceTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SequenceTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SequenceTableTable createAlias(String alias) {
    return $SequenceTableTable(_db, alias);
  }
}

class SongTableData extends DataClass implements Insertable<SongTableData> {
  final int id;
  final String title;
  SongTableData({@required this.id, @required this.title});
  factory SongTableData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return SongTableData(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    return map;
  }

  SongTableCompanion toCompanion(bool nullToAbsent) {
    return SongTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
    );
  }

  factory SongTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SongTableData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  SongTableData copyWith({int id, String title}) => SongTableData(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('SongTableData(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, title.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SongTableData &&
          other.id == this.id &&
          other.title == this.title);
}

class SongTableCompanion extends UpdateCompanion<SongTableData> {
  final Value<int> id;
  final Value<String> title;
  const SongTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  SongTableCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
  }) : title = Value(title);
  static Insertable<SongTableData> custom({
    Expression<int> id,
    Expression<String> title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  SongTableCompanion copyWith({Value<int> id, Value<String> title}) {
    return SongTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }
}

class $SongTableTable extends SongTable
    with TableInfo<$SongTableTable, SongTableData> {
  final GeneratedDatabase _db;
  final String _alias;
  $SongTableTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  $SongTableTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'song_table';
  @override
  final String actualTableName = 'song_table';
  @override
  VerificationContext validateIntegrity(Insertable<SongTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SongTableData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SongTableData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SongTableTable createAlias(String alias) {
    return $SongTableTable(_db, alias);
  }
}

abstract class _$MainDatabase extends GeneratedDatabase {
  _$MainDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $SequenceTableTable _sequenceTable;
  $SequenceTableTable get sequenceTable =>
      _sequenceTable ??= $SequenceTableTable(this);
  $SongTableTable _songTable;
  $SongTableTable get songTable => _songTable ??= $SongTableTable(this);
  SequenceDao _sequenceDao;
  SequenceDao get sequenceDao =>
      _sequenceDao ??= SequenceDao(this as MainDatabase);
  SongDao _songDao;
  SongDao get songDao => _songDao ??= SongDao(this as MainDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [sequenceTable, songTable];
}
