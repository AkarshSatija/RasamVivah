<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="accountsettings.aspx.cs" Inherits="accountsettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div>
    <div id="divchangepass" runat="server">
        <table>
            <tr>
                <td>
                    Change Password
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbcurrentpwd" runat="server" Text="Current Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcurrentpwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtcurrentpwd" Display="Dynamic"
                        Text="*" ValidationGroup="changepassword" ErrorMessage="Please enter your current password "
                        Visible="true"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="lbwrongpass" runat="server" Text="Your old password is not correct"
                        Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbnewpwd" runat="server" Text="New Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtnewpwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtnewpwd" Display="Dynamic"
                        ValidationGroup="changepassword" Text="*" ErrorMessage="Enter your new password "
                        Visible="true"></asp:RequiredFieldValidator>
                        </td><td>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtnewpwd" ValidationGroup="changepassword"
                        ErrorMessage="Incorrect format" ValidationExpression="^[\s\S]{5,25}$">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Label ID="lbcnfrmpwd" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcnfrmpwd" runat="server" Width="127px" TextMode="Password" ValidationGroup="changepassword"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcnfrmpwd"
                        Display="Dynamic" ValidationGroup="changepassword" Text="*" ErrorMessage="Password do not match"
                        Visible="true"></asp:RequiredFieldValidator>
                </td>
                <td class="style3">
                    
                    <asp:CompareValidator ID="cmparepwd" runat="server" ErrorMessage="Password should be same"
                        ControlToValidate="txtcnfrmpwd" ValidationGroup="changepassword" ControlToCompare="txtnewpwd"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnchangepass" runat="server" ValidationGroup="changepassword" Text="Save Changes"
                        OnClick="btnchangepass_Click"></asp:Button>
                </td>
            </tr>
        </table>
    </div>

    <div id="divpasschanged" runat="server" visible="false">
        <asp:Label ID="lbchanged" runat="server" Text="Password Changed Successfully"></asp:Label>
    </div>
    <br />
    <%--<div >
        <table>
            <tr>
                <td>
                    Your Current EmailId is
                </td>
                <td>
                    <asp:Label ID="lboldemail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbemail" runat="server" Text="Enter your new Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtemail" ErrorMessage="Incorrect format"
                        ValidationExpression="\S+@\S+\.\S+"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbpwd" runat="server" Text="Enter your Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtpaswd" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnchangeemail" runat="server" Text="Save Changes" Width="128px">
                    </asp:Button>
                </td>
            </tr>
        </table>
        <asp:Label ID="lbemailchanged" runat="server" Text="Your new email has been saved. Please verify it" Visible="false"></asp:Label>
    </div>--%>
    <br />
    <div id="divchangemobileno" runat="server">
        <table>
            <tr>
                <td>
                    Your Current Mobile No. is
                </td>
                <td>
                    <asp:Label ID="lboldmobile" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbnewmobileno" runat="server" Text="Enter your new Mobile No."></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtnewmobileno" runat="server"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnewmobileno" Display="Dynamic"
                        Text="*" ValidationGroup="changemobile" ErrorMessage="Please enter your current password "
                        Visible="true"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="regphone" runat="server" ControlToValidate="txtnewmobileno"
                        ErrorMessage="Incorrect format" ValidationGroup="changemobile" ValidationExpression="^^[7-9][0-9]{9}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbpassword" runat="server" Text="Enter your Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtpassword" Display="Dynamic"
                        Text="*" ValidationGroup="changemobile" ErrorMessage="Please enter your password "
                        Visible="true"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="lbincorrectpassword" runat="server" Text="Incorrect Password"
                        Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="savemobile" runat="server" Text="Save Changes" Width="128px" 
                        onclick="savemobile_Click" ValidationGroup="changemobile"></asp:Button>
                </td>
            </tr>
        </table>
        
    </div>
    <br /><asp:Label ID="lbmobilechanged" runat="server" Text="Your new mobile number has been saved. Please verify it now" Visible="false"></asp:Label>

    <br />
    <br />

    <div visible="false" id="Privacysettings" runat="server">
    <table>
<tr>
    <td>
    <asp:Label ID="lbcontact" runat="server" Text="Contact Details"></asp:Label>
    </td>
    <td>
    <asp:RadioButtonList ID="rbtncontact" runat="server">
    <asp:ListItem>Show to all(including Guests)</asp:ListItem>
    <asp:ListItem>Show to registered users only</asp:ListItem>
    <asp:ListItem>Show to paid users only</asp:ListItem>
    
    
    </asp:RadioButtonList>
     </td>
    </tr>    
<tr>
    <td>
    <asp:Label ID="lbmyprofile" runat="server" Text="My Profile"></asp:Label>
    </td>
    <td>
    <asp:RadioButtonList ID="rbtnmyprofile" runat="server">
   <asp:ListItem>Show to all(including Guests)</asp:ListItem>
    <asp:ListItem>Show to registered users only</asp:ListItem>
    <asp:ListItem>Show to paid users only</asp:ListItem>
    </asp:RadioButtonList>
     </td>
    </tr>

    <tr>
    <td>
    <asp:Label ID="lbalbum" runat="server" Text="Album Photos"></asp:Label>
    </td>
    <td>
    <asp:RadioButtonList ID="rbtnalbum" runat="server">
    <asp:ListItem>Show to all(including Guests)</asp:ListItem>
    <asp:ListItem>Show to registered users only</asp:ListItem>
    <asp:ListItem>Show to paid users only</asp:ListItem>
    </asp:RadioButtonList>
     </td>
    </tr>

    <tr>
    <td>
    <asp:Label ID="lbdisplayphoto" runat="server" Text="Display photo"></asp:Label>
    </td>
    <td>
    <asp:RadioButtonList ID="rbtndisplay" runat="server">
   <asp:ListItem>Show to all(including Guests)</asp:ListItem>
    <asp:ListItem>Show to registered users only</asp:ListItem>
    <asp:ListItem>Show to paid users only</asp:ListItem>
    </asp:RadioButtonList>
     </td>
    </tr>
    
    </table>
    
    </div>
    </div>



    <div style="min-height:100px"></div>
</asp:Content>
