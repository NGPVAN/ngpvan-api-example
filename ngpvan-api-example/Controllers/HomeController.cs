using System;
using System.Net;
using System.Web.Mvc;
using ngpvanapi.Models;
using Newtonsoft.Json;

namespace ngpvanapi.Controllers
{
    public class HomeController : Controller
    {
        private const string Action = "echoes";

        public ActionResult Index()
        {
            var message = new Home {Message = string.Format("Hello, world! Posted @ {0}", DateTime.Now)};
            var messageSerialized = JsonConvert.SerializeObject(message);
            var result = Helper.Post(Action, messageSerialized);
            if (result.Code() == HttpStatusCode.OK)
            {
                var messageResponse = JsonConvert.DeserializeObject<Home>(result.Body());
                return View(messageResponse);
            }

            var errors = JsonConvert.DeserializeObject<Errors>(result.Body());
            return View("Error", errors);
        }
    }
}
