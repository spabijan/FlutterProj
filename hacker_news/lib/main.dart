import 'package:flutter/material.dart';
import 'package:hacker_news/pages/home_page.dart';
import 'package:hacker_news/view_models/story_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hacker News',
      home: ChangeNotifierProvider(
          create: (_) => StoryListViewModel(), child: HomePage()),
    );
  }
}
