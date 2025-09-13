import 'package:ayucare/src/features/splash/controller/splash_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(secureStorage: Get.find<FlutterSecureStorage>()),
    );
  }
}
