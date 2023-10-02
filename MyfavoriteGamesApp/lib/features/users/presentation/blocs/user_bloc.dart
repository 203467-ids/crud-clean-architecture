import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamingapp/features/users/domain/entities/user.dart';
import 'package:gamingapp/features/users/domain/usecases/login_usecase.dart';
import 'package:gamingapp/features/users/domain/usecases/register_escase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserAuthentication extends Bloc<UserEvent, UserState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  UserAuthentication(
      {required this.loginUseCase, required this.registerUseCase})
      : super(Updating()) {
    on<UserEvent>((event, emit) async {
      if (event is Login) {
        try {
          emit(Updating());
          await loginUseCase.execute(event.user);
          emit(Updated());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      } else if (event is Register) {
        try {
          emit(Updating());
          await registerUseCase.execute(event.user);
          emit(Updated());
        } catch (e) {
          emit(Error(error: e.toString()));
        }
      }
    });
  }
}
