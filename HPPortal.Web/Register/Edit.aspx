<%@ Page Title="CustomerEdit" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Edit.aspx.cs" Inherits="HPPortal.Web.Customers.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.Customer" DefaultMode="Edit" DataKeyNames="CustomerId"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Customer with CustomerId <%: Request.QueryString["CustomerId"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit Customer</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
						    <asp:DynamicControl Mode="Edit" DataField="Name" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Email" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Phone" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Active" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="DOB" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Gender" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="Pwd" runat="server" />
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

