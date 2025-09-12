import 'package:ayucare/src/core/network/api_client.dart';
import 'package:ayucare/src/features/bookings/controller/bookings_controller.dart';
import 'package:ayucare/src/features/bookings/data/repository/bookings_repository_impl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class BookingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingsController>(
      () => BookingsController(
        repository: BookingsRepositoryImpl(client: Get.find<ApiClient>()),
        secureStorage: Get.find<FlutterSecureStorage>(),
      ),
    );
  }
}
