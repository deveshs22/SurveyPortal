<%@ Page Title="QuestionOptionList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="HPPortal.Web.QuestionOptions.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>QuestionOptions List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="QuestionOptionId" 
			ItemType="SurveyPortal.Data.Models.QuestionOption"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for QuestionOptions
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="QuestionOptionId" CommandName="Sort" CommandArgument="QuestionOptionId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="QuestionOption1" CommandName="Sort" CommandArgument="QuestionOption1" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="QuestionId" CommandName="Sort" CommandArgument="QuestionId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Value" CommandName="Sort" CommandArgument="Value" runat="Server" />
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
				<asp:DataPager PageSize="15"  runat="server">
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
								<asp:DynamicControl runat="server" DataField="QuestionOptionId" ID="QuestionOptionId" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="QuestionOption1" ID="QuestionOption1" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.Question != null ? Item.Question.Question1 : "" %>
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Value" ID="Value" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Active" ID="Active" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/QuestionOptions/Details", Item.QuestionOptionId) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/QuestionOptions/Edit", Item.QuestionOptionId) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/QuestionOptions/Delete", Item.QuestionOptionId) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

