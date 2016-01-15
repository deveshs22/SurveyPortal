using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class QuestionType
    {
        public QuestionType()
        {
            this.Questions = new List<Question>();
        }

        public int QuestionTypeId { get; set; }
        public string QuestionTypeDesc { get; set; }
        public Nullable<bool> Active { get; set; }
        public virtual ICollection<Question> Questions { get; set; }
    }
}
