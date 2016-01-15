<%@ Page Title="InterpretationDetail Details" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="HPPortal.Web.InterpretationDetails.Details" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
      
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.InterpretationDetail" DataKeyNames="InterpretationDetailId"
            SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the InterpretationDetail with InterpretationDetailId <%: Request.QueryString["InterpretationDetailId"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>InterpretationDetail Details</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>InterpretationDetailId</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="InterpretationDetailId" ID="InterpretationDetailId" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>SurveyInterpretationId</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.SurveyInterpretation != null ? Item.SurveyInterpretation.Title : "" %>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ScoreRangeStart</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ScoreRangeStart" ID="ScoreRangeStart" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>ScoreRangeEnd</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="ScoreRangeEnd" ID="ScoreRangeEnd" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Result</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Result" ID="Result" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>Action</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="Action" ID="Action" Mode="ReadOnly" />
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

