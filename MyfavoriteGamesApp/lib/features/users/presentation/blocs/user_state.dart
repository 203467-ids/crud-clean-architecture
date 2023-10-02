part of 'user_bloc.dart';


abstract class UserState {}

class Loading extends UserState {}


class Error extends UserState {
  final String error;

  Error({required this.error});
}

class Updating extends UserState {}

class Updated extends UserState {}
