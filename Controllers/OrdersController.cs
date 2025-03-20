using InventryAPI.data;
using InventryAPI.Models;
using InventryAPI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InventryAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        IMSDb database;        
        public OrdersController(IMSDb _database)
        {
            database = _database;
        }

        [HttpGet("GetAllOrders")]
        public async Task<IActionResult> OrdersList()
        {
            //var Ord = database.Orders.ToList();
            var Ord = await database.SpGetAllOrders.FromSqlRaw("EXEC Sp_GetAllOrders").ToListAsync();
            //var Ord = await database.SpGetAllOrders.FromSqlRaw("select Id,OrderDate from orders").ToListAsync();
            return Ok(Ord);
        }
        [HttpPost("AddOrders")]
        public IActionResult AddOrders([FromBody] OrdersModel sup)
        {
            database.Orders.Add(sup);
            database.SaveChanges();
            return Ok(sup);
        }
        [HttpDelete("dataDelete")]
        public IActionResult DeleteOrders(int Id)
        {
            try
            {
                OrdersModel _ordersModel = database.Orders.FirstOrDefault(x => x.Id == Id);
                if (_ordersModel == null)
                {
                    return BadRequest("process is null");
                }

                else
                {
                    database.Orders.Remove(_ordersModel);
                    database.SaveChanges();
                    return Ok(_ordersModel);
                }
            }
            catch (Exception ex)
            { return BadRequest(ex.Message); }



        }
        [HttpPut("OrderUpdate")]
        public IActionResult update([FromBody] OrdersModel oder)
        {
            var Ord = database.Orders.FirstOrDefault(o => o.Id == oder.Id);
            Ord.First = oder.First;
            Ord.Middle = oder.Middle;
            Ord.Last = oder.Last;

            database.SaveChanges();
            return Ok(oder);
        }

        [HttpGet("Details")]
        public IActionResult Detail(int Id)
        {
            OrdersModel _ord = database.Orders.FirstOrDefault(x => x.Id == Id);
            return Ok(_ord);

        }
    }
}