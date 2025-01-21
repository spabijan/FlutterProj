class NewsArticle {
  const NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
  });

  final String title;
  final String description;
  final String urlToImage;
  final String url;

  factory NewsArticle.fromJSON(Map<String, dynamic> json) {
    return NewsArticle(
        title: json['title'],
        description: json['description'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'] ?? '');
  }
}
