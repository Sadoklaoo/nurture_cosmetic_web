import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'ngx-type-ingredients',
  templateUrl: './type-ingredients.component.html',
  styleUrls: ['./type-ingredients.component.scss'],
})
export class TypeIngredientsComponent implements OnInit {

  loading = false;

  toggleLoadingAnimation() {
    this.loading = true;
    setTimeout(() => this.loading = false, 3000);
  }

  ngOnInit(): void {
  }

}
