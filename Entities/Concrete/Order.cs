using Core.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Concrete
{
   public class Order : IEntity
    {
        [Key]
        public Guid Id { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public string Status { get; set; } 
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        [ForeignKey("Customers")]
        public Guid CustomerId { get; set; }
        public Customer Customer { get; set; }
        public ICollection<Address> Addresses { get; set; }
        public ICollection<Product> Product { get; set; }
    }
}
