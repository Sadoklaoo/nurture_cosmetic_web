import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Component, OnInit } from "@angular/core";
import { Router } from "@angular/router";
import { NbAuthService } from "@nebular/auth";
import { LocalDataSource } from "ng2-smart-table";
import { SmartTableData } from "../../../@core/data/smart-table";
import { IngredientService } from "../../../services/ingredient.service";

@Component({
  selector: "ngx-list-ingredients",
  templateUrl: "./list-ingredients.component.html",
  styleUrls: ["./list-ingredients.component.scss"],
})
export class ListIngredientsComponent implements OnInit {
  settings = {
    add: {
      addButtonContent: '<i class="nb-plus"></i>',
      createButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
      confirmCreate : true,
    },
    edit: {
      editButtonContent: '<i class="nb-edit"></i>',
      saveButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
      confirmSave: true,
    },
    delete: {
      deleteButtonContent: '<i class="nb-trash"></i>',
      confirmDelete: true,
    },
    columns: {
      IngredientName: {
        title: "Ingredient Name",
        type: "string",
      },
      IngredientType: {
        title: "Type",
        type: "html",
        editor: {
          type: "list",
          config: {
            list: [
              { value: "NORMAL", title: "NORMAL" },
              { value: "LOW", title: "LOW" },
              {
                value: "MEDIUM",
                title: "MEDIUM",
              },
              {
                value: "HIGH",
                title: "HIGH",
              },
            ],
          },
        },
      },
    },
  };
  source: LocalDataSource = new LocalDataSource();
  token: string;
  httpOptions: { headers: HttpHeaders };
  categories: any;

  constructor(
    private service: IngredientService,
    private router: Router,
    private http: HttpClient,
    private authService: NbAuthService
  ) {}

  onDeleteConfirm(event): void {
    if (window.confirm("Are you sure you want to delete?")) {
      this.service.deleteIngredient(event.data.id);
      event.confirm.resolve();
    } else {
      event.confirm.reject();
    }
  }

  onEditConfirm(event): void {
    //console.log(event.data.id);
    if (window.confirm("Are you sure you want to edit?")) {
     /* console.log(event.newData.IngredientName);
      console.log(event.data.IngredientName);
      console.log(event.newData.IngredientType);*/
     this.service.editIngredient(event.data.IngredientName,event.newData.IngredientName,event.newData.IngredientType);
      event.confirm.resolve();
    } else {
      event.confirm.reject();
    }
  }

  onCreateConfirm(event): void {
    //console.log(event.data.id);
    if (window.confirm("Are you sure you want to add?")) {
     /* console.log(event.newData.IngredientName);
      console.log(event.data.IngredientName);
      console.log(event.newData.IngredientType);*/
     this.service.addIngredient(event.newData.IngredientName,event.newData.IngredientType);
      event.confirm.resolve();
    } else {
      event.confirm.reject();
    }
  }
  ngOnInit(): void {
    this.service.listIngredients().subscribe((response) => {
      this.categories = response;
      console.log(response);
      this.source.load(this.categories);
    });
  }
}
