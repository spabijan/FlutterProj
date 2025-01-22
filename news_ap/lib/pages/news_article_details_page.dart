import 'package:flutter/material.dart';
import 'package:news_ap/view_models/news_article_vm.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticleDetailsPage extends StatefulWidget {
  const NewsArticleDetailsPage({super.key, required this.article});

  final NewsArticleVM article;

  @override
  State<NewsArticleDetailsPage> createState() => _NewsArticleDetailsPageState();
}

class _NewsArticleDetailsPageState extends State<NewsArticleDetailsPage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    controller.loadRequest(Uri.parse(widget.article.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebViewWidget(controller: controller),
        appBar: AppBar(
          title: Text(widget.article.title),
        ));
  }
}
