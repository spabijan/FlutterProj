import 'package:news_ap/model/news_article.dart';

class NewsArticleVM {
  const NewsArticleVM({required NewsArticle newsArticle})
      : _newsArticle = newsArticle;

  final NewsArticle _newsArticle;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get imageUrl {
    return _newsArticle.urlToImage;
  }

  String get url {
    return _newsArticle.url;
  }
}
