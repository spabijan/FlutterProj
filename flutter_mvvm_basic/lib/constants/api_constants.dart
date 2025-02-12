import 'package:flutter_dotenv/flutter_dotenv.dart';

final class ApiConstants {
  ApiConstants._();
  static String apiKeys = dotenv.get('MOVIES_API_KEY');
  static String bearerToken = dotenv.get('MOVIES_BEARER_KEY');

  static String baseUrl = 'https://api.themoviedb.org/3';
  static Map<String, String> get headers =>
      {'Authorization': 'Bearer $bearerToken', 'accept': 'application/json'};

  static String imageBaseUrl = 'https://image.tmdb.org/t/p/w500/';
}
