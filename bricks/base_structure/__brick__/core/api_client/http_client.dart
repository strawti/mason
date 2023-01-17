import 'package:http/http.dart' as http;

import 'api_client.dart';

class HttpClient implements ApiClient {
  final http.Client client;
  HttpClient(this.client);

  @override
  Future<ResponseApiClient> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.delete(
      Uri(path: url, queryParameters: query),
      headers: headers,
    );

    return ResponseApiClient(
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
      headers: response.headers,
      body: response.body,
    );
  }

  @override
  Future<ResponseApiClient> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.get(
      Uri(path: url, queryParameters: query),
      headers: headers,
    );

    return ResponseApiClient(
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
      headers: response.headers,
      body: response.body,
    );
  }

  @override
  Future<ResponseApiClient> patch(
    String url,
    body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.patch(
      Uri(path: url, queryParameters: query),
      body: body,
      headers: headers,
    );

    return ResponseApiClient(
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
      headers: response.headers,
      body: response.body,
    );
  }

  @override
  Future<ResponseApiClient> post(
    String url,
    body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.post(
      Uri(path: url, queryParameters: query),
      headers: headers,
      body: body,
    );

    return ResponseApiClient(
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
      headers: response.headers,
      body: response.body,
    );
  }

  @override
  Future<ResponseApiClient> put(
    String url,
    body, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.put(
      Uri(path: url, queryParameters: query),
      body: body,
      headers: headers,
    );

    return ResponseApiClient(
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
      headers: response.headers,
      body: response.body,
    );
  }
}
