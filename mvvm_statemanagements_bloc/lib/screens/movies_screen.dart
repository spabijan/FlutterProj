import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_statemanagements/view_models/movies/movies_bloc.dart';
import 'package:mvvm_statemanagements/view_models/theme/theme_bloc.dart';

import '../constants/my_app_icons.dart';
import '../service/init_getit.dart';
import '../service/navigation_service.dart';
import '../widgets/movies/movies_widget.dart';
import 'favorites_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular Movies"),
        actions: [
          IconButton(
            onPressed: () {
              // getIt<NavigationService>().showSnackbar();
              // getIt<NavigationService>().showDialog(MoviesWidget());
              getIt<NavigationService>().navigate(const FavoritesScreen());
            },
            icon: const Icon(
              MyAppIcons.favoriteRounded,
              color: Colors.red,
            ),
          ),
          BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
            return IconButton(
              onPressed: () async {
                // context.read<ThemeBloc>().add(ToggleThemeEvent());
                getIt<ThemeBloc>().add(ToggleThemeEvent());
              },
              icon: Icon(
                state is DarkThemeState
                    ? MyAppIcons.darkMode
                    : MyAppIcons.lightMode,
              ),
            );
          }),
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return switch (state) {
            MoviesInitial() || MoviesLoadingState() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            MoviesLoadedState(
              movies: var movies,
              lenght: var length,
              isLoadingMore: var isLoadingMore
            ) ||
            MoviesLoadingMoreState(
              movies: var movies,
              lenght: var length,
              isLoadingMore: var isLoadingMore
            ) =>
              NotificationListener(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent &&
                      !isLoadingMore) {
                    getIt<MoviesBloc>().add(FetchMoreMoviesEvent());
                    return true;
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount: length,
                  itemBuilder: (context, index) {
                    if (index >= length && isLoadingMore) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    } else {
                      return MoviesWidget(movieModel: movies[index]);
                    }
                  },
                ),
              ),
            _ => const Center(
                child: Text('No data available'),
              )
          };
        },
      ),
    );
  }
}
