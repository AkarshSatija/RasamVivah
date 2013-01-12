<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="verify.aspx.cs" Inherits="verify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Verification</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="qsearch">
            <asp:Panel ID="panelQsearch" runat="server" DefaultButton="btsearch">
                <table width="100%" border="0">
                    <tr>
                        <td valign="top" style="font: 'Arial Black', Gadget, sans-serif; font-size: 24px;
                            color: #2a54c2; font-weight: bold" rowspan="3">
                            Quick
                            <br />
                            Search
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtnlooking" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Selected="True">Bride</asp:ListItem>
                                <asp:ListItem Value="1">Groom</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpadvreligion" runat="server" Width="100px" AutoPostBack="true"
                                OnSelectedIndexChanged="drpadvreligion_SelectedIndexChanged">
                                <asp:ListItem>Religion</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcaste" runat="server" Width="100px">
                                <asp:ListItem>Caste</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpadvmthrtongue" runat="server" Width="100px">
                                <asp:ListItem>Mother Tongue</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;&nbsp;<asp:DropDownList ID="drpadvcountry" runat="server" Width="100px" AutoPostBack="true"
                                OnSelectedIndexChanged="drpadvcountry_SelectedIndexChanged">
                                <asp:ListItem Text="Country"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcity" runat="server" Width="100px">
                                <asp:ListItem>City</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbadvage" runat="server" Text="Age"></asp:Label>
                            :
                            <asp:DropDownList ID="drpadvlwrage" runat="server">
                            </asp:DropDownList>
                            &nbsp;to&nbsp;
                            <asp:DropDownList ID="drpadvuprage" runat="server">
                            </asp:DropDownList>
                        </td>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="Compare" />
                        <td>
                            <asp:DropDownList ID="drpadvmarital" Width="100px" runat="server">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpadveducation" runat="server" Width="100px">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpadvworkstatus" runat="server" Width="100px">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:CheckBox ID="chkphotos" runat="server" Text="With photos only" />
                        </td>
                        <td>
                            &nbsp;<asp:Button class="logbtn" ID="btsearch" runat="server" Text="Search" OnClick="btsearch_Click" />
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <a href="search.aspx">Advance search</a>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="commonbox" style="top: 120px; height: 40px; border: 0px">
            <table class="navigation" width="100%" height="100%" border="1" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" valign="middle">
                        <a href="home.aspx">My Vivah</a>
                    </td>
                    <td class="active" align="center" valign="middle">
                        <a href="profile.aspx">My Profile</a>
                    </td>
                    <td align="center" valign="middle">
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
        <div class="sidebar">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="border: solid 1px #000099; font-size: 0px; line-height: 0px">
                        <asp:Image ID="prof_image" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td id="tdverification" runat="server" align="right" valign="middle" class="verified">
                        <asp:Label ID="lbverified" runat="server"></asp:Label>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td valign="middle" class="name">
                        <asp:Label ID="lbname" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbage" runat="server"></asp:Label>&nbsp;Years
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbgender" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbprofession" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbreligion" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbcaste" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbcity" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbcountry" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%--  Last login:<asp:Label ID="lbLastLogin" runat="server"  />--%>
                    </td>
                </tr>
            </table>
        </div>
        <div class="content">
            <div class="xbox" style="width: 100%; ">
                <div class="heading">
                    Verification
                </div>
                <div>
                    <table cellpadding="1" style="width: 100%; height:100px; padding:6px;">
                        <tr>
                            <td ><br />
                                <div runat="server" id="divemail" style="display:block;">
                                    <asp:Label ID="lbemailmsg" runat="server"></asp:Label>
                                    <asp:TextBox ID="txtemail" runat="server" Visible="false"></asp:TextBox>
                                    <asp:Button ID="btnemail" runat="server" Visible="false" Text="verify Now" OnClick="btnemail_Click" />
                                    <br />
                                    <div id="divrecievecode" runat="server">
                                    <asp:Label ID="lbresendcode" runat="server" Text="Didn't recieved a verification code yet??"
                                        ></asp:Label>
                                    <asp:LinkButton ID="lnkresendemail" runat="server" Text="Click Here"
                                        OnClick="lnkresendemail_Click"></asp:LinkButton>
                                    </div>
                                </div>
                                <br />
                            </td>
                        </tr>
                        <tr><td><hr /></td></tr>
                        <tr><td>
                            <div runat="server" id="divmobile">
                                <br />
                                <asp:Label ID="lbmobilemsg" runat="server"></asp:Label>
                                <asp:TextBox ID="txtmobile" runat="server" Visible="false"></asp:TextBox>
                                <asp:Button ID="btnmobile" runat="server" Visible="false" Text="verify Now" OnClick="btnmobile_Click" />
                                <br />
                                <div id="divrecievemobilecode" runat="server">
                                <asp:Label ID="lbresendmobile" runat="server" Text="Didn't recieved a verification code yet??"
                                    ></asp:Label>
                                <asp:LinkButton ID="lnkresendmobile" runat="server" Text="Click Here" 
                                    OnClick="lnkresendmobile_Click"></asp:LinkButton>
                                    </div>
                            <br />
                            <br />
                            </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            
        </div>
        <div>
        </div>
    </div>


    <div style="min-height:900px;">
    </div>
</asp:Content>
