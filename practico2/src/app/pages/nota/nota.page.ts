import { DbService } from './../../services/db.service';
import { Component, OnInit } from '@angular/core';
import { NotasBLL } from '../../bll/notas-bll';
import { Nota } from '../../models/nota';
import { Router } from '@angular/router';

@Component({
  selector: 'app-nota',
  templateUrl: './nota.page.html',
  styleUrls: ['./nota.page.scss'],
})
export class NotaPage implements OnInit {

  NotasBLL: NotasBLL = new NotasBLL();
  note: Nota = {
    id: -1,
    titulo: '',
    contenido: '',
    color: ''
  };

  constructor(private dbService : DbService, private router: Router) {
    const id = parseInt(this.router.url.split('/')[2]); 
    if(id != -1) {
      this.loadNote(id);
    }
  }

  // eslint-disable-next-line @angular-eslint/no-empty-lifecycle-method
  ngOnInit() {
  }

  async loadNote(id: number) {
    const note = await this.NotasBLL.getById(this.dbService, id);
    this.note.id = note?.id || -1;
    this.note.titulo = note?.titulo || '';
    this.note.contenido = note?.contenido || '';
    this.note.color = note?.color || '';
    console.log(this.note);
  }

  async saveNote() {

    if(this.note.id == -1) {
      await this.NotasBLL.insert(this.dbService, this.note.titulo, this.note.contenido, this.note.color);
      console.log('Nota insertada');
    } else {
      await this.NotasBLL.update(this.dbService, this.note.id, this.note.titulo, this.note.contenido, this.note.color);
    }
    this.router.navigate(['/home']);
  }

  async deleteNote(){
    await this.NotasBLL.delete(this.dbService, this.note.id);
    this.router.navigate(['/home']);
  }

}
