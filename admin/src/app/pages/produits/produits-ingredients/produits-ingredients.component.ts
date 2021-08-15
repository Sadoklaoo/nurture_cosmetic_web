import { HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Product } from '../../../entities/Product';
import { ProductService } from '../../../services/product.service';

@Component({
  selector: 'ngx-produits-ingredients',
  templateUrl: './produits-ingredients.component.html',
  styleUrls: ['./produits-ingredients.component.scss']
})
export class ProduitsIngredientsComponent implements OnInit {

  token: string;
  httpOptions: { headers: HttpHeaders };
  product: any;
  ProductIngredients: any;
  Others: any;

  loading = false;
  selectedProduct = 0;

  toggleLoadingAnimation() {
    this.loading = true;
    setTimeout(() => (this.loading = false), 1000);
    console.log(this.selectedProduct)
    this.product.forEach((element)=>{
      if (element.id == this.selectedProduct){
        console.log(element.ProductIngredients)
        this.ProductIngredients = element.ProductIngredients;
        this.filterList(element)
      }
    });
  }
  constructor(
    private service: ProductService
  ) {}
  onAdd(id :number){
    //console.log(id)
    this.service.addIngredientProduct(this.selectedProduct,id);
    this.Others.forEach((element,index)=>{
      if (element.id == id){
        this.Others.splice(index,1);
        this.ProductIngredients.push(element);
      }
    })
  }
  onDelete(id :number){
    //console.log(id)
    this.service.deleteIngredientProduct(this.selectedProduct,id);
    this.ProductIngredients.forEach((element,index)=>{
      if (element.id == id){
        this.ProductIngredients.splice(index,1);
        this.Others.push(element);
      }
    })
  }
  ngOnInit(): void {
    this.service.listProducts().subscribe((response) => {
      this.product = response;
      console.log(response)
    });
  }
  filterList(element:Product){
    this.service.getOther(element.id).subscribe((response) => {
      this.Others = response;
      console.log(response)
    });
  }
}
