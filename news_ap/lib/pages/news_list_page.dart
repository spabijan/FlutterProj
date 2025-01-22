import 'package:flutter/material.dart';
import 'package:news_ap/pages/news_article_details_page.dart';
import 'package:news_ap/view_models/news_article_list_vm.dart';
import 'package:news_ap/view_models/news_article_vm.dart';
import 'package:news_ap/widgets/news_list.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({super.key});

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();

  void _showNewsArticleDetails(BuildContext context, NewsArticleVM article) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return NewsArticleDetailsPage(
        article: article,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListVM>(context, listen: false)
        .populateTopHeadlines();
  }

  Widget _buildList(BuildContext context, NewsArticleListVM vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.empty:
        return Align(child: Text('No results found'));
      case LoadingStatus.completed:
        return Expanded(
            child: NewsList(
                articles: vm.articles,
                onSelected: (selected) =>
                    _showNewsArticleDetails(context, selected)));
    }
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<NewsArticleListVM>(context);
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  vm.search(value);
                }
              },
              controller: _controller,
              decoration: InputDecoration(
                  suffix: IconButton(
                      onPressed: () => _controller.clear(),
                      icon: Icon(Icons.clear)),
                  labelText: "Enter search term",
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  )),
            ),
          ),
          _buildList(context, vm)
        ],
      ),
      appBar: AppBar(
        title: Text('Top News'),
      ),
    );
  }
}
