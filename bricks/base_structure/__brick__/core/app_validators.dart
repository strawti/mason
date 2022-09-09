String? simpleValidate(String? value) {
  if (value == null) {
    return 'Campo obrigatório';
  }

  if (value.isEmpty) {
    return 'Campo não pode ser vazio';
  }

  return null;
}