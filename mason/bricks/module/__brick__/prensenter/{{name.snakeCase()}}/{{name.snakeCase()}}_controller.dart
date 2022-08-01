import 'package:get/get.dart';


import '../../infra/providers/{{#snakeCase}}{{name}}{{/snakeCase}}_provider.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Controller extends GetxController { 

  final {{#pascalCase}}{{name}}{{/pascalCase}}Provider _provider;
  {{#pascalCase}}{{name}}{{/pascalCase}}Controller(this._provider);





  bool isLoading = false;
  void _setIsLoading(bool value) {
    isLoading = value;
    update();
  }

}