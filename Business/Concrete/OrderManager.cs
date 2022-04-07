using Business.Abstract;
using Business.Constants;
using Business.ValidationRules;
using Core.Aspects.Autofac.Validation;
using Core.Utilities.Result;
using DataAccess.Abstract;
using Entities.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Concrete
{
    public class OrderManager : IOrderService
    {
        IOrderDal _orderDal;

        public OrderManager(IOrderDal orderDal)
        {
            _orderDal = orderDal;
        }

        [ValidationAspect(typeof(OrderValidator))]
        public IResult Add(Order order)
        {
            _orderDal.Add(order);
            return new SuccessResult(Messages.SuccessAdd);
        }

        public IResult ChangeStatus(Guid orderId, string status)
        {
            var entity = _orderDal.Get(p => p.Id == orderId);

            entity.Status = status;

            _orderDal.Update(entity);

            return new SuccessResult(Messages.SuccessUpdate);
        }

        public IResult Delete(Order order)
        {
            _orderDal.Delete(order);
            return new SuccessResult(Messages.SuccessDelete);
        }

        public IDataResult<List<Order>> GetAllNew()
        {
            return new SuccessDataResult<List<Order>>(_orderDal.GetAllNew(), Messages.SuccessListed);
        }

        public IDataResult<List<Order>> GetByCustomerId(Guid customerId)
        {
            return new SuccessDataResult<List<Order>>(_orderDal.GetByCustomerId(x => x.CustomerId == customerId), Messages.SuccessListed);
        }

        public IDataResult<Order> GetById(Guid id)
        {
            return new SuccessDataResult<Order>(_orderDal.Get(x => x.Id == id), Messages.SuccessListed);
        }

        public IDataResult<List<Order>> GetByIdArray(Guid id)
        {
            return new SuccessDataResult<List<Order>>(_orderDal.GetByIdArray(x => x.Id == id), Messages.SuccessListed);
        }

        [ValidationAspect(typeof(OrderValidator))]
        public IResult Update(Order order)
        {
            _orderDal.Update(order);
            return new SuccessResult(Messages.SuccessUpdate);
        }
    }
}
