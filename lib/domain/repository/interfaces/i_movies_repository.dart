import '../../../core/utils/enums/endpoints.dart';
import '../../../core/utils/resources/data_state.dart';
import '../../../data/model/result_model.dart';

abstract class IMoviesRepository {
  Future<DataState<ResultModel>> fetchMovies(Endpoints chosenEndpoint);
}
