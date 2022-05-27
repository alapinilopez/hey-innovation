using System;
using System.Data.SqlClient;
using System.Web.UI;


namespace practicasdotnet
{
    public partial class Default : Page
    {
        public Default() { }

        public void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGV();
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
    }
}