import 'dart:convert';

import 'api_error_model.dart';

class ApiResponseModel<T> {
  final T? data;
  final bool isSuccess;
  final ApiErrorModel? error;

  ApiResponseModel({
    this.data,
    this.isSuccess = true,
    this.error,
  });

  Map<String, dynamic> toMap() {
    return {
      'result': data,
      'isError': isSuccess,
      'error': error?.toMap(),
    };
  }

  factory ApiResponseModel.fromMap(Map<String, dynamic> map) {
    return ApiResponseModel(
      data: map['result'],
      isSuccess: map['isError'],
      error: ApiErrorModel.fromMap(map['error']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponseModel.fromJson(String source) =>
      ApiResponseModel.fromMap(json.decode(source));
}
