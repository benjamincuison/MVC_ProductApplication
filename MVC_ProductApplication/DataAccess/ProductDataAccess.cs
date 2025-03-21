using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using MVC_ProductApplication.Models;

namespace MVC_ProductApplication.DataAccess
{
    public class ProductDataAccess
    {
        public bool CreateNewProduct (string ProductName, int ProductQuantity, int CustomerID)
        {

            bool success = true;
            String connString = ConfigurationManager.ConnectionStrings["connString"].ToString();
            SqlConnection sqlConnection = new SqlConnection(connString);
            try
            {
                sqlConnection.Open();
                String query = "CreateProduct";
                SqlCommand cmd = new SqlCommand(query, sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@ProductName", SqlDbType.VarChar).Value = ProductName;
                cmd.Parameters.AddWithValue("@ProductQuantity", SqlDbType.Int).Value = ProductQuantity;
                cmd.Parameters.AddWithValue("@CustomerID", SqlDbType.Int).Value = CustomerID;
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["ProductName"].ToString() == ProductName && Convert.ToInt32(reader["ProductQuantity"]) == ProductQuantity)
                        {
                            success = true;
                            break;
                        }
                        else
                        {
                            success = false;
                        }


                    }
                }
                sqlConnection.Close();
            }
            catch (Exception e)
            {
                sqlConnection.Close();
                return false;
            }
            return success;
        }
        public List<Models.PRODUCT> GetProductList()
        {
            List<PRODUCT> products = new List<PRODUCT>();
            String connString = ConfigurationManager.ConnectionStrings["connString"].ToString();
            SqlConnection sqlConnection = new SqlConnection(connString);
            try
            {

                sqlConnection.Open();
                String query = "GetProductList";
                SqlCommand cmd = new SqlCommand(query, sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        PRODUCT tempProduct = new PRODUCT();

                        tempProduct.ProductID = Convert.ToInt32(reader["ProductID"]);
                        tempProduct.ProductName = reader["ProductName"].ToString();
                        tempProduct.ProductQuantity = Convert.ToInt32(reader["ProductQuantity"]);
                        tempProduct.CustomerID = Convert.ToInt32(reader["CustomerID"]);

                        products.Add(tempProduct);
                    }
                }
                sqlConnection.Close();

            }
            catch (Exception e)
            {
                sqlConnection.Close();
            }

            return products;
        }
        public bool DeleteProductByID(int ProductID)
        {
            String connString = ConfigurationManager.ConnectionStrings["connString"].ToString();
            SqlConnection sqlConnection = new SqlConnection(connString);
            try
            {

                sqlConnection.Open();
                String query = "DeleteProduct";
                SqlCommand cmd = new SqlCommand(query, sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@ProductID", SqlDbType.NChar).Value = ProductID;
                cmd.ExecuteNonQuery();
                sqlConnection.Close();

            }
            catch (Exception e)
            {
                sqlConnection.Close();
                return false;
            }
            return true;
        }
        public bool UpdateProduct (int OldProductID, string ProductName, int ProductQuantity, int CustomerID)
        {
            bool success = true;
            String connString = ConfigurationManager.ConnectionStrings["connString"].ToString();
            SqlConnection sqlConnection = new SqlConnection(connString);
            try
            {
                sqlConnection.Open();
                String query = "UpdateProduct";
                SqlCommand cmd = new SqlCommand(query, sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;

                cmd.Parameters.AddWithValue("@ProductID", SqlDbType.Int).Value = OldProductID;
                cmd.Parameters.AddWithValue("@ProductName", SqlDbType.VarChar).Value = ProductName;
                cmd.Parameters.AddWithValue("@ProductQuantity", SqlDbType.Int).Value = ProductQuantity;
                cmd.Parameters.AddWithValue("@CustomerID", SqlDbType.Int).Value = CustomerID;
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (Convert.ToInt32(reader["ProductID"]) == OldProductID && Convert.ToInt32(reader["ProductQuantity"]) == ProductQuantity &&
                            reader["ProductName"].ToString() == ProductName && Convert.ToInt32(reader["CustomerID"]) == CustomerID)
                        {
                            success = true;
                            break;
                        }
                        else
                        {
                            success = false;
                        }


                    }
                }
                sqlConnection.Close();
            }
            catch (Exception e)
            {
                sqlConnection.Close();
                return false;
            }
            return success;
            return true;
        }
    }
}