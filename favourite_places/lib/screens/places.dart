import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/screens/add_place.dart';
import 'package:favourite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListScreen extends ConsumerStatefulWidget {
  const PlacesListScreen({super.key});

  @override
  ConsumerState<PlacesListScreen> createState() {
    return _PlacesListScreenState();
  }
}

class _PlacesListScreenState extends ConsumerState<PlacesListScreen> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () => _onAddButtonPressed(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: FutureBuilder(
              future: _placesFuture,
              builder: (context, snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : PlacesList(places: userPlaces))),
    );
  }

  void _onAddButtonPressed(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()));
  }
}
