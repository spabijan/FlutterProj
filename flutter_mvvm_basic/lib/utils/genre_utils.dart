import 'package:flutter_mvvm_basic/data/repositories/movies_repository_protocol.dart';
import 'package:flutter_mvvm_basic/data/view_models/genre_view_model.dart';
import 'package:flutter_mvvm_basic/utils/init_getit.dart';

class GenreUtils {
  GenreUtils._();

  static List<String> movieGenresNames(List<int> genreIds) {
    final moviesRepository = getIt<MoviesRepositoryProtocol>();
    final genres = moviesRepository.cachedGenres();
    List<String> genreNames = [];

    for (var genreId in genreIds) {
      genreNames.add(genres
          .firstWhere((genre) => genre.id == genreId,
              orElse: GenreViewModel.unknown)
          .name);
    }
    return genreNames;
  }
}
