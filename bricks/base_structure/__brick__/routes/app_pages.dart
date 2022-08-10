import 'package:get/get.dart';

import '../presenter/splash/splash_page.dart';

class AppPages {
  const AppPages._();

  static final pages = <GetPage>[
    GetPage(
      name: SplashPage.route,
      page: () => SplashPage(),
    ),
  ];
}
