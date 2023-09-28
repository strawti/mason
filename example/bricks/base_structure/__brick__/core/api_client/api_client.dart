import 'package:flutter/foundation.dart';

@immutable
abstract class ApiClient {
  Future<ResponseApiClient> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });

  Future<ResponseApiClient> post(
    String url,
    dynamic body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });

  Future<ResponseApiClient> put(
    String url,
    dynamic body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });

  Future<ResponseApiClient> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });

  Future<ResponseApiClient> patch(
    String url,
    dynamic body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  });
}

@immutable
class ResponseApiClient<B> {
  const ResponseApiClient({
    this.statusCode,
    this.bodyString,
    this.statusText = '',
    this.headers = const {},
    this.body,
  });

  /// The response headers.
  final Map<String, String>? headers;

  /// The status code returned by the server.
  final int? statusCode;

  /// Human-readable context for [statusCode].
  final String? statusText;

  /// [HttpStatus] from [Response]. `status.connectionError` is true
  /// when statusCode is null. `status.isUnauthorized` is true when
  /// statusCode is equal `401`. `status.isNotFound` is true when
  /// statusCode is equal `404`. `status.isServerError` is true when
  /// statusCode is between `500` and `599`.
  HttpStatus get status => HttpStatus(statusCode);

  /// `hasError` is true when statusCode is not between 200 and 299.
  bool get hasError => status.hasError;

  /// `isOk` is true when statusCode is between 200 and 299.
  bool get isOk => !hasError;

  /// `unauthorized` is true when statusCode is equal `401`.
  bool get unauthorized => status.isUnauthorized;

  /// The response body as a Stream of Bytes.
  final String? bodyString;

  /// The decoded body of this [Response]. You can access the
  /// body parameters as Map
  /// Ex: `body['title'];`
  final B? body;
}

@immutable
class HttpStatus {
  const HttpStatus(this.code);

  final int? code;

  static const int continue_ = 100;
  static const int switchingProtocols = 101;
  static const int processing = 102;
  static const int earlyHints = 103;
  static const int ok = 200;
  static const int created = 201;
  static const int accepted = 202;
  static const int nonAuthoritativeInformation = 203;
  static const int noContent = 204;
  static const int resetContent = 205;
  static const int partialContent = 206;
  static const int multiStatus = 207;
  static const int alreadyReported = 208;
  static const int imUsed = 226;
  static const int multipleChoices = 300;
  static const int movedPermanently = 301;
  static const int found = 302;
  static const int movedTemporarily = 302; // Common alias for found.
  static const int seeOther = 303;
  static const int notModified = 304;
  static const int useProxy = 305;
  static const int switchProxy = 306;
  static const int temporaryRedirect = 307;
  static const int permanentRedirect = 308;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int paymentRequired = 402;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int methodNotAllowed = 405;
  static const int notAcceptable = 406;
  static const int proxyAuthenticationRequired = 407;
  static const int requestTimeout = 408;
  static const int conflict = 409;
  static const int gone = 410;
  static const int lengthRequired = 411;
  static const int preconditionFailed = 412;
  static const int requestEntityTooLarge = 413;
  static const int requestUriTooLong = 414;
  static const int unsupportedMediaType = 415;
  static const int requestedRangeNotSatisfiable = 416;
  static const int expectationFailed = 417;
  static const int imATeapot = 418;
  static const int misdirectedRequest = 421;
  static const int unprocessableEntity = 422;
  static const int locked = 423;
  static const int failedDependency = 424;
  static const int tooEarly = 425;
  static const int upgradeRequired = 426;
  static const int preconditionRequired = 428;
  static const int tooManyRequests = 429;
  static const int requestHeaderFieldsTooLarge = 431;
  static const int connectionClosedWithoutResponse = 444;
  static const int unavailableForLegalReasons = 451;
  static const int clientClosedRequest = 499;
  static const int internalServerError = 500;
  static const int notImplemented = 501;
  static const int badGateway = 502;
  static const int serviceUnavailable = 503;
  static const int gatewayTimeout = 504;
  static const int httpVersionNotSupported = 505;
  static const int variantAlsoNegotiates = 506;
  static const int insufficientStorage = 507;
  static const int loopDetected = 508;
  static const int notExtended = 510;
  static const int networkAuthenticationRequired = 511;
  static const int networkConnectTimeoutError = 599;

  bool get connectionError => code == null;

  bool get isUnauthorized => code == unauthorized;

  bool get isForbidden => code == forbidden;

  bool get isNotFound => code == notFound;

  bool get isServerError =>
      between(internalServerError, networkConnectTimeoutError);

  bool between(int begin, int end) {
    return !connectionError && code! >= begin && code! <= end;
  }

  bool get isOk => between(200, 299);

  bool get hasError => !isOk;
}
