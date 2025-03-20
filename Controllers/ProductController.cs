using InventryAPI.data;
using InventryAPI.Models;
using InventryAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace InventryAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        ProductService ProdService;

        public ProductController(ProductService _ProdService)
        {
            ProdService = _ProdService;
        }
        [HttpGet("GetById")]

        public ActionResult Get(int Id) 
        {
            ProductModel model = this.ProdService.ProductAllget().FirstOrDefault(x=>x.Id==Id);
            return Ok(model);
        }

        [HttpGet("ProductAllget")]
        public IActionResult ProductAllget()
        {
            List<ProductModel> prod = this.ProdService.ProductAllget();
            return Ok(prod);
        }

        [HttpPost("Add_product")]
        public IActionResult AddProduct([FromBody] ProductModel product)
        {
            ProductModel prod = this.ProdService.AddProduct(product);
            return Ok(prod);
        }

        [HttpDelete("product_delete")]
        public IActionResult Delete(int Id)
        {
            bool result = this.ProdService.Delete(Id);
            if (result == true)
            {
                return Ok("Record Deleted Successfully!");
            }
            else
            {
                return BadRequest("Record not found!");
            }
        }

        [HttpPut("update_product")]
        public IActionResult update([FromBody] ProductModel product)
        {
            ProductModel prodModel = this.ProdService.Update(product);
            return Ok(prodModel);
        }

        [HttpGet("Detail")]
        public IActionResult Detail(int Id)
        {
            return null;
        }

    }
}