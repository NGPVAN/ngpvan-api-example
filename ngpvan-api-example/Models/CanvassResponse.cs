using System;
using System.Collections.Generic;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace ngpvanapi.Models
{
    public class CanvassResponse
    {
        [JsonProperty("resultCodeId")]
        public int? ResultCodeId;

        [JsonProperty("canvassContext")]
        public CanvassContext Context;
    }

    public class CanvassContext
    {
        [JsonProperty("inputTypeId")]
        public int? InputTypeId;

        [JsonProperty("contactTypeId")]
        public int? ContactTypeId;

        [JsonProperty("dateCanvassed")]
        public DateTime DateCanvassedUtc;
    }

    public class CanvassResponseView
    {
        public int VanId;
        public int InputTypeId;
        public int ResultCodeId;
        public int ContactTypeId;
        public List<SelectListItem> InputTypes;
    }
}