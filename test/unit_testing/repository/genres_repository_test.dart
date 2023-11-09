import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_card/core/utils/resources/data_state.dart';
import 'package:movie_card/data/datasources/remote/api_service.dart';
import 'package:movie_card/data/model/genre_model.dart';
import 'package:movie_card/data/repository/implementation/genres_repository.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late GenresRepository genresRepository;
  final Map<String, List<Map<String, Object>>> genresList = {
    "genres": [
      {"id": 27, "name": "Horror"},
      {"id": 9648, "name": "Mystery"},
    ],
  };

  setUp(() {
    apiService = MockApiService();
    genresRepository = GenresRepository(apiService: apiService);
  });

  group(
      "The genres repository returns a data state depending on the response it gets from the api service",
      () {
    test(
      'When api service returns DataSuccess for fetchGenresList, the repo also returns DataSuccess',
      () async {
        when(() => apiService.fetchGenresList()).thenAnswer(
          (_) => Future.value(
            DataSuccess(
              jsonEncode(genresList),
            ),
          ),
        );
        DataState<List<GenreModel>> result =
            await genresRepository.fetchGenresList();
        expect(result, isA<DataSuccess<List<GenreModel>>>());
      },
    );

    test(
      'When api service returns DataFailure for fetchGenresList, the repo also returns DataFailure',
      () async {
        when(() => apiService.fetchGenresList()).thenAnswer(
          (_) => Future.value(
            DataFailure(
              Exception("Failed to load"),
            ),
          ),
        );
        DataState<List<GenreModel>> result =
            await genresRepository.fetchGenresList();
        expect(result, isA<DataFailure<List<GenreModel>>>());
      },
    );
  });
}
