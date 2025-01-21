import 'package:flutter/material.dart';
import 'package:news_ap/view_models/news_article_vm.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.articles});

  final List<NewsArticleVM> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (ctx, index) {
          final article = articles[index];
          return ListTile(
            leading: SizedBox(
                width: 100,
                height: 100,
                child: article.imageUrl.isEmpty
                    ? Image.asset('assets/images/news_placeholder.png')
                    : Image.network(articles[index].imageUrl)),
            title: Text(article.title),
          );
        });
  }
}
