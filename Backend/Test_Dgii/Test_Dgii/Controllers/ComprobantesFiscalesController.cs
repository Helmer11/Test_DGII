using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Test_Dgii.Interfaces;
using Test_Dgii.Models;

namespace Test_Dgii.Controllers
{

    [ApiController]
    [Route("[controller]")]
    public class ComprobantesFiscalesController : Controller
    {
        private readonly IConexion conex;
        private readonly IComprobantesFiscales _comprobante;


        public ComprobantesFiscalesController(IConexion _conex)
        {
            conex = _conex;
            _comprobante = new ComprobantesFiscales(conex);
        }

        [HttpGet]
        [Route("api/Comprobantes")]
        public IActionResult getComprobanteLista(string rncCedula)
        {
            try
            {
                var lista = _comprobante.getListaComprobantesFiscales(rncCedula);
                
                var result = JsonConvert.SerializeObject(lista);
                
                return Ok( result);
            } catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
