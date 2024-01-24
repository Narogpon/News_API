class NewsThailand {
  final String author;
  final String title;
  final String publishedAt;

  NewsThailand({
    required this.author,
    required this.title,
    required this.publishedAt,
  });

  factory NewsThailand.fromJson(Map<String, dynamic> json) {
    return NewsThailand(
      author: json['author'] ?? 'Unknown Author',
      title: json['title'] ?? 'Unknown Title',
      publishedAt: json['publishedAt'] ?? 'Unknown publishedAt',
    );
  }
}
