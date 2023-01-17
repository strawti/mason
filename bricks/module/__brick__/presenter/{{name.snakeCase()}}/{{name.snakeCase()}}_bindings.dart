import 'package:get/get.dart';

import '../../infra/repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';
import '../../infra/usecases/{{#snakeCase}}{{name}}{{/snakeCase}}_usecase.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_controller.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}Bindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<{{#pascalCase}}{{name}}{{/pascalCase}}Repository>(
      () => {{#pascalCase}}{{name}}{{/pascalCase}}RepositoryImpl(
        Get.find(),
      ),
    );

    Get.lazyPut<{{#pascalCase}}{{name}}{{/pascalCase}}Usecase>(
      () => {{#pascalCase}}{{name}}{{/pascalCase}}UsecaseImpl(
        Get.find(),
      ),
    );
    
    Get.put({{#pascalCase}}{{name}}{{/pascalCase}}Controller(Get.find()));
  }
}