import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/user_model.dart';

class UserLocalDataSource {
  Future<UserModel> loadMockUser() async {
    final String response = await rootBundle.loadString(
      'assets/mock_data/mock_users.json',
    );
    final List<dynamic> data = json.decode(response);
    return UserModel.fromJson(data.first); // Load the first user
  }
}
