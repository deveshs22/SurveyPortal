using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class QuestionResponse
    {
        public int QuestionResponseId { get; set; }
        public Nullable<int> SurveyResponseId { get; set; }
        public Nullable<int> QuestionOptionId { get; set; }
        public string ResponseText { get; set; }
        public Nullable<int> QuestionId { get; set; }
        public virtual Question Question { get; set; }
        public virtual QuestionOption QuestionOption { get; set; }
        public virtual SurveyResponse SurveyResponse { get; set; }
    }
}
