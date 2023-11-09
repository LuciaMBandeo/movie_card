import 'package:floor/floor.dart';

@entity
class GenreEntity {
  @primaryKey
  final int id;
  final String name;

  GenreEntity({
    required this.id,
    required this.name,
  });

  @override
  int get hashCode => id.hashCode + name.hashCode;

  @override
  bool operator ==(Object other) =>
      other is GenreEntity && id == other.id && name == other.name;
}
