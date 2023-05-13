using Microsoft.Data.SqlClient;
using System.Data;
using Microsoft.Extensions.Configuration;
using Test_Dgii.Interfaces;

namespace Test_Dgii.Models
{
    public class Conexion : IConexion
    {
        private readonly string cadenaConexion;
        private SqlConnection conec = null;

        public Conexion(IConfiguration _confi)
        {
            cadenaConexion = _confi.GetConnectionString("DGIIConexion");
        }

        public SqlConnection AbrirConexion()
        {
            conec = new SqlConnection(cadenaConexion);
            if (conec.State == ConnectionState.Closed)
                conec.Open();
            return conec;
        }


        public SqlConnection CerrarConexion()
        {
            if (conec.State == ConnectionState.Open)
                conec.Close();
            return conec;
        }
    }
}

