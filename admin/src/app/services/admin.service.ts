import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Inject, Injectable } from "@angular/core";
import { NbAuthJWTToken, NbAuthService, NB_AUTH_OPTIONS } from "@nebular/auth";
import { NbDialogService } from "@nebular/theme";
import { environment } from "../../environments/environment";
import { Admin } from "../entities/Admin";

@Injectable({
  providedIn: "root",
})
export class AdminService {
  token: any;
  email: string;
  private httpOptions;
  constructor(private http: HttpClient,
    @Inject(NB_AUTH_OPTIONS) protected options = {},
    private authService: NbAuthService) {
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

  getCurrentAdmin() {
    return this.http.get<Admin>(
      environment.me,
      this.httpOptions
    );
  }
}
