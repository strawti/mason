import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infra/models/defaults/provider_error_model.dart';

class CustomSnackbar {
  CustomSnackbar._();

  static CustomSnackbar get to => CustomSnackbar._();

  final _defaultDuration = const Duration(seconds: 2);
  final _defaultMargin = const EdgeInsets.fromLTRB(10, 16, 10, 0);
  final _defaultBorderRadius = 8.0;
  final _defaultSnackPosition = SnackPosition.BOTTOM;
  final _defaultMainButton = TextButton(
    onPressed: Get.back,
    child: const Text(
      'Entendi',
      style: TextStyle(),
    ),
  );

  final _defaultBoxShadows = [
    BoxShadow(
      color: const Color.fromARGB(255, 30, 0, 0).withOpacity(0.2),
      offset: const Offset(0, 2),
      blurRadius: 4,
    ),
  ];

  void show(String message, {Widget? mainButton}) {
    Get.rawSnackbar(
      message: message,
      duration: _defaultDuration,
      margin: _defaultMargin,
      borderRadius: _defaultBorderRadius,
      snackPosition: _defaultSnackPosition,
      boxShadows: _defaultBoxShadows,
      mainButton: mainButton ?? _defaultMainButton,
    );
  }

  void showProviderError(ProviderErrorModel providerErrorModel) {
    show(providerErrorModel.content!);
  }
}
