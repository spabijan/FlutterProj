import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/widgets/movies/movies_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
          itemCount: 10,
          itemBuilder: (context, index) => MoviesWidget(),
        ));
  }
}
