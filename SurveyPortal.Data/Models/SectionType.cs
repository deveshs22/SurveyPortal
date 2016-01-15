using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class SectionType
    {
        public SectionType()
        {
            this.SurveySections = new List<SurveySection>();
        }

        public int SectionTypeId { get; set; }
        public string SectionTypeDesc { get; set; }
        public Nullable<bool> Active { get; set; }
        public virtual ICollection<SurveySection> SurveySections { get; set; }
    }
}
