import 'package:ayucare/src/core/network/api_client.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<FlutterSecureStorage>()) {
      Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage());
    }

    if (!Get.isRegistered<ApiClient>()) {
      Get.lazyPut<ApiClient>(() => ApiClient());
    }
  }
}
