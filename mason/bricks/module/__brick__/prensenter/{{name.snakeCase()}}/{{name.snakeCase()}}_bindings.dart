import 'package:get/get.dart';

import '../../infra/repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';
import '../../infra/providers/{{#snakeCase}}{{name}}{{/snakeCase}}_provider.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_controller.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}Bindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => {{#pascalCase}}{{name}}{{/pascalCase}}Repository(Get.find()));
    Get.lazyPut(() => {{#pascalCase}}{{name}}{{/pascalCase}}Provider(Get.find()));
    Get.put({{#pascalCase}}{{name}}{{/pascalCase}}Controller(Get.find()));
  }
}