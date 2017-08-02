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
        public DateTime StartDate;

        [JsonProperty("endDate")] 
        public DateTime EndDate;

        [JsonProperty("eventType")] 
        public EventType EventType;

        [JsonProperty("IsActive")]
        public bool IsActive;

        //public Location[] Locations;
        //public Note[] Notes;
        //public Code[] Codes;
    }

    public class EventType 
    {
        [JsonProperty("eventTypeId")]
        public int EventTypeId;

        [JsonProperty("name")]
        public string Name;
    }

    public class Location
    {
        public int LocationId;
        public string Name;
        public string DisplayName;
        public Address Address;
        public int Id;
        public Note[] Notes;
        public Code[] Codes;
    }

    public class Address
    {
        public int? AddressId;
        public string AddressLine1;
        public string AddressLine2;
        public string AddressLine3;
        public string City;
        public string StateOrProvince;
        public string ZipOrPostalCode;
        public GeoLocation GeoLocation;
        public string CountryCode;
        public string Preview;
        //public Nullable<T> Type;
        public bool? IsPreferred;
    }

    public class GeoLocation
    {
        public float Longitute;
        public float Latitude;
    }

    public class Code
    {
        public int CodeId;
        public int ParentCodeId;
        public string Name;
        public string CodePath;
        public string CreatedByName;
        public DateTime DateCreated;
        //public Nullable<T> SupportedEntities;
    }

    public class Note
    {
        public int NoteId;
        public string Text;
        public bool IsViewRestricted;
       // public Nullable<T> Categoty;
        public DateTime CreatedDate;
    }
}