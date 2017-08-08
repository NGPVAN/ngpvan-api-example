using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Location
    {
        [JsonProperty("locationId")]
        public int LocationId;

        [JsonProperty("name")]
        public string Name;

        [JsonProperty("displayName")]
        public string DisplayName;

        [JsonProperty("address")]
        public Address Address;
    }
}