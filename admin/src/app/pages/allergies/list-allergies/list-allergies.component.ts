import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NbAuthService } from '@nebular/auth';
import { LocalDataSource } from 'ng2-smart-table';
import { SmartTableData } from '../../../@core/data/smart-table';
import { AllergyService } from '../../../services/allergy.service';

@Component({
  selector: 'ngx-list-allergies',
  templateUrl: './list-allergies.component.html',
  styleUrls: ['./list-allergies.component.scss'],
})
export class ListAllergiesComponent implements OnInit {
  settings = {
    actions:{
      add:false,
    },
    edit: {
      editButtonContent: '<i class="nb-edit"></i>',
      saveButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
      confirmSave:true,
    },
    delete: {
      deleteButtonContent: '<i class="nb-trash"></i>',
      confirmDelete: true,
    },
    columns: {
      AllergyName: {
        title: 'Name',
        type: 'string',
      },
      Image: {
        editable:false,
        title: 'Image',
        type: 'html',
        width:'5%',
        valuePrepareFunction: (data) => { return '<img width="100%" height="100%" src= http://localhost:3000/images/'+ data +'>' }
      },
    },
  };
  source: LocalDataSource = new LocalDataSource();
  token: string;
  httpOptions: { headers: HttpHeaders; };
  categories: any;
  
  constructor(private service: AllergyService,
    private router: Router,
    private http: HttpClient,
    private authService: NbAuthService,) {
    
   
  }

  onDeleteConfirm(event): void {
    if (window.confirm('Are you sure you want to delete?')) {
      this.service.deleteAllergy(event.data.id);
      event.confirm.resolve();
     // 
    } else {
      event.confirm.reject();
    }
  }

  onEditConfirm(event): void {
    if (window.confirm('Are you sure you want to edit?')) {
      this.service.editAllergy(event.data.AllergyName,event.newData.AllergyName);
      event.confirm.resolve();
     // 
    } else {
      event.confirm.reject();
    }
  }

  ngOnInit(): void {
    

    this.service.listAdminAllergy().subscribe((response) => {
      this.categories = response;
      console.log(response);
      this.source.load(this.categories);
    });

  }

}
