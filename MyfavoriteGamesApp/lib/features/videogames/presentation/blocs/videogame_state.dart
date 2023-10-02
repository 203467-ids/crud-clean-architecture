part of 'videogame_bloc.dart';


@immutable
abstract class VideoGameState {}

class Loading extends VideoGameState {}

class InitialState extends VideoGameState {}

class Loaded extends VideoGameState {
  final List<VideoGame> videogame;

  Loaded({required this.videogame});
}

class Error extends VideoGameState {
  final String error;

  Error({required this.error});
}

class Updating extends VideoGameState {}

class Updated extends VideoGameState {}
