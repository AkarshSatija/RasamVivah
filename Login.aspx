<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/notsignedin.master"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>RasamVivah</title>
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
    
    <div>
        <div class="biglogin">
            <asp:Panel ID="panelLogin" runat="server" DefaultButton="btnsignin" >
                <table class="logform" width="100%" border="0" >
                <tr>
                <td colspan="3" style="font-size:16px; ">
                    RasamVivah Login
                <hr /> 
                </td>
                </tr>
                <tr>
                <td colspan="3">
                <div id="divLoginError" class="bigloginerror" runat="server" visible="false">
                <span style=" font-size:16px;font-weight:bold;">Login Failed</span>
                <br />
                <br />
                Check Your Username & Password Combination.<br />

                You can login using your email, username or RasamVivah ID associated with your account. Make sure that it is typed correctly.
                </div>
                <br />
                </td>
                
                </tr>

                </table>
                <table style="width:100%;">
                    <tr>
                        <td style="width:35%; text-align:right;">
                            User Name
                        </td>
                    <td>:</td>
                        <td>
                            <asp:TextBox class="textinp" runat="server" Width="180px" ID="tbusername" ValidationGroup="login"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbusername" ValidationGroup="login"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:35%; text-align:right;">
                            Password
                        </td>
                    <td>:</td>
                        <td>
                            <asp:TextBox class="textinp" ID="tbpaasword" runat="server" Text="nsdk" TextMode="Password"
                                Width="180px" ValidationGroup="login"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="tbpaasword" ValidationGroup="login"
                                SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                    <td></td>
                    <td></td>
                        <td>
                            <asp:CheckBox runat="server" ID="cbremember" Text="Keep me logged in" Checked="false" />
                        </td>
                    </tr>
                    <tr>
                    <td></td>
                    <td></td>
                        <td style="vertical-align:middle" >
                            <%--<input class="logbtn" name="ogin" type="button" value="Login">--%>
                            <asp:Button class="logbtn" runat="server" ID="btnsignin" Text="Sign In" OnClick="btnsignin_Click"
                                TabIndex="0" ValidationGroup="login" /> or <a href="register.aspx">Sign up for Rasamvivah</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                           
                        </td>
                    </tr>
                    
                    <tr>
                    <td></td>
                    <td></td>
                        <td>
                            <asp:LinkButton ID="lnkforgotpass" runat="server" OnClick="lnkforgotpass_Click">Forgot your Password?</asp:LinkButton>
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
        
        <div class="rightpane" style="top:0px;"  >
    <div style="padding:5px;" >
            <table width="100%" border="0" cellpadding="4">
                <tr >
                    <td >
                        <a href="/">Home</a>
                    </td>
                </tr>
                <tr >
                    <td >
                        <a href="aboutus.aspx">About Us</a>
                    </td>
                </tr>
                <tr>
                    <td >
                        <a href="services.aspx">Services</a>
                    </td>
                </tr>
                <tr  >
                    <td >
                       <a href="membership.aspx">Membership Plans</a>
                    </td>
                </tr>
         <tr  >
                    <td >
                        <a href="javascript:redirectToLogin()">Login</a>
                    </td>
                </tr>
                <tr  >
                    <td >
                       <a href="help.aspx">Help</a>
                    </td>
                </tr>
         <tr  >
                    <td >
                       <a href="contactus.aspx">
                            Contact Us</a>
                    </td>
                </tr>
        

             </table>
          
    </div>
    </div>
    </div>
    <div style="height: 750px">
      <%--  <p style="">
            The email you entered does not belong to any account.</p>
        <p style="margin: 1em 0px; color: rgb(51, 51, 51); font-family: 'lucida grande', tahoma, verdana, arial, sans-serif; font-size: 11px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 14px; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 235, 232);">
            You can login using any email, username or mobile phone number associated with 
            your account. Make sure that it is typed correctly.</p>--%>
    </div>
</asp:Content>
