import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_statemanagements/service/init_getit.dart';
import 'package:mvvm_statemanagements/view_models/favourites/favourites_bloc.dart';
import 'package:mvvm_statemanagements/widgets/movies/movies_widget.dart';

import '../constants/my_app_icons.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              MyAppIcons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: BlocBuilder<FavouritesBloc, FavouritesState>(
          bloc: getIt<FavouritesBloc>(),
          builder: (context, state) => switch (state) {
                FavouritesLoaded(movieModel: var favorites) => ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      return MoviesWidget(movieModel: favorites[index]);
                    },
                  ),
                FavouritesError(errorMessage: var message) => Center(
                    child: Text("Error with loading favorites: $message"),
                  ),
                FavouritesLoading() => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                _ => const SizedBox.shrink(),
              }),
    );
  }
}
