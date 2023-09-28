// ignore: non_constant_identifier_names
T TernaryClean<T>({
  required bool condition,
  required T caseTrue,
  required T caseFalse,
}) {
  return condition ? caseTrue : caseFalse;
}
