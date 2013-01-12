<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
 CodeFile="editdetails1.aspx.cs" Inherits="editdetails1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Detail 1</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    
        <div>
            <div class="registerbox">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="rheading" colspan="2">
                            <h3>
                                Education Details</h3>
                        </td>
                    </tr>
                </table>
            </div>
            <hr />
            <div class="registerbox">
                <table width="100%" border="0" cellspacing="1" cellpadding="4">
                    <tr>
                        <td>
                            <asp:Label ID="lbeducation" runat="server" Text="Highest Degree*"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpeducation" runat="server">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqeducation" runat="server" ErrorMessage="Education is mandatory." SetFocusOnError="true"
                                Display="Dynamic" Visible="true" ControlToValidate="drpeducation" Text="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbworking" runat="server" Text="Work Status"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpworking" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbedufield" runat="server" Text="Work Area*"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpedufield" runat="server">
                                <asp:ListItem>Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqedufield" runat="server" ErrorMessage="Please specify the Work area."
                                Display="Dynamic" Visible="true" ControlToValidate="drpedufield" Text="*" SetFocusOnError="true" InitialValue="0"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbincome" runat="server" Text="Annual Income*"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpincome" runat="server">
                            
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqincome" runat="server" ErrorMessage="Please specify a value for annual income."
                                Display="Dynamic" Visible="true" ControlToValidate="drpincome" Text="*" SetFocusOnError="true" InitialValue="0"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbprefer" runat="server" Text="Would you prefer working after marriage?"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtnprefer" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                <asp:ListItem Value="2">No</asp:ListItem>
                                <asp:ListItem Value="3">Not Sure</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbotheredu" runat="server" Text="Write about your other related details*">
                            </asp:Label> 
                        </td>
                        <td>Write about your educational qualifications, place of study etc., and current and past work experience.</td>
                        </tr>
                        <tr>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtotheredu" runat="server" TextMode="MultiLine" Width="500px" Height="100px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ErrorMessage="Please enter atleast 100 characters " SetFocusOnError="true"
                                Display="Dynamic" Visible="true" ControlToValidate="txtotheredu" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ControlToValidate="txtotheredu" ErrorMessage="Invalid range(It should be between 100 and 4000 characters)"
                                ValidationExpression="^[\s\S]{100,4000}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <hr />
            <div class="registerbox">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="rheading" colspan="2">
                            <h3>
                                Family Details</h3>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="registerbox">
                <table width="100%" border="0" cellspacing="1" cellpadding="4">
                    <tr>
                        <td>
                            <asp:Label ID="lbfamilyvalues" runat="server" Text="Family Values"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtnfamilyvalues" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Orthodox</asp:ListItem>
                                <asp:ListItem Value="2">Conservative</asp:ListItem>
                                <asp:ListItem Value="3">Moderate</asp:ListItem>
                                <asp:ListItem Value="4">Liberal</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbfamilytype" runat="server" Text="Family Type"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtnfamilytype" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">Joint family</asp:ListItem>
                                <asp:ListItem Value="2">Nuclear Family</asp:ListItem>
                                <asp:ListItem Value="3">Others</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbfamilystatus" runat="server" Text="Family Status"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtnfamilystatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" >
                                <asp:ListItem Value="1">Rich/Affluent</asp:ListItem>
                                <asp:ListItem Value="2">Upper Class</asp:ListItem>
                                <asp:ListItem Value="3">Middle Class</asp:ListItem>
                                <asp:ListItem Value="4">Lower Class</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbfather" runat="server" Text="Father's Occupation"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpfather" runat="server">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">Business/Entrepreneur</asp:ListItem>
                                <asp:ListItem Value="2">Service-Private</asp:ListItem>
                                <asp:ListItem Value="3">Service-Govt./PSU</asp:ListItem>
                                <asp:ListItem Value="4">Army/Armed force</asp:ListItem>
                                <asp:ListItem Value="5">Civil Services</asp:ListItem>
                                <asp:ListItem Value="6">Retired</asp:ListItem>
                                <asp:ListItem Value="7">Not Employed</asp:ListItem>
                                <asp:ListItem Value="8">Expired</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbmother" runat="server" Text="Mother's Occupation"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpmother" runat="server">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">House Wife</asp:ListItem>
                                <asp:ListItem Value="2">Business/Entrepreneur</asp:ListItem>
                                <asp:ListItem Value="3">Service-Private</asp:ListItem>
                                <asp:ListItem Value="4">Service-Govt./PSU</asp:ListItem>
                                <asp:ListItem Value="5">Army/Armed force</asp:ListItem>
                                <asp:ListItem Value="6">Civil Services</asp:ListItem>
                                <asp:ListItem Value="7">Retired</asp:ListItem>
                                <asp:ListItem Value="8">Teacher</asp:ListItem>
                                <asp:ListItem Value="9">Expired</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbbrother" runat="server" Text="Brother(s)"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpbrothr" runat="server">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">0</asp:ListItem>
                                <asp:ListItem Value="2">1</asp:ListItem>
                                <asp:ListItem Value="3">2</asp:ListItem>
                                <asp:ListItem Value="4">3</asp:ListItem>
                                <asp:ListItem Value="5">3+</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbsister" runat="server" Text="Sister(s)"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpsister" runat="server">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">0</asp:ListItem>
                                <asp:ListItem Value="2">1</asp:ListItem>
                                <asp:ListItem Value="3">2</asp:ListItem>
                                <asp:ListItem Value="4">3</asp:ListItem>
                                <asp:ListItem Value="5">3+</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbresidency" runat="server" Text="Residency Status*"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="drpresidency" runat="server">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                                <asp:ListItem Value="1">Citizen</asp:ListItem>
                                <asp:ListItem Value="2">Permanent Resident</asp:ListItem>
                                <asp:ListItem Value="3">Student Visa</asp:ListItem>
                                <asp:ListItem Value="4">Temporary Visa</asp:ListItem>
                                <asp:ListItem Value="5">Work Permit</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqresidency" runat="server" InitialValue="0" SetFocusOnError="true"
                                ErrorMessage="Residency status is mandatory." Display="Dynamic" Visible="true"
                                ControlToValidate="drpresidency" Text="*"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbliving" runat="server" Text="Do you live with your parents?"></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtnliving" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value='1'>Yes</asp:ListItem>
                                <asp:ListItem Value='0'>No</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbotherdetails" runat="server" Text="Write about your family*"></asp:Label>
                        </td>
                        <td>
                        Tell us about your parents and/or siblings, what they do, their backgrounds etc.
                        </td>
                        </tr>
                        <tr>
                        <td></td>
                        <td>
                            <asp:TextBox ID="txtotherfamily" runat="server" TextMode="MultiLine" Width="500px" Height="100px"></asp:TextBox>
                             <asp:RequiredFieldValidator  runat="server" ErrorMessage="Please enter atleast 100 characters " SetFocusOnError="true"
                                Display="Dynamic" Visible="true" ControlToValidate="txtotherfamily" Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtotherfamily"
                                ErrorMessage="Invalid range(It should be between 100 and 4000 characters)" ValidationExpression="^[\s\S]{100,4000}$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
                <center>
                    <asp:Button ID="btnsave" CssClass="logbtn" runat="server" Text="Save and Continue" OnClick="btnsave_Click" Width="200px" />
                </center>
            </div>
        </div>
    <div style="min-height:200px">
    </div>
</asp:Content>
