<%@ Control Language="C#" CodeBehind="Boolean.ascx.cs" Inherits="HPPortal.Web.BooleanField" %>

<asp:CheckBox runat="server" ID="CheckBox1" class="nochange" />

<script>
    /* by class */
    $(".nochange").click(function () {
        return false;
    });
</script>