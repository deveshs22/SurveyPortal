<%@ Page Title="Survey" Language="C#" CodeBehind="Default.aspx.cs" Inherits="HPPortal.Web.Survey.Insert" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - Survey Portal</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:bundlereference runat="server" path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    
</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

        <div class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header" style="text-align:center; align-content:center; float:none;">
                    <span class="navbar-brand shadow" runat="server"  style="float: none;">
                    <%--     <img src="/Content/images/survey.png" style="max-height:50px;"/>--%> &nbsp; &nbsp;<b> Patient Survey Portal</b></span>
                </div>
                
            </div>
        </div>
       
        <div class="container body-content" style="max-width:900px;">
        <div>
        
              <asp:FormView runat="server" ID="Formview1"
            ItemType="SurveyPortal.Data.Models.Customer" DefaultMode="Insert"
            InsertItemPosition="FirstItem" InsertMethod="InsertItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <InsertItemTemplate>
                <fieldset class="form-horizontal">
				<legend>Registration Form</legend>
		        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
						    <asp:DynamicControl Mode="Insert" DataField="Name" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="Email" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="Phone" runat="server" Visible ="false"/>
						    <asp:DynamicControl Mode="Insert" DataField="Active" runat="server" Visible="false" />
						    <asp:DynamicControl Mode="Insert" DataField="DOB" runat="server" />
						    <asp:DynamicControl Mode="Insert" DataField="Pwd" runat="server" Visible="false" />
                     <div id="Div1" runat="server" class="form-group">
    <asp:Label ID="Label2" runat="server" CssClass="col-md-4 control-label" Text="Gender"/>
    <div class="col-md-7">                                                       
                           
                             <asp:DropDownList ID="ddlGender" CssClass="form-control" Width="280"  runat="server">
                                            <asp:ListItem Text="-Select-" Value=""></asp:ListItem>
                                            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                        </asp:DropDownList>
                                </div>
                            </div>

                    <div id="Div2" runat="server" class="form-group">
    <asp:Label ID="Label1" runat="server" CssClass="col-md-4 control-label" Text="Doctor"/>
    <div class="col-md-7">                                                       
                           
                              <asp:DropDownList
                                            ID="ddlDoctor"
                                            SelectMethod="GetDoctor"
                                            DataTextField="Name"
                                            DataValueField="UserId"
                                            CssClass="form-control"
                                            Width="280"
                                             AppendDataBoundItems="true"
                                            runat="server">
                                            <asp:ListItem Text="-Select-" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                </div>
                            </div>

                    <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-10">
                            <asp:Button runat="server" ID="InsertButton" CommandName="Insert" Text="Save and Proceed to Survey>>" CssClass="btn btn-primary" /> &nbsp;
                            <asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" Visible="false" />
                        </div>
					</div>
                </fieldset>
            </InsertItemTemplate>
        </asp:FormView>

    </div></div>
    
</form>
    </body>
    </html>
