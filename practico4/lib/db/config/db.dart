import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  static Future<Database> openDB() async {
    // String path = join(await getDatabasesPath(), 'practico4.db');

    // // Eliminar la base de datos existente
    // await deleteDatabase(path);

    final database = openDatabase(
      join(await getDatabasesPath(), 'practico4.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE peliculaHistoria(id INTEGER PRIMARY KEY, title TEXT, timestamp TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }
}
