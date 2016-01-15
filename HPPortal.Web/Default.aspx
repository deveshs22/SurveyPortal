<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HPPortal.Web.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>&nbsp;</p>

    <div class="row">
        <div class="col-md-6 col-sm-6">
            <asp:Panel ID="pnlSurvey" runat="server" Visible="false">
                <div class="panel panel-info">
                 <div class="panel-heading">
                    <h3 class="panel-title"><b>Surveys</b></h3>
                  </div>
                <div class="table-responsive" style="max-height: 220px; overflow: auto;">
                    <asp:ListView ID="ListView2" runat="server"
                        DataKeyNames="SurveyTitleId"
                        ItemType="SurveyPortal.Data.Models.SurveyTitle"
                        SelectMethod="GetSurveys">
                        <EmptyDataTemplate>
                            There are no entries found for Surveys
                        </EmptyDataTemplate>
                        <LayoutTemplate>
                            <table class=" table table-striped" >

                                <tr runat="server" id="itemPlaceholder"/>

                            </table>

                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td style="height:41px; padding-left:12px; padding-top:10px;">
                                    <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/Survey/{0}", Item.FirendlyUrl)%>' Text='<%# Item.SurveyTitle1%>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                </div>
            </asp:Panel>
        </div>
        <div class="col-md-6 col-sm-6">
            <asp:Panel ID="pnlLinks" runat="server" Visible="false">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><b>Quick Links</b></h3>
                    </div>
                    <div class="list-group">
                        <a href="SurveyTitles" class="list-group-item list-group-item-info">Manage Survey</a>
                        <a href="SurveySections" class="list-group-item list-group-item-warning">Manage Survey Sections</a>
                        <a href="Questions" class="list-group-item list-group-item-warning">Manage Questions</a>
                        <a href="QuestionOptions" class="list-group-item list-group-item-warning">Manage Options</a>
                        <a href="Users" class="list-group-item ">Manage Users</a>
                        <a href="SurveyInterpretations" class="list-group-item ">Manage Survey Interpretations</a>
                        <a href="InterpretationDetails" class="list-group-item ">Manage Interpretations Details</a>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

    <asp:UpdatePanel runat="server" ID="pnlUpdatePending">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearchPendingApproval"/>
            <asp:AsyncPostBackTrigger ControlID="btnCancel" />

        </Triggers>
        <ContentTemplate>
    <div class="panel panel-info">
        <div class="panel-heading" style="padding:5px 15px;">
            <div class="row">
                <div class="col-sm-4 col-md-5">
                    <h3 class="panel-title" style="padding:5px 2px 2px 2px;"><b>Pending Approval</b></h3>
                </div>
                <div class="col-sm-8 col-md-7">
                    <div class="input-group input-group-sm">
                        <asp:TextBox runat="server" ID="txtPendingSearch" ToolTip="Search by Patient Name" placeholder="Search by Patient Name" class="form-control pull-right" Width="200px"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:Button runat="server" ID="btnSearchPendingApproval" Text="Search" class="btn btn-primary" OnClick="btnSearchPendingApproval_Click"/>
                            <asp:Button runat="server" ID="btnCancel" Text="Reset" class="btn btn-default" OnClick="btnCancel_Click"/>
                        </span>
                    </div> <!-- /input-group -->

                </div><!-- /.col-lg-6 -->
            </div>
        </div>
        <div class="panel-body" style="overflow: auto;">

            <asp:ListView ID="lstViewPending" runat="server"
                DataKeyNames="SurveyResponseId"
                ItemType="SurveyPortal.Data.Models.SurveyResponse"
                SelectMethod="GetData"  OnDataBound="lstViewPending_DataBound">
                <EmptyDataTemplate>
                    No Pending approval found..
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
                                    <asp:LinkButton Text="Response Date" CommandName="Sort" CommandArgument="ResponseDate" runat="Server" />
                                </th>
                                <th>
                                    <asp:LinkButton runat="server" ID="lblHeadingDocName" CommandName="Sort" Text="Physician Assigned" Visible="false"></asp:LinkButton>&nbsp;
                                </th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr runat="server" id="itemPlaceholder" />
                        </tbody>
                    </table>
                    <asp:DataPager ID="dtPager" runat="server" class="btn-group btn-group-sm" PageSize="10" > 
        <Fields>
            <asp:NextPreviousPagerField PreviousPageText="< Prev" FirstPageText="|<<" ShowPreviousPageButton="true"
                ShowFirstPageButton="false" ShowNextPageButton="false" ShowLastPageButton="false"
                ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
            <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-info disabled"  RenderNonBreakingSpacesBetweenControls="false"
                NumericButtonCssClass="btn btn-default" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />
            <asp:NextPreviousPagerField NextPageText="Next >" LastPageText=">>|" ShowNextPageButton="true"
                ShowLastPageButton="false" ShowPreviousPageButton="false" ShowFirstPageButton="false"
                ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false"/>
        </Fields>
    </asp:DataPager>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <%#: Item.SurveyTitle != null ? Item.SurveyTitle.SurveyTitle1 : ""%>
                        </td>
                        <td>
                            <%#: Item.Customer != null ? Item.Customer.Name : ""%>
                        </td>
                        <td>
                            <asp:DynamicControl runat="server" DataField="ResponseDate" ID="ResponseDate" Mode="ReadOnly" />
                        </td>

                        <td runat="server" id="tdApprove" visible='<%# IsDoctor%>'>

                            <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/SurveyForm/{0}?rid={1}&m=app", Item.SurveyTitle.FirendlyUrl, Item.SurveyResponseId)%>' Text="Approve" />

                        </td>
                        <td runat="server" id="tdDoctor" visible='<%# IsAdmin%>'>

                            <%#: Item.User != null ? Item.User.Name : ""%>                        
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>

        </div>
    </div>
            </ContentTemplate>
</asp:UpdatePanel>

      <asp:UpdatePanel runat="server" ID="UpdatePanel2">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSearchApproved"/>
            <asp:AsyncPostBackTrigger ControlID="btnResetApproved" />

        </Triggers>
        <ContentTemplate>
    <div class="panel panel-info">
        <div class="panel-heading" style="padding:5px 15px;">
            <div class="row">
                <div class="col-sm-4 col-md-5">
                    <h3 class="panel-title" style="padding:5px 2px 2px 2px;"><b>Approved Surveys</b></h3>
                </div>
                <div class="col-sm-8 col-md-7">
                    <div class="input-group input-group-sm">
                        <asp:TextBox runat="server" ID="txtSearchApproved" ToolTip="Search by Patient Name" placeholder="Search by Patient Name" class="form-control pull-right" Width="200px"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:Button runat="server" ID="btnSearchApproved" Text="Search" class="btn btn-primary" OnClick="btnSearchApproved_Click"/>
                            <asp:Button runat="server" ID="btnResetApproved" Text="Reset" class="btn btn-default" OnClick="btnResetApproved_Click"/>
                        </span>
                    </div> <!-- /input-group -->

                </div><!-- /.col-lg-6 -->
            </div>
        </div>
        <div class="panel-body" style="overflow:auto;">
       <asp:UpdatePanel runat="server" ID="UpdatePanel1">
           <ContentTemplate>
    <asp:ListView id="lstViewApproved" runat="server"
            DataKeyNames="SurveyResponseId" 
			ItemType="SurveyPortal.Data.Models.SurveyResponse"
            SelectMethod="GetApprovedSurveys" OnDataBound="lstViewApproved_DataBound">
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
								<asp:LinkButton Text="Response Date" CommandName="Sort" CommandArgument="ResponseDate" runat="Server" />
							</th>
                            <th> 
                                 <asp:LinkButton runat="server" ID="lblHeadingDocName" CommandName="Sort" Text="Physician Assigned" Visible="false"></asp:LinkButton>&nbsp;
                            </th>                            
                             
                        </tr>
                    </thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder" />
                    </tbody>
                </table>
				<asp:DataPager ID="dtPager" runat="server" class="btn-group btn-group-sm" PageSize="5" > 
        <Fields>
            <asp:NextPreviousPagerField PreviousPageText="< Prev" FirstPageText="|<<" ShowPreviousPageButton="true"
                ShowFirstPageButton="false" ShowNextPageButton="false" ShowLastPageButton="false"
                ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
            <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-info disabled"  RenderNonBreakingSpacesBetweenControls="false"
                NumericButtonCssClass="btn btn-default" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />
            <asp:NextPreviousPagerField NextPageText="Next >" LastPageText=">>|" ShowNextPageButton="true"
                ShowLastPageButton="false" ShowPreviousPageButton="false" ShowFirstPageButton="false"
                ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false"/>
        </Fields>
    </asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
							<td >
								<%#: Item.SurveyTitle != null ? Item.SurveyTitle.SurveyTitle1 : ""%>
							</td>
							<td >
								<%#: Item.Customer != null ? Item.Customer.Name : ""%>
							</td>
                             <td >
							    <asp:DynamicControl runat="server" DataField="ResponseDate" ID="ResponseDate" Mode="ReadOnly" />
							</td>
					                  
                            <td runat="server" id="tdApprove1" visible='<%# IsDoctor %>'>

                            <asp:HyperLink runat="server" NavigateUrl='<%# string.Format("~/SurveyForm/{0}?rid={1}&m=view", Item.SurveyTitle.FirendlyUrl, Item.SurveyResponseId) %>' Text="View" />

                        </td>
                    <td runat="server" id="tdDoctor" visible='<%# IsAdmin%>'>
                      
					    <%#: Item.User != null ? Item.User.Name : ""%>                        
                   </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
               </ContentTemplate>
           </asp:UpdatePanel>

      </div>
    </div>
            </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
