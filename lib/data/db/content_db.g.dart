// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorContentDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ContentDatabaseBuilder databaseBuilder(String name) =>
      _$ContentDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$ContentDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$ContentDatabaseBuilder(null);
}

class _$ContentDatabaseBuilder {
  _$ContentDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$ContentDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$ContentDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<ContentDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$ContentDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$ContentDatabase extends ContentDatabase {
  _$ContentDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `movies` (`id` TEXT NOT NULL, `is_movie` INTEGER NOT NULL, `title` TEXT NOT NULL, `grade` REAL NOT NULL, `director` TEXT NOT NULL, `stars` TEXT NOT NULL, `poster_path` TEXT, `backdrop_path` TEXT, `overview` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `persons` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `profile_path` TEXT, `character` TEXT, `order` INTEGER, `department` TEXT, `job` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `content_person` (`content_id` INTEGER NOT NULL, `person_id` INTEGER NOT NULL, `order` INTEGER NOT NULL, FOREIGN KEY (`content_id`) REFERENCES `movies` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`content_id`, `person_id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }
}
