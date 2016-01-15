using System;
using System.Collections.Generic;

namespace SurveyPortal.Data.Models
{
    public partial class Role
    {
        public Role()
        {
            this.Users = new List<User>();
        }

        public int RoleId { get; set; }
        public string Description { get; set; }
        public bool Active { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
