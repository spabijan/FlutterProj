import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_riverpod_asyncvalue/constants/constants.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://${Constants.kApiHost}',
  ));
}
