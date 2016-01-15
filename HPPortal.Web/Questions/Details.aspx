<%@ Page Title="Question Details" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="HPPortal.Web.Questions.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.Question" DataKeyNames="QuestionId"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Question with QuestionId <%: Request.QueryString["QuestionId"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Question Details</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>QuestionId</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="QuestionId" ID="QuestionId" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Question1</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Question1" ID="Question1" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>QuestionTypeId</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.QuestionType != null ? Item.QuestionType.QuestionTypeDesc : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>SurveySectionId</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.SurveySection != null ? Item.SurveySection.SurveySectionTtile : "" %>
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

