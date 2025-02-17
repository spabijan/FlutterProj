import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_statemanagements/screens/movies_screen.dart';
import 'package:mvvm_statemanagements/service/init_getit.dart';
import 'package:mvvm_statemanagements/service/navigation_service.dart';
import 'package:mvvm_statemanagements/view_models/favourites/favourites_bloc.dart';
import 'package:mvvm_statemanagements/view_models/movies/movies_bloc.dart';

import '../widgets/my_error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesBlock = getIt<MoviesBloc>();
    final favoritesBloc = getIt<FavouritesBloc>();
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<MoviesBloc, MoviesState>(
            bloc: moviesBlock..add(FetchMoreMoviesEvent()),
            listener: (context, state) {
              switch (state) {
                case MoviesLoadedState() || MoviesLoadingMoreState():
                  if (favoritesBloc.state is FavouritesLoaded) {
                    getIt<NavigationService>()
                        .navigateReplace(const MoviesScreen());
                  }
                  break;
                case MoviesErrorState():
                  getIt<NavigationService>()
                      .showSnackbar("Error while loading movies data");
                  break;
                case _:
                  break;
              }
            },
          ),
          BlocListener<FavouritesBloc, FavouritesState>(
            bloc: favoritesBloc..add(LoadFavourites()),
            listener: (context, state) {
              switch (state) {
                case FavouritesError(errorMessage: String message):
                  getIt<NavigationService>()
                      .showSnackbar("Error while loading movies data $message");
                  break;
                case _:
                  break;
              }
            },
          )
        ],
        child: BlocBuilder<MoviesBloc, MoviesState>(
          bloc: moviesBlock..add(FetchMoviesEvent()),
          builder: (context, state) {
            switch (state) {
              case MoviesLoadingState() || MoviesInitial():
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Loading...'),
                      SizedBox(
                        height: 20,
                      ),
                      CircularProgressIndicator.adaptive()
                    ],
                  ),
                );
              case MoviesErrorState():
                return MyErrorWidget(
                    errorText: state.message,
                    retryFunction: () =>
                        moviesBlock.add(FetchMoreMoviesEvent()));
              case _:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
