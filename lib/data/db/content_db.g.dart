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

  PeopleDao? _peopleDaoInstance;

  ContentDao? _movieDaoInstance;

  TvShowDao? _tvShowDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `content` (`id` INTEGER NOT NULL, `is_movie` INTEGER NOT NULL, `title` TEXT NOT NULL, `grade` REAL NOT NULL, `director` TEXT NOT NULL, `stars` TEXT NOT NULL, `poster_path` TEXT, `backdrop_path` TEXT, `overview` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `persons` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `profile_path` TEXT, `character` TEXT, `order` INTEGER, `department` TEXT, `job` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `content_person` (`content_id` INTEGER NOT NULL, `person_id` INTEGER NOT NULL, `is_movie` INTEGER NOT NULL, `is_cast` INTEGER NOT NULL, `order` INTEGER, FOREIGN KEY (`content_id`) REFERENCES `content` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`content_id`, `person_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `movie` (`id` INTEGER NOT NULL, `is_popular` INTEGER NOT NULL, `order` INTEGER NOT NULL, FOREIGN KEY (`id`) REFERENCES `content` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`, `is_popular`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `tv_show` (`id` INTEGER NOT NULL, `is_popular` INTEGER NOT NULL, `order` INTEGER NOT NULL, FOREIGN KEY (`id`) REFERENCES `content` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`id`, `is_popular`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PeopleDao get peopleDao {
    return _peopleDaoInstance ??= _$PeopleDao(database, changeListener);
  }

  @override
  ContentDao get movieDao {
    return _movieDaoInstance ??= _$ContentDao(database, changeListener);
  }

  @override
  TvShowDao get tvShowDao {
    return _tvShowDaoInstance ??= _$TvShowDao(database, changeListener);
  }
}

class _$PeopleDao extends PeopleDao {
  _$PeopleDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _personDbInsertionAdapter = InsertionAdapter(
            database,
            'persons',
            (PersonDb item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'profile_path': item.profilePath,
                  'character': item.character,
                  'order': item.order,
                  'department': item.department,
                  'job': item.job
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PersonDb> _personDbInsertionAdapter;

  @override
  Future<List<PersonDb>> findAllCastForMovie(int contentId) async {
    return _queryAdapter.queryList(
        'SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id WHERE c.is_movie = 1 AND c.content_id = ?1 AND c.is_cast = 1 ORDER BY c.`order`',
        mapper: (Map<String, Object?> row) => PersonDb(row['id'] as int, row['name'] as String, row['profile_path'] as String?, row['character'] as String?, row['order'] as int?, row['department'] as String?, row['job'] as String?),
        arguments: [contentId]);
  }

  @override
  Future<List<PersonDb>> findAllCrewForMovie(int contentId) async {
    return _queryAdapter.queryList(
        'SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id WHERE c.content_id = ?1 AND c.is_cast = 0 AND c.is_movie = 1',
        mapper: (Map<String, Object?> row) => PersonDb(row['id'] as int, row['name'] as String, row['profile_path'] as String?, row['character'] as String?, row['order'] as int?, row['department'] as String?, row['job'] as String?),
        arguments: [contentId]);
  }

  @override
  Future<List<PersonDb>> findAllCrewForTvShow(int contentId) async {
    return _queryAdapter.queryList(
        'SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id WHERE c.content_id = ?1 AND c.is_cast = 0 AND c.is_movie = 0',
        mapper: (Map<String, Object?> row) => PersonDb(row['id'] as int, row['name'] as String, row['profile_path'] as String?, row['character'] as String?, row['order'] as int?, row['department'] as String?, row['job'] as String?),
        arguments: [contentId]);
  }

  @override
  Future<List<PersonDb>> findAllCastForTvShow(int contentId) async {
    return _queryAdapter.queryList(
        'SELECT p.* FROM content_person c JOIN persons p ON c.person_id = p.id WHERE c.content_id = ?1 AND c.is_cast = 1 AND c.is_movie = 0 ORDER BY c.`order`',
        mapper: (Map<String, Object?> row) => PersonDb(row['id'] as int, row['name'] as String, row['profile_path'] as String?, row['character'] as String?, row['order'] as int?, row['department'] as String?, row['job'] as String?),
        arguments: [contentId]);
  }

  @override
  Future<void> insertPeople(List<PersonDb> people) async {
    await _personDbInsertionAdapter.insertList(
        people, OnConflictStrategy.ignore);
  }
}

class _$ContentDao extends ContentDao {
  _$ContentDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _contentDbInsertionAdapter = InsertionAdapter(
            database,
            'content',
            (ContentDb item) => <String, Object?>{
                  'id': item.id,
                  'is_movie': item.isMovie ? 1 : 0,
                  'title': item.title,
                  'grade': item.grade,
                  'director': item.director,
                  'stars': item.stars,
                  'poster_path': item.posterPath,
                  'backdrop_path': item.backdropPath,
                  'overview': item.overview
                }),
        _contentPersonDbInsertionAdapter = InsertionAdapter(
            database,
            'content_person',
            (ContentPersonDb item) => <String, Object?>{
                  'content_id': item.contentId,
                  'person_id': item.personId,
                  'is_movie': item.isMovie ? 1 : 0,
                  'is_cast': item.isCast ? 1 : 0,
                  'order': item.order
                }),
        _movieDbInsertionAdapter = InsertionAdapter(
            database,
            'movie',
            (MovieDb item) => <String, Object?>{
                  'id': item.id,
                  'is_popular': item.isPopular ? 1 : 0,
                  'order': item.order
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ContentDb> _contentDbInsertionAdapter;

  final InsertionAdapter<ContentPersonDb> _contentPersonDbInsertionAdapter;

  final InsertionAdapter<MovieDb> _movieDbInsertionAdapter;

  @override
  Future<List<ContentDb>> findAllPopular() async {
    return _queryAdapter.queryList(
        'SELECT c.* FROM content c JOIN movie m ON c.id = m.id WHERE m.is_popular = 1 ORDER BY m.`order`',
        mapper: (Map<String, Object?> row) => ContentDb(
            row['id'] as int,
            (row['is_movie'] as int) != 0,
            row['title'] as String,
            row['grade'] as double,
            row['director'] as String,
            row['stars'] as String,
            row['poster_path'] as String?,
            row['backdrop_path'] as String?,
            row['overview'] as String));
  }

  @override
  Future<List<ContentDb>> findAllUpcoming() async {
    return _queryAdapter.queryList(
        'SELECT c.* FROM content c JOIN movie m ON c.id = m.id WHERE m.is_popular = 1 ORDER BY m.`order`',
        mapper: (Map<String, Object?> row) => ContentDb(
            row['id'] as int,
            (row['is_movie'] as int) != 0,
            row['title'] as String,
            row['grade'] as double,
            row['director'] as String,
            row['stars'] as String,
            row['poster_path'] as String?,
            row['backdrop_path'] as String?,
            row['overview'] as String));
  }

  @override
  Future<void> insertAll(List<ContentDb> content) async {
    await _contentDbInsertionAdapter.insertList(
        content, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertMoviePersons(List<ContentPersonDb> moviePeople) async {
    await _contentPersonDbInsertionAdapter.insertList(
        moviePeople, OnConflictStrategy.ignore);
  }

  @override
  Future<void> insert(ContentDb dbContent) async {
    await _contentDbInsertionAdapter.insert(
        dbContent, OnConflictStrategy.ignore);
  }

  @override
  Future<void> insertMovie(MovieDb movie) async {
    await _movieDbInsertionAdapter.insert(movie, OnConflictStrategy.abort);
  }
}

class _$TvShowDao extends TvShowDao {
  _$TvShowDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _contentDbInsertionAdapter = InsertionAdapter(
            database,
            'content',
            (ContentDb item) => <String, Object?>{
                  'id': item.id,
                  'is_movie': item.isMovie ? 1 : 0,
                  'title': item.title,
                  'grade': item.grade,
                  'director': item.director,
                  'stars': item.stars,
                  'poster_path': item.posterPath,
                  'backdrop_path': item.backdropPath,
                  'overview': item.overview
                }),
        _contentPersonDbInsertionAdapter = InsertionAdapter(
            database,
            'content_person',
            (ContentPersonDb item) => <String, Object?>{
                  'content_id': item.contentId,
                  'person_id': item.personId,
                  'is_movie': item.isMovie ? 1 : 0,
                  'is_cast': item.isCast ? 1 : 0,
                  'order': item.order
                }),
        _tvShowDbInsertionAdapter = InsertionAdapter(
            database,
            'tv_show',
            (TvShowDb item) => <String, Object?>{
                  'id': item.id,
                  'is_popular': item.isPopular ? 1 : 0,
                  'order': item.order
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ContentDb> _contentDbInsertionAdapter;

  final InsertionAdapter<ContentPersonDb> _contentPersonDbInsertionAdapter;

  final InsertionAdapter<TvShowDb> _tvShowDbInsertionAdapter;

  @override
  Future<List<ContentDb>> findAllPopular() async {
    return _queryAdapter.queryList(
        'SELECT c.* FROM content c JOIN tv_show t ON c.id = t.id WHERE t.is_popular = 1 ORDER BY t.`order`',
        mapper: (Map<String, Object?> row) => ContentDb(
            row['id'] as int,
            (row['is_movie'] as int) != 0,
            row['title'] as String,
            row['grade'] as double,
            row['director'] as String,
            row['stars'] as String,
            row['poster_path'] as String?,
            row['backdrop_path'] as String?,
            row['overview'] as String));
  }

  @override
  Future<List<ContentDb>> findAllTopRated() async {
    return _queryAdapter.queryList(
        'SELECT c.* FROM content c JOIN tv_show t ON c.id = t.id WHERE t.is_popular = 1 ORDER BY t.`order`',
        mapper: (Map<String, Object?> row) => ContentDb(
            row['id'] as int,
            (row['is_movie'] as int) != 0,
            row['title'] as String,
            row['grade'] as double,
            row['director'] as String,
            row['stars'] as String,
            row['poster_path'] as String?,
            row['backdrop_path'] as String?,
            row['overview'] as String));
  }

  @override
  Future<void> insertAll(List<ContentDb> content) async {
    await _contentDbInsertionAdapter.insertList(
        content, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertMoviePersons(List<ContentPersonDb> moviePeople) async {
    await _contentPersonDbInsertionAdapter.insertList(
        moviePeople, OnConflictStrategy.ignore);
  }

  @override
  Future<void> insert(ContentDb dbContent) async {
    await _contentDbInsertionAdapter.insert(
        dbContent, OnConflictStrategy.ignore);
  }

  @override
  Future<void> insertTvShow(TvShowDb dbTvShow) async {
    await _tvShowDbInsertionAdapter.insert(dbTvShow, OnConflictStrategy.abort);
  }
}
