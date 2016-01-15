<%@ Page Title="QuestionOption Details" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="HPPortal.Web.QuestionOptions.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.QuestionOption" DataKeyNames="QuestionOptionId"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the QuestionOption with QuestionOptionId <%: Request.QueryString["QuestionOptionId"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>QuestionOption Details</legend>
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
							<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Back" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </ItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>

