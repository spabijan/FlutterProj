import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_statemanagements/riverpod/movies/movies_provider.dart';
import 'package:mvvm_statemanagements/riverpod/theme/theme_provider.dart';
import 'package:mvvm_statemanagements/widgets/movies/movies_widget_provider.dart';

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
            Consumer(
              builder: (_, WidgetRef ref, __) {
                var themeState = ref.watch(themeProvider);
                return IconButton(
                  onPressed: () async {
                    ref.read(themeProvider.notifier).toggleTheme();
                  },
                  icon: Icon(themeState.icon),
                );
              },
            ),
          ],
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final moviesVm = ref.watch(moviesProvider);

            if (moviesVm.isLoading && moviesVm.moviesList.isEmpty) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (moviesVm.fetchMoviesError.isNotEmpty) {
              return Center(child: Text(moviesVm.fetchMoviesError));
            }

            return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent &&
                      !moviesVm.isLoading) {
                    ref.read(moviesProvider.notifier).getMovies();
                    return true;
                  }
                  return false;
                },
                child: ListView.builder(
                    itemCount: moviesVm.moviesList.length,
                    itemBuilder: (context, index) => ProviderScope(overrides: [
                          moviesViewModel
                              .overrideWithValue(moviesVm.moviesList[index])
                        ], child: const MoviesWidget())));
          },
        ));
  }
}
