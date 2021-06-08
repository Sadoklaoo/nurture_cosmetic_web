import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AffectProduitCategorieComponent } from './affect-produit-categorie/affect-produit-categorie.component';
import { CategoriesComponent } from './categories.component';
import { ListCategoriesComponent } from './list-categories/list-categories.component';

const routes: Routes = [
  {
    path: '',
    component: CategoriesComponent,
    children: [
      {
        path: 'list-categories',
        component: ListCategoriesComponent,
      },
      {
        path: 'affect-produit-categorie',
        component: AffectProduitCategorieComponent,
      },
      
      
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CategoriesRoutingModule { }

export const routedComponents = [
  CategoriesComponent,
];