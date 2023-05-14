using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Test_Dgii.Interfaces;
using Test_Dgii.Models;

namespace Test_Dgii.Controllers
{

    [ApiController]
    [Route("[controller]")]
    public class ContribuyenteController : Controller
    {
        private readonly IConexion conex;
        private readonly IContribuyente _contribuyente;


        public ContribuyenteController( IConexion _conex)
        {
             conex = _conex;
            _contribuyente = new Contribuyente(conex);
        }

        [HttpGet]
        [Route("api/Lista")]
        // GET: ContribuyenteController
        public IActionResult ListaContribuyente()
        {
            try
            {
                var lista = _contribuyente.getListaContribuyente();
                var json = JsonConvert.SerializeObject(lista);

                return Ok(json);

            } catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
           
        }

        
    }
}
