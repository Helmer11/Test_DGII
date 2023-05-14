import { Component, OnInit } from '@angular/core';
import { ContribuyenteService } from '../Contribuyente.service';
import { ActivatedRoute } from '@angular/router';
import { Comprobante } from 'src/Models/Comprobante';

@Component({
  selector: 'app-App-Detalle',
  templateUrl: './Contribuyente-Detalle.component.html',
  styleUrls: ['./Contribuyente-Detalle.component.css']
})
export class ContribuyenteDetalleComponent implements OnInit {


    RncCedula!: string;
    Comprobante: Comprobante[] = []

  constructor( private _contri: ContribuyenteService,
               private _router: ActivatedRoute
               ) {
        this.RncCedula = String( this._router.snapshot.paramMap.get('id'));
   }

  ngOnInit() {
    this.getListaComprobantesFiscales();
  }

    getListaComprobantesFiscales(){
            this._contri.getComprobantesFiscales(this.RncCedula).subscribe(res => {
              this.Comprobante = res as Comprobante[];
            })
    }





}
