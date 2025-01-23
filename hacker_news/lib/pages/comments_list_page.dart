import 'package:flutter/material.dart';
import 'package:hacker_news/view_models/comment_list_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';
import 'package:hacker_news/widgets/comment_list.dart';
import 'package:hacker_news/widgets/story_list.dart';
import 'package:provider/provider.dart';

class CommentsListPage extends StatefulWidget {
  const CommentsListPage({super.key, required this.story});

  final StoryViewModel story;

  @override
  State<CommentsListPage> createState() => _CommentsListPageState();
}

class _CommentsListPageState extends State<CommentsListPage> {
  @override
  void initState() {
    super.initState();
    final vm = context.read<CommentListViewModel>();
    vm.getCommentsbyStory(widget.story);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.story.title),
        ),
        body: Consumer<CommentListViewModel>(
            builder: (_, vm, __) => CommentList(comments: vm.comments)));
  }
}
