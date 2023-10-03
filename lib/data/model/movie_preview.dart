import '../../domain/entity/genre.dart';
import '../../domain/entity/movie.dart';

class MoviePreview {
  final Movie movie;
  final List<Genre> genres;

  MoviePreview(
    this.movie,
    this.genres,
  );
}
