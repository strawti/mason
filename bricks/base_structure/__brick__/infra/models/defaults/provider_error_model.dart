import 'dart:convert';

class ProviderErrorModel {
  final String? code;
  final String title;
  final String? content;
  final String? details;

  ProviderErrorModel({
    this.code,
    this.title = 'Ocorreu um erro interno no app.',
    this.content = 'Erro desconhecido, tente mais tarde.',
    this.details,
  });

  factory ProviderErrorModel.fromMap(Map<String, dynamic> map) {
    return ProviderErrorModel(
      code: map['code'],
      title: map['title'],
      content: map['content'],
    );
  }

  factory ProviderErrorModel.fromJson(String source) =>
      ProviderErrorModel.fromMap(json.decode(source));
}
