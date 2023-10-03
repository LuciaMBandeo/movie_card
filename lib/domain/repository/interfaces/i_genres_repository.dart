import '../../entity/genre.dart';

abstract class IGenresRepository {
  Future<List<Genre>> getGenres();
}
