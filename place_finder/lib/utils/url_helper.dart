class UrlHelper {
  static String urlForPlaceKeywordAndLocation(
      String keyword, double longitude, double latitude) {
    return "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=$keyword&location=$latitude,$longitude&radius=1500&type=restaurant&key=YOUR_API_KEY";
  }
}
