import 'dart:convert';
import 'package:practico3/models/article.dart';
import 'package:practico3/models/welcome.dart';
import 'package:http/http.dart' as http;

class apiServices {
  final API_KEY = '3d609cf0969e4f278a4cbe37f113054a';

  apiServices();

  Future<Welcome> getNews() async {
    var client = http.Client();
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=${API_KEY}');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return Welcome.fromJson(json.decode(response.body));
    }
    return Welcome(articles: [], status: 'failed', totalResults: 0);
  }
}
