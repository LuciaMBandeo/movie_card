import 'package:flutter_test/flutter_test.dart';
import 'package:movie_card/data/datasources/local/dao/genres_dao.dart';
import 'package:movie_card/data/datasources/local/dao/movies_dao.dart';
import 'package:movie_card/data/datasources/local/movies_database.dart';
import 'package:movie_card/domain/entity/genre_entity.dart';
import 'package:movie_card/domain/entity/movie_entity.dart';

void main() {
  late MoviesDatabase moviesDatabase;
  late MoviesDao moviesDao;
  late GenresDao genresDao;

  MovieEntity movie = MovieEntity(
    adult: false,
    backdrop: "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg",
    genres: [27, 9648],
    id: 1,
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
    category: ["popular"],
  );

  final movie2 = MovieEntity(
    adult: false,
    backdrop: '',
    genres: [20],
    id: 3,
    originalLanguage: 'English',
    originalTitle: 'title1',
    overview: 'overview',
    popularity: 200,
    poster: ' ',
    releaseDate: '01-01-2001',
    title: 'title1',
    video: false,
    voteAverage: 10,
    voteCount: 200,
    category: ['popular'],
  );

  final genre = GenreEntity(
    id: 1,
    name: 'Action',
  );
  final genre2 = GenreEntity(
    id: 2,
    name: 'Adventure',
  );

  setUp(() async {
    moviesDatabase =
        await $FloorMoviesDatabase.inMemoryDatabaseBuilder().build();
    moviesDao = moviesDatabase.moviesDao;
    genresDao = moviesDatabase.genresDao;
  });

  test('It should fetch a certain movie by the id', () async {
    await moviesDao.insertMovie(movie);
    final actual = await moviesDao.fetchMovieById(1);
    expect(actual?.id, equals(movie.id));
  });

  test('It should fetch all the movies', () async {
    await moviesDao.insertMovie(movie);
    await moviesDao.insertMovie(movie2);

    final actual = await moviesDao.fetchMovies("popular");
    expect(actual, isA<List<MovieEntity>>());
    expect(actual[0].id, equals(movie.id));
    expect(actual[1].id, equals(movie2.id));
  });

  test('It should fetch a certain genre by the id', () async {
    await genresDao.insertGenre(genre);
    final actual = await genresDao.fetchGenreById(1);
    expect(actual == genre, true);
  });

  test('It should fetch all the genres', () async {
    await genresDao.insertGenre(genre);
    await genresDao.insertGenre(genre2);

    final actual = await genresDao.fetchGenres();
    expect(actual, isA<List<GenreEntity>>());
    expect(actual[0].id, equals(genre.id));
    expect(actual[1].id, equals(genre2.id));
  });

  tearDown(() async {
    await moviesDatabase.close();
  });
}
