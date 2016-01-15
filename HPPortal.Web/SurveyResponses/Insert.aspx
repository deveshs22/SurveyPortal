<%@ Page Title="SurveyResponseInsert" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Insert.aspx.cs" Inherits="HPPortal.Web.SurveyResponses.Insert" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.SurveyResponse" DefaultMode="Insert"
            InsertItemPosition="FirstItem" InsertMethod="InsertItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <InsertItemTemplate>
                <fieldset class="form-horizontal">
				<legend>Insert SurveyResponse</legend>
		        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
							<asp:DynamicControl Mode="Insert" 
								DataField="SurveyTitleId" 
								DataTypeName="SurveyPortal.Data.Models.SurveyTitle" 
								DataTextField="SurveyTitle1" 
								DataValueField="SurveyTitleId" 
								UIHint="ForeignKey" runat="server" />
							<asp:DynamicControl Mode="Insert" 
								DataField="CustomerId" 
								DataTypeName="SurveyPortal.Data.Models.Customer" 
								DataTextField="Name" 
								DataValueField="CustomerId" 
								UIHint="ForeignKey" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="ApproverUserId" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="ResponseDate" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="ApprovalDate" runat="server" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button runat="server" ID="InsertButton" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
                        </div>
					</div>
                </fieldset>
            </InsertItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
