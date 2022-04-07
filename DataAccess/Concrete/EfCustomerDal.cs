using Core.DataAccess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Concrete
{
    public class EfCustomerDal : EfEntityRepositoryBase<Customer, OADbContext>, ICustomerDal
    {
        public List<Customer> GetAllNew(Expression<Func<Customer, bool>> filter = null)
        {
            using (OADbContext context = new())
            {
                var result = from customer in context.Customers

                             select new Customer
                             {
                                 Id = customer.Id,
                                 Name=customer.Name,
                                 Email=customer.Email,
                                 CreatedAt=customer.CreatedAt,
                                 UpdatedAt=customer.UpdatedAt,
                                 Addresses=customer.Addresses

                             };
                return filter == null ? result.ToList() : result.Where(filter).ToList();
            }
        }

        public bool Validate(Guid id)
        {
            using (OADbContext context = new())
            {
                var customer = context.Set<Customer>().FirstOrDefault(x => x.Id == id);
                if (customer == null)
                {
                    return false;
                }
                return true;
            }
        }


    }
}
