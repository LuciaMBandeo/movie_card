import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_card/core/utils/enums/endpoints.dart';
import 'package:movie_card/core/utils/resources/data_state.dart';
import 'package:movie_card/data/model/result_model.dart';
import 'package:movie_card/data/repository/implementation/movies_repository.dart';
import 'package:movie_card/domain/entity/movie_entity.dart';
import 'package:movie_card/domain/use_cases/implementation/movies_use_case.dart';

class MockMoviesRepository extends Mock implements MoviesRepository {}

void main() {
  late MoviesRepository moviesRepository;
  late MoviesUseCase categoriesMoviesUseCase;

  setUp(() {
    moviesRepository = MockMoviesRepository();
    categoriesMoviesUseCase = MoviesUseCase(moviesRepository: moviesRepository);
    registerFallbackValue(Endpoints.upcoming);
  });

  test(
    'When movies repository returns DataSuccess, the use case also returns DataSuccess',
    () async {
      when(() => moviesRepository.fetchMovies(Endpoints.upcoming)).thenAnswer(
        (_) => Future.value(
          DataSuccess(
            ResultModel(
              page: 1,
              results: [],
              totalPages: 1,
              totalResults: 1,
            ),
          ),
        ),
      );
      DataState<List<MovieEntity>> result =
          await categoriesMoviesUseCase.call(params: Endpoints.upcoming);
      expect(result, isA<DataSuccess<List<MovieEntity>>>());
    },
  );

  test(
    'When movies repository returns DataFailure, the use case also returns DataFailure',
    () async {
      when(() => moviesRepository.fetchMovies(any())).thenAnswer(
        (_) => Future.value(DataFailure(Exception("Failed to load"))),
      );
      DataState<List<MovieEntity>> result =
          await categoriesMoviesUseCase.call(params: Endpoints.upcoming);
      expect(result, isA<DataFailure<List<MovieEntity>>>());
    },
  );
}
