/**
 * @license
 * Copyright Akveo. All Rights Reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 */
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http';
import { CoreModule } from './@core/core.module';
import { ThemeModule } from './@theme/theme.module';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import {
  NbChatModule,
  NbDatepickerModule,
  NbDialogModule,
  NbMenuModule,
  NbSidebarModule,
  NbToastrModule,
  NbWindowModule,
  NbThemeModule,
} from '@nebular/theme';
import { AuthGuard } from './auth/auth-guard.service';
import { NbAuthJWTToken, NbAuthModule, NbPasswordAuthStrategy } from '@nebular/auth';
import { environment } from '../environments/environment';



@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    AppRoutingModule,
    NbSidebarModule.forRoot(),
    NbMenuModule.forRoot(),
    NbDatepickerModule.forRoot(),
    NbDialogModule.forRoot(),
    NbWindowModule.forRoot(),
    NbToastrModule.forRoot(),
    NbChatModule.forRoot({
      messageGoogleMapKey: 'AIzaSyA_wNuCzia92MAmdLRzmqitRGvCF7wCZPY',
    }),
    CoreModule.forRoot(),
    ThemeModule.forRoot(),
    NbThemeModule.forRoot({ name: 'aquamarine' }),
    NbAuthModule.forRoot({
      strategies:[
        NbPasswordAuthStrategy.setup({
          name:'email',
          token : {
            class: NbAuthJWTToken,
            key:'token'
          },
          baseEndpoint: environment.base,
          login : {
            endpoint: environment.login,
            method:'POST',
            redirect : {
              success:'/pages/allergies/list-allergies',
              failure:null,
            }
          },
          logout : {
            redirect : {
              success:'/auth/login',
              failure:null,
            }
          }
          
        })
      ],
      forms: {logout: {
        redirectDelay: 0,
      },},
    }),
  ],
  providers: [
    // ...
    AuthGuard,

  ],
  bootstrap: [AppComponent],
})
export class AppModule {
}
