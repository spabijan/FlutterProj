import 'package:flutter/material.dart';
import 'package:news_ap/model/news_article.dart';
import 'package:news_ap/services/web_service.dart';
import 'package:news_ap/view_models/news_article_vm.dart';

class NewsArticleListVM extends ChangeNotifier {
  List<NewsArticleVM> articles = List<NewsArticleVM>.empty();

  void populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    articles = newsArticles
        .map((article) => NewsArticleVM(newsArticle: article))
        .toList();
    notifyListeners();
  }
}
