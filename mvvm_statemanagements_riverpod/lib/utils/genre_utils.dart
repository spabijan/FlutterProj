import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_statemanagements/models/movies_genre.dart';
import 'package:mvvm_statemanagements/riverpod/movies/movies_provider.dart';

import '../data/movies_repo.dart';
import '../service/init_getit.dart';

class GenreUtils {
  static List<MoviesGenre> movieGenresNames(
      List<int> genreIds, List<MoviesGenre> genresRepository) {
    List<MoviesGenre> matchingGenres = List.empty(growable: true);
    for (var genreId in genreIds) {
      var genre = genresRepository.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MoviesGenre(id: 5448484, name: 'Unknown'),
      );
      matchingGenres.add(genre);
    }
    return matchingGenres;
  }
}
