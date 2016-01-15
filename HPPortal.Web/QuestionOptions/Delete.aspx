<%@ Page Title="QuestionOptionDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="HPPortal.Web.QuestionOptions.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this QuestionOption?</h3>
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.QuestionOption" DataKeyNames="QuestionOptionId"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the QuestionOption with QuestionOptionId <%: Request.QueryString["QuestionOptionId"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete QuestionOption</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>QuestionOptionId</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="QuestionOptionId" ID="QuestionOptionId" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>QuestionOption1</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="QuestionOption1" ID="QuestionOption1" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>QuestionId</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.Question != null ? Item.Question.Question1 : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Value</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Value" ID="Value" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Active</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Active" ID="Active" Mode="ReadOnly" />
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

