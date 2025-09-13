// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ayucare/src/core/routes/app_routes.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final FlutterSecureStorage secureStorage;
  SplashController({required this.secureStorage});

  @override
  void onInit() {
    super.onInit();

    _checkToken();
  }

  Future<void> _checkToken() async {
    await Future.delayed(const Duration(seconds: 1));

    final token = await secureStorage.read(key: 'token');

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(AppRoutes.bookings);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
