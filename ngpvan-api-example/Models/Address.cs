using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Address
    {
        [JsonProperty("addressId")]
        public int? AddressId;

        [JsonProperty("addressLine1")]
        public string AddressLine1;

        [JsonProperty("addressLine2")]
        public string AddressLine2;

        [JsonProperty("addressLine3")]
        public string AddressLine3;

        [JsonProperty("city")]
        public string City;

        [JsonProperty("stateOrProvince")]
        public string StateOrProvince;

        [JsonProperty("zipOrPostalCode")]
        public string ZipOrPostalCode;

        [JsonProperty("countryCode")]
        public string CountryCode;

        [JsonProperty("type")] 
        public string AddressType;

        [JsonProperty("isPreferred")] 
        public bool? IsPreferred;
    }
}