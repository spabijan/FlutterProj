import 'package:flutter_mvvm_basic/model/genre.dart';

class GenreViewModel {
  final Genre _genre;

  GenreViewModel({required Genre genre}) : _genre = genre;

  factory GenreViewModel.unknown() {
    return GenreViewModel(genre: Genre(id: 5448484, name: 'Unknown'));
  }

  int get id => _genre.id;
  String get name => _genre.name;
}
