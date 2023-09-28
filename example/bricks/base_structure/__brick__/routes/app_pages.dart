import 'package:get/get.dart';

import 'routers_imports.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: SplashPage.route,
      page: () => const SplashPage(),
    ),
  ];
}
