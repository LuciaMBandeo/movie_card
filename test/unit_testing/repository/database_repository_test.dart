import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_card/core/utils/enums/endpoints.dart';
import 'package:movie_card/core/utils/resources/data_state.dart';
import 'package:movie_card/data/datasources/local/dao/genres_dao.dart';
import 'package:movie_card/data/datasources/local/dao/movies_dao.dart';
import 'package:movie_card/data/datasources/local/movies_database.dart';
import 'package:movie_card/data/repository/implementation/database_repository.dart';
import 'package:movie_card/domain/entity/genre_entity.dart';
import 'package:movie_card/domain/entity/movie_entity.dart';

class MockMoviesDatabase extends MoviesDatabase {
  @override
  MoviesDao moviesDao;

  @override
  GenresDao genresDao;

  MockMoviesDatabase(
    this.moviesDao,
    this.genresDao,
  );
}

class MockMoviesDao extends Mock implements MoviesDao {}

class MockGenresDao extends Mock implements GenresDao {}

void main() {
  late MoviesDatabase moviesDatabase;
  late DatabaseRepository databaseRepository;
  late MoviesDao moviesDao;
  late GenresDao genresDao;

  final MovieEntity movie = MovieEntity(
    adult: false,
    backdrop: "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg",
    genres: [27, 9648],
    id: 507089,
    originalLanguage: "en",
    originalTitle: "Five Nights at Freddy's",
    overview:
        "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems.",
    popularity: 3635.108,
    poster: "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg",
    releaseDate: "2023-10-25",
    title: "Five Nights at Freddy's",
    video: false,
    voteAverage: 8.537,
    voteCount: 618,
    category: [
      "popular",
    ],
  );

  final GenreEntity genre = GenreEntity(
    id: 27,
    name: "Horror",
  );

  setUp(() {
    moviesDao = MockMoviesDao();
    genresDao = MockGenresDao();
    moviesDatabase = MockMoviesDatabase(moviesDao, genresDao);
    databaseRepository = DatabaseRepository(moviesDatabase);
    registerFallbackValue(Endpoints.upcoming);
  });

  test('The movies should be saved on the local database', () async {
    when(
      () => moviesDao.fetchMovies(any()),
    ).thenAnswer(
      (_) => Future.value([movie]),
    );
    DataState<List<MovieEntity>> localMovies =
        await databaseRepository.getSavedMovies(Endpoints.popular);
    expect(localMovies, isA<DataSuccess<List<MovieEntity>>>());
  });

  test('It checks that a certain movie is saved on the local database',
      () async {
    when(
      () => moviesDao.fetchMovieById(any()),
    ).thenAnswer(
      (_) => Future.value(movie),
    );
    MovieEntity? localMovies = await databaseRepository.getMovieById(movie);
    expect(localMovies, isA<MovieEntity>());
  });

  test('The genres should be saved on the local database', () async {
    when(
      () => genresDao.fetchGenres(),
    ).thenAnswer(
      (_) => Future.value([genre]),
    );
    DataState<List<GenreEntity>> localGenres = await databaseRepository.getSavedGenres();
    expect(localGenres, isA<DataSuccess<List<GenreEntity>>>());
  });
}
