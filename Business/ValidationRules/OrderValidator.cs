using Entities.Concrete;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.ValidationRules
{
   public class OrderValidator : AbstractValidator<Order>
    {
        public OrderValidator()
        {
            RuleFor(o=>o.Quantity).NotEmpty();
            RuleFor(o=>o.Price).NotNull().WithMessage("Price cannot be empty");
            RuleFor(o=>o.Price).GreaterThan(0).WithMessage("You cannot enter a value less than 0");
            RuleFor(o => o.CreatedAt).NotEmpty().WithMessage("Creation time cannot be empty");
            RuleFor(o => o.UpdatedAt).NotEmpty().WithMessage("Update time cannot be empty");
        }
    }
}
