using System;
using System.Web.UI;


namespace practicasdotnet
{
    public partial class Default : Page {
        public Default() { }

        public void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                FillGV();
            }
        }

        protected void FillGV() {
            DbConnection.Connection();
            var data = DbConnection.Connection();
            if (dr.HasRows == true) {
                    
                grvUsuarios.DataSource = dr;
                grvUsuarios.DataBind();
            }
        }
    }
}
