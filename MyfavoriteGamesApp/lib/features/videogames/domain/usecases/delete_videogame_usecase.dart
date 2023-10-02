import '../entities/videogame.dart';
import '../repositories/videogame_repository.dart';

class DeleteVideoGameUseCase {
  final VideoGameRepository videoGameRepository;

  DeleteVideoGameUseCase(this.videoGameRepository);

  Future<void> execute(VideoGame videogame) async {
    return await videoGameRepository.deleteGame(videogame);
  }
}
