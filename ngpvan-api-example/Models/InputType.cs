using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class InputType
    {
        [JsonProperty("inputTypeId")]
        public int InputTypeId;

        [JsonProperty("name")]
        public string Name;
    }
}