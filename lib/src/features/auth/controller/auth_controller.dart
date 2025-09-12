import 'package:ayucare/src/core/data_state/data_state.dart';
import 'package:ayucare/src/features/auth/domain/entity/user.dart';
import 'package:ayucare/src/features/auth/domain/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  final FlutterSecureStorage secureStorage;

  AuthController({required this.repository, required this.secureStorage});

  // Use Ds<User> instead of separate variables
  final authState = Rx<Ds<User>>(Initial<User>());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login(String username, String password) async {
    authState.value = Loading<User>();

    final result = await repository.login(
      username: username,
      password: password,
    );

    result.fold(
      (failure) {
        authState.value = Failed<User>(e: failure.message);
      },
      (login) async {
        authState.value = Success<User>(data: login);
        await secureStorage.write(key: 'token', value: login.token);
      },
    );
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: 'token');
  }

  Future<void> logout() async {
    await secureStorage.delete(key: 'token');
    authState.value = Initial<User>();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
