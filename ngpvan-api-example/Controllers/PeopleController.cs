using System.Net;
using System.Web.Mvc;
using ngpvanapi.Models;
using Newtonsoft.Json;

namespace ngpvanapi.Controllers
{
    public class PeopleController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult FindOrCreate(string firstName, string lastName, string emailAddress, string phoneNumber,
            string dateOfBirth, string addressLine1, string city, string stateOrProvince, string zip5,
            bool expandAddresses, bool expandPhones, bool expandEmails)
        {
            var toFindOrCreate = BuildPeople(firstName, lastName, emailAddress, phoneNumber, dateOfBirth, addressLine1,
                city, stateOrProvince, zip5);
            var toFindOrCreateSerialized = JsonConvert.SerializeObject(toFindOrCreate);
            var result = Helper.PostWithRedirect("people/findOrCreate", toFindOrCreateSerialized);

            if ((result.Code() == HttpStatusCode.Created) | (result.Code() == HttpStatusCode.Found))
            {
                var matchResponse = JsonConvert.DeserializeObject<Match>(result.Body());
                var vanId = matchResponse.VanId;
                return RedirectToAction("Detail",
                    new
                    {
                        id = vanId,
                        expandAddresses,
                        expandPhones,
                        expandEmails
                    });
            }

            if (result.Code() == HttpStatusCode.OK)
            {
                var peopleResponse = JsonConvert.DeserializeObject<People>(result.Body());
                var vanId = peopleResponse.VanId;
                return RedirectToAction("Detail",
                    new
                    {
                        id = vanId,
                        expandAddresses,
                        expandPhones,
                        expandEmails
                    });
            }

            //todo: Handle errors
            return View("Error");
        }

        private People BuildPeople(string firstName, string lastName, string emailAddress, string phoneNumber,
            string dateOfBirth, string addressLine1, string city, string stateOrProvince, string zip5)
        {
            var peep = new People
            {
                FirstName = firstName,
                LastName = lastName
            };

            if (!string.IsNullOrEmpty(dateOfBirth))
            {
                peep.DateOfBirth = dateOfBirth;
            }

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

        public ActionResult Detail(int id, bool expandAddresses, bool expandPhones, bool expandEmails)
        {
            var ext = "";
            if (expandAddresses)
            {
                ext = "addresses";
            }
            if (expandPhones)
            {
                if (!string.IsNullOrEmpty(ext))
                {
                    ext = ext + ",";
                }
                ext = ext + "phones";
            }
            if (expandEmails)
            {
                if (!string.IsNullOrEmpty(ext))
                {
                    ext = ext + ",";
                }
                ext = ext + "emails";
            }
            if (!string.IsNullOrEmpty(ext))
            {
                ext = "?$expand=" + ext;
            }

            var people = Helper.Get("people/" + id + ext);
            var peopleResponse = JsonConvert.DeserializeObject<People>(people.Body());
            return View("Detail", peopleResponse);
        }
    }
}
