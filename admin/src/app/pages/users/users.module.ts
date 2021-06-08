import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { routedComponents, UsersRoutingModule } from './users-routing.module';
import { NbCardModule, NbSelectModule, NbSpinnerModule, NbIconModule, NbAlertModule, NbInputModule, NbUserModule } from '@nebular/theme';
import { Ng2SmartTableModule } from 'ng2-smart-table';
import { ThemeModule } from '../../@theme/theme.module';
import { ListUsersComponent } from './list-users/list-users.component';



@NgModule({
  declarations: [...routedComponents, ListUsersComponent, ],
  imports: [
    CommonModule,
    UsersRoutingModule,
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
export class UsersModule { }
