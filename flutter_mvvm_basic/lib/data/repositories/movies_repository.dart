import 'package:flutter_mvvm_basic/data/view_models/genre_view_model.dart';
import 'package:flutter_mvvm_basic/data/view_models/movie_view_model.dart';
import 'package:flutter_mvvm_basic/data/repositories/movies_repository_protocol.dart';
import 'package:flutter_mvvm_basic/services/api_services_protocol.dart';

class MoviesRepository implements MoviesRepositoryProtocol {
  MoviesRepository({required ApiServicesProtocol protocol})
      : _protocol = protocol;

  final ApiServicesProtocol _protocol;

  List<GenreViewModel> _cachedGenres = [];

  @override
  Future<List<GenreViewModel>> fetchGenres() async {
    var genresModelsList = await _protocol.fetchGenres();

    _cachedGenres = [
      for (final model in genresModelsList) GenreViewModel(genre: model)
    ];
    return _cachedGenres;
  }

  @override
  Future<List<MovieViewModel>> fetchMovies({int page = 1}) async {
    var moviesModelList = await _protocol.fetchMovies(page: page);

    return [for (final model in moviesModelList) MovieViewModel(movie: model)];
  }

  @override
  List<GenreViewModel> cachedGenres() {
    return _cachedGenres;
  }
}
