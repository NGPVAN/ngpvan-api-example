using System.Net;
using System.Web.Mvc;
using Newtonsoft.Json;
using ngpvanapi.Models;

namespace ngpvanapi.Controllers
{
    public class EventController : Controller
    {
        public ActionResult Index()
        {
            var result = Helper.Get("events");
            if (result.Code() == HttpStatusCode.OK)
            {
                var list = JsonConvert.DeserializeObject<EventList>(result.Body());
                return View(list.Items);
            }

            //todo: Handle errors
            return View("Error");
        }

        public ActionResult Detail(int eventId)
        {
            var result = Helper.Get("events/" + eventId);
            if (result.Code() == HttpStatusCode.OK)
            {
                var eventDetail = JsonConvert.DeserializeObject<Event>(result.Body());
                return View(eventDetail);
            }

            //todo: Handle errors
            return View("Error");
        }
    }
}
