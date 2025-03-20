using InventryAPI.data;
using InventryAPI.Models;
using Microsoft.AspNetCore.Mvc;

namespace InventryAPI.Services
{
    public class SuppliersService
    {
        IMSDb database;
        public SuppliersService(IMSDb _database)
        {
            database = _database;
        }

        public List<SuppliersModel> GetAll()
        {
            List<SuppliersModel> model = database.Suppliers.ToList();
            return model;
        }
        public SuppliersModel AddSuppliers(SuppliersModel model)
        {
            database.Suppliers.Add(model);
            database.SaveChanges();
            return model;
        }
        public bool delete(int Id)
        {
            try
            {
                SuppliersModel supp = database.Suppliers.FirstOrDefault((SuppliersModel x) => x.Id == Id);
                if (supp == null)
                {
                    return false;
                }
                else
                {
                    database.Suppliers.Remove(supp);
                    database.SaveChanges();
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public SuppliersModel detail(int Id)
        {
            SuppliersModel model = database.Suppliers.FirstOrDefault(x => x.Id == Id);
            return model;
        }
        public SuppliersModel update(SuppliersModel model) 
        {
        SuppliersModel model1 = database.Suppliers.FirstOrDefault(x=>x.Id == model.Id);
          model1.Supplier_Name = model.Supplier_Name;
            database.SaveChanges();
            return model;
        }
    }
}
