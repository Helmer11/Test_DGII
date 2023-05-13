using Microsoft.Data.SqlClient;

namespace Test_Dgii.Interfaces
{
    public interface IConexion
    {

        SqlConnection AbrirConexion();

        SqlConnection CerrarConexion();
    }
}
