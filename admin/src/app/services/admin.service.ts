
import { HttpClient, HttpErrorResponse, HttpHeaders } from "@angular/common/http";
import { Inject, Injectable } from "@angular/core";
import { NbAuthJWTToken, NbAuthService, NB_AUTH_OPTIONS } from "@nebular/auth";
import { NbComponentStatus, NbDialogService, NbToastrService } from "@nebular/theme";
import { environment } from "../../environments/environment";
import { Admin } from "../entities/Admin";
import { Contact } from "../entities/Contact";

@Injectable({
  providedIn: "root",
})
export class AdminService {
  token: any;
  email: string;
  private httpOptions;
  constructor(private http: HttpClient,
    @Inject(NB_AUTH_OPTIONS) protected options = {},
    private toastrService: NbToastrService,
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

  getAllContact() {
    return this.http.get<Contact[]>(
      environment.getAllContact,
      this.httpOptions
    );
  }

  showEditedToast(status: NbComponentStatus) {
    this.toastrService.show(
      status,
      `Contact EDITED SUCCESSFULLY`,
      { status }
    );
  }

  errorDoneToast(status: NbComponentStatus) {
    this.toastrService.show(
      status,
      `Contact COULDN'T BE EDITED`,
      { status }
    );
  }

  updateContact(id: number, status: String) {
    const contact  = { id,status};
    console.log("Admin Inside SERVICE")
   let state = 0 ;

    this.http
     .post(environment.updateContact, contact,this.httpOptions )
     .subscribe(response => {
       //    console.log(this.getAuthData().token)
           console.log(response);
          },
           (error: HttpErrorResponse) => {
           state = error.status;
           console.log(error);
           // tslint:disable-next-line: triple-equals
           if (error.status == 404) {
            console.log('Please Verify storeID');
           // tslint:disable-next-line: triple-equals
           } else if (error.status == 409) {
           this.errorDoneToast("danger")
          // tslint:disable-next-line: triple-equals

          } else if (error.status == 400) {
            console.log('missing data');
           // tslint:disable-next-line: triple-equals
          }else if(error.status == 203){
            this.showEditedToast("success");
          }
       
          
         });
        
       }
       
}
