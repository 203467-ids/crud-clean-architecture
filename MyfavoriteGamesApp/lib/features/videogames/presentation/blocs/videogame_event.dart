part of 'videogame_bloc.dart';

@immutable
abstract class VideoGameEvent {}

class GetVideoGame extends VideoGameEvent {}

class AddGames extends VideoGameEvent {
  final List<VideoGame> videoGames;

  AddGames({required this.videoGames});
}

class DeleteGame extends VideoGameEvent {
  final VideoGame videoGame;

  DeleteGame({required this.videoGame});
}

class UpdateGame extends VideoGameEvent {
  final VideoGame videoGame;

  UpdateGame({required this.videoGame});
}

class getGamesOffline extends VideoGameEvent {}