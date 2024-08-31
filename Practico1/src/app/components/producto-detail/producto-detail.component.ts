import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Producto } from '../../models/producto';
import { ProductoService } from '../../services/producto.service';

@Component({
  selector: 'app-producto-detail',
  templateUrl: './producto-detail.component.html',
  styleUrls: ['./producto-detail.component.scss']
})
export class ProductoDetailComponent  implements OnInit {

  producto? : Producto

  constructor(private productoService: ProductoService, private route: ActivatedRoute) { }

  ngOnInit() {
    this.route.params.subscribe(params => {
      console.log(params['id']);
      this.productoService.getProducto(params['id']).subscribe((producto : Producto) =>{
        this.producto = producto
      });

    });
  }

}
