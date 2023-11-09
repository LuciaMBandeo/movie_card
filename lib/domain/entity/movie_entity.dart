import 'package:floor/floor.dart';

import '../../core/utils/constants/strings.dart';

@entity
class MovieEntity {
  final bool adult;
  final String backdrop;
  final List<int> genres;
  @primaryKey
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
  final List<String> category;

  MovieEntity({
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
    required this.category,
  });

  String get backdropUrl => "${Strings.imagesBaseUrl}$backdrop";

  String get posterUrl => "${Strings.imagesBaseUrl}$poster";

  String get voteAverageAsString => voteAverage.toString();

  ///I implemented this method only for the attributes I considered the most relevant
  @override
  int get hashCode =>
      id.hashCode +
      title.hashCode +
      poster.hashCode +
      genres.hashCode +
      voteAverage.hashCode;

  ///I implemented this method only for the attributes I considered the most relevant
  @override
  bool operator ==(Object other) =>
      other is MovieEntity &&
      id == other.id &&
      title == other.title &&
      poster == other.poster &&
      genres == other.genres &&
      voteAverage == other.voteAverage;
}
