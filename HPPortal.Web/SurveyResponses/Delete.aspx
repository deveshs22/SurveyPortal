<%@ Page Title="SurveyResponseDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="HPPortal.Web.SurveyResponses.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this SurveyResponse?</h3>
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.SurveyResponse" DataKeyNames="SurveyResponseId"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the SurveyResponse with SurveyResponseId <%: Request.QueryString["SurveyResponseId"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete SurveyResponse</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>SurveyResponseId</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="SurveyResponseId" ID="SurveyResponseId" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>SurveyTitleId</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.SurveyTitle != null ? Item.SurveyTitle.SurveyTitle1 : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>CustomerId</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.Customer != null ? Item.Customer.Name : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ApproverUserId</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ApproverUserId" ID="ApproverUserId" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ResponseDate</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ResponseDate" ID="ResponseDate" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ApprovalDate</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ApprovalDate" ID="ApprovalDate" Mode="ReadOnly" />
								</div>
							</div>
                 	<div class="row">
					  &nbsp;
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

