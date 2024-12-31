import 'dart:convert';

import 'package:favourite_places/model/place_location.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});
  final void Function(PlaceLocation) onSelectLocation;
  @override
  State<StatefulWidget> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;

  void _getCurrentLocation() async {
    setState(() {
      _isGettingLocation = true;
    });

    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }
    locationData = await location.getLocation();
    var lat = locationData.latitude;
    var lon = locationData.longitude;

    if (lat == null || lon == null) {
      return;
    }

    final url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lon&key=AIzaSyAhj6xW5RjUyVClERC5Ikf13JUTyVSCNTw");

    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address = resData['results'][0]['formatted_address'];

    setState(() {
      _pickedLocation =
          PlaceLocation(latitude: lat, longitude: lon, address: address);
      _isGettingLocation = false;
    });
    widget.onSelectLocation(_pickedLocation!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.primary.withAlpha(50))),
        height: 170,
        width: double.infinity,
        alignment: Alignment.center,
        child: _locationWidgetBody,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
              icon: const Icon(Icons.location_on),
              onPressed: _getCurrentLocation,
              label: const Text('Get Current Location')),
          TextButton.icon(
              icon: const Icon(Icons.map),
              onPressed: () {},
              label: const Text('Select on map'))
        ],
      )
    ]);
  }

  Widget get _locationWidgetBody {
    if (_isGettingLocation) {
      return _loadingLocation;
    }
    if (_pickedLocation != null) {
      return _getMapSnapshot;
    }
    return _noLocationChoosen;
  }

  Widget get _noLocationChoosen {
    return Text(
      'No location chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: Theme.of(context).colorScheme.onSurface),
    );
  }

  Widget get _loadingLocation {
    return const CircularProgressIndicator();
  }

  Widget get _getMapSnapshot {
    final lat = _pickedLocation!.latitude;
    final lon = _pickedLocation!.longitude;
    String url =
        "https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lon&zoom=16&size=600x300&maptype=roadmap&markers=color:Red%7Clabel:A%7C$lat,$lon&key=AIzaSyAhj6xW5RjUyVClERC5Ikf13JUTyVSCNTw";
    return Image.network(url,
        fit: BoxFit.cover, width: double.infinity, height: double.infinity);
  }
}
