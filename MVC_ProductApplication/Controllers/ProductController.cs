using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVC_ProductApplication.DataAccess;
using MVC_ProductApplication.Models;

namespace MVC_ProductApplication.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        [HttpGet]
        public ActionResult CreateProduct()
        {
            List<Models.CUSTOMER> customerList = new List<CUSTOMER>();
            CustomerDataAccess customerData = new CustomerDataAccess();
            //customerList.Add(new CUSTOMER{CustomerName = "Billy Bob", CustomerID = 3});
            customerList = customerData.GetCustomerList();
            //ViewBag.Message = "Customers: " + customerList.Count;
            return View(customerList);
        }
        [HttpPost]
        public ActionResult CreateProduct(string ProductName, int ProductQuantity, int CustomerID)
        {
            List<Models.CUSTOMER> customerList = new List<CUSTOMER>();
            bool success = true;
            ProductDataAccess data = new ProductDataAccess();
            success = data.CreateNewProduct(ProductName,ProductQuantity,CustomerID);
            if (success)
            {
                ViewBag.Message = "Product Created";
            }
            else
            {
                ViewBag.Message = "Create Failed";
            }
            return View(customerList);
        }
        [HttpGet]
        public ActionResult EditProduct()
        {
            List<Models.CUST_PROD_DTO> custProdList = new List<CUST_PROD_DTO>();
            CustProdDTODataAccess dtoData = new CustProdDTODataAccess();
            custProdList = dtoData.GetCustProdDTOs();
            return View(custProdList);
        }
        [HttpPost]
        public ActionResult EditProduct(int ProductID, string ProductName, int ProductQuantity, int CustomerID)
        {
            List<Models.CUST_PROD_DTO> custProdList = new List<CUST_PROD_DTO>();
            CustProdDTODataAccess dtoData = new CustProdDTODataAccess();
            ProductDataAccess productData = new ProductDataAccess();
            bool success = productData.UpdateProduct(ProductID,ProductName,ProductQuantity,CustomerID);
            if (success) { ViewBag.Message = "Product Edit Success"; }
            else { ViewBag.Message = "Edit Failed";  }
            custProdList = dtoData.GetCustProdDTOs();

            return View(custProdList);

        }
        public ActionResult DeleteProduct()
        {
            List<Models.PRODUCT> productList = new List<PRODUCT>();
            ProductDataAccess data = new ProductDataAccess();
            productList = data.GetProductList();
            
            //ViewBag.Message = "Amount: " + productList.Count;

            return View(productList);
        }
        [HttpPost]
        public ActionResult DeleteProduct(int ProductID)
        {
            List<Models.PRODUCT> productList = new List<PRODUCT>();
            ProductDataAccess data = new ProductDataAccess();
            productList = data.GetProductList();
            bool successful = data.DeleteProductByID(ProductID);
            if (successful) {
                ViewBag.Message = "Successful deletion";
            }
            else
            {
                ViewBag.Message = "Deletion failed";
            }

            return View(productList);
        }
        public ActionResult ProductList()
        {
            List<CUST_PROD_DTO> dtoList = new List<CUST_PROD_DTO>();
            CustProdDTODataAccess data = new CustProdDTODataAccess();
            dtoList = data.GetCustProdDTOs();
            return View(dtoList);
        }
    }
}