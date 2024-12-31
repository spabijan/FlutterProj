import 'package:favourite_places/model/place.dart';
import 'package:favourite_places/model/place_location.dart';
import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/widgets/image_input.dart';
import 'package:favourite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _tittleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  @override
  void dispose() {
    _tittleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add new Place'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(label: Text('Tittle')),
                controller: _tittleController,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              ImageInput(onPickImage: _saveImage),
              const SizedBox(
                height: 8,
              ),
              LocationInput(
                onSelectLocation: _saveLocation,
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton.icon(
                  onPressed: _onAddPlace,
                  icon: const Icon(Icons.add),
                  label: Text('Add place'))
            ],
          ),
        ));
  }

  void _saveImage(File? file) {
    _selectedImage = file;
  }

  void _saveLocation(PlaceLocation location) {
    _selectedLocation = location;
  }

  void _onAddPlace() {
    final enteredTitle = _tittleController.text;
    if (enteredTitle.isEmpty ||
        _selectedImage == null ||
        _selectedLocation == null) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(Place(
        title: enteredTitle,
        image: _selectedImage!,
        location: _selectedLocation!));
    Navigator.of(context).pop();
  }
}
