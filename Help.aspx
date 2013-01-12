<%@ Page Title="" Language="C#" MasterPageFile="~/MasterLoginOptional.master" AutoEventWireup="true"
    CodeFile="Help.aspx.cs" Inherits="Helpform" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        <div class="biglogin rounded-corners">
            <asp:Panel ID="panelLogin" runat="server" DefaultButton="btnsubmit">
                <table class="logform" width="100%" border="0">
                    <tr>
                        <td colspan="3" style="font-size: 15px;">
                        
                            To help you better, please provide some information.We will get back to
                            you at the earliest:
                            <hr />
                            <br />
                        </td>
                    </tr>
                </table>
                <table style="width: 100%; color: #202020">
                    <tr>
                        <td>
                            Required Fields are marked with *
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%; text-align: right;">
                            Name
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox class="textinp" runat="server" Width="180px" ID="tbname"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="regfstname" runat="server" ControlToValidate="tbname"
                                ValidationGroup="validhelp" ErrorMessage="Incorrect format" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%; text-align: right;">
                            Email*
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txtemail" runat="server" Width="180px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtemail"
                                SetFocusOnError="true" ValidationGroup="validhelp" Display="Dynamic" Text="*"
                                ErrorMessage="Enter a valid email address" Visible="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail"
                                ErrorMessage="Incorrect format" ValidationGroup="validhelp" ValidationExpression="\S+@\S+\.\S+"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%; text-align: right;">
                            Category*
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:DropDownList ID="drphelp" runat="server">
                                <asp:ListItem Value="0">Please select an option</asp:ListItem>
                                <asp:ListItem>Profile Deletion</asp:ListItem>
                                <asp:ListItem>Contact Initiation</asp:ListItem>
                                <asp:ListItem>Edit Basic Information</asp:ListItem>
                                <asp:ListItem>Login to RasamVivah.com</asp:ListItem>
                                <asp:ListItem>Search for perfect match</asp:ListItem>
                                <asp:ListItem>Photo Upload</asp:ListItem>
                                <asp:ListItem>Membership/Payment related Queries</asp:ListItem>
                                <asp:ListItem>Suggestions</asp:ListItem>
                                <asp:ListItem>Others</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="drphelp"
                                SetFocusOnError="true" InitialValue="0" Display="Dynamic" Text="*" ErrorMessage="Please Specify a Category"
                                ValidationGroup="validhelp" Visible="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%; text-align: right;">
                            Your Query
                        </td>
                        <td>
                            :
                        </td>
                        <td>
                            <asp:TextBox ID="txthelp" runat="server" TextMode="MultiLine" Height="80px" Width="250px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr align="center">
                        <td colspan="3">
                            <br />
                            <asp:Button class="logbtn" runat="server" ID="btnsubmit" Text="Submit" ValidationGroup="validhelp"
                                TabIndex="0" OnClick="btnsubmit_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div class="rightpane" style="top: 0px;">
            <div style="padding: 5px;">
                <table width="100%" border="0" cellpadding="4">
                    <tr>
                        <td>
                            <a href="/">Home</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="aboutus.aspx">About Us</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="services.aspx">Services</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="membership.aspx">Membership Plans</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="javascript:redirectToLogin()">Login</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="help.aspx">Help</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="contactus.aspx">Contact Us</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div style="min-height: 600px">
    </div>
</asp:Content>
