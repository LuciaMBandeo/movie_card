import '../../data_models/movie.dart';

abstract class MoviesRepositoryInterface {
  Future<List<Movie>> getMovies();

  Future<Movie> getMovieById(int id);
}
