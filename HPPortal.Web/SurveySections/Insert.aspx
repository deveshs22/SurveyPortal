<%@ Page Title="SurveySectionInsert" Language="C#" MasterPageFile="~/Site.Master" CodeBehind="Insert.aspx.cs" Inherits="HPPortal.Web.SurveySections.Insert" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="SurveyPortal.Data.Models.SurveySection" DefaultMode="Insert"
            InsertItemPosition="FirstItem" InsertMethod="InsertItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <InsertItemTemplate>
                <fieldset class="form-horizontal">
				<legend>Insert SurveySection</legend>
		        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
						    <asp:DynamicControl Mode="Insert" DataField="SurveySectionTtile" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="SurveySectionDesc" runat="server" />
							<asp:DynamicControl Mode="Insert" 
								DataField="SurveyTitleId" 
								DataTypeName="SurveyPortal.Data.Models.SurveyTitle" 
								DataTextField="SurveyTitle1" 
								DataValueField="SurveyTitleId" 
								UIHint="ForeignKey" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="DisplaySectionHeader" runat="server" />
							<asp:DynamicControl Mode="Insert" 
								DataField="SectionTypeId" 
								DataTypeName="SurveyPortal.Data.Models.SectionType" 
								DataTextField="SectionTypeDesc" 
								DataValueField="SectionTypeId" 
								UIHint="ForeignKey" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="Active" runat="server" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <asp:Button runat="server" ID="InsertButton" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                            <asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
                        </div>
					</div>
                </fieldset>
            </InsertItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>
