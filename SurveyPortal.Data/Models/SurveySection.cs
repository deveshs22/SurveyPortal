using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class SurveySection
    {
        public SurveySection()
        {
            this.Questions = new List<Question>();
        }

        public int SurveySectionId { get; set; }
        public string SurveySectionTtile { get; set; }
        public string SurveySectionDesc { get; set; }
        public int SurveyTitleId { get; set; }
        public int SectionTypeId { get; set; }
        public bool DisplaySectionHeader { get; set; }
        public bool Active { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
        public virtual SectionType SectionType { get; set; }
        public virtual SurveyTitle SurveyTitle { get; set; }
    }
}
