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

        public Peticion getPeticion () { 

            using (SqlConnection con = DbConnection.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("SELECT petiCODI, petiNom, petiDesc, petiFecha, petiEstado FROM Peticion", con);
                SqlDataReader dr = cmd.ExecuteReader();
            }
            return null;
        }
    }
}
