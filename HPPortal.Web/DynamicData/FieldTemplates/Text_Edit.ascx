<%@ Control Language="C#" CodeBehind="Text_Edit.ascx.cs" Inherits="HPPortal.Web.Text_EditField" %>

<div id="Div1" runat="server" class="form-group">
    <asp:Label ID="Label1" runat="server" CssClass="col-md-4 control-label" />
    <div class="col-md-7">
		<asp:TextBox ID="TextBox1" type="Text" runat="server" Text='<%# FieldValueEditString %>' CssClass="form-control DDTextBox" ></asp:TextBox>
    </div>
</div>


