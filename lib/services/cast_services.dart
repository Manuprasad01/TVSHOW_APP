import 'package:dio/dio.dart';
import 'package:tvshow/services/api_services.dart';

class CastServices {
  Future<Response> getCasts(int showId) async {
    try {
      final Response response = await ApiServices.get('/shows/$showId/cast');
      return response;
    } on DioException catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
