import { DatePipe } from "@angular/common";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Component, OnInit } from "@angular/core";
import { Router } from "@angular/router";
import { NbAuthService } from "@nebular/auth";
import { LocalDataSource } from "ng2-smart-table";
import { SmartTableData } from "../../../@core/data/smart-table";
import { AdminService } from "../../../services/admin.service";

@Component({
  selector: "ngx-list-reclamation",
  templateUrl: "./list-reclamation.component.html",
  styleUrls: ["./list-reclamation.component.scss"],
})
export class ListReclamationComponent implements OnInit {
  settings = {
    actions: {
      add: false,
      edit: true,
      delete: false,
    },
    edit: {
      editButtonContent: '<i class="nb-edit"></i>',
      saveButtonContent: '<i class="nb-checkmark"></i>',
      cancelButtonContent: '<i class="nb-close"></i>',
      confirmSave:true,
    },
    columns: {
      message: {
        title: "Message",
        type: "string",
        editable: false,
      },
      type: {
        title: "Type",
        type: "html",
        editable: false,
        filter: {
          type: "list",
          config: {
            list: [
              { value: "BUG", title: "BUG" },
              { value: "SUGGUESTION", title: "SUGGUESTION" },
              {
                value: "OTHERS",
                title: "OTHERS",
              },
            ],
          },
        },
       
      },
      rate: {
        title: "Rate",
        type: "number",
        editable: false,
      },
      Client: {
        title: "User",
        editable: false,
        filter: false,
        valuePrepareFunction: (data) => {
          return data.firstName + " " + data.lastName;
        },
      },
      status: {
        title: "Status",
        type: "html",
        filter: {
          type: "list",
          config: {
            list: [
              { value: "PENDING", title: "PENDING" },
              { value: "RESOLVED", title: "RESOLVED" },
              {
                value: "DECLINED",
                title: "DECLINED",
              },
            ],
          },
        },
        editor: {
          type: "list",
          config: {
            list: [
              { value: "PENDING", title: "PENDING" },
              { value: "RESOLVED", title: "RESOLVED" },
              {
                value: "DECLINED",
                title: "DECLINED",
              },
            ],
          },
        },
      },
      date: {
        title: "Created At",
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
  token: string;
  httpOptions: { headers: HttpHeaders };
  contacts: any;

  constructor(
    private service: AdminService,
    private router: Router,
    private http: HttpClient,
    private authService: NbAuthService
  ) {}

  ngOnInit(): void {
    this.service.getAllContact().subscribe((response) => {
      this.contacts = response;
      // console.log(response);
      this.source.load(this.contacts);
    });
  }

  onEditConfirm(event): void {
    if (window.confirm('Are you sure you want to edit?')) {
      this.service.updateContact(event.data.id,event.newData.status);
     
      event.confirm.resolve();
     // 
    } else {
      event.confirm.reject();
    }
  }
}
