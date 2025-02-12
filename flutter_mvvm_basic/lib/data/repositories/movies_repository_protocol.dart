import 'package:flutter_mvvm_basic/data/view_models/genre_view_model.dart';
import 'package:flutter_mvvm_basic/data/view_models/movie_view_model.dart';

abstract class MoviesRepositoryProtocol {
  Future<List<MovieViewModel>> fetchMovies({int page = 1});
  Future<List<GenreViewModel>> fetchGenres();
  List<GenreViewModel> cachedGenres();
}
