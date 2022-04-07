using Core.DataAccess.EntityFramework;
using DataAccess.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;

namespace DataAccess.Concrete
{
    public class EfOrderDal : EfEntityRepositoryBase<Order, OADbContext>, IOrderDal
    {
        public List<Order> GetAllNew(Expression<Func<Order, bool>> filter = null)
        {
            using (OADbContext context = new())
            {
                var result = from order in context.Orders


                             select new Order
                             {
                                 Id = order.Id,
                                 CustomerId = order.CustomerId,
                                 Quantity = order.Quantity,
                                 Price = order.Price,
                                 Status = order.Status,
                                 Product = order.Product,
                                 CreatedAt = order.CreatedAt,
                                 UpdatedAt = order.UpdatedAt,
                                 Addresses = order.Addresses,
                                 Customer = order.Customer,
                             };
                return filter == null ? result.ToList() : result.Where(filter).ToList();
            }
        }

        public List<Order> GetByCustomerId(Expression<Func<Order, bool>> filter)
        {
            using (OADbContext context = new())
            {
                var result = from order in context.Orders
                             join c in context.Customers
                             on order.CustomerId equals c.Id

                             select new Order
                             {
                                 Id = order.Id,
                                 CustomerId = c.Id,
                                 Quantity = order.Quantity,
                                 Price = order.Price,
                                 Status = order.Status,
                                 Addresses = order.Addresses,
                                 Customer = order.Customer,
                                 Product = order.Product,
                                 CreatedAt = order.CreatedAt,
                                 UpdatedAt = order.UpdatedAt


                             };
                return filter == null ? result.ToList() : result.Where(filter).ToList();
            }
        }

        public List<Order> GetByIdArray(Expression<Func<Order, bool>> filter)
        {
            using (OADbContext context = new())
            {
                var result = from order in context.Orders

                             select new Order
                             {
                                 Id = order.Id,
                                 CustomerId = order.CustomerId,
                                 Quantity = order.Quantity,
                                 Price = order.Price,
                                 Status = order.Status,
                                 Addresses = order.Addresses,
                                 Customer = order.Customer,
                                 Product = order.Product,
                                 CreatedAt = order.CreatedAt,
                                 UpdatedAt = order.UpdatedAt


                             };
                return filter == null ? result.ToList() : result.Where(filter).ToList();
            }
        }
    }
}
