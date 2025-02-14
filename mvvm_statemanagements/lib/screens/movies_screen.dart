import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const MoviesWidget();
        },
      ),
    );
  }
}
