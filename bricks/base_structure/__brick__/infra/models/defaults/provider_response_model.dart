import 'dart:convert';

import 'provider_error_model.dart';

class ProviderResponseModel<T> {
  final T? data;
  final bool isSuccess;
  final ProviderErrorModel? error;

  ProviderResponseModel({
    this.data,
    this.isSuccess = true,
    this.error,
  });

  factory ProviderResponseModel.fromMap(Map<String, dynamic> map) {
    return ProviderResponseModel(
      data: map['result'],
      isSuccess: map['isError'],
      error: map['error'] != null
          ? ProviderErrorModel.fromMap(map['error'])
          : null,
    );
  }

  factory ProviderResponseModel.fromJson(String source) =>
      ProviderResponseModel.fromMap(json.decode(source));
}
