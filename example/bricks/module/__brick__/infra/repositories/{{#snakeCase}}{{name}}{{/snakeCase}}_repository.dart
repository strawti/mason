import 'package:get/get.dart';

import '../../../../../base_structure/__brick__/core/api_client/api_client.dart';

abstract class {{#pascalCase}}{{name}}{{/pascalCase}}Repository {}

class {{#pascalCase}}{{name}}{{/pascalCase}}RepositoryImpl implements {{#pascalCase}}{{name}}{{/pascalCase}}Repository {

  final ApiClient _apiClient;
  {{#pascalCase}}{{name}}{{/pascalCase}}RepositoryImpl(this._apiClient);

}