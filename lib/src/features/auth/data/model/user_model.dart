import 'package:ayucare/src/features/auth/domain/entity/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required super.username,
    required super.adminId,
    required super.isAdmin,
    required super.isActive,
    required super.branch,
    required super.createdAt,
    required super.updatedAt,
    required super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user_details'];

    return UserModel(
      id: userJson['id'],
      name: userJson['name'],
      phone: userJson['phone'],
      email: userJson['mail'],
      address: userJson['address'] ?? '',
      username: userJson['username'],
      adminId: userJson['admin'],
      isAdmin: userJson['is_admin'],
      isActive: userJson['is_active'],
      branch: userJson['branch'],
      createdAt: userJson['created_at'],
      updatedAt: userJson['updated_at'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "mail": email,
      "address": address,
      "username": username,
      "admin": adminId,
      "is_admin": isAdmin,
      "is_active": isActive,
      "branch": branch,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "token": token,
    };
  }

  User toEntity() => this;
}
