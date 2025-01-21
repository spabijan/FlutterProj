import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_ap/model/news_article.dart';
import 'package:news_ap/utils/constants.dart';

class WebService {
  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async {
    String url = Constants.headlinesFor(keyword);
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((item) => NewsArticle.fromJSON(item)).toList();
    } else {
      throw Exception('Failet to get top news');
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    var response = await http.get(Uri.parse(Constants.TOP_HEADLINES_URL));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((item) => NewsArticle.fromJSON(item)).toList();
    } else {
      throw Exception('Failet to get top news');
    }
  }
}
