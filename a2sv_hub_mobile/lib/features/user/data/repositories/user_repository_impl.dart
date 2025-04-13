import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserEntity> getCurrentUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? "Guest";

    // Mock user data (replace with API later)
    return UserEntity(id: 1, name: username, email: "guest@example.com");
  }

  @override
  Future<List<UserEntity>> getUsers() async {
    // This is a mock example; replace with actual API later
    return [UserEntity(id: 1, name: "Aryam", email: "aryam@example.com")];
  }
}
