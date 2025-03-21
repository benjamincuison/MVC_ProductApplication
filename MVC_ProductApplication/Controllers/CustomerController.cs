using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVC_ProductApplication.DataAccess;

namespace MVC_ProductApplication.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        public ActionResult CreateCustomer()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateCustomer(string CustomerName, string CustomerEmail)
        {
            CustomerDataAccess data = new CustomerDataAccess();
            bool success = data.CreateCustomer(CustomerName, CustomerEmail);
            if (success) { ViewBag.Message = "Customer Created"; }
            else { ViewBag.Message = "Failed to Create Customer";  }
            return View();
        }

    }
}