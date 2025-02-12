import 'package:flutter_mvvm_basic/model/genre.dart';
import 'package:flutter_mvvm_basic/model/movie.dart';

abstract class ApiServicesProtocol {
  Future<List<Movie>> fetchMovies({int page = 1});
  Future<List<Genre>> fetchGenres();
}
