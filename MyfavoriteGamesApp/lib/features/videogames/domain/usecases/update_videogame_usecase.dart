import '../entities/videogame.dart';
import '../repositories/videogame_repository.dart';

class UpdateVideoGameUseCase{
  final VideoGameRepository videoGameRepository;

  UpdateVideoGameUseCase(this.videoGameRepository);

    Future<void> execute(VideoGame videogame) async {
    return await videoGameRepository.updateGame(videogame);
  }
}