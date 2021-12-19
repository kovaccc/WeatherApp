// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorWeatherDB {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WeatherDBBuilder databaseBuilder(String name) =>
      _$WeatherDBBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$WeatherDBBuilder inMemoryDatabaseBuilder() =>
      _$WeatherDBBuilder(null);
}

class _$WeatherDBBuilder {
  _$WeatherDBBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$WeatherDBBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$WeatherDBBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<WeatherDB> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$WeatherDB();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$WeatherDB extends WeatherDB {
  _$WeatherDB([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DBWeatherResponseDao? _weatherResponseDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DBWeatherResponse` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `weather` TEXT NOT NULL, `main` TEXT NOT NULL, `wind` TEXT NOT NULL, `visibility` INTEGER NOT NULL, `name` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DBWeatherResponseDao get weatherResponseDao {
    return _weatherResponseDaoInstance ??=
        _$DBWeatherResponseDao(database, changeListener);
  }
}

class _$DBWeatherResponseDao extends DBWeatherResponseDao {
  _$DBWeatherResponseDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _dBWeatherResponseInsertionAdapter = InsertionAdapter(
            database,
            'DBWeatherResponse',
            (DBWeatherResponse item) => <String, Object?>{
                  'id': item.id,
                  'weather': _weatherConverter.encode(item.weather),
                  'main': _mainWeatherConverter.encode(item.main),
                  'wind': _windConverter.encode(item.wind),
                  'visibility': item.visibility,
                  'name': item.name
                },
            changeListener),
        _dBWeatherResponseUpdateAdapter = UpdateAdapter(
            database,
            'DBWeatherResponse',
            ['id'],
            (DBWeatherResponse item) => <String, Object?>{
                  'id': item.id,
                  'weather': _weatherConverter.encode(item.weather),
                  'main': _mainWeatherConverter.encode(item.main),
                  'wind': _windConverter.encode(item.wind),
                  'visibility': item.visibility,
                  'name': item.name
                },
            changeListener),
        _dBWeatherResponseDeletionAdapter = DeletionAdapter(
            database,
            'DBWeatherResponse',
            ['id'],
            (DBWeatherResponse item) => <String, Object?>{
                  'id': item.id,
                  'weather': _weatherConverter.encode(item.weather),
                  'main': _mainWeatherConverter.encode(item.main),
                  'wind': _windConverter.encode(item.wind),
                  'visibility': item.visibility,
                  'name': item.name
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DBWeatherResponse> _dBWeatherResponseInsertionAdapter;

  final UpdateAdapter<DBWeatherResponse> _dBWeatherResponseUpdateAdapter;

  final DeletionAdapter<DBWeatherResponse> _dBWeatherResponseDeletionAdapter;

  @override
  Future<List<DBWeatherResponse>> getWeathersAsync() async {
    return _queryAdapter.queryList('SELECT * FROM DBWeatherResponse',
        mapper: (Map<String, Object?> row) => DBWeatherResponse(
            id: row['id'] as int?,
            weather: _weatherConverter.decode(row['weather'] as String),
            name: row['name'] as String,
            main: _mainWeatherConverter.decode(row['main'] as String),
            wind: _windConverter.decode(row['wind'] as String),
            visibility: row['visibility'] as int));
  }

  @override
  Stream<DBWeatherResponse?> getWeatherStreamById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM DBWeatherResponse WHERE id = ?1',
        mapper: (Map<String, Object?> row) => DBWeatherResponse(
            id: row['id'] as int?,
            weather: _weatherConverter.decode(row['weather'] as String),
            name: row['name'] as String,
            main: _mainWeatherConverter.decode(row['main'] as String),
            wind: _windConverter.decode(row['wind'] as String),
            visibility: row['visibility'] as int),
        arguments: [id],
        queryableName: 'DBWeatherResponse',
        isView: false);
  }

  @override
  Stream<List<DBWeatherResponse>> getWeathersStream() {
    return _queryAdapter.queryListStream('SELECT * FROM DBWeatherResponse',
        mapper: (Map<String, Object?> row) => DBWeatherResponse(
            id: row['id'] as int?,
            weather: _weatherConverter.decode(row['weather'] as String),
            name: row['name'] as String,
            main: _mainWeatherConverter.decode(row['main'] as String),
            wind: _windConverter.decode(row['wind'] as String),
            visibility: row['visibility'] as int),
        queryableName: 'DBWeatherResponse',
        isView: false);
  }

  @override
  Future<void> insert(DBWeatherResponse model) async {
    await _dBWeatherResponseInsertionAdapter.insert(
        model, OnConflictStrategy.replace);
  }

  @override
  Future<List<int>> insertMultiple(List<DBWeatherResponse> models) {
    return _dBWeatherResponseInsertionAdapter.insertListAndReturnIds(
        models, OnConflictStrategy.replace);
  }

  @override
  Future<void> update(DBWeatherResponse model) async {
    await _dBWeatherResponseUpdateAdapter.update(
        model, OnConflictStrategy.replace);
  }

  @override
  Future<int> updateMultiple(List<DBWeatherResponse> models) {
    return _dBWeatherResponseUpdateAdapter.updateListAndReturnChangedRows(
        models, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteModel(DBWeatherResponse model) async {
    await _dBWeatherResponseDeletionAdapter.delete(model);
  }

  @override
  Future<int> deleteMultiple(List<DBWeatherResponse> models) {
    return _dBWeatherResponseDeletionAdapter
        .deleteListAndReturnChangedRows(models);
  }
}

// ignore_for_file: unused_element
final _weatherConverter = WeatherConverter();
final _mainWeatherConverter = MainWeatherConverter();
final _windConverter = WindConverter();
