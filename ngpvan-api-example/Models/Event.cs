using System;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class EventList
    {
        [JsonProperty("items")]
        public List<Event> Items;

        [JsonProperty("count")]
        public int Count;

        [JsonProperty("nextPageLink")]
        public string NextPageLink;

        [JsonProperty("top")]
        public int? Top;

        [JsonProperty("skip")]
        public int? Skip;
    }
    
    public class Event
    {
        [JsonProperty("eventId")]
        public int EventId;

        [JsonProperty("name")]
        public string Name;

        [JsonProperty("shortName")]
        public string ShortName;

        [JsonProperty("description")]
        public string Description;

        [JsonProperty("startDate")]
        public DateTime StartDateUtc;

        [JsonProperty("endDate")]
        public DateTime EndDateUtc;

        [JsonProperty("eventType")]
        public EventType EventType;

        [JsonProperty("isActive")]
        public bool IsActive;

        [JsonProperty("locations")]
        public Location[] Locations;

        [JsonProperty("shifts")]
        public Shift[] Shifts;

        [JsonProperty("roles")]
        public Role[] Roles;
    }

    public class EventType 
    {
        [JsonProperty("eventTypeId")]
        public int EventTypeId;

        [JsonProperty("name")]
        public string Name;
    }
}