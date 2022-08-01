import '../repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}Provider {

  final {{#pascalCase}}{{name}}{{/pascalCase}}Repository _repository;
  {{#pascalCase}}{{name}}{{/pascalCase}}Provider(this._repository);

}