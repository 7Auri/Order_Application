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
    public class CustomerManager : ICustomerService
    {
        ICustomerDal _customerDal;
        public CustomerManager(ICustomerDal customerDal)
        {
            _customerDal = customerDal;
        }
        [ValidationAspect(typeof(CustomerValidator))]
        public IResult Add(Customer customer)
        {
            _customerDal.Add(customer);
            return new SuccessResult(Messages.SuccessAdd);
        }

        public IResult Delete(Customer customer)
        {
            _customerDal.Delete(customer);
            return new SuccessResult(Messages.SuccessDelete);
        }

        public IDataResult<List<Customer>> GetAllNew()
        {
            return new SuccessDataResult<List<Customer>>(_customerDal.GetAllNew(), Messages.SuccessListed);
        }

        public IDataResult<Customer> GetById(Guid id)
        {
            return new SuccessDataResult<Customer>(_customerDal.Get(x => x.Id == id), Messages.SuccessListed);
        }

        [ValidationAspect(typeof(CustomerValidator))]
        public IResult Update(Customer customer)
        {
            _customerDal.Update(customer);
            return new SuccessResult(Messages.SuccessUpdate);
        }

        public IResult Validate(Guid id)
        {
            if (_customerDal.Validate(id))
            {
                return new SuccessResult(Messages.SuccessValidate);
            }
            return new ErrorResult(Messages.ErrorValidate);
        }
    }
}
