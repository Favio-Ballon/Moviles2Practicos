import { DbService } from './../services/db.service';
import { Nota } from '../models/nota';

export class NotasBLL {
    public async selectAll(dbService: DbService) {
        if(!dbService.database) {
            await dbService.createDb();
        }
        const sSelect = 'Select id, titulo, contenido, color FROM notas';

        return await dbService.database?.executeSql(sSelect, [])
        .then((data) => {
            let notas: Nota[] = [];
            if(data.rows.length > 0) {
                for(let i = 0; i < data.rows.length; i++) {
                    notas.push({
                        id: data.rows.item(i).id,
                        titulo: data.rows.item(i).titulo,
                        contenido: data.rows.item(i).contenido,
                        color: data.rows.item(i).color
                    });
                }
            }
            return notas;
        })
    }

    public async getById(dbService: DbService, id: number) {
        if(!dbService.database) {
            await dbService.createDb();
        }
        const sSelect = 'Select id, titulo, contenido, color FROM notas WHERE id = ?';

        return await dbService.database?.executeSql(sSelect, [id])
        .then((data) => {
            let nota: Nota = {
                id: data.rows.item(0).id,
                titulo: data.rows.item(0).titulo,
                contenido: data.rows.item(0).contenido,
                color: data.rows.item(0).color
            };
            return nota;
        })
    }

    public async insert(dbService: DbService, titulo: string, contenido: string, color: string) {
        if(!dbService.database) {
            await dbService.createDb();
        }
        const sInsert = 'INSERT INTO notas (titulo, contenido, color) VALUES (?, ?, ?)';
        return await dbService.database?.executeSql(sInsert, [titulo, contenido, color])
        .catch((error) => {
            console.log('No se pudo ejecutar el insert', JSON.stringify(error))});
    }

    public async update(dbService: DbService, id: number, titulo: string, contenido: string, color: string) {
        if(!dbService.database) {
            await dbService.createDb();
        }
        const sUpdate = 'UPDATE notas SET titulo = ?, contenido = ?, color = ? WHERE id = ?';
        return await dbService.database?.executeSql(sUpdate, [titulo, contenido, color, id])
        .catch((error) => {
            console.log('No se pudo ejecutar el update', JSON.stringify(error))});
    }

    public async delete(dbService: DbService, id: number) {
        if(!dbService.database) {
            await dbService.createDb();
        }
        const sDelete = 'DELETE FROM notas WHERE id = ?';
        return await dbService.database?.executeSql(sDelete, [id])
        .catch((error) => {
            console.log('No se pudo ejecutar el delete', JSON.stringify(error))});
    }
}
