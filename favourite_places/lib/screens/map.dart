import 'package:favourite_places/model/place_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {super.key,
      this.isSelecting = true,
      this.location = const PlaceLocation(
          latitude: 37.422, longitude: -122.084, address: '')});
  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Pick Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop(_pickedLocation);
                },
                icon: Icon(Icons.save))
        ],
      ),
      body: GoogleMap(
          onTap: (position) {
            setState(() {
              _pickedLocation = position;
            });
          },
          markers: (_pickedLocation == null && widget.isSelecting)
              ? {}
              : {
                  Marker(
                      position: _pickedLocation ??
                          LatLng(widget.location.latitude,
                              widget.location.longitude),
                      markerId: const MarkerId('m1'))
                },
          initialCameraPosition: CameraPosition(
              zoom: 16,
              target:
                  LatLng(widget.location.latitude, widget.location.longitude))),
    );
  }
}
