import 'package:ayucare/src/core/network/api_client.dart';
import 'package:ayucare/src/features/auth/controller/auth_controller.dart';
import 'package:ayucare/src/features/auth/data/repository/auth_repo_impl.dart';
import 'package:get/get.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        repository: AuthRepositoryImpl(apiClient: Get.find<ApiClient>()),
        secureStorage: Get.find<FlutterSecureStorage>(),
      ),
    );
  }
}
