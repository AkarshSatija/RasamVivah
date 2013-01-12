<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="photos.aspx.cs" Inherits="photos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function lnkdelete_onClientClick() {
            var r = window.confirm("Are You Sure you want to delete this Image");
            if (r != true) {

                return false;
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height: 2000px">
        <div id="divlvalbum" runat="server">
            <div id="divupload">
                Add more photos:<br />
                &nbsp;<asp:FileUpload ID="flupldalbum" runat="server" />
                <asp:Button ID="btnupload" runat="server" Text="Upload" OnClick="btnupload_Click" />
                <asp:RegularExpressionValidator ID="uplValidator" runat="server" ControlToValidate="flupldalbum"
                    SetFocusOnError="true" ErrorMessage="only .jpg, .jpeg, bmp & png formats are allowed"
                    ValidationExpression="(.+\.([Jj][Pp][Gg])|.+\.([Pp][Nn][Gg])|.+\.([Bb][Mm][Pp])|.+\.([Jj][Pp][Ee][Gg]))">
                </asp:RegularExpressionValidator>
            </div>
            <div class="sidebar" style="height: 170px;">
                <asp:ListView ID="lvalbum" runat="server">
                    <ItemTemplate>
                        <div class="picbox" align="center">
                            <asp:Label ID="lbid" runat="server" Text='<% #Eval("id") %>' Visible="false"></asp:Label>
                            <asp:ImageButton ID="imgalbum" runat="server" Height="164px" Width="148px" ImageUrl='<%# "~/albumHandler.ashx?id=" + Eval("id") %>'
                                PostBackUrl='<%# "~/photos.aspx?imgid=" + Eval("id") %>' />
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
        <div class="commonbox" style="top: 120px; height: 40px; border: 0px">
            <table class="navigation" width="100%" height="100%" border="1" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" valign="middle">
                        <a href="home.aspx">My Vivah</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="profile.aspx">My Profile</a>
                    </td>
                    <td class="active" align="center" valign="middle">
                        <a href="photos.aspx">My Photos</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="mypartner.aspx">My Partner</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="contacts.aspx">My Contacts</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="messages.aspx">Messages</a>
                    </td>
                    <!--<td align="center" valign="middle">Membership</td>-->
                </tr>
            </table>
        </div>
        <div class="content">
            <div id="divpic" style="width: inherit;" runat="server">
                <table style="width: 100%">
                    <tr valign="top">
                        <td align="left">
                            <asp:LinkButton ID="lnkprev" runat="server" Text="previous" OnClick="lnkprev_Click"></asp:LinkButton>
                            &nbsp;|&nbsp;
                            <asp:LinkButton ID="lnknext" runat="server" Text="next" OnClick="lnknext_Click"></asp:LinkButton>
                        </td>
                        <td align="right">
                            <asp:LinkButton ID="lnkdelete" runat="server" Text="Delete" OnClientClick="{return lnkdelete_onClientClick();}"
                                OnClick="lnkdelete_Click"></asp:LinkButton>
                        </td>
                    </tr>
                </table>
                <asp:ImageButton ID="imgalbum" runat="server" CssClass="photos" ImageUrl='<%# "~/albumHandler.ashx?id=" + Request.QueryString["imgid"].ToString()  %>'
                    OnClick="lnknext_Click" />
            </div>
        </div>
    </div>
</asp:Content>
