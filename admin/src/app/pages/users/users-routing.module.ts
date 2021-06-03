import { UserAllergiesComponent } from './user-allergies/user-allergies.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ListUsersComponent } from './list-users/list-users.component';
import { UserSearchHistoryComponent } from './user-search-history/user-search-history.component';
import { UsersComponent } from './users.component';
import { UserSkinTypeComponent } from './user-skin-type/user-skin-type.component';

const routes: Routes = [
  {
    path: '',
    component: UsersComponent,
    children: [
      {
        path: 'list-users',
        component: ListUsersComponent,
      },
      {
        path: 'user-search-history',
        component: UserSearchHistoryComponent,
      },
      {
        path: 'user-allergies',
        component: UserAllergiesComponent,
      },      
      {
        path: 'user-skin-type',
        component: UserSkinTypeComponent,
      },
      
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class UsersRoutingModule { }

export const routedComponents = [UsersComponent];