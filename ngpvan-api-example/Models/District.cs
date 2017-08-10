using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ngpvanapi.Models
{
    public class District
    {
        public int DistrictFieldId;
        public string Name;
        public int? ParentFieldId;
        public bool IsCustomDistrict;
        public DistrictFieldValue[] DistrictFieldValues;
    }

    public class DistrictFieldValue
    {
        public int Id;
        public string Name;
        public int? ParentId;

    }
}