using System.Net;
using System.Web.Mvc;
using Newtonsoft.Json;
using ngpvanapi.Models;

namespace ngpvanapi.Controllers
{
    public class EventController : Controller
    {
        private string UrlFormat
        {
            get { return System.Configuration.ConfigurationManager.AppSettings["VANAPI_UrlFormat"]; }
        }

        private string Username
        {
            get { return System.Configuration.ConfigurationManager.AppSettings["VANAPI_Username"]; }
        }

        private string Password
        {
            get
            {
                var pwd = System.Configuration.ConfigurationManager.AppSettings["VANAPI_Password"];
                var dbMode = System.Configuration.ConfigurationManager.AppSettings["VANAPI_DBMode"];
                return string.Format("{0}|{1}", pwd, dbMode);
            }
        }

        public ActionResult Index()
        {
            var result = Helper.Get(string.Format(UrlFormat, "events"), Username, Password);
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
            var result = Helper.Get(string.Format(UrlFormat, "events/" + eventId), Username, Password);
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
