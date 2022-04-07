using Core.Utilities.Result;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
   public interface ICustomerService
    {
        IDataResult<List<Customer>> GetAllNew();
        IDataResult<Customer> GetById(Guid id);
        IResult Add(Customer customer);
        IResult Update(Customer customer);
        IResult Delete(Customer customer);
        IResult Validate(Guid id);
    }
}
