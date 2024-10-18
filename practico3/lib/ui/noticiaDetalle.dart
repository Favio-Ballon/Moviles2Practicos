import 'package:flutter/material.dart';
import 'package:practico3/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiaDetalle extends StatelessWidget {
  final Article article;

  NoticiaDetalle({required this.article});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'No se pudo lanzar $url';
    }
  }

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
            Text(article.title,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            Image.network(article.urlToImage),
            SizedBox(height: 1.0),
            Text('Publicado el: ${article.publishedAt}'),
            Text('Por: ${article.author}'),
            Text('Fuente: ${article.source.name}'),
            SizedBox(height: 16.0),
            Text(article.description,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
            SizedBox(height: 8.0),
            Text(article.content,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
            //Colorea el link de azul y subrayado
            GestureDetector(
              onTap: () {
                _launchURL(article.url); // Abre el enlace en el navegador
              },
              child: const Text(
                'Link de la noticia',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
