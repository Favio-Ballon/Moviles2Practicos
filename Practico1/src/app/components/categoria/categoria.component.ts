import { CategoriaService } from './../../services/categoria.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-categoria',
  templateUrl: './categoria.component.html',
  styleUrls: ['./categoria.component.scss'],
})
export class CategoriaComponent {

  categorias? : String[];

  constructor(private categoriaService : CategoriaService ) {
    this.categoriaService.getCategorias().subscribe((categorias : String[]) =>{
      this.categorias = categorias
   });
   }

}
