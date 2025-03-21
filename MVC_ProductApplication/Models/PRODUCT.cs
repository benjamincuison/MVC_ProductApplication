using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_ProductApplication.Models
{
    public class PRODUCT
    {
        public PRODUCT() { }
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public int ProductQuantity { get; set; }
        public int CustomerID { get; set; }

    }
}