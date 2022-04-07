
using Business.Abstract;
using Business.Concrete;
using DataAccess.Abstract;
using DataAccess.Concrete;
using Entities.Concrete;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

using System;
using WebApi;

namespace UnitTests
{
    public class TestStartup : Startup
    {
        public TestStartup(IConfiguration configuration) : base(configuration)
        {

        }

        public override void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers()
                .AddApplicationPart(typeof(Startup).Assembly);


            services.AddDbContext<OADbContextForTest>(options => options.UseInMemoryDatabase("Manager"));

          

            services.AddAutoMapper(typeof(Startup).Assembly);
            services.AddControllers().AddNewtonsoftJson();
            services.AddScoped<ICustomerService, CustomerManager>();
            services.AddScoped<IOrderService, OrderManager>();
            services.AddScoped<IOrderDal, EfOrderDal>();
        }
        

      
        public override void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            var scope = app.ApplicationServices.CreateScope();
            var context = scope.ServiceProvider.GetRequiredService<OADbContextForTest>();
            AddData(context);
           
            base.Configure(app, env);
        }

        private void AddData(OADbContextForTest context)
        {
            for (int i = 0; i < 20; i++)
            {
                Customer cus = new();
                cus.Name = i.ToString();
                

                context.Customerz.Add(cus);
            }


            for (int i = 0; i < 20; i++)
            {
                Order ord = new();
                ord.Status = i.ToString();

                context.Orderz.Add(ord);
            }
           
            context.SaveChanges();
        }
    }
}
