import 'package:place_finder/model/place.dart';

class PlaceVM {
  final Place _place;

  PlaceVM(Place place) : _place = place;

  String get placeId {
    return _place.placeId;
  }

  String get photoUrl {
    return _place.photoUrl;
  }

  double get latitude {
    return _place.latitude;
  }

  double get longitude {
    return _place.longitude;
  }
}
