using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class People
    {
        [JsonProperty("vanId")]
        public int? VanId;

        [JsonProperty("title")]
        public string Title;

        [JsonProperty("firstName")]
        public string FirstName;

        [JsonProperty("middleName")]
        public string MiddleName;

        [JsonProperty("lastName")]
        public string LastName;

        [JsonProperty("suffix")]
        public string Suffix;

        [JsonProperty("dateOfBirth")]
        public string DateOfBirth;

        [JsonProperty("party")]
        public string Party;

        [JsonProperty("sex")]
        public string Sex;

        [JsonProperty("salutation")]
        public string Salutation;

        [JsonProperty("envelopeName")]
        public string EnvelopeName;

        [JsonProperty("addresses")]
        public Address[] Addresses;

        [JsonProperty("emails")]
        public Email[] Emails;

        [JsonProperty("phones")]
        public Phone[] Phones;
    }

    public class Match
    {
        [JsonProperty("vanId")]
        public int VanId;

        [JsonProperty("status")]
        public string Status;
    }
}