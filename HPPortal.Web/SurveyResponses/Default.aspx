<%@ Page Title="SurveyResponseList" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="HPPortal.Web.SurveyResponses.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>SurveyResponses List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="SurveyResponseId" 
			ItemType="SurveyPortal.Data.Models.SurveyResponse"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Survey Responses
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="Survey" CommandName="Sort" CommandArgument="SurveyTitleId" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="Patient Name" CommandName="Sort" CommandArgument="CustomerId" runat="Server" />
							</th>
                             <th>
								<asp:LinkButton Text="ResponseDate" CommandName="Sort" CommandArgument="ResponseDate" runat="Server" />
							</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder" />
                    </tbody>
                </table>
				<asp:DataPager PageSize="100"  runat="server">
					<Fields>
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn"  Visible="false"/>
                        <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" Visible="false"
                             />
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" Visible="false" />
                    </Fields>
				</asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
							<td>
								<%#: Item.SurveyTitle != null ? Item.SurveyTitle.SurveyTitle1 : "" %>
							</td>
							<td>
								<%#: Item.Customer != null ? Item.Customer.Name : "" %>
							</td>
                             <td>
							    <asp:DynamicControl runat="server" DataField="ResponseDate" ID="ResponseDate" Mode="ReadOnly" />
							</td>
							
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/SurveyForm/{0}?rid={1}&m=app", Item.SurveyTitle.FirendlyUrl, Item.SurveyResponseId) %>' Text="Approve" /> 
                   </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>

