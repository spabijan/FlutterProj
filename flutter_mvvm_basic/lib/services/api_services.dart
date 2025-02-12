import 'dart:convert';

import 'package:flutter_mvvm_basic/constants/api_constants.dart';
import 'package:flutter_mvvm_basic/model/genre.dart';
import 'package:flutter_mvvm_basic/model/movie.dart';
import 'package:flutter_mvvm_basic/services/api_services_protocol.dart';
import 'package:http/http.dart' as http;

class MoviesApiServices implements ApiServicesProtocol {
  @override
  Future<List<Movie>> fetchMovies({int page = 1}) async => await _fetchMovies();

  @override
  Future<List<Genre>> fetchGenres() async => await _fetchGenres();

  Future<List<Genre>> _fetchGenres() async {
    http.Response response = await _callFetchRequest(
        path: '${ApiConstants.baseUrl}/genre/movie/list?language=en');
    if (response.statusCode == 200) {
      return _handleSuccessFetchGenres(response);
    } else {
      throw Exception('Failed to load genres ${response.statusCode}');
    }
  }

  Future<List<Movie>> _fetchMovies({int page = 1}) async {
    http.Response response = await _callFetchRequest(
        path:
            '${ApiConstants.baseUrl}/movie/popular?language=en-US&page=$page');

    if (response.statusCode == 200) {
      return _handleSuccessFetchMovies(response);
    } else {
      throw Exception('Failed to load movies ${response.statusCode}');
    }
  }

  Future<http.Response> _callFetchRequest({required String path}) async {
    final url = Uri.parse(path);
    final response = await http.get(url, headers: ApiConstants.headers);
    return response;
  }

  List<Movie> _handleSuccessFetchMovies(http.Response successResponse) {
    final data = jsonDecode(successResponse.body);
    return [for (final movieData in data['results']) Movie.fromMap(movieData)];
  }

  List<Genre> _handleSuccessFetchGenres(http.Response successResponse) {
    final data = jsonDecode(successResponse.body);
    return [for (final genreData in data['genres']) Genre.fromMap(genreData)];
  }
}
