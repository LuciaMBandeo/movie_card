import '../../../core/utils/enums/endpoints.dart';
import '../../../core/utils/resources/data_state.dart';
import '../../entity/genre_entity.dart';
import '../../entity/movie_entity.dart';

abstract class IDatabaseRepository {
  Future<void> saveMovie(MovieEntity movie, Endpoints endpoint);

  Future<DataState<List<MovieEntity>>> getSavedMovies(Endpoints endpoint);

  Future<MovieEntity?> getMovieById(MovieEntity movie);

  Future<void> saveGenre(GenreEntity genre);

  Future<DataState<List<GenreEntity>>> getSavedGenres();

  Future<GenreEntity?> getGenreById(GenreEntity genre);
}
