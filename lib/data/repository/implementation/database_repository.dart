import '../../../core/utils/enums/endpoints.dart';
import '../../../core/utils/resources/data_state.dart';
import '../../../domain/entity/genre_entity.dart';
import '../../../domain/entity/movie_entity.dart';
import '../../../domain/repository/interfaces/i_database_repository.dart';
import '../../datasources/local/movies_database.dart';

class DatabaseRepository implements IDatabaseRepository {
  final MoviesDatabase moviesDatabase;

  DatabaseRepository(
    this.moviesDatabase,
  );

  @override
  Future<void> saveMovie(
    MovieEntity movie,
    Endpoints endpoint,
  ) async {
    MovieEntity? existingMovie = await getMovieById(movie);
    if (existingMovie != null) {
      if (!existingMovie.category.contains(endpoint.endpointName)) {
        existingMovie.category.add(endpoint.endpointName);
        await moviesDatabase.moviesDao.insertMovie(existingMovie);
      }
    } else {
      await moviesDatabase.moviesDao.insertMovie(movie);
    }
  }

  @override
  Future<DataState<List<MovieEntity>>> getSavedMovies(
    Endpoints endpoint,
  ) async {
    List<MovieEntity> savedMovies = [];
    try {
      savedMovies =
          await moviesDatabase.moviesDao.fetchMovies(endpoint.endpointName);
      return DataSuccess(savedMovies);
    } catch (e) {
      return DataFailure(Exception(e));
    }
  }

  @override
  Future<MovieEntity?> getMovieById(MovieEntity movie) {
    return moviesDatabase.moviesDao.fetchMovieById(movie.id);
  }

  @override
  Future<void> saveGenre(GenreEntity genre) async {
    GenreEntity? existingGenre = await getGenreById(genre);
    if (existingGenre != null) {
      await moviesDatabase.genresDao.insertGenre(genre);
    }
  }

  @override
  Future<DataState<List<GenreEntity>>> getSavedGenres() async {
    List<GenreEntity> savedGenres = [];
    try {
      savedGenres = await moviesDatabase.genresDao.fetchGenres();
      return DataSuccess(savedGenres);
    } catch (e) {
      return DataFailure(
        Exception(e),
      );
    }
  }

  @override
  Future<GenreEntity?> getGenreById(GenreEntity genre) {
    return moviesDatabase.genresDao.fetchGenreById(genre.id);
  }
}
