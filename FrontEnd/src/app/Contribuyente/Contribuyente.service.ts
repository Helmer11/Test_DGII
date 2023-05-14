import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { APIURL } from 'src/Shared/APIURL';

@Injectable({
  providedIn: 'root'
})
export class ContribuyenteService {

  constructor(private _http: HttpClient) { }


  public getListaContribuyente(){
    return this._http.get(APIURL.contribuyente.consulta);
  }

  public getComprobantesFiscales(rncCedula: string){
    return this._http.get(APIURL.ComprobantesFiscales.consulta + rncCedula );
  }


}
