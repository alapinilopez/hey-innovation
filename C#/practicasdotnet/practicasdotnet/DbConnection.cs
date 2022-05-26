using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace practicasdotnet
{
    public static class DbConnection
    {

        public static void Connection()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs)) {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT UsuaCODI, UsuaNom, UsuaActivo FROM Usuarios", con);
                SqlDataReader dr = cmd.ExecuteReader();
            }
        }
    }
}
        

