import './article.dart';

class Welcome {
  String status;
  int totalResults;
  List<Article> articles;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Welcome({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
