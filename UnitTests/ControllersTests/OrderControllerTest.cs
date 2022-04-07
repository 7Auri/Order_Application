using Business.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc.Testing;
using Moq;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Xunit;


namespace UnitTests.ControllersTest
{
    public class OrderControllerTest : IClassFixture<ManagerApplicationFactory>
    {
        private readonly WebApplicationFactory<TestStartup> _factory;

        public OrderControllerTest(ManagerApplicationFactory factory)
        {
            _factory = factory;
        }
        [Fact]
        public void AddNewOrder_IActionResult()
        {
            //Arrange
            var orderService = new Mock<IOrderService>();

            //Act
            Order order = new Order
            {
                Addresses = { },
                CreatedAt = new DateTime(20, 11, 10),
                UpdatedAt = new DateTime(21, 11, 10),
                Customer = { },
                CustomerId= new Guid("83BC647C-AD54-4BCC-A860-E5A2664B019D"),
                Price=23.5,
                Product = {},
                Quantity=777,
                Status="test",
                Id = new Guid("62FA647C-AD54-4BCC-A860-E5A2664B019D")
            };
            var client = _factory.CreateClient();
            var content = new StringContent(System.Text.Json.JsonSerializer.Serialize(order), Encoding.UTF8, "application/json");

            //Assert
            var response = client.PostAsync("http://localhost:5000/api/order/add", content);
            Assert.NotNull(order);

        }
       
    }
}
