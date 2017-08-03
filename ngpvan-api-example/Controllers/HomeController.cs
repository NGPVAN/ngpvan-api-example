using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Mvc;
using ngpvanapi.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace ngpvanapi.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var message = new Home {Message = string.Format("Hello, world! @ {0}", DateTime.Now)};
            var messageSerialized = JsonConvert.SerializeObject(message);
            var result = Helper.Post("echoes", messageSerialized);
            if (result.Code() == HttpStatusCode.OK)
            {
                var messageResponse = JsonConvert.DeserializeObject<Home>(result.Body());
                return View(messageResponse);
            }

            //todo: Handle errors
            return View("Error");
        }
    }
}
