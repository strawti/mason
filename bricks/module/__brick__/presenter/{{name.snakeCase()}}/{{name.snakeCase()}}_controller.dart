import 'package:get/get.dart';


import '../../infra/usecases/{{#snakeCase}}{{name}}{{/snakeCase}}_provider.dart';
import '../../shared/utils/loader_manager.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Controller extends GetxController with LoaderManager { 

  final {{#pascalCase}}{{name}}{{/pascalCase}}Usecase _usecase;
  {{#pascalCase}}{{name}}{{/pascalCase}}Controller(this._usecase);

}