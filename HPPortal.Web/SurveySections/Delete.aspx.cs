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

namespace HPPortal.Web.SurveySections
{
    public partial class Delete : System.Web.UI.Page
    {
		protected SurveyPortal.Data.SurveyDBContext _db = new SurveyPortal.Data.SurveyDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected SurveySection item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int SurveySectionId)
        {
            using (_db)
            {
                var item = _db.SurveySections.Find(SurveySectionId);

                if (item != null)
                {
                    _db.SurveySections.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single SurveySection item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public SurveyPortal.Data.Models.SurveySection GetItem([FriendlyUrlSegmentsAttribute(0)]int? SurveySectionId)
        {
            if (SurveySectionId == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.SurveySections.Where(m => m.SurveySectionId == SurveySectionId).Include(m => m.SectionType).Include(m => m.SurveyTitle).FirstOrDefault();
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

