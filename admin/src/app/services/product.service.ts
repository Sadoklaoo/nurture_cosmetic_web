import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { NbAuthJWTToken, NbAuthService } from '@nebular/auth';
import { NbComponentStatus, NbToastrService } from '@nebular/theme';
import { environment } from '../../environments/environment';
import { Allergy } from '../entities/Allergy';
import { Product } from '../entities/Product';
import { ProductType } from '../entities/ProductType';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
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

  editProductCategory( idProduct: number,idCategory: number) {
    const category = { idProduct, idCategory };
    console.log("Category Inside SERVICE");
    console.log(category);

    this.http
      .post(environment.updateProductCategory, category, this.httpOptions)
      .subscribe(
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
          } else if (error.status == 203) {
            this.showToastEdit("success");
          }
        }
      );
  }

  showToastEdit(status: NbComponentStatus) {
    this.toastrService.show(
      status,
      `PRODUCT EDITED SUCCESSFULLY`,
      { status }
    );
  }

  showToastDelete(status: NbComponentStatus) {
    this.toastrService.show(
      status,
      `PRODUCT DELETED SUCCESSFULLY`,
      { status }
    );
  }
  showToastDeleteError(status: NbComponentStatus) {
    this.toastrService.show(
      status,
      `PRODUCT DELETED ERROR`,
      { status }
    );
  }

  listProducts() {
    return this.http.get<Product[]>(
      environment.getAllProducts,
      this.httpOptions
    );
  }

  listProductType() {
    return this.http.get<ProductType[]>(
      environment.getAllProductTypes,
      this.httpOptions
    );
  }

  listProductAllergy(id:number) {
    return this.http.get<Allergy[]>(
      environment.getProductAllergies+id,
      this.httpOptions
    );
  }

  getCurrentProduct(id: number) {
    return this.http.get<Product>(
      environment.detailsProduct + id,
      this.httpOptions
    );
  }

  async deleteProduct(id: number) {
    this.http
      .delete(environment.deleteProduct + id, this.httpOptions)
      .subscribe(
        (res) => {
          console.log(res);
          this.showToastDelete("success");
        },
        (err: HttpErrorResponse) => {
          if (err.error instanceof Error) {
            console.log("Client-side error occured.");
            this.showToastDeleteError("danger");
          } else {
            console.log("Server-side error occured.");
          }
        }
      );
  }
}
