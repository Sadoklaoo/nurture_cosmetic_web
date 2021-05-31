import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { IngredientsRoutingModule, routedComponents } from './ingredients-routing.module';
import { NbCardModule, NbSelectModule, NbTreeGridModule, NbIconModule, NbAlertModule, NbInputModule, NbUserModule, NbSpinnerModule } from '@nebular/theme';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ThemeModule } from '../../@theme/theme.module';
import { ListIngredientsComponent } from './list-ingredients/list-ingredients.component';
import { TypeIngredientsComponent } from './type-ingredients/type-ingredients.component';



@NgModule({
  declarations: [...routedComponents, ListIngredientsComponent, TypeIngredientsComponent,],
  imports: [
    CommonModule,
    IngredientsRoutingModule,
    NbCardModule,
    NbSelectModule,
    NbTreeGridModule,
    NbSpinnerModule,
    NbIconModule,
    NbAlertModule,
    NbInputModule,
    NbUserModule,
    ThemeModule,
    Ng2SmartTableModule,
  ]
})
export class IngredientsModule { }
