import 'package:mvvm_statemanagements/models/movies_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_statemanagements/riverpod/movies/movies_provider.dart';
import 'package:riverpod/riverpod.dart';

final moviesViewModel = Provider<MovieModel>((ref) {
  throw UnimplementedError();
});

final moviesDetailsProvider = Provider.family<MovieModel, int>((ref, movieId) {
  final allMovies = ref.watch(moviesProvider);

  return allMovies.moviesList.firstWhere((movie) => movie.id == movieId);
});
