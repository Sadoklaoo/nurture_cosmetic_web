import { Allergy } from './../../../entities/Allergy';
import { HttpHeaders } from "@angular/common/http";
import { Component, OnInit } from "@angular/core";
import { LocalDataSource } from "ng2-smart-table";
import { SmartTableData } from "../../../@core/data/smart-table";
import { AllergyService } from "../../../services/allergy.service";
import { IngredientService } from "../../../services/ingredient.service";

@Component({
  selector: "ngx-affect-allergies-ingredients",
  templateUrl: "./affect-allergies-ingredients.component.html",
  styleUrls: ["./affect-allergies-ingredients.component.scss"],
})
export class AffectAllergiesIngredientsComponent implements OnInit {
  token: string;
  httpOptions: { headers: HttpHeaders };
  allergy: any;
  AllergyIngredients: any;
  Others: any;

  loading = false;
  selectedAllergy = 0;

  constructor(
    private allergyService: AllergyService,
    private ingredientService: IngredientService
  ) {}

  toggleLoadingAnimation() {
    this.loading = true;
    setTimeout(() => (this.loading = false), 1000);
    console.log(this.selectedAllergy)
    this.allergy.forEach((element)=>{
      if (element.id == this.selectedAllergy){
        this.AllergyIngredients = element.IngredientTriggering;
        this.filterList(element)
      }
    });
    //this.ingredientService.listIngredients
  }
  onAdd(id :number){
    //console.log(id)
    this.allergyService.addIngredientAllergy(this.selectedAllergy,id);
    this.Others.forEach((element,index)=>{
      if (element.id == id){
        this.Others.splice(index,1);
        this.AllergyIngredients.push(element);
      }
    })
  }

  onDelete(id :number){
    //console.log(id)
    this.allergyService.deleteIngredientAllergy(this.selectedAllergy,id);
    this.AllergyIngredients.forEach((element,index)=>{
      if (element.id == id){
        this.AllergyIngredients.splice(index,1);
        this.Others.push(element);
      }
    })
  }
  ngOnInit(): void {
    this.allergyService.listAdminAllergy().subscribe((response) => {
      this.allergy = response;
      console.log(response)
    });

   
  }

  filterList(element:Allergy){
    this.allergyService.getOther(element.id).subscribe((response) => {
      this.Others = response;
      console.log(response)
    });
  }
}
