import 'package:flutter/material.dart';
import 'package:news_ap/view_models/news_article_list_vm.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListVM>(context, listen: false)
        .populateTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<NewsArticleListVM>(context);
    return Scaffold(
      body: ListView.builder(
          itemCount: vm.articles.length,
          itemBuilder: (ctx, index) {
            final article = vm.articles[index];
            return ListTile(
              leading: SizedBox(
                  width: 100,
                  height: 100,
                  child: article.imageUrl.isEmpty
                      ? Image.asset('assets/images/news_placeholder.png')
                      : Image.network(vm.articles[index].imageUrl)),
              title: Text(article.title),
            );
          }),
      appBar: AppBar(
        title: Text('Top News'),
      ),
    );
  }
}
