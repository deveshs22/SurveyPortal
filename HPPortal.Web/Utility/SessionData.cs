using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace HPPortal.Web
{
    public class SessionData
    {
        private SessionData()
        {
            
        }

        public static SessionData Current
        {
           get
            {
                SessionData session = (SessionData)HttpContext.Current.Session["__Session__"];
                if (session == null)
                {
                    session = new SessionData();
                    HttpContext.Current.Session["__Session__"] = session;
                }
                return session;
            }
        }

        public int UserId { get; set; }
        public int RoleId { get; set; }
       
    }
}