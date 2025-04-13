import '../../domain/entities/user_entity.dart';

class UserModel {
  final int id;
  final String name;
  final String email;

  UserModel({required this.id, required this.name, required this.email});

  // Convert JSON into a `UserModel`
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json['id'], name: json['name'], email: json['email']);
  }

  // Convert `UserModel` into JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }

  // Convert `UserModel` into `UserEntity`
  UserEntity toEntity() {
    return UserEntity(id: id, name: name, email: email);
  }
}
