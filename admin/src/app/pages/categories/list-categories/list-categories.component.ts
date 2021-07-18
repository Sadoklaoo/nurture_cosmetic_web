import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NbAuthJWTToken, NbAuthService } from '@nebular/auth';
import { LocalDataSource } from 'ng2-smart-table';
import { SmartTableData } from '../../../@core/data/smart-table';
import { CategoryService } from '../../../services/category.service';

@Component({
  selector: 'ngx-list-categories',
  templateUrl: './list-categories.component.html',
  styleUrls: ['./list-categories.component.scss']
})
export class ListCategoriesComponent implements OnInit {

  settings = {
    actions:{
      add:false,
    },
    edit: {
      editButtonContent: '<i class="nb-edit"></i>',
      saveButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
    },
    delete: {
      deleteButtonContent: '<i class="nb-trash"></i>',
      confirmDelete: true,
    },
    columns: {
      CategoryName: {
        title: 'Name',
        type: 'string',
      },
      Image: {
        editable: false,
        title: 'Image',
        type: 'string',
      },
    },
  };
  source: LocalDataSource = new LocalDataSource();
  token: string;
  httpOptions: { headers: HttpHeaders; };
  categories: any;

  constructor(private service: CategoryService,
    private router: Router,
    private http: HttpClient,
    private authService: NbAuthService,) {
    
   
  }
  ngOnInit(): void {
    this.authService.onTokenChange().subscribe((token: NbAuthJWTToken) => {
      if (token.isValid()) {
        this.token = token.getValue();
        this.httpOptions = {
          headers: new HttpHeaders({
            "Content-Type": "application/json",
            "auth": this.token,
          }),
        };
      }
    });

    this.service.listCategories().subscribe((response) => {
      this.categories = response;
      console.log(response);
      this.source.load(this.categories);
    });
  }

  onDeleteConfirm(event): void {
    console.log(event.data.idUser);
    if (window.confirm("Are you sure you want to delete?")) {
      console.log(event.data.idUser);
      this.service.deleteCategory(event.data.idUser);
      event.confirm.resolve();
    } else {
      event.confirm.reject();
    }
  }

}
