class Comment {
  Comment({required this.title, required this.commentId});
  final String title;
  final int commentId;

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(title: json['text'], commentId: json['id']);
  }
}
