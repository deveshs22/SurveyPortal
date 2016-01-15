<%@ Page Title="SurveySectionList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="HPPortal.Web.SurveySections.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>SurveySections List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="SurveySectionId" 
			ItemType="SurveyPortal.Data.Models.SurveySection"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for SurveySections
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="SurveySectionId" CommandName="Sort" CommandArgument="SurveySectionId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="SurveySectionTtile" CommandName="Sort" CommandArgument="SurveySectionTtile" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="SurveySectionDesc" CommandName="Sort" CommandArgument="SurveySectionDesc" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="SurveyTitleId" CommandName="Sort" CommandArgument="SurveyTitleId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="DisplaySectionHeader" CommandName="Sort" CommandArgument="DisplaySectionHeader" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="SectionTypeId" CommandName="Sort" CommandArgument="SectionTypeId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Active" CommandName="Sort" CommandArgument="Active" runat="Server" />
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
								<asp:DynamicControl runat="server" DataField="SurveySectionId" ID="SurveySectionId" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="SurveySectionTtile" ID="SurveySectionTtile" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="SurveySectionDesc" ID="SurveySectionDesc" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.SurveyTitle != null ? Item.SurveyTitle.SurveyTitle1 : "" %>
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="DisplaySectionHeader" ID="DisplaySectionHeader" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.SectionType != null ? Item.SectionType.SectionTypeDesc : "" %>
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Active" ID="Active" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/SurveySections/Details", Item.SurveySectionId) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/SurveySections/Edit", Item.SurveySectionId) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/SurveySections/Delete", Item.SurveySectionId) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

