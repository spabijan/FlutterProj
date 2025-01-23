import 'package:flutter/material.dart';
import 'package:hacker_news/pages/comments_list_page.dart';
import 'package:hacker_news/view_models/comment_list_view_model.dart';
import 'package:hacker_news/view_models/story_list_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';
import 'package:hacker_news/widgets/story_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final vm = context.read<StoryListViewModel>();
    vm.getTopStories();
  }

  void _navigateToStoryDetails(BuildContext context, StoryViewModel story) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return ChangeNotifierProvider(
        create: (_) => CommentListViewModel(),
        child: CommentsListPage(
          story: story,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News'),
      ),
      body: Consumer<StoryListViewModel>(
          builder: (_, vm, __) => StoryList(
                stories: vm.stories,
                onSelected: (story) => _navigateToStoryDetails(context, story),
              )),
    );
  }
}
