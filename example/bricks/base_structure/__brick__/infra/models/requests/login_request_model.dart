import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class LoginRequestModel {
  final String email;
  final String password;

  const LoginRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'LoginRequestModel(email: $email, password: $password)';
}
