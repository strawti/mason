import 'package:get/get.dart';

import 'api_client.dart';

class GetConnectClient implements ApiClient {
  final GetConnect client;
  GetConnectClient(this.client);

  @override
  Future<ResponseApiClient> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    final response = await client.delete(
      url,
      headers: headers,
      query: query,
    );

    return ResponseApiClient(
      statusCode: response.statusCode,
      bodyString: response.bodyString,
      statusText: response.statusText,
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
      url,
      headers: headers,
      query: query,
    );

    return ResponseApiClient(
      statusCode: response.statusCode,
      bodyString: response.bodyString,
      statusText: response.statusText,
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
    Progress? uploadProgress,
  }) async {
    final response = await client.patch(
      url,
      body,
      headers: headers,
      query: query,
      uploadProgress: uploadProgress,
    );

    return ResponseApiClient(
      statusCode: response.statusCode,
      bodyString: response.bodyString,
      statusText: response.statusText,
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
      url,
      body,
      headers: headers,
      query: query,
    );

    return ResponseApiClient(
      statusCode: response.statusCode,
      bodyString: response.bodyString,
      statusText: response.statusText,
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
      url,
      body,
      headers: headers,
      query: query,
    );

    return ResponseApiClient(
      statusCode: response.statusCode,
      bodyString: response.bodyString,
      statusText: response.statusText,
      headers: response.headers,
      body: response.body,
    );
  }

  
}
