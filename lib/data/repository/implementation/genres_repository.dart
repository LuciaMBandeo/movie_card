import 'dart:convert';

import '../../../core/utils/enums/states.dart';
import '../../../core/utils/resources/data_state.dart';
import '../../../domain/repository/interfaces/i_genres_repository.dart';
import '../../datasources/remote/api_service.dart';
import '../../model/genre_model.dart';

class GenresRepository implements IGenresRepository {
  final ApiService apiService;

  GenresRepository({
    required this.apiService,
  });

  @override
  Future<DataState<List<GenreModel>>> fetchGenresList() async {
    try {
      DataState<dynamic> result = await apiService.fetchGenresList();
      if (result.state == States.success) {
        return DataSuccess(
          List<GenreModel>.from(
            jsonDecode(result.data)["genres"].map(
              (genre) => GenreModel.fromJson(genre),
            ),
          ),
        );
      } else {
        return DataFailure(
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
