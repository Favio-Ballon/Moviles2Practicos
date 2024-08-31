import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CategoriaService {

  constructor(private api : HttpClient) { }

  getCategorias(){
    return this.api.get<String[]>('https://fakestoreapi.com/products/categories');
  }
}
