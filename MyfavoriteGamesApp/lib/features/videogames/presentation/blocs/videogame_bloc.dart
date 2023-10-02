import 'package:bloc/bloc.dart';
import 'package:gamingapp/features/videogames/data/models/videogame.dart';
import 'package:gamingapp/features/videogames/domain/entities/videogame.dart';
import 'package:gamingapp/features/videogames/domain/usecases/add_videogame_usecase.dart';
import 'package:gamingapp/features/videogames/domain/usecases/delete_videogame_usecase.dart';
import 'package:gamingapp/features/videogames/domain/usecases/get_videogames_usecase.dart';
import 'package:gamingapp/features/videogames/domain/usecases/update_videogame_usecase.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

part 'videogame_event.dart';
part 'videogame_state.dart';

class VideoGameBloc extends Bloc<VideoGameEvent, VideoGameState> {
  final GetVideoGamesUseCase getVideoGamesUseCase;

  VideoGameBloc({required this.getVideoGamesUseCase}) : super(InitialState()) {
    on<VideoGameEvent>((event, emit) async {
      if (event is GetVideoGame) {
        try {
          emit(Loading());
          List<VideoGame> response = await getVideoGamesUseCase.execute();
          emit(Loaded(videogame: response));
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is getGamesOffline) {
        try {
          final prefs = await SharedPreferences.getInstance();
          String? dataStr = prefs.getString('Response');
          if (dataStr != null) {
            var returnData = convert
                .jsonDecode(dataStr)
                .map<VideoGameModel>((data) => VideoGameModel.fromJson(data))
                .toList();
            emit(Loaded(videogame: returnData));
          }
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}

class VideoGamesBlocModify extends Bloc<VideoGameEvent, VideoGameState> {
  final AddVideoGameUsecase addVideoGameUsecase;
  final DeleteVideoGameUseCase deleteVideoGameUseCase;
  final UpdateVideoGameUseCase updateVideoGameUseCase;

  VideoGamesBlocModify(
      {required this.addVideoGameUsecase,
      required this.deleteVideoGameUseCase,
      required this.updateVideoGameUseCase})
      : super(Updating()) {
    on<VideoGameEvent>((event, emit) async {
      if (event is AddGames) {
        try {
          emit(Updating());
          await addVideoGameUsecase.execute(event.videoGames);
          emit(Updated());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is DeleteGame) {
        try {
          emit(Updating());
          await deleteVideoGameUseCase.execute(event.videoGame);
          emit(Updated());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is UpdateGame) {
        try {
          emit(Updating());
          await updateVideoGameUseCase.execute(event.videoGame);
          emit(Updated());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}
