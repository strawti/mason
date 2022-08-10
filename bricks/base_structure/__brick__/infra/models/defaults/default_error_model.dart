import 'dart:convert';

class DefaultErrorModel {
  final String? message;
  final String? timestamp;
  final String? path;

  DefaultErrorModel({
    this.message,
    this.timestamp,
    this.path,
  });

  DefaultErrorModel copyWith({
    String? message,
    String? timestamp,
    String? path,
  }) {
    return DefaultErrorModel(
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'timestamp': timestamp,
      'path': path,
    };
  }

  factory DefaultErrorModel.fromMap(Map<String, dynamic>? map) {
    String _getErrorMessageOfList(List<dynamic> list) {
      return list.map((e) => e.toString()).join('\n');
    }

    return DefaultErrorModel(
      message: map?['message'] is List
          ? _getErrorMessageOfList(map!['message'])
          : map?['message'].toString(),
      timestamp: map?['timestamp'],
      path: map?['path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DefaultErrorModel.fromJson(String source) =>
      DefaultErrorModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'Error(message: $message, timestamp: $timestamp, path: $path)';
}
