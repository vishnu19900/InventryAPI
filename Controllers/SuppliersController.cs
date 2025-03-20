using InventryAPI.data;
using InventryAPI.Models;
using InventryAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace InventryAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SuppliersController : ControllerBase
    {
        IMSDb database;

        public SuppliersController(IMSDb _databasee)
        {
            database = _databasee;
        }

        [HttpGet("GetAllSuppliers")]
        public IActionResult SupplierList()
        {
            var subList = database.Suppliers.ToList();
            return Ok(subList);
        }

        [HttpGet("GetSuppliers")]
        public IActionResult GetSuppliers(int Id)
        {
            var subList = database.Suppliers.FirstOrDefault(p => p.Id == Id);
            return Ok(subList);
        }

        [HttpPost("AddSupplier")]
        public IActionResult AddSuppliers([FromBody] SuppliersModel sup)
        {
            database.Suppliers.Add(sup);
            database.SaveChanges();
            return Ok(sup);
        }

        [HttpPut("UpdateSupplier")]
        public IActionResult UpdateSuppliers([FromBody] SuppliersModel sup)

        {
            database.Suppliers.Update(sup);
            database.SaveChanges();
            return Ok(sup);
        }

        [HttpDelete("DeleteSuppliers")]
        public IActionResult DeleteSuppliers(int Id)
        {
            try
            {
                SuppliersModel sup = database.Suppliers.FirstOrDefault(x => x.Id == Id);
                if(sup == null)
                {
                    return NotFound("suppliers not found");
                }
                else
                {
                    database.Suppliers.Remove(sup);
                    database.SaveChanges();
                    return Ok(sup);

                }
            }
            catch
            (Exception ex)
            {
                return BadRequest(ex.Message);
            }


        }

        [HttpGet("Details")]
        public IActionResult Detail(int Id, string name)
        {
            SuppliersModel _supp = database.Suppliers.FirstOrDefault(x => x.Id == Id);
            return Ok(_supp) ;
        }
    
    
    }
}
