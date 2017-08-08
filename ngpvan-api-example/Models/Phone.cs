using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Phone
    {
        [JsonProperty("phoneNumber")]
        public string PhoneNumber;

        [JsonProperty("phoneType")]
        public string PhoneType;

        [JsonProperty("ext")]
        public string Ext;

        [JsonProperty("isPreferred")]
        public bool IsPreferred;

        [JsonProperty("phoneOptInStatus")]
        public string PhoneOptInStatus;
    }
}