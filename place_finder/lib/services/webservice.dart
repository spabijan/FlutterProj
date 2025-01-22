import 'dart:convert';

import 'package:place_finder/model/place.dart';
import 'package:place_finder/utils/url_helper.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<List<Place>> fetchPlacesByKeywordAndPosition(
      String keyword, double latitude, double longitude) async {
    final url =
        UrlHelper.urlForPlaceKeywordAndLocation(keyword, longitude, latitude);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final Iterable results = jsonResponse['results'];
      return results.map((place) => Place.fromJson(place)).toList();
    } else {
      throw Exception('Unable to perform request');
    }
  }
}
