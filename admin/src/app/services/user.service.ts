import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { NbAuthJWTToken, NbAuthService } from '@nebular/auth';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { Client } from '../entities/Client';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  token: any;
  email: string;
  private httpOptions;
  constructor(private http: HttpClient,
    private authService: NbAuthService,) {
      this.authService.onTokenChange().subscribe((token: NbAuthJWTToken) => {
        if (token.isValid()) {
          this.email = token.getPayload().sub;
          this.token = token.getValue();
          
          //console.log(token.getValue())
          this.httpOptions = {
            headers: new HttpHeaders({
              "Content-Type": "application/json",
              "auth": this.token,
            }),
          };
        }
      });
     }


     listUsers() {
    
      return this.http.get<Client[]>(environment.getAllUsers, this.httpOptions);
      
    }
}
