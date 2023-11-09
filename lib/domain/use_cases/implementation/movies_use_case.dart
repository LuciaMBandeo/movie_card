import '../../../core/utils/resources/data_state.dart';
import '../../../data/repository/implementation/database_repository.dart';
import '../../../data/repository/implementation/movies_repository.dart';
import '../../entity/movie_entity.dart';
import '../use_case_interface.dart';

class MoviesUseCase implements IUseCase {
  final MoviesRepository moviesRepository;
  final DatabaseRepository databaseRepository;

  MoviesUseCase({
    required this.moviesRepository,
    required this.databaseRepository,
  });

  @override
  Future<DataState<List<MovieEntity>>> call({params}) async {
    try {
      final remoteMovies = await moviesRepository.fetchMovies(params);
      if (remoteMovies is DataSuccess) {
        await Future.forEach(remoteMovies.data!.results,
            (MovieEntity movie) async {
          databaseRepository.saveMovie(movie, params);
        });
        return DataSuccess(remoteMovies.data!.results);
      } else {
        final savedMovies = await databaseRepository.getSavedMovies(params);
        if (savedMovies.data!.isEmpty) {
          return const DataEmpty();
        } else {
          return DataSuccess(savedMovies.data!);
        }
      }
    } catch (e) {
      return DataFailure(
        Exception(e),
      );
    }
  }
}
