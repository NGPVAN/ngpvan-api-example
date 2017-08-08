using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Shift
    {
        [JsonProperty("eventShiftId")]
        public int EventShiftId;

        [JsonProperty("name")]
        public string Name;
    }
}