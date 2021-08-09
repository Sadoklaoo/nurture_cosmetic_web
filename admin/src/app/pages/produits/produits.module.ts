import { NbEvaIconsModule } from '@nebular/eva-icons';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProduitsRoutingModule, routedComponents } from './produits-routing.module';
import { NbCardModule, NbSelectModule, NbSpinnerModule, NbIconModule, NbAlertModule, NbInputModule, NbUserModule, NbListModule, NbButtonModule, NbCheckboxModule } from '@nebular/theme';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ThemeModule } from '../../@theme/theme.module';
import { ListProduitsComponent } from './list-produits/list-produits.component';
import { ProduitsIngredientsComponent } from './produits-ingredients/produits-ingredients.component';
import { ProduitsDetailsComponent } from './produits-details/produits-details.component';
import { FormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { AddProduitComponent } from './add-produit/add-produit.component';


@NgModule({
  declarations: [...routedComponents, ListProduitsComponent, ProduitsIngredientsComponent, ProduitsDetailsComponent, AddProduitComponent,],
  imports: [
    CommonModule,
    FormsModule,
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
    NbCheckboxModule,
    ThemeModule,
    Ng2SmartTableModule,
    NbUserModule,
  ]
})
export class ProduitsModule { }
