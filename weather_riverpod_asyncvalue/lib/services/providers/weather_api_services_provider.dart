import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:weather_riverpod_asyncvalue/services/providers/dio_provider.dart';
import 'package:weather_riverpod_asyncvalue/services/weather_api_services.dart';
part 'weather_api_services_provider.g.dart';

@riverpod
WeatherApiServices weatherApiServices(Ref ref) {
  return WeatherApiServices(dio: ref.watch(dioProvider));
}
