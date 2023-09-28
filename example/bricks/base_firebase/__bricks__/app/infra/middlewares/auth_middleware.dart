import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  /// Example
  ///
  /// @override
  /// RouteSettings? redirect(String? route) {
  ///   if (AppController.myIdUser.isEmpty) {
  ///     return const RouteSettings(name: LoginPage.route);
  ///   }
  ///   return null;
  /// }
  @override
  RouteSettings? redirect(String? route) {
    throw UnimplementedError();
  }
}
