import 'package:floor/floor.dart';

import '../../../../domain/entity/genre_entity.dart';

@dao
abstract class GenresDao {
  @Query('SELECT * FROM GenreEntity')
  Future<List<GenreEntity>> fetchGenres();

  @Query('SELECT * FROM GenreEntity WHERE id = :id')
  Future<GenreEntity?> fetchGenreById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGenre(GenreEntity movie);
}
