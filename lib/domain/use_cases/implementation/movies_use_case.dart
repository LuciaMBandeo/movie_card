import '../../../core/utils/constants/strings.dart';
import '../../../core/utils/resources/data_state.dart';
import '../../../data/repository/implementation/movies_repository.dart';
import '../../entity/movie_entity.dart';
import '../use_case_interface.dart';

class MoviesUseCase implements IUseCase {
  final MoviesRepository moviesRepository;

  MoviesUseCase({
    MoviesRepository? moviesRepository,
  }) : moviesRepository = moviesRepository ?? MoviesRepository();

  @override
  Future<DataState<List<MovieEntity>>> call({params}) async {
    final response = await moviesRepository.fetchMovies(params);
    if (response is DataSuccess) {
      return DataSuccess(
        response.data!.results,
      );
    } else {
      return DataFailure(
        response.error ??
            Exception(
              Strings.errorText,
            ),
      );
    }
  }
}
