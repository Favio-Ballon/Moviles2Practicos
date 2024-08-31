import { ProductoService } from './../../services/producto.service';
import { Component } from '@angular/core';
import { Producto } from 'src/app/models/producto';
import { Router } from '@angular/router';

@Component({
  selector: 'app-producto',
  templateUrl: './producto.component.html',
  styleUrls: ['./producto.component.scss'],
})

export class ProductoComponent{

  productos? : Producto[];

  constructor(private productoService: ProductoService , private router: Router) {
    this.productoService.getProductos().subscribe((productos : Producto[]) =>{
      this.productos = productos
   });

}

navigateToDetail(productId: number) {
  this.router.navigate(['/product-detail', productId]);
}

}
