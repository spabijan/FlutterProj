import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_statemanagements/data/movies_repo.dart';

import '../../models/movies_model.dart';
import '../../service/init_getit.dart';
import 'movies_state.dart';

final moviesProvider = NotifierProvider<MoviesProvider, MoviesViewModel>(
  () => MoviesProvider(),
);

class MoviesProvider extends Notifier<MoviesViewModel> {
  @override
  MoviesViewModel build() {
    return MoviesViewModel();
  }

  final MoviesRepository _moviesRepository = getIt<MoviesRepository>();
  Future<void> getMovies() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    try {
      if (state.genresList.isEmpty) {
        final genresList = await _moviesRepository.fetchGenres();
        state = state.copyWith(genresList: genresList);
      }
      List<MovieModel> movies =
          await _moviesRepository.fetchMovies(page: state.currentPage);
      state = state.copyWith(
        moviesList: [...state.moviesList, ...movies],
        currentPage: state.currentPage + 1,
        fetchMoviesError: '',
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(fetchMoviesError: e.toString(), isLoading: false);
      rethrow;
    }
  }
}
