import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'ngx-produits-details',
  templateUrl: './produits-details.component.html',
  styleUrls: ['./produits-details.component.scss']
})
export class ProduitsDetailsComponent implements OnInit {
  users: { name: string, title: string }[] = [
    { name: 'Carla Espinosa', title: 'Nurse' },
    { name: 'Bob Kelso', title: 'Doctor of Medicine' },
    { name: 'Janitor', title: 'Janitor' },
    { name: 'Perry Cox', title: 'Doctor of Medicine' },
    { name: 'Ben Sullivan', title: 'Carpenter and photographer' },
  ];

  loading = false;

  toggleLoadingAnimation() {
    this.loading = true;
    setTimeout(() => this.loading = false, 3000);
  }
  
  constructor() { }

  ngOnInit(): void {
  }

}
