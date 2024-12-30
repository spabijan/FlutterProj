import 'package:favourite_places/model/place.dart';
import 'package:riverpod/riverpod.dart';

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
        (ref) => UserPlacesNotifier());

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(Place newPlace) {
    state = [newPlace, ...state];
  }
}
