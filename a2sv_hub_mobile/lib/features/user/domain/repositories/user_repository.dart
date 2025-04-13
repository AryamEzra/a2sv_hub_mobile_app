import 'package:a2sv_hub_mobile/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getCurrentUser(); // For fetching the logged-in user
  Future<List<UserEntity>> getUsers(); // If you want multiple users
}
