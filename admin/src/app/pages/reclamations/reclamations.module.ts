import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ReclamationsRoutingModule, routedComponents } from './reclamations-routing.module';
import { NbCardModule, NbSelectModule, NbSpinnerModule, NbIconModule, NbAlertModule, NbInputModule, NbUserModule } from '@nebular/theme';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ThemeModule } from '../../@theme/theme.module';
import { ListReclamationComponent } from './list-reclamation/list-reclamation.component';
import { EtatReclamationComponent } from './etat-reclamation/etat-reclamation.component';


@NgModule({
  declarations: [...routedComponents, ListReclamationComponent, EtatReclamationComponent,],
  imports: [
    CommonModule,
    ReclamationsRoutingModule,
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
export class ReclamationsModule { }
