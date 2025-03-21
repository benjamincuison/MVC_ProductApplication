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
    public class CustProdDTODataAccess
    {
        public List<Models.CUST_PROD_DTO> GetCustProdDTOs ()
        {
            List<CUST_PROD_DTO> dtoList = new List<CUST_PROD_DTO>();
            String connString = ConfigurationManager.ConnectionStrings["connString"].ToString();
            SqlConnection sqlConnection = new SqlConnection(connString);
            try
            {
                sqlConnection.Open();
                String query = "GetCustProdList";
                SqlCommand cmd = new SqlCommand(query, sqlConnection);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        CUST_PROD_DTO tempDTO = new CUST_PROD_DTO();

                        int colIndex = reader.GetOrdinal("ProductID");                       
                        if (reader.IsDBNull(colIndex))
                        {
                            tempDTO.ProductID = null;
                        }
                        else
                        {
                            tempDTO.ProductID = Convert.ToInt32(reader["ProductID"]);
                        }

                        colIndex = reader.GetOrdinal("ProductName");
                        if (reader.IsDBNull(colIndex))
                        {
                            tempDTO.ProductName = null;
                        }
                        else
                        {
                            tempDTO.ProductName = reader["ProductName"].ToString();
                        }
                        

                        colIndex = reader.GetOrdinal("ProductQuantity");
                        if (reader.IsDBNull(colIndex))
                        {
                            tempDTO.ProductQuantity = null;
                        }
                        else
                        {
                            tempDTO.ProductQuantity = Convert.ToInt32(reader["ProductQuantity"]);
                        }
                        
                        tempDTO.CustomerID = Convert.ToInt32(reader["CustomerID"]);
                        tempDTO.CustomerName = reader["CustomerName"].ToString();
                        tempDTO.CustomerEmail = reader["CustomerEmail"].ToString();


                        dtoList.Add(tempDTO);
                    }
                }
                sqlConnection.Close();

            }
            catch (Exception e)
            {
                sqlConnection.Close();
                return new List<CUST_PROD_DTO>();
            }

            return dtoList;
        }
    }
}