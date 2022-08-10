import 'dart:convert';

class ApiErrorModel {
  final String code;
  final String title;
  final String content;

  ApiErrorModel({
    required this.code,
    required this.title,
    this.content = 'Não conseguimos encontrar o motivo do erro... ',
  });

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'title': title,
      'content': content,
    };
  }

  factory ApiErrorModel.fromMap(Map<String, dynamic> map) {
    return ApiErrorModel(
      code: map['code'],
      title: map['title'],
      content:
          map['content'] ?? 'Não conseguimos encontrar o motivo do erro... ',
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiErrorModel.fromJson(String source) =>
      ApiErrorModel.fromMap(json.decode(source));
}
