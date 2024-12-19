import 'package:flutter/material.dart';
import '../models/cast_model.dart';
import '../services/cast_services.dart';

class CastController extends ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  bool _isloadingTwo = false;
  bool get isloadingTwo => _isloadingTwo;
  List<CastModel> _casts = [];
  List<CastModel> get casts => _casts;

  Future<void> getCasts(int showId) async {
    _isloading = true;
    try {
      final response = await CastServices().getCasts(showId);
      print("***********${response.statusCode}");
      if (response.statusCode == 200) {
        _casts = (response.data as List<dynamic>)
            .map((result) => CastModel.fromJson(result))
            .toList();
      }
    } catch (e) {
    }
    _isloading = false;
    notifyListeners();
  }
}
