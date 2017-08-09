using System.Net;
using System.Web.Mvc;
using ngpvanapi.Models;
using Newtonsoft.Json;

namespace ngpvanapi.Controllers
{
    public class CanvassResponsesController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CanvassResponse(int vanId, bool showActivistCodes = true, bool showSurveyQuestions = true)
        {
            var view = new CanvassResponseView {VanId = vanId};

            if (showActivistCodes)
            {
                var activistCodes = Helper.Get("activistCodes");
                if (activistCodes.Code() != HttpStatusCode.OK)
                {
                    var errors = JsonConvert.DeserializeObject<Errors>(activistCodes.Body());
                    return View("Error", errors);
                }

                var activistCodesList = JsonConvert.DeserializeObject<ActivistCodeList>(activistCodes.Body());
                view.ActivistCodes = activistCodesList;
            }
            else
            {
                view.ActivistCodes = new ActivistCodeList();
            }

            if (showSurveyQuestions)
            {
                var surveyQuestions = Helper.Get("surveyQuestions");
                if (surveyQuestions.Code() != HttpStatusCode.OK)
                {
                    var errors = JsonConvert.DeserializeObject<Errors>(surveyQuestions.Body());
                    return View("Error", errors);
                }

                var surveyQuestionsList = JsonConvert.DeserializeObject<SurveyQuestionList>(surveyQuestions.Body());
                view.SurveyQuestions = surveyQuestionsList;
            }
            else
            {
                view.SurveyQuestions = new SurveyQuestionList();
            }

            return View(view);
        }
    }
}
