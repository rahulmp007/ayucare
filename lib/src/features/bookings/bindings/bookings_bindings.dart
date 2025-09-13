import 'package:ayucare/src/core/network/api_client.dart';
import 'package:ayucare/src/core/services/pdf_service.dart';
import 'package:ayucare/src/features/bookings/controller/bookings_controller.dart';
import 'package:ayucare/src/features/bookings/data/repository/bookings_repository_impl.dart';
import 'package:ayucare/src/features/bookings/domain/repository/bookings_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class BookingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingsRepository>(
      () => BookingsRepositoryImpl(client: Get.find<ApiClient>()),
    );

    Get.lazyPut<PdfService>(() => PdfService());

    Get.lazyPut<BookingsController>(
      () => BookingsController(
        repository: Get.find<BookingsRepository>(),
        secureStorage: Get.find<FlutterSecureStorage>(),
        pdfService: Get.find<PdfService>(),
      ),
    );
  }
}
