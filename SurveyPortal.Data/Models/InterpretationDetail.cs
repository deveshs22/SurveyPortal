using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class InterpretationDetail
    {
        public int InterpretationDetailId { get; set; }
        public int SurveyInterpretationId { get; set; }
        public int ScoreRangeStart { get; set; }
        public Nullable<int> ScoreRangeEnd { get; set; }
        public string Result { get; set; }
        public string Action { get; set; }
        public virtual SurveyInterpretation SurveyInterpretation { get; set; }
    }
}
