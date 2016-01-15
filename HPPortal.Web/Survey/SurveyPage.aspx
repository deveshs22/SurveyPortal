<%@ Page Title="Survey" Language="C#" CodeBehind="SurveyPage.aspx.cs" Inherits="HPPortal.Web.SurveyPage" %>

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
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

   

        <script type="text/javascript">
 
 function radioButtonListOnClick(elementRef,divId, itemVal)
 {
     for (var i=0; i<elementRef.rows.length; i++)
     {
         for (var j=0; j<elementRef.rows[i].cells.length; j++)
         {
             var listControl = elementRef.rows[i].cells[j].childNodes[0];

             if (listControl.labels[0].innerText == itemVal)
             {
                 if (listControl.checked)
                     $("#" + divId).find("input, select, textarea").prop('disabled', false);
                 else
                     $("#" + divId).find("input, select, textarea").prop('disabled', true);
             }
             
         }
     }
   }
        </script>



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
                <div class="navbar-header" style="text-align: center; align-content: center; float: none;">
                    <span class="navbar-brand shadow" runat="server" style="float: none;">
                        <%--     <img src="/Content/images/survey.png" style="max-height:50px;"/>--%> &nbsp; &nbsp;<b> Patient Survey Portal</b></span>
                </div>
            </div>
        </div>
        <div class="container body-content">
            <div class="panel panel-default">
                <div class="panel-body" style="background-color: #ffffe0;">
                    <div class="row">
                        <div class="col-md-3 col-sm-6">
                            <div class="col-md-3 col-xs-5 col-sm-3"><b>Name:</b></div>
                            <div class="col-md-8 col-xs-7 col-sm-7">
                                <asp:Label ID="lblName" runat="server" /></div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="col-md-3 col-xs-5 col-sm-3"><b>Gender:</b></div>
                            <div class="col-md-8 col-xs-7 col-sm-7">
                                <asp:Label ID="lblGender" runat="server" /></div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="col-md-2 col-xs-5 col-sm-3"><b>DOB:</b></div>
                            <div class="col-md-8 col-xs-7 col-sm-7">
                                <asp:Label ID="lblDOB" runat="server" /></div>
                        </div>
                        <div class="col-md-3 col-sm-6">
                            <div class="col-md-3 col-xs-5 col-sm-3"><b>Doctor:</b></div>
                            <div class="col-md-8 col-xs-7 col-sm-7">
                                <asp:Label ID="lblDoctor" runat="server" /></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading" style="text-align: center">
                    <h3><b>
                        <asp:Label ID="lblSurveyTitle" runat="server" /></b></h3>
                    <p>
                        <asp:Label ID="lblSurveyDescription" runat="server" Font-Bold="true" /></p>
                </div>
                <div class="panel-body">
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                            </ContentTemplate>
                         </asp:UpdatePanel>
                    <br />
                    <asp:Panel ID="pnlSurveyInterpretation" runat="server" Visible="false">
                        <div class="panel panel-info">
                            <div class="panel-heading" style="font-size:large">
                                <b>Survey Score:
                                    <asp:Label ID="lblScore" runat="server" /></b>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-1 col-xs-3 col-sm-2">&nbsp;<b>Result:</b></div>
                                    <div class="col-md-10 col-xs-9 col-sm-10">
                                        <asp:Label ID="lblResult" runat="server" /></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-1 col-xs-3 col-sm-2"><b>
                                        <asp:Label ID="lblACtionCaption" Text="&nbsp;Action:" runat="server" /></b></div>
                                    <div class="col-md-10 col-xs-9 col-sm-10">
                                        <asp:Label ID="lblAction" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <br />
                    <asp:UpdatePanel ID="upPanelDoctor" runat="server">
                        <ContentTemplate>
                    <asp:Panel ID="pnlDoctorSection" runat="server"></asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                </div>
                <div class="panel panel-footer">
                    <div style="text-align: center;">
                        <asp:Button Text="Approve" ID="btnApprove" runat="server" class="btn btn-primary" OnClick="btnApprove_Click" Visible="false" />
                        <asp:Button Text="Submit" ID="btnSubmit" runat="server" class="btn btn-primary" OnClick="btnSubmit_Click" />
                        &nbsp; &nbsp;
           <asp:Button Text="Reset" ID="btnReset" runat="server" class="btn btn-default" />
                    </div>
                </div>
            </div>
            <hr />
            <footer>
                <p>&copy; <%: DateTime.Now.Year %> - SurveyPortal</p>
            </footer>
        </div>
    </form>


</body>

</html>

