import 'package:flutter/material.dart';
import 'package:practico4/models/PeliculaApi.dart';
import 'package:practico4/services/api.dart';

class PeliculaDetalle extends StatefulWidget {
  const PeliculaDetalle(this.id, {super.key});

  final int id;

  @override
  _PeliculaDetalleState createState() => _PeliculaDetalleState(id);
}

class _PeliculaDetalleState extends State<PeliculaDetalle> {
  final int id;
  final ApiService apiService = ApiService();

  _PeliculaDetalleState(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la película'),
      ),
      body: Center(
        child: FutureBuilder<PeliculaApi>(
          future: apiService.getPeliculabyId(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final pelicula = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                        'https://image.tmdb.org/t/p/original/${pelicula.posterPath}'),
                    Text('Título: ${pelicula.title}'),
                    Text('Salio el: ${pelicula.releaseDate}'),
                    Text('Puntaje: ${pelicula.voteAverage}'),
                    Text('Duración: ${pelicula.runtime} minutos'),
                    Text(
                        'Géneros: ${pelicula.genres.map((e) => e.name).join(', ')}'),
                    Text(
                        'Director: ${pelicula.directors.map((e) => e.name).join(', ')}'),
                    Text('Votación: ${pelicula.voteAverage}'),
                    Text('Resumen: ${pelicula.overview}'),
                  ],
                ),
              );
            } else {
              return Text('No se encontraron detalles de la película');
            }
          },
        ),
      ),
    );
  }
}
