import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../domain/entity/genre.dart';
import '../../../domain/repository/interfaces/i_genres_repository.dart';

class GenresRepository implements IGenresRepository {
  static const mockDataGenres = 'assets/mock_data/genres.json';
  late List<Genre> genresById = [];

  Future<List<Genre>> parseJsonGenres() async {
    final jsonPath = await rootBundle.loadString(mockDataGenres);
    final Map<String, dynamic> json = jsonDecode(jsonPath);
    return genresById = json['genres']
        .map<Genre>((genreJson) => Genre.fromJson(genreJson))
        .toList();
  }

  @override
  Future<List<Genre>> getGenres() async {
    if (genresById.isEmpty) {
      genresById = await parseJsonGenres();
    }
    return genresById;
  }
}
