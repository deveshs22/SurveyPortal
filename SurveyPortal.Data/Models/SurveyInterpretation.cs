using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class SurveyInterpretation
    {
        public SurveyInterpretation()
        {
            this.InterpretationDetails = new List<InterpretationDetail>();
        }

        public int SurveyInterpretationId { get; set; }
        public int SurveyTitleId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ScoreTitle { get; set; }
        public string ResultTitle { get; set; }
        public string ActionTitle { get; set; }
        public string Footer { get; set; }
        public virtual ICollection<InterpretationDetail> InterpretationDetails { get; set; }
        public virtual SurveyTitle SurveyTitle { get; set; }
    }
}
