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

namespace HPPortal.Web.SurveyInterpretations
{
    public partial class Delete : System.Web.UI.Page
    {
		protected SurveyPortal.Data.SurveyDBContext _db = new SurveyPortal.Data.SurveyDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected SurveyInterpretation item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int SurveyInterpretationId)
        {
            using (_db)
            {
                var item = _db.SurveyInterpretations.Find(SurveyInterpretationId);

                if (item != null)
                {
                    _db.SurveyInterpretations.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single SurveyInterpretation item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public SurveyPortal.Data.Models.SurveyInterpretation GetItem([FriendlyUrlSegmentsAttribute(0)]int? SurveyInterpretationId)
        {
            if (SurveyInterpretationId == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.SurveyInterpretations.Where(m => m.SurveyInterpretationId == SurveyInterpretationId).Include(m => m.SurveyTitle).FirstOrDefault();
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

