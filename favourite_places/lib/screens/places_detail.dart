import 'package:favourite_places/model/place.dart';
import 'package:favourite_places/screens/map.dart';
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
        body: Stack(
          children: [
            Image.file(place.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => MapScreen(
                                  location: place.location,
                                  isSelecting: false,
                                )));
                      },
                      child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(_getMapSnapshotUrl)),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.transparent, Colors.black54],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Text(
                        place.location.address,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }

  String get _getMapSnapshotUrl {
    final lat = place.location.latitude;
    final lon = place.location.longitude;
    return "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lon&zoom=16&size=600x300&maptype=roadmap&markers=color:Red%7Clabel:A%7C$lat,$lon&key=AIzaSyAhj6xW5RjUyVClERC5Ikf13JUTyVSCNTw";
  }
}
