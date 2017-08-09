using System.Collections.Generic;
using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class SurveyQuestionList
    {
        [JsonProperty("items")]
        public List<SurveyQuestion> Items;

        [JsonProperty("count")]
        public int Count;

        [JsonProperty("nextPageLink")]
        public string NextPageLink;

        [JsonProperty("top")]
        public int? Top;

        [JsonProperty("skip")]
        public int? Skip;
    }

    public class SurveyQuestion
    {
        [JsonProperty("surveyQuestionId")]
        public int? SurveyQuestionId;

        [JsonProperty("type")]
        public string Type;

        [JsonProperty("cycle")]
        public string Cycle;

        [JsonProperty("name")]
        public string Name;

        [JsonProperty("mediumName")]
        public string MediumName;

        [JsonProperty("shortName")]
        public string ShortName;

        [JsonProperty("scriptQuestion")]
        public string ScriptQuestion;

        [JsonProperty("status")]
        public string Status;

        [JsonProperty("responses")]
        public List<SurveyResponse> SurveyResponses;
    }

    public class SurveyResponse
    {
        [JsonProperty("surveyResponseId")]
        public int? SurveyResponseId;

        [JsonProperty("name")]
        public string Name;

        [JsonProperty("mediumName")]
        public string MediumName;

        [JsonProperty("shortName")]
        public string ShortName;
    }

    public class SurveyQuestionResponse : ScriptResponse
    {
        [JsonProperty("surveyQuestionId")]
        public int SurveyQuestionId;

        [JsonProperty("surveyResponseId")]
        public int SurveyResponseId;

        public SurveyQuestionResponse()
        {
            Type = "SurveyResponse";
        }
    }
}