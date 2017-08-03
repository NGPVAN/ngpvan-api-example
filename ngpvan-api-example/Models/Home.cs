using System;
using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Home
    {
        public string Message;

        [JsonProperty("dateSent")]
        public DateTime DateSentUtc;
    }
}