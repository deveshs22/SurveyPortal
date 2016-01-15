using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class SurveyTitle
    {
        public SurveyTitle()
        {
            this.SurveyInterpretations = new List<SurveyInterpretation>();
            this.SurveyResponses = new List<SurveyResponse>();
            this.SurveySections = new List<SurveySection>();
        }

        public int SurveyTitleId { get; set; }
        public string SurveyTitle1 { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public string FirendlyUrl { get; set; }
        public virtual ICollection<SurveyInterpretation> SurveyInterpretations { get; set; }
        public virtual ICollection<SurveyResponse> SurveyResponses { get; set; }
        public virtual ICollection<SurveySection> SurveySections { get; set; }
    }
}
