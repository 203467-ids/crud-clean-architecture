part of 'user_bloc.dart';


abstract class UserEvent {}

class Login extends UserEvent {
  final User user;

  Login({required this.user});
}

class Register extends UserEvent {
  final User user;

  Register({required this.user});
}