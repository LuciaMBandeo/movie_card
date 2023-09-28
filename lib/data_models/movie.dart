import '../utils/constants.dart';

class Movie {
  final bool adult;
  final String backdrop;
  final List<int> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String poster;
  final String releaseDate;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdrop,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.poster,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> moviesJson) {
    return Movie(
      adult: moviesJson['adult'],
      backdrop: moviesJson['backdrop_path'],
      genres: List.from(moviesJson['genre_ids']),
      id: moviesJson['id'],
      originalLanguage: moviesJson['original_language'],
      originalTitle: moviesJson['original_title'],
      overview: moviesJson['overview'],
      popularity: moviesJson['popularity'],
      poster: moviesJson['poster_path'],
      releaseDate: moviesJson['release_date'],
      title: moviesJson['title'],
      video: moviesJson['video'],
      voteAverage: moviesJson['vote_average'],
      voteCount: moviesJson['vote_count'],
    );
  }

  String get backdropUrl => "${Constants.baseUrl}$backdrop";

  String get posterUrl => "${Constants.baseUrl}$poster";

  String get voteAverageAsString => voteAverage.toString();
}
