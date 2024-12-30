import 'package:favourite_places/model/place.dart';
import 'package:favourite_places/screens/places_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return places.isEmpty
        ? _buildEmptyListMessage(context)
        : _buildPlacesList(context);
  }

  Widget _buildEmptyListMessage(BuildContext context) {
    return Center(
      child: Text('No places added yet...',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onSurface)),
    );
  }

  Widget _buildPlacesList(BuildContext context) {
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => ListTile(
              leading: CircleAvatar(
                radius: 24,
                backgroundImage: FileImage(places[index].image),
              ),
              title: Text(
                places[index].title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              onTap: () => _gotoPlaceDetails(context, index),
            ));
  }

  void _gotoPlaceDetails(BuildContext context, int index) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => PlacesDetail(place: places[index])));
  }
}
