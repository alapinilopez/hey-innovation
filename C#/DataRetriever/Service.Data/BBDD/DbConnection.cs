using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Service.Data.BBDD
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