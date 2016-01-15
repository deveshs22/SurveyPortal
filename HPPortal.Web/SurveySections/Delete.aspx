<%@ Page Title="SurveySectionDelete" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Delete.aspx.cs" Inherits="HPPortal.Web.SurveySections.Delete" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <h3>Are you sure want to delete this SurveySection?</h3>
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.SurveySection" DataKeyNames="SurveySectionId"
            DeleteMethod="DeleteItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the SurveySection with SurveySectionId <%: Request.QueryString["SurveySectionId"] %>
            </EmptyDataTemplate>
            <ItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Delete SurveySection</legend>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>SurveySectionId</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="SurveySectionId" ID="SurveySectionId" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>SurveySectionTtile</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="SurveySectionTtile" ID="SurveySectionTtile" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>SurveySectionDesc</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="SurveySectionDesc" ID="SurveySectionDesc" Mode="ReadOnly" />
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
									<strong>DisplaySectionHeader</strong>
								</div>
								<div class="col-sm-4">
									<asp:DynamicControl runat="server" DataField="DisplaySectionHeader" ID="DisplaySectionHeader" Mode="ReadOnly" />
								</div>
							</div>
							<div class="row">
								<div class="col-sm-2 text-right">
									<strong>SectionTypeId</strong>
								</div>
								<div class="col-sm-4">
									<%#: Item.SectionType != null ? Item.SectionType.SectionTypeDesc : "" %>
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

