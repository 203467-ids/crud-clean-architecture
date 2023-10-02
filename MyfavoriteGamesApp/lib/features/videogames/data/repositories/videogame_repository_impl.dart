import 'package:gamingapp/features/videogames/data/datasource/videogame_remote_datasource.dart';
import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';
import 'package:gamingapp/features/videogames/domain/repositories/videogame_repository.dart';

class VideoGameRepositoryImpl implements VideoGameRepository {
  final VideoGameRemoteDataSource videoGameRemoteDataSource;

  VideoGameRepositoryImpl({required this.videoGameRemoteDataSource});

  @override
  Future<List<VideoGame>> getVideoGames() async {
    return await videoGameRemoteDataSource.getVideoGames();
  }

  @override
  Future<void> addGames(List<VideoGame> videoGames) async {
    return await videoGameRemoteDataSource.addGames(videoGames);
  }

  @override
  Future<void> deleteGame(VideoGame videoGame) async {
    return await videoGameRemoteDataSource.deleteGame(videoGame);
  }

  @override
  Future<void> updateGame(VideoGame videoGame) async {
    return await videoGameRemoteDataSource.updateGame(videoGame);
  }
}
