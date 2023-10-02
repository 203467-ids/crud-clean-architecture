import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';
import 'package:gamingapp/features/videogames/domain/repositories/videogame_repository.dart';

class GetVideoGamesUseCase {
  final VideoGameRepository videoGameRepository;

  GetVideoGamesUseCase(this.videoGameRepository);

  Future<List<VideoGame>> execute() async {
    return await videoGameRepository.getVideoGames();
  }
}
