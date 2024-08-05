import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:khusm/core/network/network_info.dart';

const String serverScheme = 'https';
// Server URL Dev
const String serverAuthority = 'api.mediconsulteg.com';

class ServerApiClient {
  final NetworkInfoRepository networkInfoRepository;
  final Dio dio;

  ServerApiClient({
    required this.networkInfoRepository,
    Dio? dio,
  }) : dio = dio ?? Dio();

  final Map<String, String> _authHeader = {};
  Map<String, String> get authHeader => _authHeader;

  Future<Response> get(
    String path, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final url = Uri(
      scheme: serverScheme,
      host: serverAuthority,
      path: path,
      queryParameters: queryParameters,
    ).toString();

    final Map<String, String> allHeaders = _authHeader;
    if (headers != null) {
      allHeaders.addAll(headers);
    }
    if (!allHeaders.containsKey('Content-Type')) {
      allHeaders['Content-Type'] = 'application/json';
    }

    Response response;
    try {
      response = await dio.get(
        url,
        options: Options(
          headers: _authHeader..addAll(headers ?? {}),
        ),
      );
    } catch (ex) {
      final check = await networkInfoRepository.hasConnection;
      if (!check) {
        // for check another event
      }
      rethrow;
    }

    if (kDebugMode) {
      log(_formatResponseLog(response));
    }

    return _processResponse(
      response: response,
      requestFunc: () =>
          get(path, queryParameters: queryParameters, headers: headers),
    );
  }

  Future<T> _processResponse<T>({
    required Response response,
    required FutureOr<T> Function() requestFunc,
  }) async {
    if (response.statusCode! >= 200 && response.statusCode! <= 300) {
      return response.data as T;
    } else if (response.statusCode == 401) {
      // for check another event
      return response.data as T;
    } else {
      // for check another event
      return response.data as T;
    }
  }

  String _formatResponseLog(Response response, {Object? requestBody}) {
    final time = DateTime.now().toUtc().toIso8601String();
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String formattedRequestBody =
        requestBody != null ? encoder.convert(requestBody) : '';
    String formattedBodyJson;
    try {
      final json = jsonDecode(response.data);
      formattedBodyJson = encoder.convert(json);
    } catch (e) {
      formattedBodyJson = response.data.toString();
    }
    return '''
  $time
  Request: ${response.requestOptions}${formattedRequestBody.isNotEmpty == true ? '\n  Request body: $formattedRequestBody' : ''}
  Response code: ${response.statusCode}
  Body: $formattedBodyJson
  ''';
  }
}
