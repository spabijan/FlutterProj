class UrlHelper {
  static String urlForReferenceImage(String photoReferenceId) {
    return 'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photoReferenceId&key=AIzaSyDKfNIJcHeJGHchq_X2Zptn6ITU4_xZX-Y';
  }

  static String urlForPlaceKeywordAndLocation(
      String keyword, double longitude, double latitude) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=$keyword&location=$latitude,$longitude&radius=1500&type=restaurant&key=AIzaSyDKfNIJcHeJGHchq_X2Zptn6ITU4_xZX-Y";
  }
}
