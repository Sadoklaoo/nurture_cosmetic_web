import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AllergiesRoutingModule,routedComponents } from './allergies-routing.module';
import { NbCardModule, NbTreeGridModule, NbIconModule, NbInputModule, NbSelectModule, NbAlertModule, NbListModule, NbRouteTabsetModule, NbTabsetModule, NbAccordionModule, NbButtonModule, NbStepperModule, NbUserModule, NbSpinnerModule } from '@nebular/theme';
import { ThemeModule } from '../../@theme/theme.module';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ListAllergiesComponent } from './list-allergies/list-allergies.component';
import { AffectAllergiesIngredientsComponent } from './affect-allergies-ingredients/affect-allergies-ingredients.component';
import { NbEvaIconsModule } from '@nebular/eva-icons';


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
    NbListModule,
    NbIconModule,
    NbAlertModule,
    NbInputModule,
    NbButtonModule,
    NbEvaIconsModule,
    NbSpinnerModule,
    ThemeModule,
    Ng2SmartTableModule,
    NbUserModule,
  ]
})
export class AllergiesModule { }
