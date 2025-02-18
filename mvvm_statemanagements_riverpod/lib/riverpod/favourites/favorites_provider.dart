import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_statemanagements/models/movies_model.dart';
import 'package:mvvm_statemanagements/riverpod/favourites/favorites_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favouritesProvider =
    NotifierProvider<FavouritesNotifier, FavoritesViewModel>(
        FavouritesNotifier.new);

class FavouritesNotifier extends Notifier<FavoritesViewModel> {
  @override
  build() {
    return FavoritesViewModel.empty();
  }

  final favskey = "favsKey";
  bool isFavorite(MovieModel movieModel) {
    return state.favouriteMovies.any((movie) => movie.id == movieModel.id);
  }

  Future<void> addOrRemoveFromFavorites(MovieModel movieModel) async {
    if (isFavorite(movieModel)) {
      state = state.copyWith(favouriteMovies: [
        for (final movie in state.favouriteMovies)
          if (movie.id != movieModel.id) movie
      ]);
    } else {
      state = state
          .copyWith(favouriteMovies: [...state.favouriteMovies, movieModel]);
    }
    await saveFavorites();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = state.favouriteMovies
        .map((movie) => json.encode(movie.toJson()))
        .toList();
    prefs.setStringList(favskey, stringList);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(favskey) ?? [];
    final List<MovieModel> newList = [
      for (final movieJson in stringList)
        MovieModel.fromJson(json.decode(movieJson))
    ];
    state = state.copyWith(favouriteMovies: newList);
  }

  void clearAllFavs() {
    state = state.copyWith(favouriteMovies: []);
    saveFavorites();
  }
}
