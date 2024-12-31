import 'dart:ffi';
import 'dart:io';

import 'package:favourite_places/model/place.dart';
import 'package:favourite_places/model/place_location.dart';
import 'package:riverpod/riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());

Future<Database> _getDatabase() async {
  final dbpath = await sql.getDatabasesPath();
  return await sql.openDatabase(path.join(dbpath, 'places.db'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lon REAL, address TEXT)');
  }, version: 1);
}

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  Future<void> loadPlaces() async {
    var db = await _getDatabase();
    var data = await db.query('user_places');
    var places = data
        .map((row) => Place(
            id: row['id'] as String,
            title: row['title'] as String,
            image: File(row['image'] as String),
            location: PlaceLocation(
                latitude: row['lat'] as double,
                longitude: row['lon'] as double,
                address: row['address'] as String)))
        .toList();
    state = places;
  }

  void addPlace(Place newPlace) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(newPlace.image.path);
    final copiedImage = await newPlace.image.copy('${appDir.path}/$fileName');

    var updatedPlace = Place(
        title: newPlace.title, image: copiedImage, location: newPlace.location);

    var db = await _getDatabase();

    db.insert('user_places', {
      'id': updatedPlace.id,
      'title': updatedPlace.title,
      'image': copiedImage.path,
      'lat': updatedPlace.location.latitude,
      'lon': updatedPlace.location.longitude,
      'address': updatedPlace.location.address
    });
    state = [updatedPlace, ...state];
  }
}
