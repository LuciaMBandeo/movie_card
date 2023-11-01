import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_card/core/utils/resources/data_state.dart';
import 'package:movie_card/data/model/genre_model.dart';
import 'package:movie_card/data/repository/implementation/genres_repository.dart';
import 'package:movie_card/domain/entity/genre_entity.dart';
import 'package:movie_card/domain/use_cases/implementation/genres_use_case.dart';

class MockGenresRepository extends Mock implements GenresRepository {}

void main() {
  late GenresRepository genresRepository;
  late GenresUseCase genresUseCase;
  final genresList = [
    GenreModel(id: 1, name: 'action'),
    GenreModel(id: 2, name: 'family'),
  ];

  setUp(() {
    genresRepository = MockGenresRepository();
    genresUseCase = GenresUseCase(genresRepository: genresRepository);
  });

  test(
    'When movies repository returns DataSuccess, the use case also returns DataSuccess',
    () async {
      when(() => genresRepository.fetchGenresList()).thenAnswer(
        (_) => Future.value(
          DataSuccess(genresList),
        ),
      );
      DataState<List<GenreEntity>> result = await genresUseCase.call();
      expect(result, isA<DataSuccess<List<GenreEntity>>>());
    },
  );

  test(
    'When movies repository returns DataFailure, the use case also returns DataFailure',
    () async {
      when(() => genresRepository.fetchGenresList()).thenAnswer(
        (_) => Future.value(DataFailure(Exception("Failed to load"))),
      );
      DataState<List<GenreEntity>> result = await genresUseCase.call();
      expect(result, isA<DataFailure<List<GenreEntity>>>());
    },
  );
}
