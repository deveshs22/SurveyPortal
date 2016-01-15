using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class SurveyResponse
    {
        public SurveyResponse()
        {
            this.QuestionResponses = new List<QuestionResponse>();
        }

        public int SurveyResponseId { get; set; }
        public Nullable<int> SurveyTitleId { get; set; }
        public Nullable<int> CustomerId { get; set; }
        public Nullable<int> ApproverUserId { get; set; }
        public Nullable<System.DateTime> ResponseDate { get; set; }
        public Nullable<System.DateTime> ApprovalDate { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual ICollection<QuestionResponse> QuestionResponses { get; set; }
        public virtual SurveyTitle SurveyTitle { get; set; }
        public virtual User User { get; set; }
    }
}
