using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class CanvassResponse
    {
        [JsonProperty("canvassContext")]
        public CanvassContext Context;

        [JsonProperty("resultCodeId")]
        public int? ResultCodeId;

        [JsonProperty("responses")]
        public IEnumerable<ScriptResponse> Responses;
    }

    public class CanvassContext
    {
        [JsonProperty("inputTypeId")]
        public int? InputTypeId;

        [JsonProperty("contactTypeId")]
        public int? ContactTypeId;

        [JsonProperty("dateCanvassed")]
        public DateTime DateCanvassedUtc;
    }

    public class CanvassResponseView
    {
        public int VanId;
        public List<SelectListItem> InputTypes;
        public List<SelectListItem> ActivistCodes;
        public SurveyQuestionList SurveyQuestions;
    }

    public class ScriptResponse
    {
        [JsonProperty("type")]
        public string Type { get; protected set; }
    }
}