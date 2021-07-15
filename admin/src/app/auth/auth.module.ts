import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { NgxLoginComponent } from './login.component';
import { RequestPasswordComponent } from './request-password/request-password.component';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { NbAlertModule, NbInputModule, NbButtonModule, NbCheckboxModule } from '@nebular/theme';
import { NgxAuthRoutingModule } from './auth-routing.module';
import { NbAuthModule } from '@nebular/auth';


@NgModule({
  declarations: [
    NgxLoginComponent,
    RequestPasswordComponent,
  ],
  imports: [
    CommonModule,
    FormsModule,
    RouterModule,
    NbAlertModule,
    NbInputModule,
    NbButtonModule,
    NbCheckboxModule,
    NgxAuthRoutingModule,
    NbAuthModule,
  ]
})
export class AuthModule { }
