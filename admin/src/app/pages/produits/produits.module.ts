import { NbEvaIconsModule } from '@nebular/eva-icons';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProduitsRoutingModule, routedComponents } from './produits-routing.module';
import { NbCardModule, NbSelectModule, NbSpinnerModule, NbIconModule, NbAlertModule, NbInputModule, NbUserModule, NbListModule, NbButtonModule } from '@nebular/theme';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ThemeModule } from '../../@theme/theme.module';
import { ListProduitsComponent } from './list-produits/list-produits.component';
import { ProduitsIngredientsComponent } from './produits-ingredients/produits-ingredients.component';
import { ProduitsDetailsComponent } from './produits-details/produits-details.component';


@NgModule({
  declarations: [...routedComponents, ListProduitsComponent, ProduitsIngredientsComponent, ProduitsDetailsComponent,],
  imports: [
    CommonModule,
    ProduitsRoutingModule,
    NbCardModule,
    NbSelectModule,
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
export class ProduitsModule { }
