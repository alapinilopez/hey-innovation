using Service.Data.Abstract;
using Service.Data.BBDD;
using Service.Data.DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Linq;
using Service.Api.Model;
using Service.Data.Model;

namespace Service.Data.Repositories
{
    public class ServiceRepository : IServiceRepository
    {
        public Servicio Get(string Name)
        {
            throw new NotImplementedException();
        }

        public Servicio Get(decimal Price)
        {
            throw new NotImplementedException();
        }


        public IEnumerable<Servicio> GetAll()
        {
            throw new NotImplementedException();
        }

        public static List<Product> GetProducts() //Query that orders by price DESCENDENT
        {

            var products = new List<Product>();

            using (SqlConnection con = DbConnection.GetConnection())
            {
                con.Open();
                StringBuilder sb = new StringBuilder("");
                sb.Append("SELECT servnom, servprecio ");
                sb.Append("FROM servicios.dbo.ServiciosComplementarios ");
                sb.Append("WHERE servactivo = 1");
                sb.Append("ORDER BY servprecio ASC");
                SqlCommand cmd = new SqlCommand(sb.ToString(), con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    products.Add(new Product
                    {
                        Name = dr.GetValue(0).ToString(),
                        Price = Convert.ToDecimal(dr.GetValue(1))
                    });
                }
            }

            var names = products.OrderBy(x => x.Name).ThenBy(y => y.Price).ToList(); //LinkU que itera por nombre y precio de cada item de la tabla.

            return products;
        }

        public static List<Product> PriceDesc() //Query that orders by price DESCENDENT
        {
            var products = new List<Product>();

            using (SqlConnection con = DbConnection.GetConnection())
            {
                con.Open();
                StringBuilder sb = new StringBuilder("");
                sb.Append("SELECT servnom, servprecio ");
                sb.Append("FROM servicios.dbo.ServiciosComplementarios sc ");
                sb.Append("ORDER BY sc.servprecio DESC");
                SqlCommand cmd = new SqlCommand(sb.ToString(), con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    products.Add(new Product
                    {
                        Name = dr.GetValue(0).ToString(),
                        Price = Convert.ToDecimal(dr.GetValue(1))
                    });
                }
            }

            var names = products.OrderBy(x => x.Name).ThenBy(y => y.Price).ToList(); //LinkU que itera por nombre y precio de cada item de la tabla.

            return products;
        }

        public static List<Product> NameAsc() //query that orders by item name ASCENDENT
        {
            var products = new List<Product>();

            using (SqlConnection con = DbConnection.GetConnection())
            {
                con.Open();
                StringBuilder sb = new StringBuilder("");
                sb.Append("SELECT servnom, servprecio ");
                sb.Append("FROM servicios.dbo.ServiciosComplementarios sc ");
                sb.Append("ORDER BY sc.servnom ASC");
                SqlCommand cmd = new SqlCommand(sb.ToString(), con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    products.Add(new Product
                    {
                        Name = dr.GetValue(0).ToString(),
                        Price = Convert.ToDecimal(dr.GetValue(1))
                    });
                }
            }

            var names = products.OrderBy(x => x.Name).ThenBy(y => y.Price).ToList(); //LinkU que itera por nombre y precio de cada item de la tabla.

            return products;
        }

        public static List<Product> NameDesc() //query that orders by item name DESCENDENT
        {
            var products = new List<Product>();

            using (SqlConnection con = DbConnection.GetConnection())
            {
                con.Open();
                StringBuilder sb = new StringBuilder("");
                sb.Append("SELECT servnom, servprecio ");
                sb.Append("FROM servicios.dbo.ServiciosComplementarios sc ");
                sb.Append("ORDER BY sc.servnom DESC");
                SqlCommand cmd = new SqlCommand(sb.ToString(), con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    products.Add(new Product
                    {
                        Name = dr.GetValue(0).ToString(),
                        Price = Convert.ToDecimal(dr.GetValue(1))
                    });
                }
            }

            var names = products.OrderBy(x => x.Name).ThenBy(y => y.Price).ToList(); //LinkU que itera por nombre y precio de cada item de la tabla.

            return products;
        }

        public static List<Category> CategoryNameAsc()
        {
            var categories = new List<Category>();

            using (SqlConnection con = DbConnection.GetConnection())
            {
                con.Open();
                StringBuilder sb = new StringBuilder("");
                sb.Append("SELECT scc.secanom ");
                sb.Append("FROM servicios.dbo.ServiciosComplementariosCategoria scc");
                sb.Append("ORDER BY scc.secanom ASC");
                SqlCommand cmd = new SqlCommand(sb.ToString(), con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    categories.Add(new Category
                    {
                        Name = dr.GetValue(0).ToString()
                    });
                }
            }

            var names = categories.OrderBy(x => x.Name).ToList();

            return categories;
        }
    }
}

