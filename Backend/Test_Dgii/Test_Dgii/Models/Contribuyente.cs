using Microsoft.Data.SqlClient;
using System.Data;
using Test_Dgii.Interfaces;

namespace Test_Dgii.Models
{
    public class Contribuyente : IContribuyente
    {
        private readonly IConexion conec;
        
        public Contribuyente( IConexion _conex )
        {
            conec = _conex;
        }

        public DataTable getListaContribuyente( )
        {
            try
            {
                using(var conn = conec.AbrirConexion())
                {
                    DataTable dt = new DataTable();
                    SqlCommand cmd = new SqlCommand("Lista_Contribuyentes", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    conec.CerrarConexion();
                    return  dt;
                }
            } catch(Exception ex)
            {
                var comm = conec.AbrirConexion();
                SqlCommand cmd = new SqlCommand("Error_Informacion_log", comm);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MensajeError", ex.Message);
                cmd.ExecuteNonQuery();
                conec.CerrarConexion();
                throw new Exception(ex.Message);
            }
        }




    }
}
