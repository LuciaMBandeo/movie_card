import '../../entity/movie.dart';

abstract class IMoviesRepository {
  Future<List<Movie>> getMovies();

  Future<Movie> getMovieById(int id);
}
