import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mvvm_statemanagements/models/movies_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc() : super(FavouritesInitial()) {
    on<LoadFavourites>(_loadFavourites);
    on<AddToFavourite>(_addToFavourite);
    on<RemoveFromFavourite>(_removeFromFavourite);
    on<RemoveAllFavourites>(_removeAllFavourites);
  }

  final favskey = 'favsKey';
  _addToFavourite(AddToFavourite event, emit) async {
    switch (state) {
      case FavouritesLoaded(movieModel: var movieModel):
        var newFavouriteList = List<MovieModel>.from(movieModel)
          ..add(event.movieModel);

        emit(FavouritesLoaded(movieModel: newFavouriteList));
        _saveFavourites(newFavouriteList);
      case _:
        break;
    }
  }

  _removeFromFavourite(event, emit) async {
    switch (state) {
      case FavouritesLoaded(movieModel: var movieModel):
        var newFavouriteList = List<MovieModel>.from(movieModel)
          ..remove(event.movieModel);

        emit(FavouritesLoaded(movieModel: newFavouriteList));
        _saveFavourites(newFavouriteList);
      case _:
        break;
    }
  }

  _removeAllFavourites(event, emit) async {
    emit(const FavouritesLoaded(movieModel: []));
    _saveFavourites([]);
  }

  _loadFavourites(event, emit) async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(favskey) ?? [];
    final favsList =
        stringList.map((e) => MovieModel.fromJson(jsonDecode(e))).toList();
    emit(FavouritesLoaded(movieModel: favsList));
  }

  _saveFavourites(List<MovieModel> favouritesList) async {
    final prefs = await SharedPreferences.getInstance();
    final stringList =
        favouritesList.map((e) => json.encode(e.toJson())).toList();
    prefs.setStringList(favskey, stringList);
  }
}
