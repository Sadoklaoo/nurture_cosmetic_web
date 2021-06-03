import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'ngx-etat-reclamation',
  templateUrl: './etat-reclamation.component.html',
  styleUrls: ['./etat-reclamation.component.scss']
})
export class EtatReclamationComponent implements OnInit {
  loading = false;

  toggleLoadingAnimation() {
    this.loading = true;
    setTimeout(() => this.loading = false, 3000);
  }
  constructor() { }

  ngOnInit(): void {
  }

}
