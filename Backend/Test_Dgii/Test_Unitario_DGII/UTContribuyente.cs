using NUnit.Framework.Internal;
using Test_Dgii.Interfaces;
using Test_Dgii.Models;

namespace Test_Unitario_DGII
{
    [TestClass]
    public class UTContribuyente 
    {
        private readonly IConexion conex;

        public UTContribuyente(IConexion _conex)
        {
            conex = _conex;
        }


        [TestMethod]
        public void ListaContribuyente()
        {
            Contribuyente contri = new Contribuyente(conex);

            var consulta = contri.getListaContribuyente();

            Assert.AreEqual(true, consulta);

        }

        
    }
}