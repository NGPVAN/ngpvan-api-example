using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class ContactType
    {
        [JsonProperty("contactTypeId")]
        public int ContactTypeId;

        [JsonProperty("name")]
        public string Name;
    }
}