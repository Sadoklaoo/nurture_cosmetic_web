import { RouterModule, Routes } from '@angular/router';
import { NgModule } from '@angular/core';

import { PagesComponent } from './pages.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { ECommerceComponent } from './e-commerce/e-commerce.component';
import { NotFoundComponent } from './miscellaneous/not-found/not-found.component';

const routes: Routes = [{
  path: '',
  component: PagesComponent,
  children: [
    {
      path: 'allergies',
      loadChildren: () => import('./allergies/allergies.module')
        .then(m => m.AllergiesModule),
    },
    {
      path: 'ingredients',
      loadChildren: () => import('./ingredients/ingredients.module')
        .then(m => m.IngredientsModule),
    },
    {
      path: 'produits',
      loadChildren: () => import('./produits/produits.module')
        .then(m => m.ProduitsModule),
    },
    {
      path: 'reclamations',
      loadChildren: () => import('./reclamations/reclamations.module')
        .then(m => m.ReclamationsModule),
    },
    {
      path: 'users',
      loadChildren: () => import('./users/users.module')
        .then(m => m.UsersModule),
    },
    {
      path: 'categories',
      loadChildren: () => import('./categories/categories.module')
        .then(m => m.CategoriesModule),
    },
    
    {
      path: '',
      redirectTo: 'allergies',
      pathMatch: 'full',
    },
    {
      path: '**',
      component: NotFoundComponent,
    },
  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PagesRoutingModule {
}
