import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_card/core/utils/resources/data_state.dart';
import 'package:movie_card/data/model/genre_model.dart';
import 'package:movie_card/data/repository/implementation/database_repository.dart';
import 'package:movie_card/data/repository/implementation/genres_repository.dart';
import 'package:movie_card/domain/entity/genre_entity.dart';
import 'package:movie_card/domain/use_cases/implementation/genres_use_case.dart';

class MockGenresRepository extends Mock implements GenresRepository {}
class MockDatabaseRepository extends Mock implements DatabaseRepository {}

void main() {
  late GenresRepository genresRepository;
  late DatabaseRepository databaseRepository;

  late GenresUseCase genresUseCase;
  final List<GenreModel>genresList = [
    GenreModel(id: 1, name: 'action'),
    GenreModel(id: 2, name: 'family'),
  ];
  final GenreEntity genre = GenreEntity(id: 1, name: 'action');

  setUp(() {
    genresRepository = MockGenresRepository();
    databaseRepository = MockDatabaseRepository();
    genresUseCase = GenresUseCase(genresRepository: genresRepository, databaseRepository: databaseRepository);
    registerFallbackValue(genre);
  });

  test(
    'When genres repository returns DataSuccess, the use case also returns DataSuccess',
    () async {
      when(() => genresRepository.fetchGenresList()).thenAnswer(
        (_) => Future.value(
          DataSuccess(genresList),
        ),
      );
      when(()=> databaseRepository.saveGenre(any())).thenAnswer((_) => Future.value());
      DataState<List<GenreEntity>> result = await genresUseCase.call();
      expect(result, isA<DataSuccess<List<GenreEntity>>>());
    },
  );

  test(
    'When movies repository returns DataFailure,if there arent movies on the local database, the use case returns DataEmpty',
        () async {
      final List<GenreEntity> emptyList = [];
      when(() => genresRepository.fetchGenresList()).thenAnswer(
            (_) => Future.value(
          DataFailure(
            Exception("Failed to load"),
          ),
        ),
      );
      when(() => databaseRepository.getSavedGenres())
          .thenAnswer(
            (_) => Future.value(
          DataSuccess(emptyList),
        ),
      );
      DataState<List<GenreEntity>> result =
      await genresUseCase.call();
      expect(result, isA<DataEmpty>());
    },
  );

  test(
    'When genres repository returns DataFailure, the use case also returns DataFailure',
    () async {
      when(() => genresRepository.fetchGenresList()).thenAnswer(
        (_) => Future.value(DataFailure(Exception("Failed to load"))),
      );
      DataState<List<GenreEntity>> result = await genresUseCase.call();
      expect(result, isA<DataFailure<List<GenreEntity>>>());
    },
  );
}
