import { Component, OnInit } from '@angular/core';
import { ContribuyenteService } from './Contribuyente.service';
import { Contribuyente } from 'src/Models/Contribuyente';

@Component({
  selector: 'app-Contribuyente',
  templateUrl: './Contribuyente.component.html',
  styleUrls: ['./Contribuyente.component.css']
})
export class ContribuyenteComponent implements OnInit {

  Contribuyente: Contribuyente[] = []


  constructor(private _appService: ContribuyenteService) { }

  ngOnInit(): void {
    this.getContribuyenteLista();
  }


  getContribuyenteLista(){
        this._appService.getListaContribuyente().subscribe(res => {
              this.Contribuyente = res as Contribuyente[]
        })
  }
}
