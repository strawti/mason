import 'package:flutter/material.dart';

import 'widgets/body_{{#snakeCase}}{{name}}{{/snakeCase}}.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Page extends StatelessWidget {
  const {{#pascalCase}}{{name}}{{/pascalCase}}Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("{{#pascalCase}}{{name}}{{/pascalCase}}")
      ),
      body: const Body{{#pascalCase}}{{name}}{{/pascalCase}}(),
    );
  }
}
