using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class Role
    {
        [JsonProperty("roleId")]
        public int RoleId;

        [JsonProperty("name")]
        public string Name;
    }
}