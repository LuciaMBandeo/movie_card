import 'package:http/http.dart';

import '../data/datasources/local/movies_database.dart';
import '../data/datasources/remote/api_service.dart';
import '../data/repository/implementation/database_repository.dart';
import '../data/repository/implementation/genres_repository.dart';
import '../data/repository/implementation/movies_repository.dart';
import '../domain/use_cases/implementation/genres_use_case.dart';
import '../domain/use_cases/implementation/movies_use_case.dart';
import '../presentation/bloc/movies_bloc.dart';

class DependencyHandler {
  late MoviesBloc _moviesBloc;
  late MoviesRepository _moviesRepository;
  late MoviesUseCase _moviesUseCase;
  late GenresUseCase _genresUseCase;
  late GenresRepository _genresRepository;
  late MoviesDatabase _moviesDatabase;
  late DatabaseRepository _databaseRepository;
  late ApiService _apiService;
  final Client _client = Client();

  static const String _databaseName = 'movies_database.db';

  Future<void> initialize() async {
    _moviesDatabase = await $FloorMoviesDatabase.databaseBuilder(_databaseName).build();
    _apiService = ApiService(client: _client);
    _databaseRepository = DatabaseRepository(_moviesDatabase);
    _moviesRepository = MoviesRepository(apiService: _apiService);
    _genresRepository = GenresRepository(apiService: _apiService);
    _moviesUseCase = MoviesUseCase(
        moviesRepository: _moviesRepository,
        databaseRepository: _databaseRepository,);
    _genresUseCase = GenresUseCase(
        genresRepository: _genresRepository,
        databaseRepository: _databaseRepository,);
    _moviesBloc = MoviesBloc(
      genresUseCase: _genresUseCase,
      moviesUseCase: _moviesUseCase,
    );
  }

  MoviesDatabase get moviesDatabase => _moviesDatabase;

  ApiService get apiService => _apiService;

  DatabaseRepository get databaseRepository => _databaseRepository;

  MoviesBloc get moviesBloc => _moviesBloc;

  MoviesUseCase get moviesUseCase => _moviesUseCase;

  GenresUseCase get genresUseCase => _genresUseCase;

  MoviesRepository get moviesRepository => _moviesRepository;

  GenresRepository get genresRepository => _genresRepository;
}
