import 'package:hacker_news/model/story.dart';

class StoryViewModel {
  StoryViewModel({required Story story}) : _story = story;

  final Story _story;

  String get title {
    return _story.title;
  }

  String get url {
    return _story.url;
  }

  int get numOfComments {
    return _story.commentIds.length;
  }

  Story get story {
    return _story;
  }
}
