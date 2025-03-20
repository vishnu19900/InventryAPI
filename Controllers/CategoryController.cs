using InventryAPI.data;
using InventryAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace InventryAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]    
    public class CategoryController : ControllerBase
    {
        IMSDb database;

        public CategoryController(IMSDb _database)
        {
            database = _database;
        }

        [HttpGet("GetAll")]
        public IActionResult GetAll()
        {
            List<CategoryModel> cat = database.Category.ToList();

            return Ok(cat);
        }

        [HttpPost("AddCategory")]
        public IActionResult AddCategory([FromBody] CategoryModel cat)
        {
            database.Category.Add(cat);
            database.SaveChanges();
            return Ok(cat);
        }

        [HttpGet("Details")]
        public IActionResult Detail(int Id)
        {
            CategoryModel _cat = database.Category.FirstOrDefault(x => x.Id == Id);
            return Ok(_cat);
        }
    }
}
