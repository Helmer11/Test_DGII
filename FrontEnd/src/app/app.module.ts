import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { LayoutComponent } from 'src/Shared/Layout/Layout.component';
import { ContribuyenteComponent } from './Contribuyente/Contribuyente.component';
import { CommonModule } from '@angular/common';
import { ContribuyenteDetalleComponent } from './Contribuyente/Detalle/Contribuyente-Detalle.component';






@NgModule({
  declarations: [
    AppComponent,
    LayoutComponent,
      ContribuyenteComponent,
      ContribuyenteDetalleComponent
   ],
  imports: [
    CommonModule,
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,

  ],
  providers: [

  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
