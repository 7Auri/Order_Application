using Entities.Concrete;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.Concrete
{
    public class OADbContextForTest : DbContext
    {
        public OADbContextForTest(DbContextOptions<OADbContextForTest> options)
        : base(options)
        { }
        public DbSet<Customer> Customerz { get; set; }
        public DbSet<Order> Orderz { get; set; }
    }
}
