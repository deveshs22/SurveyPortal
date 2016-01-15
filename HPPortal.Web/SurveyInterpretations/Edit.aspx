<%@ Page Title="SurveyInterpretationEdit" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Edit.aspx.cs" Inherits="HPPortal.Web.SurveyInterpretations.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.SurveyInterpretation" DefaultMode="Edit" DataKeyNames="SurveyInterpretationId"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the SurveyInterpretation with SurveyInterpretationId <%: Request.QueryString["SurveyInterpretationId"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit SurveyInterpretation</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
							<asp:DynamicControl Mode="Edit" 
								DataField="SurveyTitleId" 
								DataTypeName="SurveyPortal.Data.Models.SurveyTitle" 
								DataTextField="SurveyTitle1" 
								DataValueField="SurveyTitleId" 
								UIHint="ForeignKey" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Title" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Description" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="ScoreTitle" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="ResultTitle" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="ActionTitle" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Footer" runat="server" />
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

