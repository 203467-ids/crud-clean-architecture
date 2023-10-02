import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';
import 'package:gamingapp/features/videogames/domain/repositories/videogame_repository.dart';

class AddVideoGameUsecase {
  final VideoGameRepository videoGameRepository;

  AddVideoGameUsecase(this.videoGameRepository);

  Future<void> execute(List<VideoGame> videoGames ) async {
    return await videoGameRepository.addGames(videoGames);
  }
}