import {
  HttpClient,
  HttpErrorResponse,
  HttpHeaders,
} from "@angular/common/http";
import { Injectable } from "@angular/core";
import { NbAuthService, NbAuthJWTToken } from "@nebular/auth";
import { NbComponentStatus, NbToastrService } from "@nebular/theme";
import { environment } from "../../environments/environment";
import { Category } from "../entities/Category";
import { Client } from "../entities/Client";

@Injectable({
  providedIn: "root",
})
export class CategoryService {
  token: any;
  private index: number = 0;
  private httpOptions;
  constructor(private http: HttpClient, private authService: NbAuthService,private toastrService: NbToastrService,) {
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

  listCategories() {
    return this.http.get<Category[]>(
      environment.getAllCategory,
      this.httpOptions
    );
  }

  async deleteCategory(id: number) {
    this.http
      .delete(environment.deleteCategory + id, this.httpOptions)
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

  addCategory(CategoryName: String, Image: String) {
    const category  = { id: null, CategoryName,Image};
    console.log("Category Inside SERVICE")
    console.log(category);

    this.http
     .post(environment.addCategory, category,this.httpOptions )
     .subscribe(response => {
       //    console.log(this.getAuthData().token)
           console.log(response);
          },
           (error: HttpErrorResponse) => {
           console.log('HTTPERROR');
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
          }else if(error.status == 201){
            this.showToast("success",5000);
          }

         });

       }

       showToast(status: NbComponentStatus,duration) {
        this.toastrService.show(status, `PRODUCT ADDED SUCCESSFULLY: ${++this.index}`, { status });
      }
  public uploadImage(image: File) {
    const formData = new FormData();

    formData.append("image", image);

    return this.http.post(environment.upload, formData);
  }
}
