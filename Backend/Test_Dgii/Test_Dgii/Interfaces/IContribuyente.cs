using System.Data;

namespace Test_Dgii.Interfaces
{
    public interface IContribuyente
    {
        DataTable getListaContribuyente(string RncCedula);
    }
}
