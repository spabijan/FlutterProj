import 'package:flutter/material.dart';
import 'package:news_ap/pages/news_list_page.dart';
import 'package:news_ap/view_models/news_article_list_vm.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fresh News",
      home: ChangeNotifierProvider(
        create: (_) => NewsArticleListVM(),
        child: NewsListPage(),
      ),
    );
  }
}
