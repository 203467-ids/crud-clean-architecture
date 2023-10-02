import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';

abstract class VideoGameRepository {
  Future<List<VideoGame>> getVideoGames();
  Future<void> addGames(List<VideoGame> videoGames);
  Future<void> deleteGame(VideoGame videoGame);
  Future<void> updateGame(VideoGame videoGame);
}
