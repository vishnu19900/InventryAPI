using InventryAPI.data;
using InventryAPI.Models;
using Microsoft.AspNetCore.Mvc;

namespace InventryAPI.Services
{
    public class ProductService
    {
        IMSDb database;
        public ProductService(IMSDb _database)
        {
            database = _database;
        }

        public List<ProductModel> ProductAllget()
        {
            List<ProductModel> prod = database.Products.ToList();
            return prod;
        }

        public ProductModel AddProduct(ProductModel product)
        {
            database.Products.Add(product);
            database.SaveChanges();
            return product;
        }



        public bool Delete(int Id)
        {
            try
            {
                var Prod = database.Products.FirstOrDefault((ProductModel x) => x.Id == Id);
                if (Prod == null)
                {
                    return false;
                }
                else
                {

                    database.Products.Remove(Prod);
                    database.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        public ProductModel Update(ProductModel product)
        {
            ProductModel prod = database.Products.FirstOrDefault(x => x.Id == product.Id);
            prod.ProductName = product.ProductName;
            prod.ProductLabel = product.ProductLabel;
            database.SaveChanges();

            return prod;

        }

        public IActionResult Details(int Id)
        {
            //ProductModel _pro = database.Products.FirstOrDefault(x => x.Id == Id);
            //return Ok(_pro);

            return null;
        }
    }
}
