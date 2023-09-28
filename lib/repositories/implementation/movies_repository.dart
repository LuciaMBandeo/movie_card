import 'dart:convert';

import 'package:flutter/services.dart';

import '../../data_models/movie.dart';
import '../interfaces/movies_repository_interface.dart';

class MoviesRepository extends MoviesRepositoryInterface {
  static const mockDataMovies = 'mock_data/movies.json';
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
