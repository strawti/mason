import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class UserResponseModel {
  final String id;
  final String username;

  const UserResponseModel({
    required this.id,
    required this.username,
  });

  factory UserResponseModel.fromMap(Map<String, dynamic> map) {
    return UserResponseModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
    );
  }

  factory UserResponseModel.fromJson(String source) =>
      UserResponseModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserResponseModel(id: $id, username: $username)';
}
