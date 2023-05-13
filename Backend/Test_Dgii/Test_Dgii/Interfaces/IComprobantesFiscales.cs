using System.Data;

namespace Test_Dgii.Interfaces
{
    public interface IComprobantesFiscales
    {

        DataTable getListaComprobantesFiscales(string rncCedula);

    }
}
