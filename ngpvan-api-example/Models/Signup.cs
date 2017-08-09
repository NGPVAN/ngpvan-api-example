using System.Collections.Generic;
using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class SignupList
    {
        [JsonProperty("items")]
        public List<Signup> Items;

        [JsonProperty("count")]
        public int Count;

        [JsonProperty("nextPageLink")]
        public string NextPageLink;

        [JsonProperty("top")]
        public int? Top;

        [JsonProperty("skip")]
        public int? Skip;

        [JsonProperty("vanId")]
        public int? VanId;

        [JsonProperty("eventId")]
        public int? EventId;
    }

    public class Signup
    {
        [JsonProperty("person")]
        public People Person;

        [JsonProperty("event")]
        public Event Event;

        [JsonProperty("status")]
        public Status Status;

        [JsonProperty("role")]
        public Role Role;

        [JsonProperty("shift")]
        public Shift Shift;

        [JsonProperty("location")]
        public Location Location;
    }

    public class SignupView
    {
        public int VanId;
        public int EventId;
        public int? StatusId;
        public Event Event;
        public List<Status> Statuses;
    }

    public class Status
    {
        [JsonProperty("statusId")]
        public int StatusId;

        [JsonProperty("name")]
        public string Name;
    }
}