<%@ Page Title="InterpretationDetailList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="HPPortal.Web.InterpretationDetails.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>InterpretationDetails List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="InterpretationDetailId" 
			ItemType="SurveyPortal.Data.Models.InterpretationDetail"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for InterpretationDetails
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="InterpretationDetailId" CommandName="Sort" CommandArgument="InterpretationDetailId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="SurveyInterpretationId" CommandName="Sort" CommandArgument="SurveyInterpretationId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="ScoreRangeStart" CommandName="Sort" CommandArgument="ScoreRangeStart" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="ScoreRangeEnd" CommandName="Sort" CommandArgument="ScoreRangeEnd" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Result" CommandName="Sort" CommandArgument="Result" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Action" CommandName="Sort" CommandArgument="Action" runat="Server" />
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
								<asp:DynamicControl runat="server" DataField="InterpretationDetailId" ID="InterpretationDetailId" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.SurveyInterpretation != null ? Item.SurveyInterpretation.Title : "" %>
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="ScoreRangeStart" ID="ScoreRangeStart" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="ScoreRangeEnd" ID="ScoreRangeEnd" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Result" ID="Result" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Action" ID="Action" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/InterpretationDetails/Details", Item.InterpretationDetailId) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/InterpretationDetails/Edit", Item.InterpretationDetailId) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/InterpretationDetails/Delete", Item.InterpretationDetailId) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

