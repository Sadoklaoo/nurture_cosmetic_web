import { DatePipe } from '@angular/common';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { NbAuthJWTToken, NbAuthService } from '@nebular/auth';
import { LocalDataSource } from 'ng2-smart-table';
import { SmartTableData } from '../../../@core/data/smart-table';
import { UserService } from '../../../services/user.service';

@Component({
  selector: 'ngx-list-users',
  templateUrl: './list-users.component.html',
  styleUrls: ['./list-users.component.scss']
})
export class ListUsersComponent implements OnInit {
  users: any = {};
  settings = {
    actions: {
      
      add: false,
      edit: false,
      delete: false,
      
    
    },
    
    columns: {
      firstName: {
        title: 'First Name',
        type: 'string',
      },
      lastName: {
        title: 'Last Name',
        type: 'string',
      },
      email: {
        title: 'E-mail',
        type: 'string',
      },
      phoneNumber: {
        title: 'Phone ',
        type: 'number',
      },
      sexe: {
        title: 'Sexe',
        type: 'string',
      },
      birthDate: {
        title: "Birthday",
        width: "200px",
        addable: false,
        editable: false,
        valuePrepareFunction: (data) => {
          return new DatePipe("en-US").transform(data, "dd/MM/YYYY hh:mm a");
        },
      },
      createdAt: {
        title: "Created At",
        width: "200px",
        addable: false,
        editable: false,
        valuePrepareFunction: (data) => {
          return new DatePipe("en-US").transform(data, "dd/MM/YYYY hh:mm a");
        },
      },
      updatedAt: {
        title: "Updated At",
        width: "200px",
        addable: false,
        editable: false,
        valuePrepareFunction: (data) => {
          return new DatePipe("en-US").transform(data, "dd/MM/YYYY hh:mm a");
        },
      },
    },
  };
  source: LocalDataSource = new LocalDataSource();
  token: any;
  private httpOptions;

  constructor(private service: UserService,
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

    this.service.listUsers().subscribe((response) => {
      this.users = response;
      console.log(response);
      this.source.load(this.users);
    });
  }

}
