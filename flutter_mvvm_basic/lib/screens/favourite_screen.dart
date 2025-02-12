import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/data/view_models/movie_view_model.dart';
import 'package:flutter_mvvm_basic/widgets/movies/movies_widget.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  final List<MovieViewModel> _movies = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Favourite Movies'), actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: Colors.red,
          )
        ]),
        body: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (context, index) => MoviesWidget(movie: _movies[index]),
        ));
  }
}
