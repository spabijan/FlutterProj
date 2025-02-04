import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
class TodoSearch extends _$TodoSearch {
  @override
  String build() {
    return '';
  }

  void setSearchTerm(String newSearchTerm) {
    state = newSearchTerm;
  }
}
