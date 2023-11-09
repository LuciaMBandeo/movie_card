import '../../../core/utils/resources/data_state.dart';
import '../../../data/repository/implementation/database_repository.dart';
import '../../../data/repository/implementation/genres_repository.dart';
import '../../entity/genre_entity.dart';
import '../use_case_interface.dart';

class GenresUseCase implements IUseCase {
  final GenresRepository genresRepository;
  final DatabaseRepository databaseRepository;

  GenresUseCase({
    required this.genresRepository,
    required this.databaseRepository,
  });

  @override
  Future<DataState<List<GenreEntity>>> call({params}) async {
    try {
      final remoteGenres = await genresRepository.fetchGenresList();
      if (remoteGenres is DataSuccess) {
        await Future.forEach(remoteGenres.data!, (GenreEntity genre) async {
          databaseRepository.saveGenre(genre);
        });
        return DataSuccess(
          remoteGenres.data!,
        );
      } else {
        final savedGenres =
            await databaseRepository.getSavedGenres();
        if (savedGenres.data!.isEmpty) {
          return const DataEmpty();
        } else {
          return DataSuccess(savedGenres.data!);
        }
      }
    } catch (e) {
      return DataFailure(
        Exception(e),
      );
    }
  }
}
