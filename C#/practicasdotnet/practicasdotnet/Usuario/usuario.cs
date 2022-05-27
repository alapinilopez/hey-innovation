using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace practicasdotnet
{

    public class Usuario
    {

        public int usuaCODI;
        public string usuaNom;
        public int usuaActivo;

        public Usuario() { } //Constructor vacio por temas de seguridad

        public Usuario(int usuaCODI, string usuaNom, int usuaActivo)
        {
            this.usuaCODI = usuaCODI;
            this.usuaNom = usuaNom;
            this.usuaActivo = usuaActivo;
        }

        public int getUsuario(int usuacodi)//poner int usuaCODI
        {
            Usuario usuario1 = new Usuario();
            using (SqlConnection con = DbConnection.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT UsuaCODI FROM Usuarios where usuacodi = :pusuacodi", con);

                SqlParameter parameter = new SqlParameter();
                parameter.ParameterName = "pusuacodi";
                parameter.SqlDbType = SqlDbType.Int;
                parameter.Value = usuacodi;
                cmd.Parameters.Add(parameter);

                SqlDataReader dr = cmd.ExecuteReader();
                
                if (dr.HasRows == true)
                {
                    usuario1.usuaCODI = dr.GetInt32(0);
                } 
            }
            return usuario1.usuaCODI;
        }
    }
}