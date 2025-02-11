import 'package:flutter/material.dart';

class FavouriteButtonWidget extends StatelessWidget {
  const FavouriteButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          // TODO: implement add to favourites
        },
        icon: Icon(
          Icons.favorite_outline_rounded,
          //color: Colors.red,
          size: 20,
        ));
  }
}
