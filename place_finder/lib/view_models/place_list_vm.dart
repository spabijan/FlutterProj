import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_finder/services/webservice.dart';
import 'package:place_finder/view_models/place_vm.dart';

class PlaceListVM extends ChangeNotifier {
  List<PlaceVM> places = List.empty();
  var mapType = MapType.normal;

  void toogleMapType() {
    mapType = mapType == MapType.normal ? MapType.satellite : MapType.normal;
    notifyListeners();
  }

  Future<void> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    final results = await Webservice()
        .fetchPlacesByKeywordAndPosition(keyword, latitude, longitude);
    places = results.map((place) => PlaceVM(place)).toList();
    notifyListeners();
  }
}
