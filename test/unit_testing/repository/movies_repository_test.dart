import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_card/core/utils/enums/endpoints.dart';
import 'package:movie_card/core/utils/resources/data_state.dart';
import 'package:movie_card/data/datasources/remote/api_service.dart';
import 'package:movie_card/data/model/result_model.dart';
import 'package:movie_card/data/repository/implementation/movies_repository.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService apiService;
  late MoviesRepository moviesRepository;
  final List<Map<String, Object>> movies = [
    {
      "adult": false,
      "backdrop_path": "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg",
      "genre_ids": [27, 9648],
      "id": 507089,
      "original_language": "en",
      "original_title": "Five Nights at Freddy's",
      "overview":
          "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.",
      "popularity": 3635.108,
      "poster_path": "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg",
      "release_date": "2023-10-25",
      "title": "Five Nights at Freddy's",
      "video": false,
      "vote_average": 8.537,
      "vote_count": 618,
    },
  ];
  final Map<String, dynamic> resultModel = {
    "page": 1,
    "results": movies,
    "total_pages": 1,
    "total_results": 1,
  };

  setUp(() {
    apiService = MockApiService();
    moviesRepository = MoviesRepository(apiService: apiService);
    registerFallbackValue(Endpoints.upcoming);
  });

  group(
      "The movie repository returns a data state depending on the response it gets from the api service",
      () {
    test(
      'When api service returns DataSuccess for fetchMovieList, the repo also returns DataSuccess',
      () async {
        when(() => apiService.fetchMovieList(any())).thenAnswer(
          (_) => Future.value(
            DataSuccess(resultModel),
          ),
        );
        DataState<ResultModel> result =
            await moviesRepository.fetchMovies(Endpoints.upcoming);
        expect(result, isA<DataSuccess<ResultModel>>());
      },
    );

    test(
      'When api service returns DataFailure for fetchMovieList, the repo also returns DataFailure',
      () async {
        when(() => apiService.fetchMovieList(any())).thenAnswer(
          (_) => Future.value(
            DataFailure(
              Exception("Failed to load"),
            ),
          ),
        );
        DataState<ResultModel> result =
            await moviesRepository.fetchMovies(Endpoints.upcoming);
        expect(result, isA<DataFailure<ResultModel>>());
      },
    );
  });
}
