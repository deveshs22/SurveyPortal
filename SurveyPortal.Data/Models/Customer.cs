using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class Customer
    {
        public Customer()
        {
            this.SurveyResponses = new List<SurveyResponse>();
        }

        public int CustomerId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public string Gender { get; set; }
        public bool Active { get; set; }
        public string Pwd { get; set; }
        public virtual ICollection<SurveyResponse> SurveyResponses { get; set; }
    }
}
