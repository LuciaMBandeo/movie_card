// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMoviesDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MoviesDatabaseBuilder databaseBuilder(String name) =>
      _$MoviesDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MoviesDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MoviesDatabaseBuilder(null);
}

class _$MoviesDatabaseBuilder {
  _$MoviesDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MoviesDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MoviesDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MoviesDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MoviesDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MoviesDatabase extends MoviesDatabase {
  _$MoviesDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MoviesDao? _moviesDaoInstance;

  GenresDao? _genresDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `MovieEntity` (`adult` INTEGER NOT NULL, `backdrop` TEXT NOT NULL, `genres` TEXT NOT NULL, `id` INTEGER NOT NULL, `originalLanguage` TEXT NOT NULL, `originalTitle` TEXT NOT NULL, `overview` TEXT NOT NULL, `popularity` REAL NOT NULL, `poster` TEXT NOT NULL, `releaseDate` TEXT NOT NULL, `title` TEXT NOT NULL, `video` INTEGER NOT NULL, `voteAverage` TEXT NOT NULL, `voteCount` INTEGER NOT NULL, `category` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `GenreEntity` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MoviesDao get moviesDao {
    return _moviesDaoInstance ??= _$MoviesDao(database, changeListener);
  }

  @override
  GenresDao get genresDao {
    return _genresDaoInstance ??= _$GenresDao(database, changeListener);
  }
}

class _$MoviesDao extends MoviesDao {
  _$MoviesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieEntityInsertionAdapter = InsertionAdapter(
            database,
            'MovieEntity',
            (MovieEntity item) => <String, Object?>{
                  'adult': item.adult ? 1 : 0,
                  'backdrop': item.backdrop,
                  'genres': _genresListConverter.encode(item.genres),
                  'id': item.id,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'poster': item.poster,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'video': item.video ? 1 : 0,
                  'voteAverage': _voteAverageConverter.encode(item.voteAverage),
                  'voteCount': item.voteCount,
                  'category': _categoryConverter.encode(item.category)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieEntity> _movieEntityInsertionAdapter;

  @override
  Future<List<MovieEntity>> fetchMovies(String endpoint) async {
    return _queryAdapter.queryList(
        'SELECT * FROM MovieEntity WHERE category LIKE \'%\' || ?1 || \'%\'',
        mapper: (Map<String, Object?> row) => MovieEntity(
            adult: (row['adult'] as int) != 0,
            backdrop: row['backdrop'] as String,
            genres: _genresListConverter.decode(row['genres'] as String),
            id: row['id'] as int,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            poster: row['poster'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            video: (row['video'] as int) != 0,
            voteAverage:
                _voteAverageConverter.decode(row['voteAverage'] as String),
            voteCount: row['voteCount'] as int,
            category: _categoryConverter.decode(row['category'] as String)),
        arguments: [endpoint]);
  }

  @override
  Future<MovieEntity?> fetchMovieById(int id) async {
    return _queryAdapter.query('SELECT * FROM MovieEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => MovieEntity(
            adult: (row['adult'] as int) != 0,
            backdrop: row['backdrop'] as String,
            genres: _genresListConverter.decode(row['genres'] as String),
            id: row['id'] as int,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            poster: row['poster'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            video: (row['video'] as int) != 0,
            voteAverage:
                _voteAverageConverter.decode(row['voteAverage'] as String),
            voteCount: row['voteCount'] as int,
            category: _categoryConverter.decode(row['category'] as String)),
        arguments: [id]);
  }

  @override
  Future<void> insertMovie(MovieEntity movie) async {
    await _movieEntityInsertionAdapter.insert(
        movie, OnConflictStrategy.replace);
  }
}

class _$GenresDao extends GenresDao {
  _$GenresDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _genreEntityInsertionAdapter = InsertionAdapter(
            database,
            'GenreEntity',
            (GenreEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GenreEntity> _genreEntityInsertionAdapter;

  @override
  Future<List<GenreEntity>> fetchGenres() async {
    return _queryAdapter.queryList('SELECT * FROM GenreEntity',
        mapper: (Map<String, Object?> row) =>
            GenreEntity(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<GenreEntity?> fetchGenreById(int id) async {
    return _queryAdapter.query('SELECT * FROM GenreEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            GenreEntity(id: row['id'] as int, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertGenre(GenreEntity movie) async {
    await _genreEntityInsertionAdapter.insert(
        movie, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _genresListConverter = GenresListConverter();
final _voteAverageConverter = VoteAverageConverter();
final _categoryConverter = CategoryConverter();
