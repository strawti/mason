import 'package:get/get.dart';

class AppSnackbar {
  AppSnackbar._();

  static void show(String message) {
    Get.rawSnackbar(message: message);
  }
}
