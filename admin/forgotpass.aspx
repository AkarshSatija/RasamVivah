<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotpass.aspx.cs" Inherits="admin_forgotpass" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
      <div style="min-height: 382px">
        <div >
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2">
                        <center>
                            RasamVivah Admin Recovery Options</center>
                    </td>
                </tr>
            </table>
        </div>
        <div align="center">
            <div id="divgetemail" runat="server">
                It seems like you forgot your password. Please enter your id or email id or username.
                <br />
                <br />
                <br />
                <asp:TextBox ID="tbunameforgot" runat="server" Height="25px" Width="250px"></asp:TextBox>
                <br />
                <br />
                <br />
                <asp:Button ID="btnrecover" runat="server" Text="Recover" OnClick="btnrecover_Click"
                    CssClass="logbtn" />
            </div>
            <br />
            <div id="divmessage" runat="server" visible="false" align="center">
                <asp:Label ID="lbmessage" runat="server"></asp:Label>
            </div>
            <br />
        </div>

     </div>
    </form>
</body>
</html>
