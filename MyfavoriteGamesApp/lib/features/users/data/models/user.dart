import 'package:gamingapp/features/users/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  }) : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            username: username,
            email: email,
            password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        username: json['username'],
        email: json['email'],
        password: json['password']);
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
        id: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        username: user.username,
        email: user.email,
        password: user.password);
  }
}
