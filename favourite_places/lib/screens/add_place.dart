import 'package:favourite_places/model/place.dart';
import 'package:favourite_places/providers/user_places.dart';
import 'package:favourite_places/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _tittleController = TextEditingController();

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
              ImageInput(),
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

  void _onAddPlace() {
    final enteredTitle = _tittleController.text;
    if (enteredTitle.isEmpty) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(Place(title: enteredTitle));
    Navigator.of(context).pop();
  }
}
