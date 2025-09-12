import 'package:ayucare/src/features/auth/bindings/auth_binding.dart';
import 'package:ayucare/src/features/auth/presentation/pages/login.dart';
import 'package:ayucare/src/features/bookings/bindings/bookings_bindings.dart';
import 'package:ayucare/src/features/bookings/presentation/pages/bookings.dart';
import 'package:ayucare/src/features/splash/bindings/splash_bindings.dart';
import 'package:ayucare/src/features/splash/presentation/pages/splash.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const Login(),
      binding: AuthBinding(),
    ),
     GetPage(
      name: AppRoutes.bookings,
      page: () => const Bookings(),
      binding: BookingsBinding(),
    ),
  ];
}
