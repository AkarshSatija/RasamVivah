<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/notsignedin.master" CodeFile="register.aspx.cs" Inherits="register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>User Registration</title>
    
    <script type="text/javascript" language="javascript">
        function Validate(sender, args) 
        {
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
    
         function ValidateCheckBox(sender, args) {
             if (document.getElementById("<%=chkbox1.ClientID %>").checked == true) {
                 args.IsValid = true;
             }
             else {
                 window.alert("You have to agree to the Rasamvivah terms and conditions to proceed");
                 
                 args.IsValid = false;
             }
         }
    </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="min-height:1100px">
       
        <div class="container">
            <div>
              <div class="registerbox">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="rheading" colspan="2">
                            <center>
                                ACCOUNT DETAILS<label style="font-size: 10px">(Fields marked * are compulsory)</label></center>
                        </td>
                    </tr>
                </table>
            </div>
            
            <hr />
                <div class="registerbox">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="rheading" >
                               <h3>Login Details</h3>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="registerbox">
                    <table width="100%" border="0" cellspacing="1" cellpadding="4">
                        <tr>
                            <td>
                               Email*
                               
                            </td>
                            <td>
                                <asp:TextBox ID="txtemail" runat="server" Width="180px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemail" SetFocusOnError="true"
                                    Display="Dynamic" Text="*" ErrorMessage="Enter a valid email address to register & receive relevant Matches. We never share your email with 3rd parties."
                                    Visible="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtemail" ErrorMessage="Incorrect format"
                                    ValidationExpression="\S+@\S+\.\S+"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               Confirm Email*
                                 
                                
                            </td>
                            <td>
                                <asp:TextBox ID="txtcnfrmemail" runat="server" Width="180px" 
                                    AutoCompleteType="Disabled"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcnfrmemail"
                                    Display="Dynamic" Text="*" ErrorMessage="Your emails do not match. Please try again.." SetFocusOnError="true"
                                    Visible="true"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cmpareemail" runat="server" ErrorMessage="Email ID should be same"
                                    ControlToValidate="txtcnfrmemail" ControlToCompare="txtemail"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               Password*
                                 
                                
                            </td>
                            <td>
                                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" Width="180px" 
                                    AutoCompleteType="Disabled"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpwd"
                                    Display="Dynamic" Text="*" ErrorMessage="Please create a password " SetFocusOnError="true" Visible="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtpwd" ErrorMessage="Incorrect format"
                                    ValidationExpression="^[\s\S]{5,25}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Confirm Password*
                                
                                
                            </td>
                            <td>
                                <asp:TextBox ID="txtcnfrmpwd" runat="server" Width="180px" TextMode="Password" 
                                    AutoCompleteType="Disabled"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtcnfrmpwd" SetFocusOnError="true"
                                    Display="Dynamic" Text="*" ErrorMessage="Password do not match" Visible="true"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cmparepwd" runat="server" ErrorMessage="Password should be same"
                                    ControlToValidate="txtcnfrmpwd" ControlToCompare="txtpwd"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                        <td>
                        Create Profile for*
                        </td>
                        <td>
                        <asp:DropDownList ID="drpcreate" runat="server">
                        
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="drpcreate" SetFocusOnError="true" InitialValue="0"
                                    Display="Dynamic" Text="*" ErrorMessage="Please choose the person for whom you are looking for."
                                    Visible="true"></asp:RequiredFieldValidator>
                        </td>
                        </tr>
                    </table>
                </div>
                <hr />
            </div>
            <div>
                <div class="registerbox">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="rheading" colspan="2">
                               <h3> Basic Details</h3>
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
                                <asp:RequiredFieldValidator ID="rqfstname" runat="server" ControlToValidate="txtfstname" SetFocusOnError="true"
                                    Display="Dynamic" Text="*" ErrorMessage="First name Required" Visible="true"></asp:RequiredFieldValidator>
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
                                <asp:RequiredFieldValidator ID="reqlastname" runat="server" ControlToValidate="txtlastname" SetFocusOnError="true"
                                    Display="Dynamic" Text="*" ErrorMessage="Last name Required" Visible="true"></asp:RequiredFieldValidator>
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
                                    Width="130px">
                                    <asp:ListItem Value="1">Male</asp:ListItem>
                                    <asp:ListItem Value="0">Female</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="reqgender" runat="server" ControlToValidate="rbtngender" SetFocusOnError="true"
                                    Display="Dynamic" Text="*" ErrorMessage="Please Select One" Visible="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbdob" runat="server" Text="Date Of Birth*"></asp:Label>
                               
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                                <asp:TextBox ID="txtdob" runat="server" Text="01/01/1990" Width="180px"></asp:TextBox>
                                eg. dd/mm/yyyy
                                <asp:CustomValidator ID="cvdob" runat="server" ErrorMessage="* Invalid Age(Should be in 18 to 65)"
                                    ClientValidationFunction="Validate" ControlToValidate="txtdob" ValidateEmptyText="true"
                                    ForeColor="Black"></asp:CustomValidator>
                                <cc1:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" StartDate="01/01/1945"  SelectedDate="01/01/1990" runat="server" TargetControlID="txtdob">
                                </cc1:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblmarital" runat="server" Text="Marital Status*"></asp:Label>
                               
                            </td>
                            <td>
                                <asp:DropDownList ID="drpmarital" runat="server" Width="180px" 
                                    onselectedindexchanged="drpmarital_SelectedIndexChanged" AutoPostBack="true">
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
                                <asp:RequiredFieldValidator runat="server" Text="*" ErrorMessage="Please select have children"
                                    Display="Dynamic" Visible="true" ControlToValidate="drpchildren" InitialValue="0"
                                    SetFocusOnError="true"></asp:RequiredFieldValidator>
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
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                 ControlToValidate="txtaddress" ValidationExpression="^(a-z|A-Z|0-9)*[^$%^&*()~!@']*$" ErrorMessage="*"></asp:RegularExpressionValidator>
                                 <asp:RequiredFieldValidator runat="server" ControlToValidate="txtaddress" SetFocusOnError="true" ErrorMessage="Please provide your residential address" Visible="true" Display="Dynamic">
                                 </asp:RequiredFieldValidator>
                            
                            
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <asp:Label ID="lbcountry" runat="server" Text="Country*"></asp:Label>
                               
                            </td>
                            <td>
                                <asp:DropDownList ID="drpcountry" runat="server" AutoPostBack="true" Width="180px" 
                                    onselectedindexchanged="drpcountry_SelectedIndexChanged">
                                    
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
                      <%--  <tr>
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
                                <asp:Label ID="lbphone" runat="server" Text="Phone Number*"></asp:Label>
                                
                            </td>
                            <td>
                            <asp:Label ID="lbcode" runat="server" ReadOnly="true" Width="50px"></asp:Label>
                                <asp:TextBox ID="txtphone" runat="server" Width="100px" 
                                   ></asp:TextBox>
                               
                                <asp:RequiredFieldValidator ID="reqphone" runat="server"
                                        ControlToValidate="txtphone" Display="Dynamic" Text="*" ErrorMessage="ContactNo. required" SetFocusOnError="true"
                                        Visible="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regphone" runat="server" ControlToValidate="txtphone"
                                    ErrorMessage=" Incorrect format" ValidationExpression="^^[7-9][0-9]{9}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="chkbox1" runat="server" Text="I agree to the " />
                                <a href="privacy.aspx">Privacy Policy</a> and <a href="legal.aspx">Terms and Conditions</a> of RasamVivah.com
                                 <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction = "ValidateCheckBox"></asp:CustomValidator><br />
                                
                            </td>
                            
                        </tr>
                        <tr>
                           <td></td>
                        </tr>
                        
                                
                           
                    </table>
                    <center><asp:Button ID="btnregister" runat="server" Text="Register Me" CssClass="logbtn"  Width="201px"                                 
                                 OnClick="btnregister_Click" /></center>
                </div>
                <br /><br /><br />
            </div>
        </div>
    </div>
  </asp:Content>