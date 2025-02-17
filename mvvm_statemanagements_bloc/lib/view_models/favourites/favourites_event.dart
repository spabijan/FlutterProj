part of 'favourites_bloc.dart';

sealed class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class LoadFavourites extends FavouritesEvent {}

class AddToFavourite extends FavouritesEvent {
  final MovieModel movieModel;

  const AddToFavourite({required this.movieModel});
}

class RemoveFromFavourite extends FavouritesEvent {
  final MovieModel movieModel;

  const RemoveFromFavourite({required this.movieModel});
}

class RemoveAllFavourites extends FavouritesEvent {}
