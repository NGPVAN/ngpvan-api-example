using System.Collections.Generic;
using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Errors
    {
        [JsonProperty("errors")]
        public List<Error> Items;
    }
    
    public class Error
    {
        [JsonProperty("code")]
        public string Code;

        [JsonProperty("text")]
        public string Text;

        [JsonProperty("properties")]
        public List<string> Properties;
    }
}