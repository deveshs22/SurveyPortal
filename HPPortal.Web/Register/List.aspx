<%@ Page Title="CustomerList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="List.aspx.cs" Inherits="HPPortal.Web.Customers.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>Customers List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="CustomerId" 
			ItemType="SurveyPortal.Data.Models.Customer"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Customers
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="CustomerId" CommandName="Sort" CommandArgument="CustomerId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Name" CommandName="Sort" CommandArgument="Name" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Email" CommandName="Sort" CommandArgument="Email" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Phone" CommandName="Sort" CommandArgument="Phone" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Active" CommandName="Sort" CommandArgument="Active" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="DOB" CommandName="Sort" CommandArgument="DOB" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Gender" CommandName="Sort" CommandArgument="Gender" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Pwd" CommandName="Sort" CommandArgument="Pwd" runat="Server" />
							</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder" />
                    </tbody>
                </table>
				<asp:DataPager PageSize="5"  runat="server">
					<Fields>
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                        <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                    </Fields>
				</asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
							<td>
								<asp:DynamicControl runat="server" DataField="CustomerId" ID="CustomerId" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Name" ID="Name" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Email" ID="Email" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Phone" ID="Phone" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Active" ID="Active" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="DOB" ID="DOB" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Gender" ID="Gender" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Pwd" ID="Pwd" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Customers/Details", Item.CustomerId) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Customers/Edit", Item.CustomerId) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Customers/Delete", Item.CustomerId) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

