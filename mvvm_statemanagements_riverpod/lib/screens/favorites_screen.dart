import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_statemanagements/riverpod/favourites/favorites_provider.dart';
import 'package:mvvm_statemanagements/widgets/movies/movies_widget_provider.dart';

import '../constants/my_app_icons.dart';
import '../widgets/movies/movies_widget.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesVM = ref.watch(favouritesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favouritesProvider.notifier).clearAllFavs();
            },
            icon: const Icon(
              MyAppIcons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: favoritesVM.favouriteMovies.length,
        itemBuilder: (context, index) {
          return ProviderScope(overrides: [
            moviesViewModel
                .overrideWithValue(favoritesVM.favouriteMovies[index])
          ], child: const MoviesWidget()); //const Text("data");
        },
      ),
    );
  }
}
