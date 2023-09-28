import 'package:get/get.dart';

import 'routers_imports.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: {{#pascalCase}}{{name}}{{/pascalCase}}Page.route,
      page: () => const {{#pascalCase}}{{name}}{{/pascalCase}}Page(),
      bindings: {{#pascalCase}}{{name}}{{/pascalCase}}Bindings(),
    ),
  ];
}
