using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class Question
    {
        public Question()
        {
            this.QuestionsDependent = new List<Question>();
            this.QuestionOptions = new List<QuestionOption>();
            this.QuestionResponses = new List<QuestionResponse>();
        }

        public int QuestionId { get; set; }
        public string Question1 { get; set; }
        public int QuestionTypeId { get; set; }
        public int SurveySectionId { get; set; }
        public bool Active { get; set; }
        public Nullable<int> DependentQuestionId { get; set; }
        public string EnabledValue { get; set; }
        public virtual ICollection<Question> QuestionsDependent { get; set; }
        public virtual Question DependentonQuestion{ get; set; }
        public virtual QuestionType QuestionType { get; set; }
        public virtual SurveySection SurveySection { get; set; }
        public virtual ICollection<QuestionOption> QuestionOptions { get; set; }
        public virtual ICollection<QuestionResponse> QuestionResponses { get; set; }
    }
}
