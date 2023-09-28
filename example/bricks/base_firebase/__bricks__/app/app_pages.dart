import 'package:get/get.dart';

import '../../../base_structure/__brick__/presenter/splash/splash_page.dart';

class AppPages {
  AppPages._();

  static List<GetPage> pages = [
    GetPage(
      name: SplashPage.route,
      page: () => const SplashPage(),
      binding: BindingsBuilder(() {
        // Bindings Example
        // Get.put(SplashController());
      }),
    ),
  ];
}
