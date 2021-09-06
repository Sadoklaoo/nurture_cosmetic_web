import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NbAuthService } from '@nebular/auth';
import { LocalDataSource } from 'ng2-smart-table';
import { SmartTableData } from '../../../@core/data/smart-table';
import { ProductService } from '../../../services/product.service';

@Component({
  selector: 'ngx-list-produits',
  templateUrl: './list-produits.component.html',
  styleUrls: ['./list-produits.component.scss']
})
export class ListProduitsComponent implements OnInit {

  settings = {
    actions: {
      add: false,
      edit: false,
      delete: true,
    },
    delete: {
      deleteButtonContent: '<i class="nb-trash"></i>',
      confirmDelete: true,
    },
    columns: {
      ProductName: {
        title: 'Nom Produit',
        type: 'string',
      },
      Reference: {
        title: 'Reference',
        type: 'string',
      },
      Price: {
        title: 'Prix',
        type: 'number',
      },
      Rank: {
        title: 'Rang',
        type: 'number',
      },
      
     
    },
  };
  source: LocalDataSource = new LocalDataSource();
  token: string;
  httpOptions: { headers: HttpHeaders };
  products: any;

  constructor(
    private service: ProductService,
    private router: Router,
    private http: HttpClient,
    private authService: NbAuthService
  ) {}


  ngOnInit(): void {
    this.service.listProducts().subscribe((response) => {
      this.products = response;
      // console.log(response);
      this.source.load(this.products);
    });
  }

  onDeleteConfirm(event): void {
    if (window.confirm('Are you sure you want to delete?')) {
      this.service.deleteProduct(event.data.id);
      event.confirm.resolve();
     // 
    } else {
      event.confirm.reject();
    }
  }

}
