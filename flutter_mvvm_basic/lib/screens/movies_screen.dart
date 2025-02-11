import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/screens/favourite_screen.dart';
import 'package:flutter_mvvm_basic/screens/movie_details_screen.dart';
import 'package:flutter_mvvm_basic/utils/init_getit.dart';
import 'package:flutter_mvvm_basic/utils/app_context_utils.dart';
import 'package:flutter_mvvm_basic/widgets/movies/movies_widget.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Popular Movies'),
          actions: [
            IconButton(
              onPressed: () {
                getIt<NavigationUtils>().navigate(FavouriteScreen());
              },
              icon: const Icon(Icons.favorite_rounded),
              color: Colors.red,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dark_mode),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => MoviesWidget(),
        ));
  }
}
