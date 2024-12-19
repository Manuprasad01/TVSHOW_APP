import 'package:dio/dio.dart';
import 'package:tvshow/services/api_services.dart';

class ShowServices {
  Future<Response> getShows() async {
    try {
      final Response response = await ApiServices.get('/shows');
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
