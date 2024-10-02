import './source.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  })  : source = source ?? Source(id: 'default_id', name: 'default_name'),
        author = author ?? 'Unknown Author',
        title = title ?? 'No Title',
        description = description ?? 'No Description',
        url = url ?? 'No URL',
        urlToImage = urlToImage ??
            'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
        publishedAt = publishedAt ?? DateTime.now(),
        content = content ?? 'No Content';

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}
