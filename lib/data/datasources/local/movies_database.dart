import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/entity/genre_entity.dart';
import '../../../domain/entity/movie_entity.dart';
import 'converters/category_converter.dart';
import 'converters/genres_list_converter.dart';
import 'converters/vote_average_converter.dart';
import 'dao/genres_dao.dart';
import 'dao/movies_dao.dart';

part 'movies_database.g.dart';

@TypeConverters([
  GenresListConverter,
  VoteAverageConverter,
  CategoryConverter,
])
@Database(
  version: 1,
  entities: <Type>[
    MovieEntity,
    GenreEntity,
  ],
)
abstract class MoviesDatabase extends FloorDatabase {
  MoviesDao get moviesDao;

  GenresDao get genresDao;
}
