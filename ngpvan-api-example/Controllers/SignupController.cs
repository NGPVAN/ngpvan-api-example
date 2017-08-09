using System;
using System.Collections.Generic;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ngpvanapi.Models;
using Newtonsoft.Json;

namespace ngpvanapi.Controllers
{
    public class SignupController : Controller
    {
        private const string Action = "signups";

        public ActionResult Index(int? vanId, int? eventId, int? top, int? skip)
        {
            var url = Action;
            var ext = string.Empty;
            if (vanId.HasValue && vanId.Value > 0)
            {
                ext = "?vanId=" + vanId.Value;
            }
            if (eventId.HasValue && eventId.Value > 0)
            {
                ext = "?eventId=" + eventId.Value;
            }
            if (top.HasValue && top.Value > 0)
            {
                ext = ext + "&$top=" + top.Value;
            }
            if (skip.HasValue && skip.Value > 0)
            {
                ext = ext + "&$skip=" + skip.Value;
            }
            if (!string.IsNullOrEmpty(ext))
            {
                url = Action + ext;
            }

            var result = Helper.Get(url);
            if (result.Code() == HttpStatusCode.OK)
            {
                var list = JsonConvert.DeserializeObject<SignupList>(result.Body());
                list.VanId = vanId;
                list.EventId = eventId;

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

        [HttpGet]
        public ActionResult EventSignup(int vanId, int eventId, int? statusId)
        {
            var view = new SignupView {VanId = vanId, EventId = eventId, StatusId = statusId};

            var eventResult = Helper.Get("events/" + eventId + "?$expand=shifts,roles,locations");
            if (eventResult.Code() != HttpStatusCode.OK)
            {
                var errors = JsonConvert.DeserializeObject<Errors>(eventResult.Body());
                return View("Error", errors);
            }

            var eventDetail = JsonConvert.DeserializeObject<Event>(eventResult.Body());
            view.Event = eventDetail;

            if (statusId == null)
            {
                var statusResult = Helper.Get(string.Format("{0}/statuses?eventId={1}", Action, eventId));
                if (statusResult.Code() != HttpStatusCode.OK)
                {
                    var errors = JsonConvert.DeserializeObject<Errors>(statusResult.Body());
                    return View("Error", errors);
                }

                var statusesDetail = JsonConvert.DeserializeObject<List<Status>>(statusResult.Body());
                view.Statuses = statusesDetail;
            }

            return View(view);
        }

        [HttpPost]
        public ActionResult EventSignup(int vanId, int eventId, int eventShiftId, int roleId, int statusId,
            int locationId)
        {
            var data = new Signup
            {
                Person = new People {VanId = vanId},
                Event = new Event {EventId = eventId},
                Shift = new Shift {EventShiftId = eventShiftId},
                Role = new Role {RoleId = roleId},
                Status = new Status {StatusId = statusId},
                Location = new Location {LocationId = locationId}
            };

            var result = Helper.Post(Action, JsonConvert.SerializeObject(data));
            if (result.Code() == HttpStatusCode.Created)
            {
                return RedirectToAction("Detail", "People", new {vanId});
            }

            var errors = JsonConvert.DeserializeObject<Errors>(result.Body());
            return View("Error", errors);
        }
    }
}
