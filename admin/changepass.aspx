<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="changepass.aspx.cs" Inherits="admin_changepass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcurrentpwd" Display="Dynamic"
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnewpwd" Display="Dynamic"
                        ValidationGroup="changepassword" Text="*" ErrorMessage="Enter your new password "
                        Visible="true"></asp:RequiredFieldValidator>
                        </td><td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtnewpwd" ValidationGroup="changepassword"
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
    </div>
 
</asp:Content>

