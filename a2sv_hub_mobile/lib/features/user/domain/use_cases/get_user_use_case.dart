import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<List<UserEntity>> call() async {
    return await repository.getUsers();
  }
}
