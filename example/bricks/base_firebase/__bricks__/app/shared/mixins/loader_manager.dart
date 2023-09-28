import 'package:get/get.dart';

mixin LoaderManagerMixin on GetxController {
  bool isLoading = false;
  
  void changeLoading(bool newValue) {
    isLoading = newValue;
    update();
  }
}
