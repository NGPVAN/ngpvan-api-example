using System.Collections.Generic;
using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class ActivistCodeList
    {
        [JsonProperty("items")]
        public List<ActivistCode> Items;

        [JsonProperty("count")]
        public int Count;

        [JsonProperty("nextPageLink")]
        public string NextPageLink;

        [JsonProperty("top")]
        public int? Top;

        [JsonProperty("skip")]
        public int? Skip;
    }
    
    public class ActivistCode
    {
        [JsonProperty("activistCodeId")]
        public int? ActivistCodeId;

        [JsonProperty("type")]
        public string Type;

        [JsonProperty("name")]
        public string Name;

        [JsonProperty("mediumName")]
        public string MediumName;

        [JsonProperty("shortName")]
        public string ShortName;

        [JsonProperty("description")]
        public string Description;

        [JsonProperty("scriptQuestion")]
        public string ScriptQuestion;

        [JsonProperty("status")]
        public string Status;
    }

    public class ActivistCodeResponse
    {
        [JsonProperty("type")]
        public string Type { get; private set; }

        [JsonProperty("activistCodeId")]
        public int ActivistCodeId;

        [JsonProperty("action")]
        public string Action;

        public ActivistCodeResponse()
        {
            Type = "ActivistCode";
        }
    }
}