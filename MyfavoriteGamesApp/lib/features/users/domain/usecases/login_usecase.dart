import 'package:gamingapp/features/users/domain/repositories/user_repository.dart';

import '../entities/user.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase(this.userRepository);

  Future<void> execute(User user ) async {
    return await userRepository.login(user);
  }
}