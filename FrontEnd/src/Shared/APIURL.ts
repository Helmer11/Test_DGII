import { environment } from '../environments/environment'



let BASEURL = environment.Api;


export let APIURL = {

  contribuyente: {
      consulta: BASEURL + 'Contribuyente/api/Lista',
      agregar: BASEURL + '',
      edita: BASEURL + '',
      inactivar: BASEURL + ''
  },
  ComprobantesFiscales: {
    consulta: BASEURL + 'ComprobantesFiscales/api/Comprobantes?rncCedula=',
    agregar: BASEURL + '',
    edita: BASEURL + '',
    inactivar: BASEURL + ''
  }



}

