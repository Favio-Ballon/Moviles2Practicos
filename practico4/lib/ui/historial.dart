import 'package:flutter/material.dart';
import 'package:practico4/db/controller/peliculaHistoriaController.dart';
import 'package:practico4/models/peliculaHistoria.dart';
import 'package:practico4/ui/peliculaDetalle.dart';

class Historial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de películas'),
      ),
      body: Center(
        child: FutureBuilder<List<Peliculahistoria>>(
          future: PeliculahistoriaController().getpeliculaHistoria(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final peliculas = snapshot.data!;
              return ListView.builder(
                itemCount: peliculas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(peliculas[index].title),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PeliculaDetalle(peliculas[index].id)),
                      );
                    },
                  );
                },
              );
            } else {
              return Text('No se encontraron películas en el historial');
            }
          },
        ),
      ),
    );
  }
}
