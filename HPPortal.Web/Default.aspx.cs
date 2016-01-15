using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using SurveyPortal.Data.Models;
using SurveyPortal.Data;

namespace HPPortal.Web
{
    public partial class Default : System.Web.UI.Page
    {
        protected SurveyPortal.Data.SurveyDBContext _db = new SurveyPortal.Data.SurveyDBContext();
        public bool IsAdmin = false;
        public bool IsDoctor = false;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                txtPendingSearch.Text = string.Empty;

            if (SessionData.Current.RoleId == 1)
            {
                IsAdmin = true;
                var headingLabel = lstViewPending.FindControl("lblHeadingDocName") as LinkButton;
                if (headingLabel != null)
                    headingLabel.Visible = true;

                var headingLabel2 = lstViewApproved.FindControl("lblHeadingDocName") as LinkButton;
                if (headingLabel2 != null)
                    headingLabel2.Visible = true;

                pnlLinks.Visible = true;
                pnlSurvey.Visible = true;
            }
            if (SessionData.Current.RoleId == 2)
            {
                IsDoctor = true;
            }
        }

        public IQueryable<SurveyPortal.Data.Models.SurveyResponse> GetData()
        {
            var customerName = txtPendingSearch.Text.Trim();

            if (SessionData.Current.RoleId == 1)
            {
                return _db.SurveyResponses.Include(m => m.Customer).Include(m => m.SurveyTitle)
                .Where(s => s.ApprovalDate == null && s.ResponseDate!= null
                        && (s.Customer.Name.Contains(customerName) || string.IsNullOrEmpty(customerName)))
                .OrderByDescending(s => s.ResponseDate);

            }           

            return _db.SurveyResponses.Include(m => m.Customer).Include(m => m.SurveyTitle)
                .Where(s => s.ApprovalDate == null && s.ResponseDate != null && s.ApproverUserId == SessionData.Current.UserId
                        && (s.Customer.Name.Contains(customerName) || string.IsNullOrEmpty(customerName)))
                .OrderByDescending(s => s.ResponseDate);

        }    
        

        public IQueryable<SurveyPortal.Data.Models.SurveyResponse> GetApprovedSurveys()
        {
            var customerName = txtSearchApproved.Text.Trim();

            if (SessionData.Current.RoleId == 1)
            {
                return _db.SurveyResponses.Include(m => m.Customer).Include(m => m.SurveyTitle)
                .Where(s => s.ApprovalDate != null && (s.Customer.Name.Contains(customerName) || string.IsNullOrEmpty(customerName)))
                .OrderByDescending(s => s.ApprovalDate);

            }

            return _db.SurveyResponses.Include(m => m.Customer).Include(m => m.SurveyTitle)
                .Where(s => s.ApprovalDate != null && s.ApproverUserId == SessionData.Current.UserId
                  && (s.Customer.Name.Contains(customerName) || string.IsNullOrEmpty(customerName)))
                .OrderByDescending(s => s.ApprovalDate);
        }


        public IQueryable<SurveyPortal.Data.Models.SurveyTitle> GetSurveys()
        {
            return _db.SurveyTitles.Where(s => s.Active);
        }

        protected void btnSearchPendingApproval_Click(object sender, EventArgs e)
        {
            lstViewPending.DataBind();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtPendingSearch.Text = string.Empty;
            lstViewPending.DataBind();
        }

        protected void lstViewPending_DataBound(object sender, EventArgs e)
        {
            DataPager pager = (DataPager)lstViewPending.FindControl("dtPager");

            if (pager != null && pager.TotalRowCount > 0)
                pager.Visible = (pager.PageSize < pager.TotalRowCount);
        }

        protected void lstViewApproved_DataBound(object sender, EventArgs e)
        {
            DataPager pager = (DataPager)lstViewApproved.FindControl("dtPager");

            if (pager != null && pager.TotalRowCount>0)
                pager.Visible = (pager.PageSize < pager.TotalRowCount);
        }

        protected void btnSearchApproved_Click(object sender, EventArgs e)
        {
            lstViewApproved.DataBind();
        }

        protected void btnResetApproved_Click(object sender, EventArgs e)
        {
            txtSearchApproved.Text = string.Empty;
            lstViewApproved.DataBind();
        }
    }
}