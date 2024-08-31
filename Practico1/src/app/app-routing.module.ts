import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { ProductoDetailComponent } from './components/producto-detail/producto-detail.component';
import { Tab1Page } from './tab1/tab1.page';


const routes: Routes = [
  {
    path: '',
    loadChildren: () => import('./tabs/tabs.module').then(m => m.TabsPageModule)
  },
  {
    path: 'product-detail/:id', component: ProductoDetailComponent
  },
  {
    path: 'product-category/:categoria', component: Tab1Page
  }
];
@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
