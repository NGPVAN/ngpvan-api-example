using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using ngpvanapi.Models;
using Newtonsoft.Json;

namespace ngpvanapi.Controllers
{
    public class SignupController : Controller
    {
        private const string Action = "signups";

        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult EventSignup(int vanId)
        {
            var view = new SignupView {VanId = vanId};
            var result = Helper.Get("/events?$top=50");
            if (result.Code() == HttpStatusCode.OK)
            {
                var list = JsonConvert.DeserializeObject<EventList>(result.Body());
                var eventsList = new List<SelectListItem>();
                foreach (var item in list.Items)
                {
                    if (item.IsActive)
                    {
                        eventsList.Add(new SelectListItem {Value = item.EventId.ToString(), Text = item.Name});
                    }
                }
                var defaultEvent = new SelectListItem {Value = "0", Text = string.Empty, Selected = true};
                eventsList.Insert(0, defaultEvent);
                view.Events = eventsList;
                return View(view);
            }

            var errors = JsonConvert.DeserializeObject<Errors>(result.Body());
            return View("Error", errors);
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

        public ActionResult GetStatusListByEventId(int eventId)
        {
            if (eventId <= 0)
                return null;

            var result = Helper.Get(string.Format("{0}/statuses?eventId={1}", Action, eventId));
            if (result.Code() == HttpStatusCode.OK)
            {
                var statusList = JsonConvert.DeserializeObject<List<Status>>(result.Body());
                return Json(statusList);
            }

            return null;
        }

        [HttpGet]
        public ActionResult SimpleSignup(int vanId, int eventId)
        {
            var view = new SignupView { VanId = vanId };
            var result = Helper.Get("/events/" + eventId);
            
            if (result.Code() == HttpStatusCode.OK)
            {
                var ev = JsonConvert.DeserializeObject<EventList>(result.Body());
                var eventDetail = JsonConvert.DeserializeObject<Event>(result.Body());
                return View(eventDetail);
            }

            var errors = JsonConvert.DeserializeObject<Errors>(result.Body());
            return View("Error", errors);
        }

        [HttpPost]
        public ActionResult SimpleSignup(int vanId, int eventId, int statusId)
        {
            var view = new SignupView { VanId = vanId };
            var result = Helper.Get("/events/" + eventId);

            if (result.Code() == HttpStatusCode.OK)
            {
                var eventDetail = JsonConvert.DeserializeObject<Event>(result.Body());
                return View(eventDetail);
            }

            var errors = JsonConvert.DeserializeObject<Errors>(result.Body());
            return View("Error", errors);
        }
    }
}
