import 'package:flutter/material.dart';
import 'package:place_finder/services/webservice.dart';
import 'package:place_finder/view_models/place_vm.dart';

class PlaceListVM extends ChangeNotifier {
  var places = List.empty();

  Future<void> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    final results = await Webservice()
        .fetchPlacesByKeywordAndPosition(keyword, latitude, longitude);
    places = results.map((place) => PlaceVM(place)).toList();
    notifyListeners();
  }
}
