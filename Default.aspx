<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/notsignedin.master"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Profile</title>
    <script type="text/Javascript">

        function load(url, event) {
            location.href = url;
        }
    </script>
    <script type="text/javascript">
        function Compare(sender, args) {



            var ddl1 = document.getElementById(("<%=drpadvlwrage.ClientID %>")).value;
            var ddl2 = document.getElementById(("<%=drpadvuprage.ClientID %>")).value;
            args.IsValid = true;

            if (ddl1 > ddl2) {
                window.alert("Lower age limit should be lesser than or equal to upper age limit. For eg. 20 to 25");
                args.IsValid = false;


            }
        }
    </script>
    
    <link href="assets/stylesheets/carouselStyle.css" rel="stylesheet" />
    <script type="text/javascript" src="assets/javascript/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="assets/javascript/simple.carousel.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            // example 1
            $("ul.example1").simplecarousel({
                width: 40,
                height: 40,
                visible: 3,
                auto: 3000,
                next: $('.next'),
                prev: $('.prev')
            });

            // example 2
            $("ul.example2").simplecarousel({
                width: 850,
                height: 300,
                auto: 5000,
                fade: 400,
                pagination: true
            });
        });
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="calluscontainer">
        <div class="callus">
            <!--call us-->
            <table cellpadding="0" cellspacing="0">
                <tr align="right">
                    <td>
                        <img src="assets/img/callus.png" alt="" width="35px" height="35px" />
                    </td>
                    <td>
                        Live Support! Call Us on 9810830402 or 9999613933
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div>
        <div class="login">
            <asp:Panel ID="panelLogin" runat="server" DefaultButton="btnsignin">
                <table class="logform" width="100%" border="0">
                    <tr>
                        <td>
                            User Name
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox class="textinp" runat="server" Width="140px" ID="tbusername" ValidationGroup="login"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbusername" ValidationGroup="login"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox class="textinp" ID="tbpaasword" runat="server" Text="nsdk" TextMode="Password"
                                Width="140px" ValidationGroup="login"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbpaasword" ValidationGroup="login"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--<input class="logbtn" name="ogin" type="button" value="Login">--%>
                            <asp:Button class="logbtn" runat="server" ID="btnsignin" Text="Sign In" OnClick="btnsignin_Click"
                                TabIndex="0" ValidationGroup="login" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbloginerror" runat="server" Font-Size="12px" ForeColor="#ff0000"
                                Text="Login Failed! Check Your Username or Password" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox runat="server" ID="cbremember" Text="Remember me" Checked="false" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="lnkforgotpass" runat="server" OnClick="lnkforgotpass_Click">Forgot Password?</asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="linkbtnjoin" runat="server" PostBackUrl="~/register.aspx">New User?Register now!</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
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
        <div class="banner">
            <img src="assets/img/baner1.jpg" />
        </div>
        <div class="banner2">
            <%--<img src="assets/img/ban2.jpg" />--%>
            <ul class="example2">
                <li>
                    <img src="assets/img/ban3.jpg" style="cursor: pointer;" onclick="load('http://www.rasamvivah.com/register.aspx'); return false;" /></li>
                <li>
                    <img src="assets/img/ban2.jpg" style="cursor: pointer;" onclick="load('http://www.rasamvivah.com/membership.aspx'); return false;" /></li>
            </ul>
        </div>
    </div>
    <div style="min-height: 850px">
    </div>
    
</asp:Content>
