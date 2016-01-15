using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using SurveyPortal.Data.Models;
using SurveyPortal.Data;

namespace HPPortal.Web.Survey
{
    public partial class Insert : System.Web.UI.Page
    {
		protected SurveyPortal.Data.SurveyDBContext _db = new SurveyPortal.Data.SurveyDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            Formview1.Enabled = true;
            var urlSegments = Request.Url.Segments.ToList();
            if (urlSegments.Count == 0)
            {
                UtilityBL.Alert("Invalid Survey.", this);
                Formview1.Enabled = false;
            }
            var url = urlSegments[(urlSegments.Count - 1)];
            var survey = _db.SurveyTitles.FirstOrDefault(s => s.FirendlyUrl == url);
            if (survey == null)
            {
                UtilityBL.Alert("Invalid Survey.", this);
                Formview1.Enabled = false;
                return;
            }
            ViewState["sid"] = survey.SurveyTitleId;
            ViewState["url"] = url;
        }

        

        public IEnumerable<User> GetDoctor()
        {
            var userData = _db.Users.Where(u => u.RoleId == 2);
            return userData.OrderBy(c => c.Name);
        }

        // This is the Insert method to insert the entered Customer item
        // USAGE: <asp:FormView InsertMethod="InsertItem">
        public void InsertItem()
        {
            using (_db)
            {
                var item = new SurveyPortal.Data.Models.Customer();

                TryUpdateModel(item);

                var ddlGender = (DropDownList)Formview1.FindControl("ddlGender");
                if (ddlGender != null)
                    item.Gender = ddlGender.SelectedValue;

                if (string.IsNullOrWhiteSpace(item.Name))
                {
                    ModelState.AddModelError("Name", "Name cannot be blank");
                    UtilityBL.Alert("Name cannot be blank", this);
                }

                if (item.DOB==null)
                {
                    ModelState.AddModelError("DOB", "DOB cannot be blank");
                    UtilityBL.Alert("DOB cannot be blank", this);
                }

                if (string.IsNullOrWhiteSpace(item.Gender))
                {
                    ModelState.AddModelError("Gender", "Gender cannot be blank");
                    UtilityBL.Alert("Gender cannot be blank", this);
                }
                int doctorId=0;
                var ddlDoctor = (DropDownList)Formview1.FindControl("ddlDoctor");
                if (ddlDoctor != null)
                    doctorId = Convert.ToInt32(ddlDoctor.SelectedValue);

                if(doctorId==0)
                {
                  ModelState.AddModelError("Name", "Doctor needs to be selected");
                    UtilityBL.Alert("Doctor needs to be selected", this);
                }

                item.Active = true;

                if (ModelState.IsValid)
                {
                    // Save changes
                    _db.Customers.Add(item);
                    _db.SaveChanges();

                    var surveyResponse = new SurveyResponse
                    {
                        SurveyTitleId = Convert.ToInt32(ViewState["sid"]),
                        CustomerId = item.CustomerId,
                        ApproverUserId = doctorId
                    };

                    _db.SurveyResponses.Add(surveyResponse);
                    _db.SaveChanges();

                    Response.Redirect(string.Format("~/SurveyForm/{0}?rid={1}&m=entry", ViewState["url"].ToString(), surveyResponse.SurveyResponseId.ToString()));
                }
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("#");
            }
        }
    }
}
