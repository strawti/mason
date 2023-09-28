import 'package:get/get.dart';

class AppValidators {
  String? simpleValidate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }

  String? emailValidate(String? value) {
    final isValid = simpleValidate(value);

    if (isValid == null) {
      if (GetUtils.isEmail(value!.trim())) {
        return null;
      } else {
        return "E-mail é inválido";
      }
    }

    return isValid;
  }

  String? passwordValidate(String? value) {
    final isValid = simpleValidate(value);

    if (isValid == null) {
      value = value!.trim();
      if (value.length < 6) {
        return "A senha deve ter pelo menos oito caracteres";
      } else {
        return null;
      }
    }

    return isValid;
  }
}
