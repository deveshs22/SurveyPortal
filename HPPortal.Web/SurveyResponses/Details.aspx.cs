using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using SurveyPortal.Data.Models;
using SurveyPortal.Data;

namespace HPPortal.Web.SurveyResponses
{
    public partial class Details : System.Web.UI.Page
    {
		protected SurveyPortal.Data.SurveyDBContext _db = new SurveyPortal.Data.SurveyDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Select methd to selects a single SurveyResponse item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public SurveyPortal.Data.Models.SurveyResponse GetItem([FriendlyUrlSegmentsAttribute(0)]int? SurveyResponseId)
        {
            if (SurveyResponseId == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.SurveyResponses.Where(m => m.SurveyResponseId == SurveyResponseId).Include(m => m.Customer).Include(m => m.SurveyTitle).FirstOrDefault();
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("../Default");
            }
        }
    }
}

