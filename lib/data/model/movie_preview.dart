import '../../domain/entity/genre_entity.dart';
import '../../domain/entity/movie_entity.dart';

class MoviePreview {
  final MovieEntity movie;
  final List<GenreEntity> genres;

  MoviePreview(
    this.movie,
    this.genres,
  );
}
