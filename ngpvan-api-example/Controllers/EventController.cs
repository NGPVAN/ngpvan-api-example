using System;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using ngpvanapi.Models;

namespace ngpvanapi.Controllers
{
    public class EventController : Controller
    {
        private const string Action = "events";

        public ActionResult Index(int? top, int? skip)
        {
            var url = Action;
            var ext = string.Empty;
            if (top.HasValue && top.Value > 0)
            {
                ext = "$top=" + top.Value;
            }
            if (skip.HasValue && skip.Value > 0)
            {
                ext = ext + "&$skip=" + skip.Value;
            }
            if (!string.IsNullOrEmpty(ext))
            {
                url = Action + "?" + ext;
            }

            var result = Helper.Get(url);
            if (result.Code() == HttpStatusCode.OK)
            {
                var list = JsonConvert.DeserializeObject<EventList>(result.Body());
                if (string.IsNullOrEmpty(list.NextPageLink))
                    return View(list);

                var myUri = new Uri(list.NextPageLink);
                var paging = HttpUtility.ParseQueryString(myUri.Query);
                list.Skip = int.Parse(paging["$skip"]);
                list.Top = int.Parse(paging["$top"]);
                return View(list);
            }

            var errors = JsonConvert.DeserializeObject<Errors>(result.Body());
            return View("Error", errors);
        }

        public ActionResult Detail(int eventId)
        {
            var result = Helper.Get(string.Format("{0}/{1}?$expand=shifts,roles,locations", Action, eventId));
            if (result.Code() == HttpStatusCode.OK)
            {
                var eventDetail = JsonConvert.DeserializeObject<Event>(result.Body());
                return View(eventDetail);
            }

            var errors = JsonConvert.DeserializeObject<Errors>(result.Body());
            return View("Error", errors);
        }

        public ActionResult GetByEventId(int eventId)
        {
            if (eventId == 0)
                return null;

            var result = Helper.Get(string.Format("{0}/{1}?$expand=shifts,roles,locations", Action, eventId));
            if (result.Code() == HttpStatusCode.OK)
            {
                var eventDetail = JsonConvert.DeserializeObject<Event>(result.Body());
                return Json(eventDetail);
            }

            return null;
        }
    }
}
