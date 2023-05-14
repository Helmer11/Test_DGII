import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { LayoutComponent } from 'src/Shared/Layout/Layout.component';
import { ContribuyenteDetalleComponent } from './Contribuyente/Detalle/Contribuyente-Detalle.component';
import { ContribuyenteComponent } from './Contribuyente/Contribuyente.component';

const routes: Routes = [
  {
    path:'',
    component: LayoutComponent,
    children: [
      {
      path: "",
      component: ContribuyenteComponent
      },
      {
        path: "detalle/:id",
       component: ContribuyenteDetalleComponent
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
