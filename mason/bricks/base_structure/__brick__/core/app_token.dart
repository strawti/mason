import 'package:get_storage/get_storage.dart';

class AppToken {
  AppToken._();

  static AppToken instance = AppToken._();

  String get token => GetStorage().read('token') ?? '';

  bool hasToken() {
    return token.isNotEmpty;
  }

  Future<void> setToken(String? token) async {
    await GetStorage().write('token', token);
  }
}
