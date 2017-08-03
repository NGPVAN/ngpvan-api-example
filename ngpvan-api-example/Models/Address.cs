using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Address
    {
        public int? AddressId;
        public string AddressLine1;
        public string AddressLine2;
        public string AddressLine3;
        public string City;
        public string StateOrProvince;
        public string ZipOrPostalCode;
        public string CountryCode;
        [JsonProperty("type")] public string AddressType;
        public bool? IsPreferred;
    }
}