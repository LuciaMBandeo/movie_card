import '../data_models/genre.dart';
import '../data_models/movie.dart';

class MoviePreview {
  final Movie movie;
  final List<Genre> genres;

  MoviePreview(
    this.movie,
    this.genres,
  );
}
