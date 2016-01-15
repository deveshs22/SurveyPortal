using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class User
    {
        public User()
        {
            this.SurveyResponses = new List<SurveyResponse>();
        }

        public int UserId { get; set; }
        public string EmailId { get; set; }
        public string Pwd { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public int RoleId { get; set; }
        public bool Active { get; set; }
        public virtual Role Role { get; set; }
        public virtual ICollection<SurveyResponse> SurveyResponses { get; set; }
    }
}
