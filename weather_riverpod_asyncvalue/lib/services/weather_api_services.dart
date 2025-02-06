import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_riverpod_asyncvalue/constants/constants.dart';
import 'package:weather_riverpod_asyncvalue/exceptions/weather_exception.dart';
import 'package:weather_riverpod_asyncvalue/models/current_weather/current_weather.dart';
import 'package:weather_riverpod_asyncvalue/models/direct_geocoding/direct_geocoding.dart';
import 'package:weather_riverpod_asyncvalue/services/dio_error_handler.dart';

class WeatherApiServices {
  final Dio dio;

  WeatherApiServices({required this.dio});

  Future<String> getReverseGeocoding(
      {required double lat, required double lon}) async {
    try {
      final Response response = await dio.get('/geo/1.0/reverse',
          queryParameters: {
            'lat': lat,
            'lon': lon,
            'limit': Constants.kLimit,
            'appid': dotenv.env['APPID']
          });
      final List result = response.data;

      if (result.isEmpty) {
        throw WeatherException('Cannot get name of the location ($lat, $lon)');
      }

      return result[0]['name'];
    } catch (e) {
      rethrow;
    }
  }

  Future<DirectGeocoding> getDirectGeocoding(String city) async {
    try {
      final Response response = await dio.get('/geo/1.0/direct',
          queryParameters: {
            'q': city,
            'limit': Constants.kLimit,
            'appid': dotenv.env['APPID']
          });
      if (response.statusCode != 200) {
        throw DioErrorHandler.dioErrorHandler(response);
      }

      if (response.data.isEmpty) {
        throw WeatherException('Cannot find location of city $city');
      }

      return DirectGeocoding.fromJson(response.data[0]);
    } catch (e) {
      rethrow;
    }
  }

  Future<CurrentWeather> getWeather(DirectGeocoding directGeocoding) async {
    try {
      final Response response =
          await dio.get('/data/2.5/weather', queryParameters: {
        'lat': directGeocoding.lat,
        'lon': directGeocoding.lon,
        'units': Constants.kUnit,
        'appid': dotenv.env['APPID']
      });

      if (response.statusCode != 200) {
        throw DioErrorHandler.dioErrorHandler(response);
      }

      return CurrentWeather.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
