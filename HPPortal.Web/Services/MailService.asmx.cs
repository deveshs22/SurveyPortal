using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using HPPortal.Web.Utility;

namespace HPPortal.Web.Services
{
    /// <summary>
    /// Summary description for MailService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class MailService : System.Web.Services.WebService
    {

        [WebMethod]
        public void SendMailMessages(string froms, string to, string bcc, string cc, string subject, string body, string attachment1, string attachment2)
        {
            MailFormat.SendMailMessages(froms, to, bcc, cc, subject, body, attachment1, attachment2);
        }
    }
}
