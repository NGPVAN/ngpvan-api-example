using System;
using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Code
    {
        [JsonProperty("codeId")]
        public int CodeId;

        [JsonProperty("parentCodeId")]
        public int ParentCodeId;

        [JsonProperty("name")]
        public string Name;

        [JsonProperty("description")]
        public string Description;

        [JsonProperty("dateCreated")]
        public DateTime DateCreatedUtc;
    }
}