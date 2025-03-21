using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Dynamic;
using System.Linq;
using System.Web;
using MVC_ProductApplication.Models;

namespace MVC_ProductApplication.DataAccess
{
    public class CustomerDataAccess
    {
        public bool CreateCustomer(string CustomerName, string CustomerEmail)
        {
            bool success = true;
            String connString = ConfigurationManager.ConnectionStrings["connString"].ToString();
            SqlConnection sqlConnection = new SqlConnection(connString);
            try
            {
                sqlConnection.Open();
                String query = "CreateCustomer";
                SqlCommand cmd = new SqlCommand(query, sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.AddWithValue("@CustomerName", SqlDbType.NChar).Value = CustomerName;
                cmd.Parameters.AddWithValue("@CustomerEmail", SqlDbType.NChar).Value = CustomerEmail;
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        
                        if (reader["CustomerName"].ToString() == CustomerName && reader["CustomerEmail"].ToString() == CustomerEmail)
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
        public List<CUSTOMER> GetCustomerList()
        {
            List<CUSTOMER> customerList = new List<CUSTOMER>();
            String connString = ConfigurationManager.ConnectionStrings["connString"].ToString();
            SqlConnection sqlConnection = new SqlConnection(connString);
            try
            {
                sqlConnection.Open();
                String query = "GetCustomerList";
                SqlCommand cmd = new SqlCommand(query, sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        CUSTOMER tempCustomer = new CUSTOMER();

                        tempCustomer.CustomerID = Convert.ToInt32(reader["CustomerID"]);
                        tempCustomer.CustomerName = reader["CustomerName"].ToString();
                        tempCustomer.CustomerEmail = reader["CustomerEmail"].ToString();

                        customerList.Add(tempCustomer);
                    }
                }
                sqlConnection.Close();
            }
            catch (Exception e)
            {
                sqlConnection.Close();
                return customerList;
            }
            return customerList;
        }
        
    }
}