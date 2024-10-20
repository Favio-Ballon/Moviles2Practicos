import 'package:sqflite/sqflite.dart';
import 'package:practico4/db/config/db.dart';
import 'package:practico4/models/peliculaHistoria.dart';

class PeliculahistoriaController {
  Future<int> insertPeliculaHistoria(Peliculahistoria peliculaHistoria) async {
    final Database db = await Db.openDB();
    return db.insert(
      'peliculaHistoria',
      peliculaHistoria.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Peliculahistoria>> getpeliculaHistoria() async {
    final Database db = await Db.openDB();
    //peliculaHistoria sort by timestamp
    final List<Map<String, dynamic>> maps =
        await db.query('peliculaHistoria', orderBy: 'timestamp DESC');

    return List.generate(maps.length, (i) {
      return Peliculahistoria(
        id: maps[i]['id'],
        title: maps[i]['title'],
        timestamp: DateTime.parse(maps[i]['timestamp']),
      );
    });
  }
}
