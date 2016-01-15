<%@ Page Title="SurveyInterpretationDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="HPPortal.Web.SurveyInterpretations.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this SurveyInterpretation?</h3>
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.SurveyInterpretation" DataKeyNames="SurveyInterpretationId"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the SurveyInterpretation with SurveyInterpretationId <%: Request.QueryString["SurveyInterpretationId"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete SurveyInterpretation</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>SurveyInterpretationId</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="SurveyInterpretationId" ID="SurveyInterpretationId" Mode="ReadOnly" />
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
									<strong>Title</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Title" ID="Title" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Description</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Description" ID="Description" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ScoreTitle</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ScoreTitle" ID="ScoreTitle" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ResultTitle</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ResultTitle" ID="ResultTitle" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ActionTitle</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ActionTitle" ID="ActionTitle" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Footer</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Footer" ID="Footer" Mode="ReadOnly" />
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

