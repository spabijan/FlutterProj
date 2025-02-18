import '../../models/movies_genre.dart';
import '../../models/movies_model.dart';

class MoviesViewModel {
  final int currentPage;
  final List<MovieModel> moviesList;
  final List<MoviesGenre> genresList;
  final bool isLoading;
  final String fetchMoviesError;

  MoviesViewModel({
    this.currentPage = 1,
    this.moviesList = const [],
    this.genresList = const [],
    this.isLoading = false,
    this.fetchMoviesError = '',
  });

  MoviesViewModel copyWith({
    int? currentPage,
    List<MovieModel>? moviesList,
    List<MoviesGenre>? genresList,
    bool? isLoading,
    String? fetchMoviesError,
  }) {
    return MoviesViewModel(
      currentPage: currentPage ?? this.currentPage,
      moviesList: moviesList ?? this.moviesList,
      genresList: genresList ?? this.genresList,
      isLoading: isLoading ?? this.isLoading,
      fetchMoviesError: fetchMoviesError ?? this.fetchMoviesError,
    );
  }
}
