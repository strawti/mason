import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../core/app_token.dart';

class ApiUtils {
  FutureOr<Request> requestModifier(Request request) async {
    String? token = AppToken.instance.token;

    request.headers.addAll({
      if (token.isNotEmpty) 'Authorization': 'Bearer $token',
      'content-type': 'application/json',
    });

    return request;
  }

  FutureOr<dynamic> responseModifier(Request request, Response response) async {
    showLogs(request, response);

    if (response.unauthorized) {}

    return response;
  }

  void showLogs(Request request, Response response) {
    if (kDebugMode) {
      print('\n\n');
      print('========================== REQUEST ==========================');
      print('(${request.method}) => ${request.url}');
      print('HEADERS: ${request.headers}');
      print('');
      print('========================== RESPONSE ==========================');
      print('STATUS CODE: ${response.statusCode}: ${response.statusText}');
      print('BODY: ${response.body}');
      print('\n\n');
    }
  }
}
