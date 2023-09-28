import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_card/data_models/genre.dart';

import '../interfaces/genres_repository_interface.dart';

class GenresRepository extends GenresRepositoryInterface {
  static const mockDataGenres = 'mock_data/genres.json';
  late List<Genre> genresById = [];

  Future<List<Genre>> parseJsonGenres() async {
    final jsonPath = await rootBundle.loadString(mockDataGenres);
    final Map<String, dynamic> json = jsonDecode(jsonPath);
    return genresById = json['genres'].map<Genre>((genreJson) => Genre.fromJson(genreJson)).toList();
  }

  @override
  Future<List<Genre>> getGenres() async {
    if (genresById.isEmpty) {
      genresById = await parseJsonGenres();
    }
    return genresById;
  }
}
