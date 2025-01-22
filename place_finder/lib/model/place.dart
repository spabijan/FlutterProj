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
    Iterable photos = json['photos'];

    return Place(
        latitude: location['lat'],
        longitude: location['lng'],
        placeId: json['place_id'],
        name: json['name'],
        photoUrl: photos.isEmpty
            ? "images/place_holder.png"
            : photos.first['photo_reference']);
  }
}
