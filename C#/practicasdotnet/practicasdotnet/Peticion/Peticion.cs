using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace practicasdotnet
{
    public class Peticion {

        private int petiCODI;
        private string petiNom;
        private string petiDesc;
        private string petiFecha;


        public Peticion() { }

        public string getPeticion () {

            string concat = "";

            using (SqlConnection con = DbConnection.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT petiCODI, petiNom, petiDesc, petiFecha, petiEstado FROM Peticion", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows == true)
                {
                    foreach (string element in dr)
                    {
                        concat += "<br />" + element;
                    }
                }
            }
            return concat;
        }
    }
}
