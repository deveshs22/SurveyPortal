using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using SurveyPortal.Data.Models;
using SurveyPortal.Data;
using Microsoft.AspNet.FriendlyUrls;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using System.Web.UI.HtmlControls;


namespace HPPortal.Web
{
    public partial class SurveyPage : System.Web.UI.Page
    {
        protected SurveyPortal.Data.SurveyDBContext _db = new SurveyPortal.Data.SurveyDBContext();

        public const string ApproveMode = "app";
        public const string VieMode = "view";
        public const string EntryMode = "entry";
                      
        protected void Page_Load(object sender, EventArgs e)
        {
            var urlSegments = Request.Url.Segments.ToList();
            if (urlSegments.Count == 0)
                return;
            var surveyUrl = urlSegments[(urlSegments.Count - 1)];

            if (Request.QueryString["rid"] == null)
            {
                Response.Redirect(string.Format("Survey/{0}", surveyUrl));
            }

            var responseId = Convert.ToInt32(Request.QueryString["rid"]);
            var response = _db.SurveyResponses.FirstOrDefault(c => c.SurveyResponseId == responseId);
            if (response == null)
            {
                Response.Redirect(string.Format("Survey/{0}", surveyUrl));
            }
            else
            {
                lblName.Text = response.Customer.Name;
                lblGender.Text = response.Customer.Gender;
                lblDOB.Text = response.Customer.DOB.Value.ToShortDateString();
                lblDoctor.Text = response.User.Name;
            }

            if (!response.SurveyTitle.FirendlyUrl.Equals(surveyUrl, StringComparison.InvariantCultureIgnoreCase))
            {
                lblSurveyTitle.Text = "Invalid Survey";
                btnSubmit.Enabled = false;
                return;
            }

            UtilityBL.Mode mode = UtilityBL.Mode.None;
            if (Request.QueryString["m"] != null)
            {
                var qString = Request.QueryString["m"];

                if (qString.Equals(ApproveMode, StringComparison.InvariantCultureIgnoreCase))
                    mode = UtilityBL.Mode.ApproveMode;

                else if (qString.Equals(VieMode, StringComparison.InvariantCultureIgnoreCase))
                    mode = UtilityBL.Mode.ViewMode;

                else if(qString.Equals(EntryMode, StringComparison.InvariantCultureIgnoreCase))
                    mode = UtilityBL.Mode.Entry;
            }


            if (mode == UtilityBL.Mode.None)
            {
                lblSurveyTitle.Text = "Invalid Survey";
                btnSubmit.Enabled = false;
                return;
            }

             if (mode == UtilityBL.Mode.Entry && response.ResponseDate !=  null)
            {
                lblSurveyTitle.Text = "Survey already submitted!";
                btnSubmit.Enabled = false;
                return;
            }


            if (mode == UtilityBL.Mode.ApproveMode)
            {
                btnSubmit.Visible = false;
                btnApprove.Visible = true;
            }

            if (mode == UtilityBL.Mode.ViewMode || (SessionData.Current.UserId != response.ApproverUserId && response.ResponseDate != null))
            {
                btnSubmit.Visible = false;
                btnApprove.Visible = true;
                btnApprove.Enabled = false;

                if (response.ApprovalDate != null)
                    btnApprove.Text = string.Format("Approved on {0}", response.ApprovalDate.Value);
            }            

            PopulateSurvey(response, mode);
        }

        public SurveyPortal.Data.Models.SurveyTitle GetItem([FriendlyUrlSegmentsAttribute(0)]int? SurveyId)
        {
            if (SurveyId == null)
            {
                return null;
            }

            using (_db)
            {
                return _db.SurveyTitles.Find(SurveyId);
            }
        }

        private void PopulateSurvey(SurveyResponse response, UtilityBL.Mode mode)
        {
            var survey = response.SurveyTitle;

            if (survey == null)
            {
                lblSurveyTitle.Text = "Invalid Survey";
                return;
            }
            lblSurveyTitle.Text = survey.SurveyTitle1;
            lblSurveyDescription.Text = survey.Description;

            var score = 0;
            var hasAnswers = false;
            if (response.QuestionResponses.Any())
                hasAnswers = true;

            foreach (var section in survey.SurveySections)
            {

                var divSection = new HtmlGenericControl("div");
                divSection.Attributes.Add("id", "divSection" + section.SurveySectionId.ToString());
                divSection.Attributes.Add("class", "panel panel-info");

                if (section.SectionTypeId == (int)UtilityBL.SectionType.Doctor)
                {
                    if (mode != UtilityBL.Mode.Entry)
                        pnlDoctorSection.Controls.Add(divSection);
                    else
                        continue;
                }
                else
                    Panel1.Controls.Add(divSection);

                var divSectionTitle = new HtmlGenericControl("div");
                divSectionTitle.Attributes.Add("id", "divSectionTitle" + section.SurveySectionId.ToString());
                divSectionTitle.Attributes.Add("class", "panel-heading");
                divSection.Controls.Add(divSectionTitle);

                if (section.DisplaySectionHeader && !string.IsNullOrEmpty(section.SurveySectionTtile))
                {
                    var lblSectionTitle = new Label();
                    lblSectionTitle.Text = section.SurveySectionTtile;
                    lblSectionTitle.Font.Bold = true;
                    lblSectionTitle.Font.Size = FontUnit.Large;
                    divSectionTitle.Controls.Add(lblSectionTitle);

                    if (!string.IsNullOrEmpty(section.SurveySectionDesc))
                    {
                        var sectionPara = new HtmlGenericControl("p");
                        sectionPara.Attributes.Add("id", "p" + section.SurveySectionId.ToString());
                        divSectionTitle.Controls.Add(sectionPara);

                        var lblSectionDescription = new Label();
                        lblSectionDescription.Text = section.SurveySectionDesc;
                        lblSectionDescription.Font.Size = FontUnit.Small;
                        sectionPara.Controls.Add(lblSectionDescription);
                    }
                }

                var divSectionBody = new HtmlGenericControl("div");
                divSectionBody.Attributes.Add("id", "divSectionBody" + section.SurveySectionId.ToString());
                divSectionBody.Attributes.Add("class", "panel-body");
                divSection.Controls.Add(divSectionBody);

                foreach (var q in section.Questions)
                {
                    var divQuestion = new HtmlGenericControl("div");
                    divQuestion.Attributes.Add("id", "divQuestion" + q.QuestionId.ToString());
                    divQuestion.Attributes.Add("class", "panel panel-default");
                    divSectionBody.Controls.Add(divQuestion);

                    var divQuestionTitle = new HtmlGenericControl("div");
                    divQuestionTitle.Attributes.Add("id", "divQuestionTitle" + q.QuestionId.ToString());
                    divQuestionTitle.Attributes.Add("class", "panel-heading");
                    divQuestion.Controls.Add(divQuestionTitle);


                    var lblQuestion = new Label();
                    lblQuestion.Text = q.Question1;
                    lblQuestion.ID = "lblQuestion" + q.QuestionId.ToString();
                    lblQuestion.Font.Bold = true;
                    divQuestionTitle.Controls.Add(lblQuestion);

                    var divQuestionBody = new HtmlGenericControl("div");
                    divQuestionBody.Attributes.Add("class", "panel-body");
                    divQuestionBody.Attributes.Add("id", "divQuestionBody" + q.QuestionId.ToString());
                    divQuestion.Controls.Add(divQuestionBody);

                    if (q.QuestionTypeId == 1)
                    {
                        var rdbList = new RadioButtonList();
                        rdbList.ID = "ctrl" + q.QuestionId.ToString();
                        rdbList.DataTextField = "QuestionOption1";
                        rdbList.DataValueField = "QuestionOptionId";
                        rdbList.DataSource = q.QuestionOptions;
                        rdbList.DataBind();
                        rdbList.Attributes.Add("class", "radio radiobuttonlist");

                        if (hasAnswers)
                        {
                            var answr = q.QuestionResponses.FirstOrDefault(r => r.SurveyResponse.SurveyResponseId == response.SurveyResponseId);
                            if (answr != null)
                                rdbList.SelectedValue = answr.QuestionOptionId.ToString();
                        }

                        if (q.DependentonQuestion != null)
                        {
                            var parentAnswer = q.DependentonQuestion.QuestionResponses.FirstOrDefault(r => r.SurveyResponse.SurveyResponseId == response.SurveyResponseId);
                            if (parentAnswer == null || q.EnabledValue != parentAnswer.ResponseText)
                            {
                                foreach (ListItem radio in rdbList.Items)
                                    radio.Enabled = false;
                            }
                        }
                            
                        divQuestionBody.Controls.Add(rdbList);
                    }

                    else if (q.QuestionTypeId == 2)
                    {
                        var chkList = new CheckBoxList();
                        chkList.ID = "ctrl" + q.QuestionId.ToString();
                        chkList.DataTextField = "QuestionOption1";
                        chkList.DataValueField = "QuestionOptionId";
                        chkList.DataSource = q.QuestionOptions;
                        chkList.DataBind();
                        chkList.Attributes.Add("class", "checkbox checked-list-box");

                        if (hasAnswers)
                        {
                            foreach (ListItem item in chkList.Items)
                            {
                                if (q.QuestionResponses.Any(r => r.QuestionOptionId == Convert.ToInt32(item.Value) && r.SurveyResponse.SurveyResponseId == response.SurveyResponseId))
                                {
                                    item.Selected = true;
                                    var qOption = q.QuestionOptions.FirstOrDefault(o => o.QuestionOptionId == Convert.ToInt32(item.Value));
                                }
                            }
                        }

                        if (q.DependentonQuestion != null)
                            chkList.Attributes.Add("disabled", "disabled");

                        divQuestionBody.Controls.Add(chkList);
                    }

                    if (q.QuestionTypeId == 3)
                    {
                        var txt = new TextBox();
                        txt.ID = "ctrl" + q.QuestionId.ToString();
                        txt.Attributes.Add("class", "form-control input-md col-md-10");
                        txt.Attributes.Add("style", "width:80%; max-width:700px;");

                        if (hasAnswers)
                        {
                            var answr = q.QuestionResponses.FirstOrDefault(r => r.SurveyResponse.SurveyResponseId == response.SurveyResponseId);
                            if (answr != null)
                                txt.Text = answr.ResponseText;
                        }

                        if (mode == UtilityBL.Mode.ViewMode || mode == UtilityBL.Mode.ApproveMode)
                            txt.ReadOnly = true;

                        if (q.DependentonQuestion != null)
                            txt.Attributes.Add("disabled", "disabled");

                        divQuestionBody.Controls.Add(txt);
                    }
                }
            }
            if ((mode == UtilityBL.Mode.ViewMode || mode == UtilityBL.Mode.ApproveMode)
                && survey.SurveySections.Any(s => s.Questions.Any(q => q.QuestionOptions.Sum(o => o.Value ?? 0) > 0)))
            {
                score = response.QuestionResponses.Where(x => x.Question.SurveySection.SectionTypeId == (int)UtilityBL.SectionType.Patient)
                                            .Select(s => s.QuestionOption.Value).Sum(r => r.Value);

                var interpretation = _db.InterpretationDetails.FirstOrDefault(d => d.SurveyInterpretation.SurveyTitleId == response.SurveyTitleId
                                                                && d.ScoreRangeStart >= score && score <= d.ScoreRangeEnd);

                if (interpretation != null)
                {
                    pnlSurveyInterpretation.Visible = true;

                    lblScore.Text = score.ToString();
                    lblResult.Text = interpretation.Result;

                    if (!string.IsNullOrEmpty(interpretation.Action))
                        lblAction.Text = interpretation.Action;
                    else
                        lblACtionCaption.Visible = false;
                }
            }

            if (mode == UtilityBL.Mode.ApproveMode)
                DependetQuestionState(response, UtilityBL.SectionType.Doctor);
            else if (mode == UtilityBL.Mode.Entry)
                DependetQuestionState(response, UtilityBL.SectionType.Patient);
        }       

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var responseId = Convert.ToInt32(Request.QueryString["rid"]);
            var surveyResponse = _db.SurveyResponses.Find(responseId);

            SaveSelection(surveyResponse, UtilityBL.SectionType.Patient);

            surveyResponse.ResponseDate = DateTime.Now;
            _db.SaveChanges();

            UtilityBL.AlertAndRedirect(this, "Survey submitted successfully!!", string.Format("/Survey/{0}", surveyResponse.SurveyTitle.FirendlyUrl));
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            var responseId = Convert.ToInt32(Request.QueryString["rid"]);
            var surveyResponse = _db.SurveyResponses.Find(responseId);

            SaveSelection(surveyResponse, UtilityBL.SectionType.Doctor);

            surveyResponse.ApprovalDate = DateTime.Now;
            _db.SaveChanges();
            UtilityBL.AlertAndRedirect(this, "Survey approved successfully!!", "/Default");
        }

        private void SaveSelection(SurveyResponse surveyResponse,  UtilityBL.SectionType sectionType)
        {
           foreach (var section in surveyResponse.SurveyTitle.SurveySections.Where(s => s.SectionTypeId == (int)sectionType))
            {
                foreach (var question in section.Questions)
                {
                    int responseValue;
                    string responseText;
                    var ctrl = "ctrl" + question.QuestionId.ToString();

                    if (question.QuestionTypeId == 1)
                    {
                        var rdbList = Form.FindControl(ctrl) as RadioButtonList;
                        if (rdbList.SelectedValue != "" && rdbList.Enabled)
                        {
                            responseValue = Convert.ToInt32(rdbList.SelectedValue);
                            responseText = rdbList.SelectedItem.Text;

                            var answer = new QuestionResponse
                            {
                                QuestionId = question.QuestionId,
                                QuestionOptionId = responseValue,
                                ResponseText = responseText,
                                SurveyResponseId = surveyResponse.SurveyResponseId,
                            };

                            _db.QuestionResponses.Add(answer);
                            _db.SaveChanges();
                        }
                    }

                    if (question.QuestionTypeId == 2)
                    {
                        var chkList = Form.FindControl(ctrl) as CheckBoxList;
                        foreach (ListItem item in chkList.Items)
                        {
                            if (item.Selected)
                            {
                                responseValue = Convert.ToInt32(item.Value);
                                responseText = item.Text;

                                var answer = new QuestionResponse
                                {
                                    QuestionId = question.QuestionId,
                                    QuestionOptionId = responseValue,
                                    ResponseText = responseText,
                                    SurveyResponseId = surveyResponse.SurveyResponseId,
                                };

                                _db.QuestionResponses.Add(answer);
                                _db.SaveChanges();
                            }
                        }
                    }

                    if (question.QuestionTypeId == 3)
                    {
                        var txtBox = Form.FindControl(ctrl) as TextBox;
                        responseText = txtBox.Text;

                        var answer = new QuestionResponse
                        {
                            QuestionId = question.QuestionId,
                            ResponseText = responseText,
                            SurveyResponseId = surveyResponse.SurveyResponseId,
                        };

                        _db.QuestionResponses.Add(answer);
                        _db.SaveChanges();
                    }
                }
            }

        }

        private void DependetQuestionState(SurveyResponse surveyResponse, UtilityBL.SectionType sectionType)
        {
            foreach (var section in surveyResponse.SurveyTitle.SurveySections.Where(s => s.SectionTypeId == (int)sectionType))
            {
                foreach (var question in section.Questions)
                {                    
                    var ctrl = "ctrl" + question.QuestionId.ToString();
                    dynamic rdbList = new RadioButtonList(); 
                    if (question.QuestionTypeId == 1)
                    {
                        rdbList = Form.FindControl(ctrl) as RadioButtonList;
                    }

                    if (question.QuestionTypeId == 2)
                    {
                        rdbList = Form.FindControl(ctrl) as CheckBoxList;
                    }
                  
                    if (question.QuestionsDependent != null && question.QuestionsDependent.Count > 0)
                    {
                        foreach (var dependent in question.QuestionsDependent)
                        {
                            var divId = "divQuestion" + dependent.QuestionId.ToString();
                            var div = Form.FindControl(divId);
                            rdbList.Attributes.Add("onclick", "JavaScript: radioButtonListOnClick(this,'" + divId + "','" + dependent.EnabledValue + "');");
                        }
                    }                   
                    
                }
            }

        }
    }
}