import 'package:flutter/material.dart';
import 'package:flutter_mvvm_basic/data/view_models/movie_view_model.dart';
import 'package:flutter_mvvm_basic/widgets/cached_image.dart';
import 'package:flutter_mvvm_basic/widgets/movies/favourite_button_wiget.dart';
import 'package:flutter_mvvm_basic/widgets/movies/genres_list_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required movie}) : _movie = movie;
  final MovieViewModel _movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Hero(
            tag: _movie.id,
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: CachedImage(
                  imageUrl: _movie.imageUrl,
                )),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                _movie.title,
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(height: 5.0),
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
                                  Text(_movie.rating),
                                  Spacer(),
                                  Text(
                                    _movie.releaseDate,
                                    style: TextStyle(color: Colors.grey),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GenresListWidget(
                                movie: _movie,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                _movie.overview,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: EdgeInsets.all(6.0),
                          child: FavouriteButtonWidget(movieViewModel: _movie),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12)),
                child: BackButton(),
              ))
        ],
      )),
    );
  }
}
