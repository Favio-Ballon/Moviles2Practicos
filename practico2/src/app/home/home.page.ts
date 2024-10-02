import { NotasBLL } from './../bll/notas-bll';
import { DbService } from './../services/db.service';
import { Component } from '@angular/core';
import { Nota } from '../models/nota';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  NotasBLL: NotasBLL = new NotasBLL();
  notes? : Nota[] = [];

  constructor(private dbService : DbService, private router: Router) {
    this.cargarLista();
  }

  //on reload
  ionViewWillEnter() {
    this.cargarLista();
  }

  async cargarLista() {
    this.notes = await this.NotasBLL.selectAll(this.dbService);
    console.log("Estas son las notas", this.notes);
  }
  addNote() {
    this.router.navigate([`/nota/${-1}`]);
  }

  async editNote(id: number) {
    this.router.navigate([`/nota/${ id}`]);
  }
  
}
