import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CategoriesRoutingModule, routedComponents } from './categories-routing.module';
import { NbEvaIconsModule } from '@nebular/eva-icons';
import { NbCardModule, NbSelectModule, NbTreeGridModule, NbListModule, NbIconModule, NbAlertModule, NbInputModule, NbButtonModule, NbSpinnerModule, NbUserModule } from '@nebular/theme';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ThemeModule } from '../../@theme/theme.module';
import { ListCategoriesComponent } from './list-categories/list-categories.component';
import { AffectProduitCategorieComponent } from './affect-produit-categorie/affect-produit-categorie.component';


@NgModule({
  declarations: [ ...routedComponents, ListCategoriesComponent, AffectProduitCategorieComponent,],
  imports: [
    CommonModule,
    CategoriesRoutingModule,
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
export class CategoriesModule { }
