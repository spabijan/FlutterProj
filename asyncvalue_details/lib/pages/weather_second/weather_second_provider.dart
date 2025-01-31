import 'package:asyncvalue_details/models/cities.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

part 'weather_second_provider.g.dart';

@riverpod
class City extends _$City {
  @override
  Cities build() {
    print('[cityProvider] initialized');
    ref.onDispose(() => print('[cityProvider] disposed'));
    return Cities.seoul;
  }

  void changeCity(Cities city) {
    state = city;
  }
}

@riverpod
FutureOr<String> weatherSecond(Ref ref) {
  print('[weatherSecondProvider] initialized');
  Future.delayed(Duration(seconds: 1));
  final city = ref.watch(cityProvider);

  switch (city) {
    case Cities.seoul:
      return '${city.name} - 23';
    case Cities.london:
      throw 'Failed to fetch the temperature of ${city.name}';
    case Cities.bangkok:
      throw 'Failed to fetch the temperature of ${city.name}';
    case Cities.tokyo:
      return '${city.name} - 28';
  }
}
