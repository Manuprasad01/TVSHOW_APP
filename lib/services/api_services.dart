import 'package:dio/dio.dart';

class ApiServices {
  static const String baseUrl = "https://api.tvmaze.com";
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    followRedirects: true,
    headers: {
      'Content-Type': 'application/json',
    },
  ))
    ..interceptors.addAll([
      LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true)
    ]);

  static Future<Response> get(String endpoint, {dynamic data}) async {
    try {
      final Response response = await _dio.get(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
