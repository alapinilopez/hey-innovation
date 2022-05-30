using System;
using System.Data.SqlClient;
using System.Web.UI;


namespace practicasdotnet
{
    public partial class Default : Page
    {
        public Default() { }

        public Usuario usuario1 = new Usuario();

        public void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGV();
                FillLabel();
            }
        }

        protected void FillGV()
        {

            using (SqlConnection con = DbConnection.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT UsuaCODI, UsuaNom, UsuaActivo FROM Usuarios", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows == true)
                {
                    grvUsuarios.DataSource = dr;
                    grvUsuarios.DataBind();
                }
            }
        }

        public void FillLabel(int usuaCODI) {
            usuario1.GetUsuario(usuaCODI);

            queryResult.Text = usuario1.GetUsuario(usuaCODI) > 0 ? "Existe" : "No existe";
        }
    }
}