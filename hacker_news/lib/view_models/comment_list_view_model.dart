import 'package:flutter/material.dart';
import 'package:hacker_news/services/webservice.dart';
import 'package:hacker_news/view_models/comment_view_model.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

class CommentListViewModel extends ChangeNotifier {
  List<CommentViewModel> comments = List.empty();

  void getCommentsbyStory(StoryViewModel storyVM) async {
    final results = await Webservice().getCommentsByStory(storyVM.story);
    comments =
        results.map((model) => CommentViewModel(comment: model)).toList();
    notifyListeners();
  }
}
