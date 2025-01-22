import 'package:flutter/material.dart';
import 'package:place_finder/utils/url_helper.dart';
import 'package:place_finder/view_models/place_vm.dart';

class PlaceList extends StatelessWidget {
  final List<PlaceVM> places;
  final Function(PlaceVM) onSelected;

  const PlaceList({super.key, required this.places, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          final place = places[index];
          return ListTile(
            onTap: () {
              onSelected(place);
            },
            leading: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  UrlHelper.urlForReferenceImage(place.photoUrl),
                  fit: BoxFit.cover,
                )),
            title: Text(place.name),
          );
        });
  }
}
