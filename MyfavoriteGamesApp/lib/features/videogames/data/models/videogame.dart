import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';

class VideoGameModel extends VideoGame {
  VideoGameModel(
      {required int id,
      required String name,
      // ignore: non_constant_identifier_names
      required String release_year,
      required String developer,
      required String genre})
      : super(
            id: id,
            name: name,
            release_year: release_year,
            developer: developer,
            genre: genre);

  factory VideoGameModel.fromJson(Map<String, dynamic> json) {
    return VideoGameModel(
        id: json['id'],
        name: json['name'],
        release_year: json['release_year'],
        developer: json['developer'],
        genre: json['genre']);
  }

  factory VideoGameModel.fromEntity(VideoGame videogame) {
    return VideoGameModel(
        id: videogame.id,
        name: videogame.name,
        release_year: videogame.release_year,
        developer: videogame.developer,
        genre: videogame.genre);
  }
}
