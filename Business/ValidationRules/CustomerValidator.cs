using Entities.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.ValidationRules
{
   public class CustomerValidator : AbstractValidator<Customer>
    {
        public CustomerValidator()
        {
            
            RuleFor(c=>c.Email).EmailAddress();
            RuleFor(c =>c.Email).NotEmpty().WithMessage("Email cannot be empty");
            RuleFor(c=>c.Name).NotEmpty().WithMessage("Name cannot be empty");
            RuleFor(c => c.Name).MinimumLength(2).MaximumLength(20).WithMessage("Must contain at least 2 characters and at most 20 characters");
            RuleFor(c => c.CreatedAt).NotEmpty().WithMessage("Creation time cannot be empty");
            RuleFor(c => c.UpdatedAt).NotEmpty().WithMessage("Update time cannot be empty");
            
        }
    }
}
