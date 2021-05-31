import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProduitsRoutingModule, routedComponents } from './produits-routing.module';
import { NbCardModule, NbSelectModule, NbSpinnerModule, NbIconModule, NbAlertModule, NbInputModule, NbUserModule } from '@nebular/theme';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ThemeModule } from '../../@theme/theme.module';


@NgModule({
  declarations: [...routedComponents,],
  imports: [
    CommonModule,
    ProduitsRoutingModule,
    NbCardModule,
    NbSelectModule,
    NbSpinnerModule,
    NbIconModule,
    NbAlertModule,
    NbInputModule,
    NbUserModule,
    ThemeModule,
    Ng2SmartTableModule,
  ]
})
export class ProduitsModule { }
