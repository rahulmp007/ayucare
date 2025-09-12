import 'package:ayucare/src/core/routes/app_pages.dart';
import 'package:ayucare/src/shared/bindings/app_bindings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Ayucare extends StatelessWidget {
  const Ayucare({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: AppPages.initial,
      builder: EasyLoading.init(),
      getPages: AppPages.routes,
    );
  }
}
