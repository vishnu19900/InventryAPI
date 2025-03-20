using InventryAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace InventryAPI.data
{
    public class IMSDb : DbContext//-<database
    {
        public IMSDb(DbContextOptions options) : base(options)
        { }

        public DbSet<SuppliersModel> Suppliers { get; set; } /*table->*/

        public DbSet<OrdersModel> Orders { get; set; }

        public DbSet<ProductModel> Products { get; set; }
        public DbSet<PurchasesModel> Purchases { get; set; }

        public DbSet<CategoryModel> Category { get; set; }

        public DbSet<OrdersViewModel> SpGetAllOrders { get; set; }

        public DbSet<purchaseViewModel> Sppurchasess { get; set; }


      }
    
}
