using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using ngpvanapi.Models;
using Newtonsoft.Json;

namespace ngpvanapi.Controllers
{
    public class CanvassResponsesController : Controller
    {
        private const string Action = "canvassResponses";

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CanvassResponse(int vanId)
        {
            var view = new CanvassResponseView {VanId = vanId};
            
            var defaultSelectListItem = new SelectListItem {Value = "0", Text = string.Empty, Selected = true};

            var inputTypes = Helper.Get(string.Format("{0}/{1}", Action, "inputTypes"));
            if (inputTypes.Code() != HttpStatusCode.OK)
            {
                var errors = JsonConvert.DeserializeObject<Errors>(inputTypes.Body());
                return View("Error", errors);
            }

            var it = JsonConvert.DeserializeObject<List<Models.InputType>>(inputTypes.Body());
            var inputTypesList =
                it.Select(e => new SelectListItem {Value = e.InputTypeId.ToString(), Text = e.Name}).ToList();
            inputTypesList.Insert(0, defaultSelectListItem);
            view.InputTypes = inputTypesList;

            var activistCodes = Helper.Get(string.Format("{0}", "activistCodes"));
            if (activistCodes.Code() != HttpStatusCode.OK)
            {
                var errors = JsonConvert.DeserializeObject<Errors>(activistCodes.Body());
                return View("Error", errors);
            }

            var ac = JsonConvert.DeserializeObject<ActivistCodeList>(activistCodes.Body());
            var activistCodesList =
                ac.Items.Select(e => new SelectListItem {Value = e.ActivistCodeId.ToString(), Text = e.Name}).ToList();
            activistCodesList.Insert(0, defaultSelectListItem);
            view.ActivistCodes = activistCodesList;

            var surveyQuestions = Helper.Get(string.Format("{0}", "surveyQuestions"));
            if (surveyQuestions.Code() != HttpStatusCode.OK)
            {
                var errors = JsonConvert.DeserializeObject<Errors>(surveyQuestions.Body());
                return View("Error", errors);
            }

            var surveyQuestionsList = JsonConvert.DeserializeObject<SurveyQuestionList>(surveyQuestions.Body());
            view.SurveyQuestions = surveyQuestionsList;

            return View(view);
        }

        public ActionResult GetContactTypesByInputTypeId(int inputTypeId)
        {
            if (inputTypeId <= 0)
                return null;

            var contactTypes = 
                Helper.Get(string.Format("{0}/{1}{2}", Action, "contactTypes?inputTypeId=", inputTypeId));
            if (contactTypes.Code() == HttpStatusCode.OK)
            {
                var contactTypesList = JsonConvert.DeserializeObject<List<ContactType>>(contactTypes.Body());
                return Json(contactTypesList);
            }

            return null;
        }

        public ActionResult GetResultCodesByContactTypeId(int contactTypeId)
        {
            if (contactTypeId <= 0)
                return null;

            var resultCodes =
                Helper.Get(string.Format("{0}/{1}{2}", Action, "resultCodes?contactTypeId=", contactTypeId));
            if (resultCodes.Code() == HttpStatusCode.OK)
            {
                var resultCodesList = JsonConvert.DeserializeObject<List<ResultCode>>(resultCodes.Body());
                return Json(resultCodesList);
            }

            return null;
        }
    }
}
