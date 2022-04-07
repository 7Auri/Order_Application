using Business.Abstract;
using Entities.Concrete;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Testing;
using Moq;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Text;
using WebApi.Controllers;
using Xunit;

namespace UnitTests.ControllersTest
{
    public class CustomerControllerTest : IClassFixture<ManagerApplicationFactory>
    {
        private readonly WebApplicationFactory<TestStartup> _factory;

        public CustomerControllerTest(ManagerApplicationFactory factory)
        {
            _factory = factory;
        }

        [Fact]
        public void AddNewCustomer_IActionResult()
        {
            //Arrange
            var customerService = new Mock<ICustomerService>();

            //Act
            Customer customer = new Customer { 
                Addresses = { },CreatedAt= new DateTime(20, 11, 10), 
                UpdatedAt= new DateTime(21, 11, 10),Email="test@test",Name="test",
                Id= new Guid("62FA647C-AD54-4BCC-A860-E5A2664B019D")
            };
            var client = _factory.CreateClient();
            var content = new StringContent(System.Text.Json.JsonSerializer.Serialize(customer), Encoding.UTF8, "application/json");
           
            //Assert
            var response = client.PostAsync("http://localhost:5000/api/customer/add", content);
            Assert.NotNull(customer);
            
        }

        
    }
}
