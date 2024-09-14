import { Injectable } from '@angular/core';
import { SQLite, SQLiteObject } from '@awesome-cordova-plugins/sqlite/ngx';

import { Platform } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class DbService {

  public database?: SQLiteObject;

  constructor(private sqlite: SQLite, private platform: Platform) {
    this.platform.ready().then(() => {
      //iniciamos
      this.createDb();
    });
   }

   async createDb() {
    try {
      //creamos la base de datos
      const db = await this.sqlite.create({
        name: 'pruebadb',
        location: 'default'
      });
      this.database = db;
      this.createTable();
    } catch (error) {
      console.log('No se pudo crear la base de datos', JSON.stringify(error));
    }
  }

  async createTable() {
    if (!this.database) {
      console.log('Database is not initialized');
      return;
    }
    try {
      //creamos la tabla
      const sqlCreateTable = 'CREATE TABLE IF NOT EXISTS notas(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, contenido TEXT, color TEXT)';
      await this.database.executeSql(sqlCreateTable, []);
    } catch (error) {
      console.log('No se pudo crear la tabla', JSON.stringify(error));
    }
  }
  
}
