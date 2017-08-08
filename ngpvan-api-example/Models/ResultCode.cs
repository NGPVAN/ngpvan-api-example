using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class ResultCode
    {
        [JsonProperty("resultCodeId")]
        public int ResultCodeId;

        [JsonProperty("name")]
        public string Name;

        [JsonProperty("mediumName")]
        public string MediumName;

        [JsonProperty("shortName")]
        public string ShortName;
    }
}