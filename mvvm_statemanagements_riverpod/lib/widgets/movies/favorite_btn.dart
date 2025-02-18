import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_statemanagements/riverpod/favourites/favorites_provider.dart';
import 'package:mvvm_statemanagements/widgets/movies/movies_widget_provider.dart';

import '../../constants/my_app_icons.dart';

class FavoriteBtnWidget extends ConsumerWidget {
  const FavoriteBtnWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movie = ref.watch(moviesViewModel);
    final favorites =
        ref.watch(favouritesProvider.select((state) => state.favouriteMovies));
    final isFavorite = favorites.any((element) => element.id == movie.id);
    return IconButton(
      onPressed: () {
        ref.read(favouritesProvider.notifier).addOrRemoveFromFavorites(movie);
      },
      icon: Icon(
        MyAppIcons.favoriteOutlineRounded,
        color: isFavorite ? Colors.red : null,
        size: 20,
      ),
    );
  }
}
