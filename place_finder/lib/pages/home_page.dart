import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:place_finder/view_models/place_list_vm.dart';
import 'package:place_finder/view_models/place_vm.dart';
import 'package:place_finder/widget/place_list.dart';
import 'package:provider/provider.dart';
import 'package:map_launcher/map_launcher.dart' as launcher;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late Position _currentPosition;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        zoom: 14)));
  }

  void _openMapsFor(PlaceVM vm) async {
    final availableMaps = await launcher.MapLauncher.installedMaps;
    await availableMaps.first
        .showMarker(coords: Coords(vm.latitude, vm.longitude), title: vm.name);
  }

  Set<Marker> _getPlaceMarkers(List<PlaceVM> places) {
    return places.map((place) {
      return Marker(
          markerId: MarkerId(place.placeId),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: place.name),
          position: LatLng(place.latitude, place.longitude));
    }).toSet();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PlaceListVM>();
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
            mapType: vm.mapType,
            markers: _getPlaceMarkers(vm.places),
            myLocationButtonEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
                target: LatLng(45.521563, -122.677433), zoom: 14)),
        SafeArea(
          child: TextField(
            onSubmitted: (value) => {
              vm.fetchPlacesByKeywordAndPosition(
                  value, _currentPosition.latitude, _currentPosition.longitude)
            },
            decoration: InputDecoration(
                labelText: 'Search here',
                fillColor: Colors.white,
                filled: true),
          ),
        ),
        Visibility(
          visible: vm.places.isNotEmpty,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => PlaceList(
                              places: vm.places,
                              onSelected: _openMapsFor,
                            ));
                  },
                  child: Text("Show List"),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 150,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                vm.toogleMapType();
              },
              child: Icon(Icons.map),
            ))
      ],
    ));
  }
}
