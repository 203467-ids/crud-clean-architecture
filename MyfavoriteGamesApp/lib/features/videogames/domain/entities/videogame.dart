class VideoGame {
  int id;
  String name;
  // ignore: non_constant_identifier_names
  String release_year;
  String developer;
  String genre;

  VideoGame(
      {required this.id,
      required this.name,
      // ignore: non_constant_identifier_names
      required this.release_year,
      required this.developer,
      required this.genre});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'releaseYear': release_year,
      'developer': developer,
      'genre': genre
    };
  }

  static VideoGame fromMap(Map<String, dynamic> map) {
    return VideoGame(
      id: map['id'],
      name: map['name'],
      release_year: map['release_year'],
      developer: map['developer'],
      genre: map['genre'],
    );
  }
}
