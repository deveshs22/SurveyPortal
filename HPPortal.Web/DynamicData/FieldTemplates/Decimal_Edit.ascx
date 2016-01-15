<%@ Control Language="C#" CodeBehind="Decimal_Edit.ascx.cs" Inherits="HPPortal.Web.Decimal_EditField" %>

<div id="Div1" runat="server" class="form-group">
    <asp:Label ID="Label1" runat="server" CssClass="col-md-4 control-label" />
    <div class="col-md-7">
		<asp:TextBox ID="TextBox1" type="Number" step="any" runat="server" Text='<%# FieldValueEditString %>' CssClass="form-control DDTextBox"></asp:TextBox>
    </div>
</div>
