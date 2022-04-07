using Business.Abstract;
using Business.Constants;
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
    public class AddressManager : IAddressService
    {
        IAddressDal _addressDal;
        public AddressManager(IAddressDal addressDal)
        {
            _addressDal = addressDal;
        }
        public IResult Add(Address address)
        {
            _addressDal.Add(address);
            return new SuccessResult(Messages.SuccessAdd);
        }

        public IResult Delete(Address address)
        {
            _addressDal.Delete(address);
            return new SuccessResult(Messages.SuccessDelete);
        }

        public IDataResult<List<Address>> GetAll()
        {
            return new SuccessDataResult<List<Address>>(_addressDal.GetAll(), Messages.SuccessListed);
        }

        public IResult Update(Address address)
        {
            _addressDal.Update(address);
            return new SuccessResult(Messages.SuccessUpdate);
        }
    }
}
