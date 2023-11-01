import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_card/core/utils/constants/strings.dart';
import 'package:movie_card/core/utils/enums/endpoints.dart';
import 'package:movie_card/core/utils/enums/states.dart';
import 'package:movie_card/core/utils/resources/data_state.dart';
import 'package:movie_card/domain/entity/genre_entity.dart';
import 'package:movie_card/domain/entity/movie_entity.dart';
import 'package:movie_card/domain/use_cases/implementation/genres_use_case.dart';
import 'package:movie_card/domain/use_cases/implementation/movies_use_case.dart';
import 'package:movie_card/presentation/bloc/movies_bloc.dart';

class MockUseCaseMovies extends Mock implements MoviesUseCase {}

class MockUseCaseGenres extends Mock implements GenresUseCase {}

///The tests in this file regard only two endpoints of the four, because I considered it redundant to test everything for all of them
void main() async {
  late MoviesBloc moviesBloc;
  late MoviesUseCase mockUseCaseMovies;
  late GenresUseCase mockUseCaseGenres;

  final List<MovieEntity> movie = [
    MovieEntity(
      adult: false,
      backdrop: "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg",
      genres: [27, 53],
      id: 507089,
      originalLanguage: "en",
      originalTitle: "Five Nights at Freddy's",
      overview:
          "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.",
      popularity: 2596.506,
      poster: "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg",
      releaseDate: "2023-10-25",
      title: "Five Nights at Freddy's",
      video: false,
      voteAverage: 8.7,
      voteCount: 340,
    ),
  ];

  final List<GenreEntity> genresList = [
    GenreEntity(id: 1, name: "Acción"),
    GenreEntity(id: 2, name: "Comedia"),
    GenreEntity(id: 3, name: "Drama"),
  ];

  setUp(() {
    mockUseCaseMovies = MockUseCaseMovies();
    mockUseCaseGenres = MockUseCaseGenres();
    moviesBloc = MoviesBloc(
      genresUseCase: mockUseCaseGenres,
      moviesUseCase: mockUseCaseMovies,
    );
    registerFallbackValue(Endpoints.popular);
  });

  test('When initialized, the stream for the popular endpoint should have data',
      () async {
    when(() => mockUseCaseMovies.call(params: any(named: "params")))
        .thenAnswer((_) async => DataSuccess(movie));
    when(() => mockUseCaseGenres.call(params: any(named: "params")))
        .thenAnswer((_) async => DataSuccess(genresList));
    Stream<States> resultPopular =
        moviesBloc.popularMoviesStream.map((event) => event.state);

    final expected = [
      States.loading,
      States.success,
    ];
    expect(resultPopular, emitsInOrder(expected));

    moviesBloc.initialize();
  });

  test(
      'When calling the fetch endpoints movies method from the bloc, it should make one call to the movies use case and one call to the genres use case',
      () async {
    when(() => mockUseCaseMovies.call(params: any(named: "params")))
        .thenAnswer((_) async => DataSuccess(movie));
    when(() => mockUseCaseGenres.call(params: any(named: "params")))
        .thenAnswer((_) async => DataSuccess(genresList));
    await moviesBloc.fetchEndpointsMovies(Endpoints.popular);
    verify(() => mockUseCaseMovies.call(params: any(named: "params")))
        .called(1);
    verify(() => mockUseCaseGenres.call(params: any(named: "params")))
        .called(1);
    verifyNoMoreInteractions(mockUseCaseMovies);
    verifyNoMoreInteractions(mockUseCaseGenres);
  });

  test(
      'When asked to show the top rated page, the stream for the top rated endpoint should have data if the response from the use cases is success',
      () async {
    when(() => mockUseCaseMovies.call(params: any(named: "params")))
        .thenAnswer((_) async => DataSuccess(movie));
    when(() => mockUseCaseGenres.call(params: any(named: "params")))
        .thenAnswer((_) async => DataSuccess(genresList));
    Stream<States> resultTopRated =
        moviesBloc.topRatedMoviesStream.map((event) => event.state);

    final expected = [
      States.loading,
      States.success,
    ];
    expect(resultTopRated, emitsInOrder(expected));
    moviesBloc.fetchEndpointsMovies(Endpoints.topRated);
  });

  test(
      'When asked to show the top rated page, the stream for the top rated endpoint should not have data if the response from the use cases is failure',
      () async {
    when(() => mockUseCaseMovies.call(params: any(named: "params")))
        .thenAnswer((_) async => DataFailure(Exception(Strings.errorText)));
    when(() => mockUseCaseGenres.call(params: any(named: "params")))
        .thenAnswer((_) async => DataFailure(Exception(Strings.errorText)));
    Stream<States> resultTopRated =
        moviesBloc.topRatedMoviesStream.map((event) => event.state);

    final expected = [
      States.loading,
      States.failure,
    ];
    expect(resultTopRated, emitsInOrder(expected));
    moviesBloc.fetchEndpointsMovies(Endpoints.topRated);
  });

  tearDown(() => moviesBloc.dispose());
}
