using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Email
    {
        [JsonProperty("email")] public string EmailAddress;
        [JsonProperty("type")] public string EmailType;
        public bool IsPreferred;
        public bool IsSuscribed;
    }
}