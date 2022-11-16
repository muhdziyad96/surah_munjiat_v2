import 'package:get/get.dart';
import 'package:surah_munjiat_v2/Routes/app_routes.dart';
import 'package:surah_munjiat_v2/splash_screen.dart';

class AppPages {
  static const splashScreen = AppRoutes.splashScreen;

  static final pageList = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
  ];
}
