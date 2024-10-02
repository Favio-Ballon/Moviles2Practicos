import 'package:flutter/material.dart';
import 'package:practico3/services/api.dart';
import 'package:practico3/models/welcome.dart';
import 'package:practico3/models/article.dart';
import 'package:practico3/ui/noticiaDetalle.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late Future<Welcome> _news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
      ),
      body: FutureBuilder<Widget>(
        future: getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return snapshot.data!;
          }
        },
      ),
    );
  }

  Future<Widget> getNews() async {
    var api = apiServices();
    final Welcome noticias = await api.getNews();
    return ListView.builder(
      itemCount: noticias.articles.length,
      itemBuilder: (context, index) {
        return buildCard(noticias.articles[index], context);
      },
    );
  }
}

Card buildCard(Article article, BuildContext context) {
  return Card(
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoticiaDetalle(article: article),
          ),
        );
      },
      child: Column(
        children: [
          Image.network(article.urlToImage),
          ListTile(
            title: Text(article.title),
          ),
        ],
      ),
    ),
  );
}
