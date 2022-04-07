using Core.DataAccess;
using DataAccess.Concrete;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Abstract
{
    public interface IOrderDal : IEntityRepository<Order>
    {
        
        List<Order> GetByCustomerId(Expression<Func<Order, bool>> filter);
        List<Order> GetAllNew(Expression<Func<Order, bool>> filter = null);
        List<Order> GetByIdArray(Expression<Func<Order, bool>> filter);
    }
}
