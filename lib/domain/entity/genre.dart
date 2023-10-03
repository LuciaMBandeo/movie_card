class Genre {
  final int id;
  final String name;

  Genre ({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> genresJson) {
    return Genre(
      id: genresJson['id'],
      name: genresJson['name'],
    );
  }
}
