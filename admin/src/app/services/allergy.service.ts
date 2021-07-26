import {
  HttpClient,
  HttpErrorResponse,
  HttpHeaders,
} from "@angular/common/http";
import { Injectable } from "@angular/core";
import { NbAuthJWTToken, NbAuthService } from "@nebular/auth";
import { NbComponentStatus, NbToastrService } from "@nebular/theme";
import { environment } from "../../environments/environment";
import { Allergy } from "../entities/Allergy";

@Injectable({
  providedIn: "root",
})
export class AllergyService {
  token: any;
  private index: number = 0;
  private httpOptions;
  constructor(
    private http: HttpClient,
    private authService: NbAuthService,
    private toastrService: NbToastrService
  ) {
    this.authService.onTokenChange().subscribe((token: NbAuthJWTToken) => {
      if (token.isValid()) {
        this.token = token.getValue();

        //console.log(token.getValue())
        this.httpOptions = {
          headers: new HttpHeaders({
            "Content-Type": "application/json",
            auth: this.token,
          }),
        };
      }
    });
  }

  listAdminAllergy() {
    return this.http.get<Allergy[]>(
      environment.getAllAllergy,
      this.httpOptions
    );
  }

  async deleteAllergy(id: number) {
    this.http
      .delete(environment.deleteAllergy + id, this.httpOptions)
      .subscribe(
        (res) => {
          console.log(res);
        },
        (err: HttpErrorResponse) => {
          if (err.error instanceof Error) {
            console.log("Client-side error occured.");
          } else {
            console.log("Server-side error occured.");
          }
        }
      );
  }

  addAllergy(AllergyName: String, Image: String) {
    const allergy = { AllergyName, Image };
    console.log("allergy Inside SERVICE");
    console.log(allergy);

    this.http.post(environment.addAllergy, allergy, this.httpOptions).subscribe(
      (response) => {
        //    console.log(this.getAuthData().token)
        console.log(response);
      },
      (error: HttpErrorResponse) => {
        console.log("HTTPERROR");
        console.log(error);
        // tslint:disable-next-line: triple-equals
        if (error.status == 404) {
          console.log("Please Verify storeID");
          // tslint:disable-next-line: triple-equals
        } else if (error.status == 409) {
          console.log("reference is already exist");
          // tslint:disable-next-line: triple-equals
        } else if (error.status == 400) {
          console.log("missing data");
          // tslint:disable-next-line: triple-equals
        } else if (error.status == 201) {
          this.showToast("success");
        }
      }
    );
  }

  editAllergy(AllergyName: String, NewAllergyName: String) {
    const allergy  = { AllergyName,NewAllergyName};
    console.log("allergy Inside SERVICE")
    console.log(allergy);

    this.http
     .post(environment.editAll, allergy,this.httpOptions )
     .subscribe(response => {
       //    console.log(this.getAuthData().token)
           console.log(response);
          },
           (error: HttpErrorResponse) => {
         
           console.log(error);
           // tslint:disable-next-line: triple-equals
           if (error.status == 404) {
            console.log('Please Verify storeID');
           // tslint:disable-next-line: triple-equals
           } else if (error.status == 409) {
           console.log('reference is already exist');
          // tslint:disable-next-line: triple-equals

          } else if (error.status == 400) {
            console.log('missing data');
           // tslint:disable-next-line: triple-equals
          }else if(error.status == 200){
            this.showEditedToast("success");
          }

         });

       }

  showToast(status: NbComponentStatus) {
    this.toastrService.show(
      status,
      `Allergy ADDED SUCCESSFULLY`,
      { status }
    );
  }
  showEditedToast(status: NbComponentStatus) {
    this.toastrService.show(
      status,
      `Allergy EDITED SUCCESSFULLY`,
      { status }
    );
  }
  public uploadImage(image: File) {
    const formData = new FormData();

    formData.append("image", image);

    return this.http.post(environment.upload, formData);
  }
}
