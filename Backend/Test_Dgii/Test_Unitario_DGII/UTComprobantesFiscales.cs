using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Test_Dgii.Interfaces;
using Test_Dgii.Models;

namespace Test_Unitario_DGII
{
    internal class UTComprobantesFiscales
    {
        private readonly IConexion conex;

        public UTComprobantesFiscales(IConexion _conex)
        {
            conex = _conex;
        }

        [TestMethod]
       public void getComprobantes()
        {
            string rncCedula = "226-3219876-1";
            ComprobantesFiscales comp = new ComprobantesFiscales(conex);

             var resultado = comp.getListaComprobantesFiscales(rncCedula);
            
            Assert.AreEqual(true, resultado);
        }



        [TestMethod]
        public void getComprobantesFalse()
        {
            string rncCedula = "226-3219876-2";
            ComprobantesFiscales comp = new ComprobantesFiscales(conex);

            var resultado = comp.getListaComprobantesFiscales(rncCedula);

            Assert.AreEqual(false,resultado);
        }
    }
}
