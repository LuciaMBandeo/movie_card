import '../../../core/utils/constants/strings.dart';
import '../../../core/utils/resources/data_state.dart';
import '../../../data/repository/implementation/genres_repository.dart';
import '../../entity/genre_entity.dart';
import '../use_case_interface.dart';

class GenresUseCase implements IUseCase {
  final GenresRepository genresRepository;

  GenresUseCase({
    GenresRepository? genresRepository,
  }) : genresRepository = genresRepository ?? GenresRepository();

  @override
  Future<DataState<List<GenreEntity>>> call({params}) async {
    final response = await genresRepository.fetchGenresList();
    if (response is DataSuccess) {
      return DataSuccess(
        response.data!,
      );
    } else {
      return DataFailure(
        response.error ?? Exception(Strings.errorText),
      );
    }
  }
}
