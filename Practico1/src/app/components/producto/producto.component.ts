import { ProductoService } from './../../services/producto.service';
import { Component, OnInit } from '@angular/core';
import { Producto } from 'src/app/models/producto';
import { ActivatedRoute, Router } from '@angular/router';


@Component({
  selector: 'app-producto',
  templateUrl: './producto.component.html',
  styleUrls: ['./producto.component.scss'],
})

export class ProductoComponent implements OnInit{

  productos? : Producto[];
  categoria? : String;

  constructor(private productoService: ProductoService , private router: Router, private route: ActivatedRoute ) {

}

ngOnInit() {
  this.route.params.subscribe((params) => {
    console.log(params['categoria']);
    this.categoria = params['categoria'];
    this.loadProductos();
  });
}

loadProductos() {
  this.productoService.getProductos().subscribe((productos: Producto[]) => {
    if (this.categoria) {
      this.productos = productos.filter(
        (producto) => producto.category === this.categoria
      );
    } else {
      this.productos = productos;
    }
  });
}

navigateToDetail(productId: number) {
  this.router.navigate(['/products', productId]);
}

}
