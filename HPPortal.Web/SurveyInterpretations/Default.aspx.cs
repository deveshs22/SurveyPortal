using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using SurveyPortal.Data.Models;
using SurveyPortal.Data;

namespace HPPortal.Web.SurveyInterpretations
{
    public partial class Default : System.Web.UI.Page
    {
		protected SurveyPortal.Data.SurveyDBContext _db = new SurveyPortal.Data.SurveyDBContext();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Model binding method to get List of SurveyInterpretation entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<SurveyPortal.Data.Models.SurveyInterpretation> GetData()
        {
            return _db.SurveyInterpretations.Include(m => m.SurveyTitle);
        }
    }
}

