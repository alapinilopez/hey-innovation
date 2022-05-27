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

        public static SqlConnection GetConnection()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            return new SqlConnection(cs);
        }
    }
}
        

