<%@ Control Language="C#" CodeBehind="MultilineText_Edit.ascx.cs" Inherits="HPPortal.Web.MultilineText_EditField" %>

<div id="Div1" runat="server" class="form-group">
    <asp:Label ID="Label1" runat="server" CssClass="col-md-3 control-label" />
    <div class="col-md-8">
		<asp:TextBox ID="TextBox1" TextMode="MultiLine" Rows='<%# TextRows %>' type="Text" runat="server" Text='<%# FieldValueEditString %>' CssClass="form-control DDTextBox"></asp:TextBox>
    </div>
</div>
