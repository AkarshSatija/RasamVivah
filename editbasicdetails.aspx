<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="editbasicdetails.aspx.cs" Inherits="editbasicdetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" language="javascript">
        function Validate(sender, args) {
            args.IsValid = false;
            var x = args.Value;

            var l = x.length;
            var y = x.substring(l - 4);
            var tdate = new Date();
            var dd = tdate.getFullYear();

            if ((args.Value != "") && (dd - y >= 18) && (dd - y <= 67)) {
                args.IsValid = true;
            }


        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <div class="registerbox">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="rheading" colspan="2">
                        <h3>
                            Basic Details</h3>
                    </td>
                </tr>
            </table>
        </div>
        <div class="registerbox">
            <table width="100%" border="0" cellspacing="1" cellpadding="4">
                <tr>
                    <td>
                        <asp:Label ID="lbfstname" runat="server" Text="First Name*"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtfstname" runat="server" ToolTip="First name" Width="180px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rqfstname" runat="server" ControlToValidate="txtfstname"
                            SetFocusOnError="true" Display="Dynamic" Text="*" ErrorMessage="First name Required"
                            Visible="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regfstname" runat="server" ControlToValidate="txtfstname"
                            ErrorMessage="Incorrect format" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbmidname" runat="server" Text="Middle Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtmidname" runat="server" ToolTip="Middle name" Width="180px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regmidname" runat="server" ControlToValidate="txtmidname"
                            ErrorMessage="Incorrect format" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblastname" runat="server" Text="Last Name*"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtlastname" runat="server" ToolTip="Last name" Width="180px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqlastname" runat="server" ControlToValidate="txtlastname"
                            SetFocusOnError="true" Display="Dynamic" Text="*" ErrorMessage="Last name Required"
                            Visible="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="reglastname" runat="server" ControlToValidate="txtlastname"
                            ErrorMessage="Incorrect format" ValidationExpression="^[a-zA-Z]+$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbgender" runat="server" Text="Gender*"></asp:Label>
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbtngender" runat="server" RepeatDirection="Horizontal"
                            Width="178px">
                            <asp:ListItem Value="1">Male</asp:ListItem>
                            <asp:ListItem Value="0">Female</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="reqgender" runat="server" ControlToValidate="rbtngender"
                            SetFocusOnError="true" Display="Dynamic" Text="*" ErrorMessage="Please Select One"
                            Visible="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbdob" runat="server" Text="Date Of Birth*"></asp:Label>
                    </td>
                    <td>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:TextBox ID="txtdob" runat="server" Width="180px"></asp:TextBox>
                        eg. dd/mm/yyyy
                        <asp:CustomValidator ID="cvdob" runat="server" ErrorMessage="* Invalid Age(Should be in 18 to 65)"
                            ClientValidationFunction="Validate" ControlToValidate="txtdob" ValidateEmptyText="true"
                            ForeColor="Black"></asp:CustomValidator>
                        <cc1:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" StartDate="01/01/1945"
                            runat="server" TargetControlID="txtdob">
                        </cc1:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblmarital" runat="server" Text="Marital Status*"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpmarital" runat="server" Width="180px" OnSelectedIndexChanged="drpmarital_SelectedIndexChanged"
                            AutoPostBack="true">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="reqdropmarital" runat="server" ControlToValidate="drpmarital"
                            Display="Dynamic" Text="*" InitialValue="0" SetFocusOnError="true" ErrorMessage="Marital status is mandatory."
                            Visible="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr id="trchildren" runat="server">
                    <td>
                        <asp:Label ID="lbchildren" runat="server" Text="Have Children*"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpchildren" runat="server" Width="180px">
                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="*"
                            ErrorMessage="Please select have children" Display="Dynamic" Visible="true" ControlToValidate="drpchildren"
                            InitialValue="0" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbmthrtongue" runat="server" Text="Mother Tongue*"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpmthrtongue" runat="server" Width="180px">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="reqdrpmthrtongue" runat="server" ControlToValidate="drpmthrtongue"
                            Display="Dynamic" Text="*" InitialValue="0" SetFocusOnError="true" ErrorMessage="Please select the community you belong to."
                            Visible="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbaddress" runat="server" Text="Address*"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Height="45px" Width="180px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtaddress"
                            ValidationExpression="^(a-z|A-Z|0-9)*[^$%^&*()~!@']*$" ErrorMessage="*"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtaddress" SetFocusOnError="true"
                            ErrorMessage="Please provide your residential address" Visible="true" Display="Dynamic">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbcountry" runat="server" Text="Country*"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpcountry" runat="server" AutoPostBack="true" Width="180px"
                            OnSelectedIndexChanged="drpcountry_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="reqdrpcountry" runat="server" ControlToValidate="drpcountry"
                            Display="Dynamic" Text="*" InitialValue="0" SetFocusOnError="true" ErrorMessage="Please select the country"
                            Visible="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr id="trcity" runat="server">
                    <td>
                        <asp:Label ID="lbcity" runat="server" Text="City*"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpcity" runat="server" Width="180px">
                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="reqcity" runat="server" Text="*" ErrorMessage="Please select the city"
                            Display="Dynamic" Visible="true" ControlToValidate="drpcity" InitialValue="0"
                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--     <tr>
                            <td>
                                <asp:Label ID="lbstate" runat="server" Text="State"></asp:Label>
                                
                            </td>
                            <td>
                                <asp:DropDownList ID="drpstate" runat="server" Width="180px">
                                    
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="reqstate" runat="server" ControlToValidate="drpstate" InitialValue="0" SetFocusOnError="true"
                                    ErrorMessage="Please select the state" Text="*" Display="Dynamic" Visible="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>--%>
                <tr>
                    <td>
                    </td>
                </tr>
            </table>
            <center>
                <asp:Button ID="btnsave" runat="server" Text="Save Changes" CssClass="logbtn" Width="201px"
                    OnClick="btnsave_Click" /></center>
            <center>
                <asp:Label ID="lbmsg" runat="server"></asp:Label></center>
        </div>
    </div>
  
    <div style="min-height: 200px">
    </div>
</asp:Content>
