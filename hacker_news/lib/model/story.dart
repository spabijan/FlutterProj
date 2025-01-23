class Story {
  Story({required this.title, required this.url, required this.commentIds});

  final String title;
  final String url;
  final List<int> commentIds;

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
        title: json['title'],
        url: json['url'],
        commentIds:
            json['kids'] == null ? List.empty() : json['kids'].cast<int>());
  }
}
