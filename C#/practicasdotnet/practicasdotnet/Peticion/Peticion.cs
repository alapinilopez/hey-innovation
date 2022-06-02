using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace practicasdotnet
{
    public class Peticion
    {

        private int petiCODI;
        private string petiNom;
        private string petiDesc;
        private string petiFecha;
        private string petiEstado;


        public Peticion() { }

        public string getPeticion()
        {

            string space = " ";
            string concat = "";

            using (SqlConnection con = DbConnection.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT petiCODI, petiNom, petiDesc, petiFecha, petiEstado FROM Peticiones", con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    
                    concat += " <br />" + dr.GetInt32(0).ToString() + space + dr.GetString(1) + space + dr.GetString(2) + space + dr.GetDateTime(3).ToString() + space + dr.GetInt32(4).ToString();
                    Console.WriteLine(concat);
  
                }
            }
            return concat;
        }
    }
}
