import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'ngx-produits-ingredients',
  templateUrl: './produits-ingredients.component.html',
  styleUrls: ['./produits-ingredients.component.scss']
})
export class ProduitsIngredientsComponent implements OnInit {

  loading = false;

  toggleLoadingAnimation() {
    this.loading = true;
    setTimeout(() => this.loading = false, 3000);
  }
  users: { name: string, title: string }[] = [
    { name: 'Carla Espinosa', title: 'Nurse' },
    { name: 'Bob Kelso', title: 'Doctor of Medicine' },
    { name: 'Janitor', title: 'Janitor' },
    { name: 'Perry Cox', title: 'Doctor of Medicine' },
    { name: 'Ben Sullivan', title: 'Carpenter and photographer' },
  ];

  ngOnInit(): void {
  }

}
