import 'package:flutter/material.dart';
import 'package:tvshow/models/show_model.dart';

import '../services/show_services.dart';

class ShowController extends ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  bool _isloadingTwo = false;
  bool get isloadingTwo => _isloadingTwo;
  List<ShowModel> _shows = [];
  List<ShowModel> get shows => _shows;

  Future<void> getShows() async {
    _isloading = true;
    try {
      final response = await ShowServices().getShows();
      print("***********${response.statusCode}");
     
      if (response.statusCode == 200) {
        _shows = (response.data as List<dynamic>)
            .map((result) => ShowModel.fromJson(result))
            .toList();
      }
    } catch (e) {
 
    }
    _isloading = false;
    notifyListeners();
  }
}