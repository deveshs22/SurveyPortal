using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.Entity;
using System.Configuration;

namespace HPPortal.Web
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }    
        

        protected void FormsAuthentication_OnAuthenticate(Object sender, FormsAuthenticationEventArgs e)
        {
            if (FormsAuthentication.CookiesSupported == true)
            {
                if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
                {
                    try
                    {
                        //let us take out the username now                
                        string username = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;

                        if (string.IsNullOrEmpty(username))
                        {
                            //Let us set the Pricipal with our user specific details
                            e.User = new System.Security.Principal.GenericPrincipal(
                              new System.Security.Principal.GenericIdentity(username, "Forms"), new string[] { "User" });                              
                        }
                        
                    }
                    catch (Exception)
                    {
                        //somehting went wrong
                    }
                }
            }
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

            //Exception exc = Server.GetLastError();
            //Utility.MailFormat.SendMailMessages(ConfigurationManager.AppSettings["From"], ConfigurationManager.AppSettings["PortolError"],
            //    "", "", "Portal Error", exc.ToString(), "", "");

            //Server.Transfer("~/Error.aspx");
           
        } 
    }
}