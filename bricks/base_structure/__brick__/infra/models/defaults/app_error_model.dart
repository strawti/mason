import 'package:flutter/foundation.dart';

import 'provider_error_model.dart';
import 'provider_response_model.dart';

class AppErrorDefaultModel<T> extends ProviderResponseModel<T> {
  final String details;

  AppErrorDefaultModel(
    this.details,
  ) : super(
          isSuccess: false,
          error: ProviderErrorModel(
            details: details,
            content: kDebugMode ? details : '',
          ),
        );
}
