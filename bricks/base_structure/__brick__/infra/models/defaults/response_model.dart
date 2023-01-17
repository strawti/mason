import 'package:flutter/foundation.dart';

@immutable
class ResponseModel<T> {
  final String status;
  final String message;
  final T? data;

  bool get isSuccess => status == 'success';
  bool get isWarning => status == 'warning';
  bool get isError => status == 'error';

  const ResponseModel.success(
    this.data, {
    this.message = 'success',
    this.status = 'success',
  });

  const ResponseModel.warning(
    this.message, {
    this.data,
    this.status = 'warning',
  });

  const ResponseModel.error(
    this.message, {
    this.data,
    this.status = 'error',
  });
}
