import '../entities/user.dart';

abstract class UserRepository {
  Future<void> login(User user);
  Future<void> register(User user);
}
