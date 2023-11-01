import '../../domain/entity/movie_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required super.adult,
    required super.backdrop,
    required super.genres,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.poster,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> result) {
    return MovieModel(
      adult: result['adult'],
      backdrop: result['backdrop_path'],
      genres: List.from(result['genre_ids']),
      id: result['id'],
      originalLanguage: result['original_language'],
      originalTitle: result['original_title'],
      overview: result['overview'],
      popularity: result['popularity'],
      poster: result['poster_path'],
      releaseDate: result['release_date'],
      title: result['title'],
      video: result['video'],
      voteAverage: result['vote_average'],
      voteCount: result['vote_count'],
    );
  }
}
