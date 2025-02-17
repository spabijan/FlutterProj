part of 'favourites_bloc.dart';

sealed class FavouritesState extends Equatable {
  const FavouritesState();

  @override
  List<Object> get props => [];
}

final class FavouritesInitial extends FavouritesState {}

final class FavouritesLoaded extends FavouritesState {
  final List<MovieModel> movieModel;

  const FavouritesLoaded({required this.movieModel});
  @override
  List<Object> get props => [movieModel];
}

final class FavouritesLoading extends FavouritesState {}

final class FavouritesError extends FavouritesState {
  final String errorMessage;

  const FavouritesError({required this.errorMessage});
}
