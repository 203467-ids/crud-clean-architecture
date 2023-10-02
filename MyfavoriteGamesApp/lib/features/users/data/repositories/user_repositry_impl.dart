import 'package:gamingapp/features/users/data/datasource/user_remote_datasource.dart';
import 'package:gamingapp/features/users/domain/entities/user.dart';
import 'package:gamingapp/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<void> login(User user) async {
    return await userRemoteDataSource.login(user);
  }

  @override
  Future<void> register(User user) async {
    return await userRemoteDataSource.register(user);
  }
}
