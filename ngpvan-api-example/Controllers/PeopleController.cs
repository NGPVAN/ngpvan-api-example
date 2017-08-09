using System;
using System.Collections.Generic;
using System.Net;
using System.Web.Mvc;
using ngpvanapi.Models;
using Newtonsoft.Json;

namespace ngpvanapi.Controllers
{
    public class PeopleController : Controller
    {
        private const string Action = "people";

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult FindOrCreate(string firstName, string lastName, string emailAddress, string phoneNumber,
            string addressLine1, string city, string stateOrProvince, string zip5)
        {
            var toFindOrCreate = BuildPeople(firstName, lastName, emailAddress, phoneNumber, addressLine1,
                city, stateOrProvince, zip5);
            var toFindOrCreateSerialized = JsonConvert.SerializeObject(toFindOrCreate);
            var result = Helper.PostWithRedirect(string.Format("{0}/{1}", Action, "findOrCreate"),
                toFindOrCreateSerialized);

            if ((result.Code() == HttpStatusCode.Created) | (result.Code() == HttpStatusCode.Found))
            {
                var matchResponse = JsonConvert.DeserializeObject<Match>(result.Body());
                var vanId = matchResponse.VanId;
                return RedirectToAction("Detail", new {vanId});
            }

            if (result.Code() == HttpStatusCode.OK)
            {
                var peopleResponse = JsonConvert.DeserializeObject<People>(result.Body());
                var vanId = peopleResponse.VanId;
                return RedirectToAction("Detail", new {vanId});
            }

            var errors = JsonConvert.DeserializeObject<Errors>(result.Body());
            return View("Error", errors);
        }

        private People BuildPeople(string firstName, string lastName, string emailAddress, string phoneNumber,
            string addressLine1, string city, string stateOrProvince, string zip5)
        {
            var peep = new People
            {
                FirstName = firstName,
                LastName = lastName
            };

            if (!string.IsNullOrEmpty(emailAddress))
            {
                var e = new Email {EmailAddress = emailAddress};
                peep.Emails = new[] {e};
            }

            if (!string.IsNullOrEmpty(phoneNumber))
            {
                var p = new Phone {PhoneNumber = phoneNumber};
                peep.Phones = new[] {p};
            }

            if (!string.IsNullOrEmpty(zip5) | !string.IsNullOrEmpty(addressLine1))
            {
                var a = new Address();
                if (!string.IsNullOrEmpty(addressLine1))
                {
                    a.AddressLine1 = addressLine1;
                }
                if (!string.IsNullOrEmpty(city))
                {
                    a.City = city;
                }
                if (!string.IsNullOrEmpty(stateOrProvince))
                {
                    a.StateOrProvince = stateOrProvince;
                }
                if (!string.IsNullOrEmpty(zip5))
                {
                    a.ZipOrPostalCode = zip5;
                }
                peep.Addresses = new[] {a};
            }

            return peep;
        }

        public ActionResult Detail(int vanId)
        {
            var result = Helper.Get(string.Format("{0}/{1}{2}", Action, vanId, "?$expand=addresses,phones,emails"));
            if (result.Code() == HttpStatusCode.OK)
            {
                var peopleResponse = JsonConvert.DeserializeObject<People>(result.Body());
                return View("Detail", peopleResponse);
            }

            var errors = JsonConvert.DeserializeObject<Errors>(result.Body());
            return View("Error", errors);
        }

        [HttpPost]
        public ActionResult PostCanvassResponse(int vanId, int contactTypeId, int inputTypeId, int? resultCodeId,
            IEnumerable<int> activistCodeId, int surveyQuestionId, int surveyResponseId)
        {
            var canvassResponse = new CanvassResponse
            {
                Context =
                    new CanvassContext
                    {
                        ContactTypeId = contactTypeId,
                        InputTypeId = inputTypeId,
                        DateCanvassedUtc = DateTime.UtcNow
                    },
                ResultCodeId = resultCodeId.HasValue ? resultCodeId.Value : new int?(),
            };

            var responses = new List<ScriptResponse>();

            if (activistCodeId != null)
            {
                foreach (var ac in activistCodeId)
                {
                    responses.Add(new ActivistCodeResponse
                    {
                        ActivistCodeId = ac,
                        Action = "Apply"
                    });
                }
            }

            if (surveyQuestionId > 0 && surveyResponseId > 0)
            {
                responses.Add(new SurveyQuestionResponse
                {
                    SurveyQuestionId = surveyQuestionId,
                    SurveyResponseId = surveyResponseId
                });
            }

            canvassResponse.Responses = responses;

            var canvassResponseSerialized = JsonConvert.SerializeObject(canvassResponse);
            var result = Helper.Post(string.Format("{0}/{1}/{2}", Action, vanId, "/canvassResponses"),
                canvassResponseSerialized);
            if (result.Code() == HttpStatusCode.NoContent)
            {
                return RedirectToAction("Detail", new {vanId});
            }

            var errors = JsonConvert.DeserializeObject<Errors>(result.Body());
            return View("Error", errors);
        }
    }
}
