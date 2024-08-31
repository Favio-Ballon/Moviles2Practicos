import { CategoriaService } from './../../services/categoria.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-categoria',
  templateUrl: './categoria.component.html',
  styleUrls: ['./categoria.component.scss'],
})
export class CategoriaComponent {

  categorias? : String[];

  constructor(private categoriaService : CategoriaService, private router: Router) {
    this.categoriaService.getCategorias().subscribe((categorias : String[]) =>{
      this.categorias = categorias
   });
   }

   navigateToProducto(category: String) {
    console.log(category);
    this.router.navigate(['/product-category', category]);
   }

}
