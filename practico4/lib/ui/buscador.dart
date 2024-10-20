import 'package:flutter/material.dart';
import 'package:practico4/db/controller/peliculaHistoriaController.dart';
import 'package:practico4/models/peliculaHistoria.dart';
import 'package:practico4/services/api.dart';
import 'package:practico4/ui/peliculaDetalle.dart';
import 'package:practico4/ui/historial.dart';

class Buscador extends StatefulWidget {
  const Buscador({super.key});

  @override
  State<Buscador> createState() => _BuscadorState();
}

class _BuscadorState extends State<Buscador> {
  List<Peliculahistoria> peliculas = [];
  void buscarPelicula(String value) {
    // Implementar la lógica de búsqueda aquí
    ApiService().searchPelicula(value).then((value) {
      setState(() {
        peliculas = value;
      });
    });
    //log de la busqueda con log no print
    debugPrint('Buscando: $value');
    debugPrint('Peliculas encontradas: ${peliculas.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscador'),
        // botón para ir al historial
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Historial()),
              );
            },
          ),
        ],
      ),
      body: Center(
        // añadir search bar y debajo una lista de películas
        child: Column(
          children: [
            SearchBar(
              hintText: 'Buscar película',
              onChanged: (value) => buscarPelicula(value),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: peliculas
                    .length, // Asegúrate de tener una lista de películas
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(peliculas[index].title),
                    onTap: () {
                      // Al hacer tap en una película, se guarda en la base de datos
                      PeliculahistoriaController().insertPeliculaHistoria(
                          Peliculahistoria(
                              id: peliculas[index].id,
                              title: peliculas[index].title));
                      // se entra a los detalles de la pelicula
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PeliculaDetalle(peliculas[index].id)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
