import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ListProduitsComponent } from './list-produits/list-produits.component';
import { ProduitsDetailsComponent } from './produits-details/produits-details.component';
import { ProduitsIngredientsComponent } from './produits-ingredients/produits-ingredients.component';
import { ProduitsComponent } from './produits.component';

const routes: Routes = [
  {
    path: '',
    component: ProduitsComponent,
    children: [
      {
        path: 'list-produits',
        component: ListProduitsComponent,
      },
      {
        path: 'produits-ingredients',
        component: ProduitsIngredientsComponent,
      },
      {
        path: 'produits-details',
        component: ProduitsDetailsComponent,
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProduitsRoutingModule { }

export const routedComponents = [ProduitsComponent];
