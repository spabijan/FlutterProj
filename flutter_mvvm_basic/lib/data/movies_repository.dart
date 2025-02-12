import 'package:flutter_mvvm_basic/model/genre.dart';
import 'package:flutter_mvvm_basic/model/movie.dart';
import 'package:flutter_mvvm_basic/services/api_services_protocol.dart';

class MoviesRepository implements ApiServicesProtocol {
  MoviesRepository({required ApiServicesProtocol protocol})
      : _protocol = protocol;

  final ApiServicesProtocol _protocol;

  @override
  Future<List<Genre>> fetchGenres() async => await _protocol.fetchGenres();

  @override
  Future<List<Movie>> fetchMovies({int page = 1}) async =>
      await _protocol.fetchMovies(page: page);
}
