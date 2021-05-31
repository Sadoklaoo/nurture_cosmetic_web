import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { IngredientsComponent } from "./ingredients.component";
import { ListIngredientsComponent } from "./list-ingredients/list-ingredients.component";
import { TypeIngredientsComponent } from "./type-ingredients/type-ingredients.component";

const routes: Routes = [
  {
    path: "",
    component: IngredientsComponent,
    children: [
      {
        path: "list-ingredients",
        component: ListIngredientsComponent,
      },
      {
        path: "type-ingredients",
        component: TypeIngredientsComponent,
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class IngredientsRoutingModule {}

export const routedComponents = [IngredientsComponent];
