import '../../../core/utils/enums/endpoints.dart';
import '../../../core/utils/enums/states.dart';
import '../../../core/utils/resources/data_state.dart';
import '../../../domain/repository/interfaces/i_movies_repository.dart';
import '../../datasources/remote/api_service.dart';
import '../../model/result_model.dart';

class MoviesRepository extends IMoviesRepository {
  final ApiService apiService;

  MoviesRepository({
    required this.apiService,
  });

  @override
  Future<DataState<ResultModel>> fetchMovies(Endpoints chosenEndpoint) async {
    try {
      DataState<dynamic> result = await apiService.fetchMovieList(
        chosenEndpoint,
      );
      if (result.state == States.success) {
        return DataSuccess<ResultModel>(
          ResultModel.fromJson(
            result.data,
            chosenEndpoint.endpointName,
          ),
        );
      } else {
        return DataFailure<ResultModel>(
          result.error!,
        );
      }
    } catch (e) {
      return DataFailure(
        Exception(e),
      );
    }
  }
}
