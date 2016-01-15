<%@ Page Title="SurveySectionEdit" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Edit.aspx.cs" Inherits="HPPortal.Web.SurveySections.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.SurveySection" DefaultMode="Edit" DataKeyNames="SurveySectionId"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the SurveySection with SurveySectionId <%: Request.QueryString["SurveySectionId"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit SurveySection</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
						    <asp:DynamicControl Mode="Edit" DataField="SurveySectionTtile" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="SurveySectionDesc" runat="server" />
							<asp:DynamicControl Mode="Edit" 
								DataField="SurveyTitleId" 
								DataTypeName="SurveyPortal.Data.Models.SurveyTitle" 
								DataTextField="SurveyTitle1" 
								DataValueField="SurveyTitleId" 
								UIHint="ForeignKey" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="DisplaySectionHeader" runat="server" />
							<asp:DynamicControl Mode="Edit" 
								DataField="SectionTypeId" 
								DataTypeName="SurveyPortal.Data.Models.SectionType" 
								DataTextField="SectionTypeDesc" 
								DataValueField="SectionTypeId" 
								UIHint="ForeignKey" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Active" runat="server" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
							<asp:Button runat="server" ID="UpdateButton" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
							<asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </EditItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

