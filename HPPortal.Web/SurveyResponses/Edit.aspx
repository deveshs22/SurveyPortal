<%@ Page Title="SurveyResponseEdit" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Edit.aspx.cs" Inherits="HPPortal.Web.SurveyResponses.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.SurveyResponse" DefaultMode="Edit" DataKeyNames="SurveyResponseId"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the SurveyResponse with SurveyResponseId <%: Request.QueryString["SurveyResponseId"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit SurveyResponse</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
							<asp:DynamicControl Mode="Edit" 
								DataField="SurveyTitleId" 
								DataTypeName="SurveyPortal.Data.Models.SurveyTitle" 
								DataTextField="SurveyTitle1" 
								DataValueField="SurveyTitleId" 
								UIHint="ForeignKey" runat="server" />
							<asp:DynamicControl Mode="Edit" 
								DataField="CustomerId" 
								DataTypeName="SurveyPortal.Data.Models.Customer" 
								DataTextField="Name" 
								DataValueField="CustomerId" 
								UIHint="ForeignKey" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="ApproverUserId" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="ResponseDate" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="ApprovalDate" runat="server" />
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

