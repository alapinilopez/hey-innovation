using System;
using System.Data.SqlClient;
using System.Web.UI;


namespace practicasdotnet
{
    public partial class Default : Page
    {
        public Default() { }

        public Usuario usuario1 = new Usuario();
        public Peticion peti1 = new Peticion();

        public void Page_Load(object sender, EventArgs e)
        {

            FillGV();
            Concatenate();
            
        }

        protected void FillGV()
        {

            using (SqlConnection con = DbConnection.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT UsuaCODI, UsuaNom, UsuaActivo FROM Usuarios", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    grvUsuarios.DataSource = dr;
                    grvUsuarios.DataBind();
                }
            }
        }

        public void FillLabel(object sender, EventArgs e) {
            if (int.TryParse(codi.Text, out int codiId))
                queryResult.Text = usuario1.UsuarioExists(codiId) ? "Existe" : "No existe";
            else
                queryResult.Text = "No me mandes algo vacío porque vacío ya está mi corazón";
        }

        public void Concatenate()
        {
            peticion.Text = peti1.getPeticion();
        }
    }
}