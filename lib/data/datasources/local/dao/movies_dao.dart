import 'dart:async';

import 'package:floor/floor.dart';

import '../../../../domain/entity/movie_entity.dart';

@dao
abstract class MoviesDao {
  @Query("SELECT * FROM MovieEntity WHERE category LIKE '%' || :endpoint || '%'")
  Future<List<MovieEntity>> fetchMovies(String endpoint);

  @Query('SELECT * FROM MovieEntity WHERE id = :id')
  Future<MovieEntity?> fetchMovieById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(MovieEntity movie);
}
