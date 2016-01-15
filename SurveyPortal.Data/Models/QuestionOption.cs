using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class QuestionOption
    {
        public QuestionOption()
        {
            this.QuestionResponses = new List<QuestionResponse>();
        }

        public int QuestionOptionId { get; set; }
        public string QuestionOption1 { get; set; }
        public int QuestionId { get; set; }
        public Nullable<int> Value { get; set; }
        public bool Active { get; set; }
        public virtual Question Question { get; set; }
        public virtual ICollection<QuestionResponse> QuestionResponses { get; set; }
    }
}
