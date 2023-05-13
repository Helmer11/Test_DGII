using Microsoft.Data.SqlClient;
using System.Data;
using Test_Dgii.Interfaces;

namespace Test_Dgii.Models
{
    public class ComprobantesFiscales : IComprobantesFiscales
    {
        private readonly IConexion conec;

        public ComprobantesFiscales(IConexion _conex)
        {
            conec = _conex;
        }

        public DataTable getListaComprobantesFiscales(string rncCedula)
        {
            try
            {
                using (var comm = conec.AbrirConexion())
                {
                    DataTable dt = new DataTable();
                    SqlCommand cmd = new SqlCommand("Lista_Comprobantes_Fiscales", comm);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RncCedula", rncCedula);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    conec.CerrarConexion();
                    return dt;
                }
            } catch (Exception ex)
            {
                throw new Exception( ex.Message );
            }

           
        }




    }
}
