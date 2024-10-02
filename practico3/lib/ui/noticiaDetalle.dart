import 'package:flutter/material.dart';
import 'package:practico3/models/article.dart';

class NoticiaDetalle extends StatelessWidget {
  final Article article;

  NoticiaDetalle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.urlToImage),
            SizedBox(height: 16.0),
            SizedBox(height: 8.0),
            Text(article.description),
            SizedBox(height: 8.0),
            Text('Published at: ${article.publishedAt}'),
            SizedBox(height: 8.0),
            Text(article.content),
            //TODO
            Text(article.url)
          ],
        ),
      ),
    );
  }
}
