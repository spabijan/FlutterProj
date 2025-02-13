import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/data/view_models/movie_view_model.dart';

class FavouriteButtonWidget extends StatefulWidget {
  const FavouriteButtonWidget({super.key, required movieViewModel})
      : _movieViewModel = movieViewModel;
  final MovieViewModel _movieViewModel;

  @override
  State<FavouriteButtonWidget> createState() => _FavouriteButtonWidgetState();
}

class _FavouriteButtonWidgetState extends State<FavouriteButtonWidget> {
  final List<int> favouriteMovieIds = [];

  void _toogleFavourite(bool isFavourite) => setState(
      isFavourite
          ? () => favouriteMovieIds.remove(widget._movieViewModel.id)
          : () => favouriteMovieIds.add(widget._movieViewModel.id),
    );

  @override
  Widget build(BuildContext context) {
    bool isFavourite = favouriteMovieIds.contains(widget._movieViewModel.id);

    return IconButton(
        onPressed: () => _toogleFavourite(isFavourite),
        icon: Icon(
          isFavourite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
          size: 20,
        ));
  }
}
