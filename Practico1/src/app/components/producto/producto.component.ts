import { ProductoService } from './../../services/producto.service';
import { Component } from '@angular/core';
import { Producto } from 'src/app/models/producto';

@Component({
  selector: 'app-producto',
  templateUrl: './producto.component.html',
  styleUrls: ['./producto.component.scss'],
})

export class ProductoComponent{

  productos? : Producto[];

  constructor(private productoService: ProductoService){
    this.productoService.getProductos().subscribe((productos : Producto[]) =>{
      this.productos = productos
   });

}

}
