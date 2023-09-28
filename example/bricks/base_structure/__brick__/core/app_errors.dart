class AppErrors {
  static String defaultError(String message, Object error) {
    return "Não foi possível $message ($error)";
  }

  static const socketException = "Problemas de conexão";
  static const noSuchMethodError = "Algo não veio como o esperado";
}
