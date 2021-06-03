import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EtatReclamationComponent } from './etat-reclamation/etat-reclamation.component';
import { ListReclamationComponent } from './list-reclamation/list-reclamation.component';
import { ReclamationsComponent } from './reclamations.component';

const routes: Routes = [
  {
    path: '',
    component: ReclamationsComponent,
    children: [
      {
        path: 'list-reclamation',
        component: ListReclamationComponent,
      },
      {
        path: 'etat-reclamation',
        component: EtatReclamationComponent,
      },
      
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReclamationsRoutingModule { }

export const routedComponents = [ReclamationsComponent];
