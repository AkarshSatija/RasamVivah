<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="editdetails.aspx.cs" Inherits="editdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Details</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    
        <div>
            <div class="registerbox">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="rheading" colspan="2">
                            <center>
                                Profile Details<label style="font-size: 10px">(Fields marked * are mandatory)</label>
                            </center>
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
                                Physical Details</h3>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="registerbox">
                <table width="100%" border="0" cellspacing="1" cellpadding="4" >
                    <tr>
                        <td>
                            <asp:Label ID="lbheight" runat="server" Text="Height*"></asp:Label> 
                            
                        </td>
                        <td>
                            <asp:DropDownList ID="drpheight" runat="server">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqdropheight" runat="server" ControlToValidate="drpheight"
                                Display="Dynamic" Text="*" InitialValue="0" SetFocusOnError="true" ErrorMessage="Height is mandatory."
                                Visible="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbweight" runat="server" Text="Weight"></asp:Label>
                           
                        </td>
                        <td>
                            <asp:TextBox ID="txtweight" runat="server" Width="59px" MaxLength="3"></asp:TextBox>kgs<asp:RangeValidator
                                runat="server" ControlToValidate="txtweight" ErrorMessage="Invalid range" Type="Integer"
                                MinimumValue="30" MaximumValue="160" SetFocusOnError="true"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbbodytype" runat="server" Text="Body Type"></asp:Label>
                            
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtnbodytype" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table">
                                <asp:ListItem Value="1">Slim</asp:ListItem>
                                <asp:ListItem Value="2">Athletic</asp:ListItem>
                                <asp:ListItem Value="3">Average</asp:ListItem>
                                <asp:ListItem Value="4">Heavy</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbsmoke" runat="server" Text="Smoke*"></asp:Label> 
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtnsmoke" runat="server" RepeatDirection="Horizontal" >
                                <asp:ListItem Value="1">No</asp:ListItem>
                                <asp:ListItem Value="2">Yes</asp:ListItem>
                                <asp:ListItem Value="3">Occasionally</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="reqsmoke" runat="server" ControlToValidate="rbtnsmoke" SetFocusOnError="true"
                                Display="Dynamic" Text="*" ErrorMessage="Please specify smoking habits." Visible="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbdrink" runat="server" Text="Drink*" ></asp:Label> 
                            
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtndrink" runat="server" RepeatDirection="Horizontal" >
                                <asp:ListItem Value="1">No</asp:ListItem>
                                <asp:ListItem Value="2">Yes</asp:ListItem>
                                <asp:ListItem Value="3">Occasionally</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="reqdrink" runat="server" ControlToValidate="rbtndrink" SetFocusOnError="true"
                                Display="Dynamic" Text="*" ErrorMessage="Please specify drinking habits." Visible="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbdiet" runat="server" Text="Diet" ></asp:Label>
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtndiet" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table">
                                <asp:ListItem Value="1">Veg</asp:ListItem>
                                <asp:ListItem Value="2">Non-Veg</asp:ListItem>
                                <asp:ListItem Value="3">Eggetarian</asp:ListItem>
                                <asp:ListItem Value="4">Jain</asp:ListItem>
                                
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbcomplexion" runat="server" Text="Complexion"></asp:Label>
                           
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtncomplexion" runat="server" RepeatDirection="Horizontal" >
                                <asp:ListItem Value="1">Very Fair</asp:ListItem>
                                <asp:ListItem Value="2">Fair</asp:ListItem>
                                <asp:ListItem Value="3">Wheatish</asp:ListItem>
                                <asp:ListItem Value="4">Dark</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbbloodgrp" runat="server" Text="Blood Group*"></asp:Label> 
                          
                        </td>
                        <td>
                            <asp:DropDownList ID="drpbloodgrp" runat="server">
                                <asp:ListItem Value="1">Don't know</asp:ListItem>
                                <asp:ListItem Value="2">A+</asp:ListItem>
                                <asp:ListItem Value="3">A-</asp:ListItem>
                                <asp:ListItem Value="4">B+</asp:ListItem>
                                <asp:ListItem Value="5">B-</asp:ListItem>
                                <asp:ListItem Value="6">AB+</asp:ListItem>
                                <asp:ListItem Value="7">AB-</asp:ListItem>
                                <asp:ListItem Value="8">O+</asp:ListItem>
                                <asp:ListItem Value="9">O-</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" Text="*" Display="Dynamic" ControlToValidate="drpbloodgrp" 
                                Visible="true" SetFocusOnError="true" ErrorMessage=""></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbhiv" runat="server" Text="HIV*"></asp:Label> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbtnhiv" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value='0'>Negative</asp:ListItem>
                                <asp:ListItem Value='1'>Positive</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="reqhiv" runat="server" ControlToValidate="rbtnhiv" SetFocusOnError="true"
                                Text="*" Display="Dynamic" Visible="true" ErrorMessage="Mandatory"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbspecialcase" runat="server" Text="Special Cases*"></asp:Label> 
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:DropDownList ID="drpspecialcase" runat="server">
                                <asp:ListItem Value="1">None</asp:ListItem>
                                <asp:ListItem Value="2">Physically challenged from birth</asp:ListItem>
                                <asp:ListItem Value="3">Physically challenged due to accident</asp:ListItem>
                                <asp:ListItem Value="4">Mentally challenged from birth</asp:ListItem>
                                <asp:ListItem Value="5">Mentally challenged due to accident</asp:ListItem>
                                <asp:ListItem Value="6">Physical abnormality affecting only looks</asp:ListItem>
                                <asp:ListItem Value="7">Physical abnormality affecting bodily functions</asp:ListItem>
                                <asp:ListItem Value="8">Physically and mentally challenged</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqspecialcase" runat="server" Text="*" Display="Dynamic"
                                ControlToValidate="drpspecialcase" Visible="true" SetFocusOnError="true" ErrorMessage=""></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbother" runat="server" Text="Write about yourself*" Width="150px"></asp:Label>
                            
                        </td>
                       
                        <td>Tell us about your family background, education, lifestyle, interests, hobbies etc</td>
                        </tr>
                        <tr>
                        <td></td>
                        <td>
                            <table style="vertical-align:top;" >
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtother" runat="server" TextMode="MultiLine" Width="500px" Height="100px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <div style="width: 200px; height: 100px; font-size:14px;">
                                            <span style="font-size:14px;"><b>Here you can write about</b></span><br />
                                            Your Personality,Lifestyle,Values.<br />
                                            Your education-school and college.<br />
                                            Your Occupation,Income and Goals.<br />
                                            Your family-Dad,Mom,Siblings.
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter atleast 100 characters "
                                SetFocusOnError="true" Display="Dynamic" Visible="true" ControlToValidate="txtother"
                                Text="*"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtother"
                                ErrorMessage="Invalid range(It should be between 100 and 4000 characters)" ValidationExpression="^[\s\S]{100,4000}$"></asp:RegularExpressionValidator>
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
                                Social Details</h3>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="registerbox">
                <table width="100%" border="0" cellspacing="1" cellpadding="4">
                    <tr>
                        <td>
                            <asp:Label ID="lbreligion" runat="server" Text="Religion*"></asp:Label> 
                        </td>
                        <td>
                            <asp:DropDownList ID="drpreligion" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpreligion_SelectedIndexChanged" Width="180px">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqdrprel" runat="server" ControlToValidate="drpreligion"
                                Display="Dynamic" Text="*" InitialValue="0" SetFocusOnError="true" ErrorMessage="Please select your religion"
                                Visible="true"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr id="trcaste" runat="server">
                        <td>
                            <asp:Label ID="lbcaste" runat="server" Text="Caste/Sect*"></asp:Label> 
                        </td>
                        <td>
                            <asp:DropDownList ID="drpcaste" runat="server" AutoPostBack="true">
                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="drpcaste" Display="Dynamic"
                                Text="*" InitialValue="0" SetFocusOnError="true" ErrorMessage="Caste/Sect is mandatory."
                                Visible="true" Width="180px"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbsubcaste" runat="server" Text="Sub Caste/Sect"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtsubcaste" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        
                            
                            </table>
                            <center><asp:Button ID="btncreate" CssClass="logbtn" runat="server" Text="Save and Continue" Width="201px" Height="27px"  OnClick="btncreate_Click" /></center>
            </div>
        </div>
        
    <div style="min-height:300px">
    </div>
</asp:Content>
