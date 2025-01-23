import 'package:flutter/material.dart';
import 'package:hacker_news/services/webservice.dart';
import 'package:hacker_news/view_models/story_view_model.dart';

class StoryListViewModel extends ChangeNotifier {
  List<StoryViewModel> _stories = List.empty();

  void getTopStories() async {
    final Iterable results = await Webservice().getTopStories();
    _stories = results.map((story) => StoryViewModel(story: story)).toList();
    notifyListeners();
  }

  List<StoryViewModel> get stories {
    return _stories;
  }
}
