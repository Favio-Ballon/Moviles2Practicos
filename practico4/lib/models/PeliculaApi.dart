import 'package:practico4/models/Cast.dart';
import 'package:practico4/models/Genre.dart';

class PeliculaApi {
    int id;
    String title;
    DateTime releaseDate;
    int runtime;
    List<Genre> genres;
    List<Cast>? directors;
    String overview;
    String posterPath;
    double voteAverage;


    PeliculaApi({
        required this.id,
        required this.title,
        required this.releaseDate,
        required this.runtime,
        required this.genres,
        required this.overview,
        required this.posterPath,
        required this.voteAverage,
    });

    factory PeliculaApi.fromJson(Map<String, dynamic> json) {
        return PeliculaApi(
            id: json['id'],
            title: json['title'],
            releaseDate: DateTime.parse(json['release_date']),
            runtime: json['runtime'],
            genres: List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
            overview: json['overview'],
            posterPath: json['poster_path'],
            voteAverage: json['vote_average'].toDouble(),
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['title'] = this.title;
        data['release_date'] = this.releaseDate;
        data['runtime'] = this.runtime;
        data['genres'] = this.genres;
        data['directors'] = this.directors;
        data['overview'] = this.overview;
        data['poster_path'] = this.posterPath;
        data['vote_average'] = this.voteAverage;
        return data;
    }

    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'title': title,
            'releaseDate': releaseDate,
            'runtime': runtime,
            'genres': genres,
            'directors': directors,
            'overview': overview,
            'posterPath': posterPath,
            'voteAverage': voteAverage,
        };
    }


}