import 'dart:convert';

class DefaultResponse {
  final int statusCode;
  final bool success;
  final dynamic data;
  final DefaultErrorModel? error;
  final dynamic metadata;

  DefaultResponse({
    required this.statusCode,
    required this.success,
    this.data,
    required this.error,
    required this.metadata,
  });

  factory DefaultResponse.fromMap(Map<String, dynamic> map) {
    return DefaultResponse(
      statusCode: map['statusCode']?.toInt() ?? 0,
      success: map['success'] ?? false,
      data: map['data'],
      error:
          map['error'] != null ? DefaultErrorModel.fromMap(map['error']) : null,
      metadata: map['metadata'],
    );
  }

  factory DefaultResponse.fromJson(String source) =>
      DefaultResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DefaultResponseModel(statusCode: $statusCode, success: $success, error: $error)';
  }
}

class DefaultErrorModel {
  final String? message;
  final String? timestamp;
  final String? path;
  DefaultErrorModel({
    this.message,
    this.timestamp,
    this.path,
  });

  factory DefaultErrorModel.fromMap(Map<String, dynamic>? map) {
    String getErrorMessageOfList(List<dynamic> list) {
      return list.map((e) => e.toString()).join('\n');
    }

    return DefaultErrorModel(
      message: map?['message'] is List
          ? getErrorMessageOfList(map!['message'])
          : map?['message'].toString(),
      timestamp: map?['timestamp'],
      path: map?['path'],
    );
  }

  factory DefaultErrorModel.fromJson(String source) =>
      DefaultErrorModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'Error(message: $message, timestamp: $timestamp, path: $path)';
}

class Metadata {}
