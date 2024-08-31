import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Producto } from '../models/producto';

@Injectable({
  providedIn: 'root'
})
export class ProductoService {

  constructor(private api : HttpClient) { }

  getProductos(){
    console.log("--------------------------");
    return this.api.get<Producto[]>('https://fakestoreapi.com/products');
  }
}
