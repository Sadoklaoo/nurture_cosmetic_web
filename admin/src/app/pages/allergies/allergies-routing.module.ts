import { ListAllergiesComponent } from './list-allergies/list-allergies.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AllergiesComponent } from './allergies.component';
import { AffectAllergiesIngredientsComponent } from './affect-allergies-ingredients/affect-allergies-ingredients.component';
import { AddAllergyComponent } from './add-allergy/add-allergy.component';

const routes: Routes = [
  {
    path: '',
  component: AllergiesComponent,
  children: [
    {
      path: 'add-allergy',
     component : AddAllergyComponent,
    },
    {
      path: 'list-allergies',
     component : ListAllergiesComponent,
    },
    
    {
      path: 'affect-allergies-ingredients',
     component: AffectAllergiesIngredientsComponent,
    },
  ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class AllergiesRoutingModule { }

export const routedComponents = [
  AllergiesComponent,
];
