import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_ap/model/news_article.dart';

class WebService {
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=485e003049dd4c5cb73dd39af593b019';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((item) => NewsArticle.fromJSON(item)).toList();
    } else {
      throw Exception('Failet to get top news');
    }
  }
}
