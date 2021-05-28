import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AllergiesRoutingModule,routedComponents } from './allergies-routing.module';
import { NbCardModule, NbTreeGridModule, NbIconModule, NbInputModule, NbSelectModule, NbAlertModule } from '@nebular/theme';
import { ThemeModule } from '../../@theme/theme.module';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ListAllergiesComponent } from './list-allergies/list-allergies.component';
import { AffectAllergiesIngredientsComponent } from './affect-allergies-ingredients/affect-allergies-ingredients.component';


@NgModule({
  declarations: [    
    ...routedComponents,
    ListAllergiesComponent,
    AffectAllergiesIngredientsComponent,],
  imports: [
    CommonModule,
    AllergiesRoutingModule,
    NbCardModule,
    NbSelectModule,
    NbTreeGridModule,
    NbIconModule,
    NbAlertModule,
    NbInputModule,
    ThemeModule,
    Ng2SmartTableModule,
  ]
})
export class AllergiesModule { }
