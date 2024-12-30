import 'package:favourite_places/model/place.dart';
import 'package:flutter/material.dart';

class PlacesDetail extends StatelessWidget {
  const PlacesDetail({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Center(
          child: Text(place.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface))),
    );
  }
}
