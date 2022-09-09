import 'package:get/get.dart';

import '../presenter/splash/splash_page.dart';

final appPages = <GetPage>[
  GetPage(
    name: SplashPage.route,
    page: () => SplashPage(),
  ),
];
