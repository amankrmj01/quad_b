import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'rest_client.dart';

final dio = getDio();
final restClient = RestClient(baseUrl: "", dio);

Dio getDio() {
  BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    contentType: "application/json",
    connectTimeout: const Duration(seconds: 3),
    receiveTimeout: const Duration(seconds: 3),
    sendTimeout: const Duration(seconds: 3),
  );

  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (request, handler) {
      debugPrint("REQUEST[${request.method}] => body: ${request.data}");
      return handler.next(request);
    },
    onResponse: (response, handler) {
      debugPrint("RESPONSE[${response.statusCode}] => body: ${response.data}");
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      debugPrint(
          "ERROR[${e.response?.statusCode}] => message: ${e.message.toString()}");
      return handler.next(e);
    },
  ));
  return dio;
}
