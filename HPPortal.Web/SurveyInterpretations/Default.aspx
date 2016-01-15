<%@ Page Title="SurveyInterpretationList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="HPPortal.Web.SurveyInterpretations.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>SurveyInterpretations List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="SurveyInterpretationId" 
			ItemType="SurveyPortal.Data.Models.SurveyInterpretation"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for SurveyInterpretations
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="SurveyInterpretationId" CommandName="Sort" CommandArgument="SurveyInterpretationId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="SurveyTitleId" CommandName="Sort" CommandArgument="SurveyTitleId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Title" CommandName="Sort" CommandArgument="Title" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Description" CommandName="Sort" CommandArgument="Description" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="ScoreTitle" CommandName="Sort" CommandArgument="ScoreTitle" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="ResultTitle" CommandName="Sort" CommandArgument="ResultTitle" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="ActionTitle" CommandName="Sort" CommandArgument="ActionTitle" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Footer" CommandName="Sort" CommandArgument="Footer" runat="Server" />
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
								<asp:DynamicControl runat="server" DataField="SurveyInterpretationId" ID="SurveyInterpretationId" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.SurveyTitle != null ? Item.SurveyTitle.SurveyTitle1 : "" %>
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Title" ID="Title" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Description" ID="Description" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="ScoreTitle" ID="ScoreTitle" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="ResultTitle" ID="ResultTitle" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="ActionTitle" ID="ActionTitle" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Footer" ID="Footer" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/SurveyInterpretations/Details", Item.SurveyInterpretationId) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/SurveyInterpretations/Edit", Item.SurveyInterpretationId) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/SurveyInterpretations/Delete", Item.SurveyInterpretationId) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

