import '../../../core/utils/enums/endpoints.dart';
import '../../../core/utils/enums/states.dart';
import '../../../core/utils/resources/data_state.dart';
import '../../../domain/repository/interfaces/i_movies_repository.dart';
import '../../datasources/remote/api_service.dart';
import '../../model/result_model.dart';

class MoviesRepository extends IMoviesRepository {
  final ApiService apiService;

  MoviesRepository({
    ApiService? apiService,
  }): apiService = apiService ?? ApiService();

  @override
  Future<DataState<ResultModel>> fetchMovies(Endpoints chosenEndpoint) async {
    DataState<dynamic> result = await apiService.fetchMovieList(chosenEndpoint);
    if (result.state == States.success) {
      return DataSuccess<ResultModel>(
        ResultModel.fromJson(result.data),
      );
    } else {
      return DataFailure<ResultModel>(
        result.error!,
      );
    }
  }
}
