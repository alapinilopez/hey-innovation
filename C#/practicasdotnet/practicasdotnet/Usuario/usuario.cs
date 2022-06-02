using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;


namespace practicasdotnet
{

    public class Usuario
    {

        private int usuaCODI;
        private string usuaNom;
        private int usuaActivo;

        public Usuario() {}

        //public Usuario() { } //Constructor vacio por temas de seguridad

        public Usuario(int usuaCODI, string usuaNom, int usuaActivo)
        {
            this.usuaCODI = usuaCODI;
            this.usuaNom = usuaNom;
            this.usuaActivo = usuaActivo;
        }

        public bool UsuarioExists(int usuaCODI)
        {
            using (SqlConnection con = DbConnection.GetConnection())
            {

                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "SELECT COUNT(1) FROM Usuarios where usuaCODI = " + usuaCODI;
                return (int)cmd.ExecuteScalar() == 1;
                
            }

        }
    }
}