import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { NbAuthJWTToken, NbAuthService } from '@nebular/auth';
import { NbComponentStatus, NbToastrService } from '@nebular/theme';
import { environment } from '../../environments/environment';
import { Ingredient } from '../entities/Ingredient';

@Injectable({
  providedIn: 'root'
})
export class IngredientService {
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

  listIngredients() {
    return this.http.get<Ingredient[]>(
      environment.getAllIngredient,
      this.httpOptions
    );
  }

  async deleteIngredient(id: number) {
    this.http
      .delete(environment.deleteIngredient + id, this.httpOptions)
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

  addIngredient(IngredientName: String, IngredientType: String) {
    const ingredient = { IngredientName, IngredientType };
    console.log("ingredient Inside SERVICE");
    console.log(ingredient);

    this.http.post(environment.addIngredient, ingredient, this.httpOptions).subscribe(
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

  editIngredient(IngredientName: String, NewIngredientName: String,IngredientType: String,) {
    const ingredient  = { IngredientName,NewIngredientName,IngredientType};
    console.log("ingredient Inside SERVICE")
    console.log(ingredient);

    this.http
     .post(environment.editIngredient, ingredient,this.httpOptions )
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
      `Ingredient ADDED SUCCESSFULLY`,
      { status }
    );
  }
  showEditedToast(status: NbComponentStatus) {
    this.toastrService.show(
      status,
      `Ingredient EDITED SUCCESSFULLY`,
      { status }
    );
  }
 
}
