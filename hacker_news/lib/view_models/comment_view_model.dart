import 'package:hacker_news/model/comment.dart';

class CommentViewModel {
  CommentViewModel({required Comment comment}) : _comment = comment;

  final Comment _comment;

  String get title {
    return _comment.title;
  }

  int get id {
    return _comment.commentId;
  }
}
