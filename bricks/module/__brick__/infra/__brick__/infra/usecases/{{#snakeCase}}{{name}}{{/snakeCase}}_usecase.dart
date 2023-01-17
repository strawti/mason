import '../repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';


abstract class {{#pascalCase}}{{name}}{{/pascalCase}}UseCase {


}

abstract class {{#pascalCase}}{{name}}{{/pascalCase}}UseCaseImpl implements {{#pascalCase}}{{name}}{{/pascalCase}}UseCase {

  final {{#pascalCase}}{{name}}{{/pascalCase}}Repository _repository;
  {{#pascalCase}}{{name}}{{/pascalCase}}UseCaseImpl(this._repository);

}
