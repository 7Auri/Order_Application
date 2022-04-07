using Core.DataAccess;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace DataAccess.Abstract
{
    public interface ICustomerDal : IEntityRepository<Customer>
    {
        bool Validate(Guid id);
        List<Customer> GetAllNew(Expression<Func<Customer, bool>> filter = null);
    }
}
