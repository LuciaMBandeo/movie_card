import 'dart:async';

import '../../core/bloc/i_bloc.dart';
import '../../core/utils/constants/strings.dart';
import '../../core/utils/enums/endpoints.dart';
import '../../core/utils/resources/data_state.dart';
import '../../data/model/movie_preview.dart';
import '../../domain/entity/genre_entity.dart';
import '../../domain/entity/movie_entity.dart';
import '../../domain/use_cases/implementation/genres_use_case.dart';
import '../../domain/use_cases/implementation/movies_use_case.dart';

class MoviesBloc implements IBloc {
  MoviesBloc({
    GenresUseCase? genresUseCase,
    MoviesUseCase? moviesUseCase,
  })  : genresUseCase = genresUseCase ?? GenresUseCase(),
        moviesUseCase = moviesUseCase ?? MoviesUseCase();

  final GenresUseCase genresUseCase;
  final MoviesUseCase moviesUseCase;
  final _popularMovies =
      StreamController<DataState<List<MoviePreview>>>.broadcast();
  final _topRatedMovies =
      StreamController<DataState<List<MoviePreview>>>.broadcast();
  final _nowPlayingMovies =
      StreamController<DataState<List<MoviePreview>>>.broadcast();
  final _upcomingMovies =
      StreamController<DataState<List<MoviePreview>>>.broadcast();

  Stream<DataState<List<MoviePreview>>> get popularMoviesStream =>
      _popularMovies.stream;

  Stream<DataState<List<MoviePreview>>> get topRatedMoviesStream =>
      _topRatedMovies.stream;

  Stream<DataState<List<MoviePreview>>> get nowPlayingMoviesStream =>
      _nowPlayingMovies.stream;

  Stream<DataState<List<MoviePreview>>> get upcomingMoviesStream =>
      _upcomingMovies.stream;

  @override
  void initialize() async {
    fetchEndpointsMovies(
      Endpoints.popular,
    );
  }

  ///Returns the genres corresponding to the list of genresId, or an empty list in case of error
  Future<List<GenreEntity>> _fetchMoviesGenres(List<int> genresId) async {
    final result = await genresUseCase.call(
      params: genresId,
    );
    if (result is DataSuccess) {
      return result.data!;
    } else {
      return [];
    }
  }

  void addStateStream(
    Endpoints endpoint,
    DataState<List<MoviePreview>> result,
  ) {
    switch (endpoint) {
      case Endpoints.popular:
        _popularMovies.sink.add(
          result,
        );
        break;
      case Endpoints.topRated:
        _topRatedMovies.sink.add(
          result,
        );
        break;
      case Endpoints.nowPlaying:
        _nowPlayingMovies.sink.add(
          result,
        );
        break;
      case Endpoints.upcoming:
        _upcomingMovies.sink.add(
          result,
        );
        break;
    }
  }

  Future<void> fetchEndpointsMovies(Endpoints endpoint) async {
    List<MovieEntity> movieListEndpoint = [];
    addStateStream(endpoint, const DataLoading());
    final result = await moviesUseCase.call(
      params: endpoint,
    );
    if (result is DataSuccess) {
      movieListEndpoint = result.data ?? [];
      List<GenreEntity> genres = await _fetchMoviesGenres(
        movieListEndpoint
            .map(
              (movie) => movie.genres,
            )
            .expand(
              (element) => element,
            )
            .toList(),
      );
      List<MoviePreview> moviePreview = movieListEndpoint.map((movie) {
        final movieGenres = genres
            .where(
              (genre) => movie.genres.contains(genre.id),
            )
            .toList();
        return MoviePreview(
          movie,
          movieGenres,
        );
      }).toList();
      addStateStream(
        endpoint,
        DataSuccess(moviePreview),
      );
    } else {
      addStateStream(
        endpoint,
        DataFailure(
          Exception(
            Strings.errorText,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _popularMovies.close();
    _topRatedMovies.close();
    _nowPlayingMovies.close();
    _upcomingMovies.close();
  }
}
