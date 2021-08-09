import { HttpHeaders } from "@angular/common/http";
import { isNull } from "@angular/compiler/src/output/output_ast";
import { Component, OnInit } from "@angular/core";
import { CategoryService } from "../../../services/category.service";
import { ProductService } from "../../../services/product.service";
import {DomSanitizer} from '@angular/platform-browser';
@Component({
  selector: "ngx-produits-details",
  templateUrl: "./produits-details.component.html",
  styleUrls: ["./produits-details.component.scss"],
})
export class ProduitsDetailsComponent implements OnInit {
  token: string;
  httpOptions: { headers: HttpHeaders };
  product: any;
  currentProduct: any;
  productIngredients: any;
  productAllergies: any;
  categories: any;
  skintypes: any;
  selectedTypes: any;
  loading = false;
  selectedProduct = 0;
  selectedCategory = 0;
  selectedSkin = 0;
  BaseLink  ;

  productTypes: any;

  constructor(
    private service: ProductService,
    private categoryService: CategoryService,
    private sanitizer:DomSanitizer
  ) {
    this.skintypes = [
      {
        id: 0,
        name: "NORMAL",
      },
      {
        id: 1,
        name: "OILED",
      },
      {
        id: 2,
        name: "MIXED",
      },
      {
        id: 3,
        name: "SEC",
      },
    ];
  }

  toggleLoadingAnimation() {
    this.loading = true;
    this.service.getCurrentProduct(this.selectedProduct).subscribe((res) => {
      this.currentProduct = res;
      this.productIngredients = this.currentProduct.ProductIngredients;
      this.setSelectedCategory(this.currentProduct.Category.CategoryName);
      this.setSelectedSkin(this.currentProduct.PreferedSkinType);
      this.BaseLink= "http://localhost:3000/images/"+this.currentProduct.Image;
    });

    this.service.listProductAllergy(this.selectedProduct).subscribe((res)=>{
      this.productAllergies = res;
    } );

    setTimeout(() => (this.loading = false), 2000);
  }
  checkValue(u){
   let value = false;
    if(this.currentProduct!=null){
      this.currentProduct.Type.forEach((item)=>{

        if (item.id == u.id)
        {
          value = true;
        }

      });
    }
    return value;
  }

  setSelectedCategory(categoryName) {
    if (categoryName != null) {
      this.categories.forEach((category, index) => {
        if (category.CategoryName == categoryName) {
          this.selectedCategory = index + 1;
        }
      });
    }
  }
  setSelectedSkin(skinName) {
    if (skinName != null) {
      this.skintypes.forEach((skin, index) => {
        if (skin.name == skinName) {
          this.selectedSkin = index ;
          console.log("found" + this.selectedSkin);
        }
      });
    }
  }
  sanitize(url:string){
    return this.sanitizer.bypassSecurityTrustUrl(url);
}
  ngOnInit(): void {
    this.service.listProducts().subscribe((response) => {
      this.product = response;
      console.log(response);
    });

    this.service.listProductType().subscribe((response) => {
      this.productTypes = response;
      
    });

    this.categoryService.listCategories().subscribe((res) => {
      this.categories = res;
    });
  }
}
