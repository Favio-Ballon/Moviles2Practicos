import 'dart:developer';

import 'package:practico4/models/PeliculaApi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:practico4/models/peliculaHistoria.dart';

class ApiService {
  final API_KEY =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZmIzYmQ3M2QzZTNiYTJhOGNhYTQyM2YyOGRjMTY0NyIsIm5iZiI6MTcyOTM0MTY4MS4xNTA2LCJzdWIiOiI2NzEyN2Q2MTI1YzcwYjhiMWQ2N2M3MDYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.ZGb_1F6BRxOXQ8OQBQ_xkABHtG5qpNX73-8keSdIKuM';

  Future<PeliculaApi> getPeliculabyId(int id) async {
    var client = http.Client();
    //auth bearer token
    var url = Uri.parse('https://api.themoviedb.org/3/movie/$id');

    var response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $API_KEY',
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      //log the json
      log(json.toString());
      
      return PeliculaApi.fromJson(json);
    } else {
      throw Exception('Failed to load movie');
    }
  }

  Future<List<Peliculahistoria>> searchPelicula(String nombre) async {
    var client = http.Client();
    var url =
        Uri.parse('https://api.themoviedb.org/3/search/movie?query=$nombre');

    var response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $API_KEY',
      },
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return List<Peliculahistoria>.from(
          json['results'].map((x) => Peliculahistoria.fromJson(x)));
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
