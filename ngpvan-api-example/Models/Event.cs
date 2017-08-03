using System;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class EventList
    {
        public List<Event> Items;
        public int Count;
        public string NextPageLink;
    }
    
    public class Event
    { 
        public int EventId;
        public string Name;
        public string ShortName;
        public string Description;
        [JsonProperty("startDate")]
        public DateTime StartDateUtc;
        [JsonProperty("endDate")]
        public DateTime EndDateUtc;
        public EventType EventType;
        public bool IsActive;
        public Location[] Locations;
        //public Note[] Notes;
        //public Code[] Codes;
    }

    public class EventType 
    {
        public int EventTypeId;
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