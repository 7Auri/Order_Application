using Core.Utilities.Result;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Abstract
{
   public interface IOrderService
    {
        IDataResult<List<Order>> GetByCustomerId(Guid customerId);
        IDataResult<List<Order>> GetAllNew();
        IDataResult<Order> GetById(Guid id);
        IDataResult<List<Order>> GetByIdArray(Guid id);
        IResult Add(Order order);
        IResult Update(Order order);
        IResult Delete(Order order);
        IResult ChangeStatus(Guid orderId, string status);

    }
}
