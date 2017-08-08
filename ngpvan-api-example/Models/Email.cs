using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Email
    {
        [JsonProperty("email")] 
        public string EmailAddress;

        [JsonProperty("type")] 
        public string EmailType;

        [JsonProperty("isPreferred")] 
        public bool IsPreferred;

        [JsonProperty("isSuscribed")] 
        public bool IsSuscribed;
    }
}