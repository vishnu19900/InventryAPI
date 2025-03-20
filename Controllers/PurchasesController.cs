using InventryAPI.data;
using InventryAPI.Models;
using InventryAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InventryAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PurchasesController : ControllerBase
    {
        IMSDb database;

        

        public PurchasesController(IMSDb _database)

        {
            database = _database;
            
        }
        [HttpGet("GetAllData")]
        public IActionResult get()
        {
            // List<PurchasesModel> Purchace = database.Purchases.ToList();
            var Purchace = database.Sppurchasess.FromSqlRaw("EXEC Sp_purchasess").ToList();
            //var Purchace = database.Sppurchasess.FromSqlRaw("select  Id,ProductName,ProductId,Purchase_date,Number_Received from Purchases").ToList();
            return Ok(Purchace);
        }

        [HttpPost("AddPurchases")]
        public IActionResult AddPurchases([FromBody] PurchasesModel purchase)
        {
            database.Purchases.Add(purchase);
            database.SaveChanges();
            return Ok(purchase);
        }

        [HttpDelete("deletePurchase")]
        public IActionResult Delete(int Id)
        {
            try
            {
                PurchasesModel _Purchas = database.Purchases.FirstOrDefault(x => x.Id == Id);
                if (_Purchas == null)
                {
                    return NotFound("Product Not Found!");
                }
                else
                {
                    database.Purchases.Remove(_Purchas);
                    database.SaveChanges();
                    return Ok(_Purchas);
                }
            }
            catch
            (Exception ex)
            { return BadRequest(ex.Message); }

        }
        [HttpPut("Updatedata")]
        public IActionResult Update([FromBody] PurchasesModel Pur)
        {
            var Purchase = database.Purchases.FirstOrDefault(x => x.Id == Pur.Id);
            Purchase.SupplierId = Pur.SupplierId;
            Purchase.ProductId = Pur.ProductId;
            Purchase.Number_Received = Pur.Number_Received;
            Purchase.Purchase_date = Pur.Purchase_date;
            database.SaveChanges();
            return Ok("Purchase");

        }
        [HttpGet("Details")]
        public IActionResult Detail(int Id)
        {
            PurchasesModel _supp = database.Purchases.FirstOrDefault(x => x.Id == Id);
            return Ok(_supp);
        }
    }
}

