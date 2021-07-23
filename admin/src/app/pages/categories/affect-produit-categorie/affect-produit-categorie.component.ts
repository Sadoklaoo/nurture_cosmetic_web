import {
  HttpClient,
  HttpErrorResponse,
  HttpHeaders,
} from "@angular/common/http";
import { Component, OnInit } from "@angular/core";
import { Router } from "@angular/router";
import { NbAuthJWTToken, NbAuthService } from "@nebular/auth";
import { LocalDataSource } from "ng2-smart-table";
import { SmartTableData } from "../../../@core/data/smart-table";
import { CategoryService } from "../../../services/category.service";
import { ProductService } from "../../../services/product.service";

@Component({
  selector: "ngx-affect-produit-categorie",
  templateUrl: "./affect-produit-categorie.component.html",
  styleUrls: ["./affect-produit-categorie.component.scss"],
})
export class AffectProduitCategorieComponent implements OnInit {
  settings = {
    actions: {
      add: false,
      edit: false,
    },
    delete: {
      deleteButtonContent: '<i class="nb-trash"></i>',
      confirmDelete: true,
    },
    columns: {
      id: {
        title: "ID",
        type: "number",
      },
      ProductName: {
        title: "Product Name",
        type: "string",
      },
      Image: {
        title: "Image",
        type: "string",
      },
    },
  };

  settingsOther = {
    hideSubHeader: true,
    
    edit: {
      editButtonContent: '<i class="nb-plus"></i>',
      saveButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
      confirmSave: false,
    },
    actions: {
      
      add: false,
      delete: false,
      edit: false,
      filter:false,
      position: "right",
      custom: [
        {
          name: 'Add',
          title: '<i class="nb-plus-circled" title="Add"></i>'
        },
        {
          name: 'View',
          title: '&nbsp;<i class="nb-compose" title="View"></i>'
        },
      ],

    },

    columns: {
      id: {
        title: "ID",
        type: "number",
        editable: false,
      },
      ProductName: {
        title: "Product Name",
        type: "string",
        editable: false,
      },
      Image: {
        title: "Image",
        type: "string",
        editable: false,
      },
     /* Actions: //or something
      {
        title:'Actions',
        type:'html',
        valuePrepareFunction:(cell,row)=>{
          return `<button title="Add Product To Category" (click)="myFunction(${row.Id})" > <i class="fas fa-plus-circle fa-lg icon-color"></i></button><a title="View Product" href="${row.Id}"> &nbsp;<i class="fas fa-eye fa-lg icon-color"></i></a>`
        },
        filter:false       
      },*/
    },
  };
  source: LocalDataSource = new LocalDataSource();
  sourceOther: LocalDataSource = new LocalDataSource();
  token: string;
  httpOptions: { headers: HttpHeaders };
  categories: any;
  selectedCategory: any;
  productsCategory: any;
  products: any;

  constructor(
    private service: CategoryService,
    private serviceProduct: ProductService,
    private router: Router,
    private http: HttpClient,
    private authService: NbAuthService
  ) {}
  ngOnInit(): void {
    this.authService.onTokenChange().subscribe((token: NbAuthJWTToken) => {
      if (token.isValid()) {
        this.token = token.getValue();
        this.httpOptions = {
          headers: new HttpHeaders({
            "Content-Type": "application/json",
            auth: this.token,
          }),
        };
      }
    });

    this.service.listCategories().subscribe((response) => {
      this.categories = response;
    });
    this.service.listProductsWithoutCategory().subscribe((response) => {
      this.products = response;
      this.sourceOther.load(this.products);
    });
  }

  onCustomAction(event) {
    switch ( event.action) {
      case 'Add':
       // this.viewRecord(event.data);
       console.log(event.data.id);
       this.onAddConfirm(event);
        break;
     case 'View':
      console.log('view')
       // this.editRecord(event.data);
    }
  }
  onDeleteConfirm(event): void {
    if (window.confirm("Are you sure you want to delete?")) {
      this.serviceProduct.editProductCategory(event.data.id,null);
      this.products.push(event.data);
      this.sourceOther.load(this.products);
      event.confirm.resolve();
    } else {
      event.confirm.reject();
    }
  }
  

  onAddConfirm(event): void {
    console.log(event.data.id);
    if (window.confirm("Are you sure you want to add?")) {
      console.log(event.data.id);
      this.serviceProduct.editProductCategory(event.data.id,this.selectedCategory);
      //console.log(this.productsCategory)
      this.productsCategory.push(event.data);
      this.source.load(this.productsCategory);
      this.deleteObject(event.data,this.products);
      this.sourceOther.load(this.products);
     //event.confirm.resolve();
    } else {
      //event.confirm.reject();
    }
  }

  deleteObject(msg:any, data:any) {
    const index: number = data.indexOf(msg);
    if (index !== -1) {
        data.splice(index, 1);
    }        
  }

  onChange(event): void {
    //console.log(event);
    this.selectedCategory = event;

    this.service.listProductByCategoryId(event).subscribe(
      (response) => {
        //    console.log(this.getAuthData().token)
        // return response;
        this.productsCategory = response;
        this.source.load(this.productsCategory);
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
        } else if (error.status == 200) {
        }
      }
    );
  }
}
