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
namespace HPPortal.Web.InterpretationDetails
{
    public partial class Edit : System.Web.UI.Page
    {
		protected SurveyPortal.Data.SurveyDBContext _db = new SurveyPortal.Data.SurveyDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Update methd to update the selected InterpretationDetail item
        // USAGE: <asp:FormView UpdateMethod="UpdateItem">
        public void UpdateItem(int  InterpretationDetailId)
        {
            using (_db)
            {
                var item = _db.InterpretationDetails.Find(InterpretationDetailId);

                if (item == null)
                {
                    // The item wasn't found
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", InterpretationDetailId));
                    return;
                }

                TryUpdateModel(item);

                if (ModelState.IsValid)
                {
                    // Save changes here
                    _db.SaveChanges();
                    Response.Redirect("../Default");
                }
            }
        }

        // This is the Select method to selects a single InterpretationDetail item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public SurveyPortal.Data.Models.InterpretationDetail GetItem([FriendlyUrlSegmentsAttribute(0)]int? InterpretationDetailId)
        {
            if (InterpretationDetailId == null)
            {
                return null;
            }

            using (_db)
            {
                return _db.InterpretationDetails.Find(InterpretationDetailId);
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
