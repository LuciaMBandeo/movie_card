import '../../data_models/genre.dart';

abstract class GenresRepositoryInterface {
  Future<List<Genre>> getGenres();
}
