import 'package:flutter/material.dart';

import 'package:flutter_mvvm_basic/data/view_models/movie_view_model.dart';
import 'package:flutter_mvvm_basic/screens/movie_details_screen.dart';
import 'package:flutter_mvvm_basic/utils/app_context_utils.dart';
import 'package:flutter_mvvm_basic/utils/init_getit.dart';
import 'package:flutter_mvvm_basic/widgets/cached_image.dart';
import 'package:flutter_mvvm_basic/widgets/movies/favourite_button_wiget.dart';
import 'package:flutter_mvvm_basic/widgets/movies/genres_list_widget.dart';

class MoviesWidget extends StatelessWidget {
  final MovieViewModel _movie;

  const MoviesWidget({super.key, required movie}) : _movie = movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () => getIt<NavigationUtils>()
              .navigate(MovieDetailsScreen(movie: _movie)),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: IntrinsicWidth(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: _movie.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedImage(
                        imageUrl: _movie.imageUrl,
                        width: 70,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _movie.title,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GenresListWidget(
                        movie: _movie,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(_movie.rating)
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: Colors.greenAccent,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(_movie.releaseDate,
                              style: TextStyle(color: Colors.grey)),
                          Spacer(),
                          FavouriteButtonWidget(movieViewModel: _movie)
                        ],
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
