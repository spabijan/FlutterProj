import 'package:mvvm_statemanagements/models/movies_model.dart';

class FavoritesViewModel {
  final List<MovieModel> favouriteMovies;

  FavoritesViewModel({required this.favouriteMovies});

  factory FavoritesViewModel.empty() =>
      FavoritesViewModel(favouriteMovies: List.empty());

  FavoritesViewModel copyWith({
    List<MovieModel>? favouriteMovies,
  }) {
    return FavoritesViewModel(
      favouriteMovies: favouriteMovies ?? this.favouriteMovies,
    );
  }
}
