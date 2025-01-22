class Place {
  final String name;
  final double latitude;
  final double longitude;
  final String placeId;
  final String photoUrl;

  Place(
      {required this.name,
      required this.latitude,
      required this.longitude,
      required this.placeId,
      required this.photoUrl});

  factory Place.fromJson(Map<String, dynamic> json) {
    final location = json['geometry']['location'];
    return Place(
        latitude: location['lat'],
        longitude: location['lon'],
        placeId: json['place_id'],
        name: json['name'],
        photoUrl: json['photos'][0]['photo_reference']);
  }
}
