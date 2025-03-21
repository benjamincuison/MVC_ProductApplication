using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_ProductApplication.Models
{
    public class CUST_PROD_DTO
    {
        public CUST_PROD_DTO() { }
        public int CustomerID { get; set; }
        public string CustomerName { get; set; }
        public string CustomerEmail { get; set; }

        public int? ProductID { get; set; }
        public string ProductName { get; set; }
        public int? ProductQuantity { get; set; }
        
        
    }
}