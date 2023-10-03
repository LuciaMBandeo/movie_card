import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../domain/entity/movie.dart';
import '../../../domain/repository/interfaces/i_movies_repository.dart';

class MoviesRepository extends IMoviesRepository {
  static const mockDataMovies = 'assets/mock_data/movies.json';
  List<Movie> parsedMovieList = [];

  Future<List<Movie>> parseMovies() async {
    final jsonPath = await rootBundle.loadString(mockDataMovies);
    return List.from(
        jsonDecode(jsonPath).map((movie) => Movie.fromJson(movie)));
  }

  @override
  Future<List<Movie>> getMovies() async {
    if (parsedMovieList.isEmpty) {
      parsedMovieList = await parseMovies();
    }
    return parsedMovieList;
  }

  @override
  Future<Movie> getMovieById(int id) async {
    if (parsedMovieList.isEmpty) {
      parsedMovieList = await parseMovies();
    }
    return parsedMovieList.where((element) => element.id == id).first;
  }
}
