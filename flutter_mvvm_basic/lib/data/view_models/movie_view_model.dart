import 'package:flutter_mvvm_basic/constants/api_constants.dart';
import 'package:flutter_mvvm_basic/model/movie.dart';

class MovieViewModel {
  MovieViewModel({required Movie movie}) : _movie = movie;

  final Movie _movie;

  String get id => _movie.id.toString();
  String get imageUrl => ApiConstants.imageBaseUrl + _movie.backdrop_path;
  String get title => _movie.title;
  String get rating => '${_movie.vote_average}/10';
  String get releaseDate => _movie.release_date;
  String get overview => _movie.overview;
  List<int> get genresIds => _movie.genre_ids;
}
