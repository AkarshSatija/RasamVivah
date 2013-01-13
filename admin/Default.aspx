<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="assets/stylesheets/adminlayout.css" rel="stylesheet" />
    <link href="assets/stylesheets/carouselStyle.css" rel="stylesheet" />
    <script type="text/javascript" src="assets/javascript/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="assets/javascript/simple.carousel.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        
    <div class="container" style="margin: auto;">
        <img src="../assets/img/logo.png" style="width: 25%; height: auto;" />
                  
          <div class="login">
                        <asp:Panel ID="panelLogin" runat="server" DefaultButton="btnsignin">
                            <table class="logform" width="100%" border="0">
                                <tr>
                                    <td>Admin Name
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="textinp" runat="server" Width="140px" ID="tbusername" ValidationGroup="login"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbusername" ValidationGroup="login"
                                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Password
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox class="textinp" ID="tbpaasword" runat="server" Text="nsdk" TextMode="Password"
                                            Width="140px" ValidationGroup="login"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbpaasword" ValidationGroup="login"
                                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbpaasword" ValidationGroup="changepassword"
                        ErrorMessage="Incorrect format" ValidationExpression="^[\s\S]{5,25}$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%--<input class="logbtn" name="ogin" type="button" value="Login">--%>
                                        <asp:Button class="logbtn" runat="server" ID="btnsignin" Text="Sign In"
                                            TabIndex="0" ValidationGroup="login" OnClick="btnsignin_Click" />
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
                                        <asp:LinkButton ID="lnkforgotpass" runat="server" PostBackUrl="~/admin/forgotpass.aspx">Forgot Password?</asp:LinkButton>
                                    </td>
                                </tr>

                            </table>
                        </asp:Panel>
                    </div>


    </div>
    </form>
</body>
</html>
