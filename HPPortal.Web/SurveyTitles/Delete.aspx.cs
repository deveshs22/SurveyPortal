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

namespace HPPortal.Web.SurveyTitles
{
    public partial class Delete : System.Web.UI.Page
    {
		protected SurveyPortal.Data.SurveyDBContext _db = new SurveyPortal.Data.SurveyDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected SurveyTitle item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int SurveyTitleId)
        {
            using (_db)
            {
                var item = _db.SurveyTitles.Find(SurveyTitleId);

                if (item != null)
                {
                    _db.SurveyTitles.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single SurveyTitle item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public SurveyPortal.Data.Models.SurveyTitle GetItem([FriendlyUrlSegmentsAttribute(0)]int? SurveyTitleId)
        {
            if (SurveyTitleId == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.SurveyTitles.Where(m => m.SurveyTitleId == SurveyTitleId).FirstOrDefault();
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

