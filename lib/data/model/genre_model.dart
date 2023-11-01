import '../../domain/entity/genre_entity.dart';

class GenreModel extends GenreEntity {
  GenreModel ({
    required super.id,
    required super.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> result) {
    return GenreModel(
      id: result['id'],
      name: result['name'],
    );
  }
}
