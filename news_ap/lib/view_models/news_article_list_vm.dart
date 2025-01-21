import 'package:flutter/material.dart';
import 'package:news_ap/model/news_article.dart';
import 'package:news_ap/services/web_service.dart';
import 'package:news_ap/view_models/news_article_vm.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListVM extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;
  List<NewsArticleVM> articles = List<NewsArticleVM>.empty();

  Future<void> search(String keyword) async {
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles =
        await WebService().fetchHeadlinesByKeyword(keyword);
    _prepareViewModelListAndNotify(newsArticles);
  }

  void populateTopHeadlines() async {
    loadingStatus = LoadingStatus.searching;
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    _prepareViewModelListAndNotify(newsArticles);
  }

  void _prepareViewModelListAndNotify(List<NewsArticle> newsArticles) {
    articles = newsArticles
        .map((article) => NewsArticleVM(newsArticle: article))
        .toList();
    loadingStatus =
        articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
