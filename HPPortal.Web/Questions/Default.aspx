﻿<%@ Page Title="QuestionList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="HPPortal.Web.Questions.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>Questions List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="QuestionId" 
			ItemType="SurveyPortal.Data.Models.Question"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Questions
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                          <%--  <th>
								<asp:LinkButton Text="QuestionId" CommandName="Sort" CommandArgument="QuestionId" runat="Server" />
							</th>--%>
                            <th>
								<asp:LinkButton Text="Question1" CommandName="Sort" CommandArgument="Question1" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="QuestionTypeId" CommandName="Sort" CommandArgument="QuestionTypeId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="SurveySectionId" CommandName="Sort" CommandArgument="SurveySectionId" runat="Server" />
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
							<%--<td>
								<asp:DynamicControl runat="server" DataField="QuestionId" ID="QuestionId" Mode="ReadOnly" />
							</td>--%>
							<td>
								<asp:DynamicControl runat="server" DataField="Question1" ID="Question1" Mode="ReadOnly" />
							</td>
							<td>
								<%#: Item.QuestionType != null ? Item.QuestionType.QuestionTypeDesc : "" %>
							</td>
							<td>
								<%#: Item.SurveySection != null ? Item.SurveySection.SurveySectionTtile : "" %>
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="Active" ID="Active" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Questions/Details", Item.QuestionId) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Questions/Edit", Item.QuestionId) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Questions/Delete", Item.QuestionId) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>
