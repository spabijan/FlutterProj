import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_statemanagements/models/movies_model.dart';
import 'package:mvvm_statemanagements/service/init_getit.dart';
import 'package:mvvm_statemanagements/view_models/favourites/favourites_bloc.dart';

import '../../constants/my_app_icons.dart';

class FavoriteBtnWidget extends StatelessWidget {
  const FavoriteBtnWidget({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesBloc, FavouritesState>(
      builder: (context, state) {
        bool isFavourite = switch (state) {
          FavouritesLoaded(movieModel: var favouriteMovies) =>
            favouriteMovies.contains(movieModel),
          _ => false
        };
        return IconButton(
          onPressed: () {
            getIt<FavouritesBloc>().add(isFavourite
                ? RemoveFromFavourite(movieModel: movieModel)
                : AddToFavourite(movieModel: movieModel));
          },
          icon: Icon(
            isFavourite
                ? Icons.favorite_rounded
                : MyAppIcons.favoriteOutlineRounded,
            color: isFavourite ? Colors.red : null,
            size: 20,
          ),
        );
      },
    );
  }
}
