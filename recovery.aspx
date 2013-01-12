<%@ Page Title="" Language="C#" MasterPageFile="~/notsignedin.master" AutoEventWireup="true"
    CodeFile="~/recovery.aspx.cs" Inherits="recovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Profile</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height: 382px">
        <div class="registerbox">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="rheading" colspan="2">
                        <center>
                            RasamVivah Recovery Options</center>
                    </td>
                </tr>
            </table>
        </div>
        <div class="searchbox" align="center">
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
</asp:Content>
