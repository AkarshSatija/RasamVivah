<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="partner.aspx.cs" Inherits="partner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Partner Preference</title>
       <script type="text/javascript">
           function Compare(sender, args) {



               var ddl1 = document.getElementById(("<%=drplwrage.ClientID %>")).value;
               var ddl2 = document.getElementById(("<%=drpuprage.ClientID %>")).value;
               args.IsValid = true;

               if (ddl1 > ddl2) {
                   window.alert("Please enter valid age range!!");
                   args.IsValid = false;


               }
           }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="min-height:1300px">
   <div class="container">
   <div>
    <div class="registerbox">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="rheading" colspan="2">
                            
                                <h3>Your Partner Preferences</h3>
                        </td>
                    </tr>
                </table>
            </div>
            <hr />
             <div class="registerbox">
                <table width="100%" border="0" cellspacing="1" cellpadding="4">
                <tr>
                <td>
    <asp:Label ID="lbpartnerage" runat="server" Text="Age"></asp:Label>
                    </td>
                <td> <asp:DropDownList ID="drplwrage" runat="server" >
    
    
    </asp:DropDownList>
       &nbsp;
       to&nbsp;
    <asp:DropDownList ID="drpuprage" runat="server">
    
    </asp:DropDownList>
     <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="Compare" />
    </td>
                </tr>
                <tr>
                <td>
    <asp:Label ID="lbpartnermarital" runat="server" Text="Marital Status"></asp:Label>
                    </td>
                <td>
                <div class="noscrolldiv">
    <asp:CheckBoxList ID="chkpartnermarital" runat="server">
    
    </asp:CheckBoxList>
    </div>
                    </td>
                </tr>
                <tr>
                <td>
     <asp:Label ID="lbpartnerheight" runat="server" Text="Height"></asp:Label>
                    </td>
                <td> <asp:DropDownList ID="drplwrheight" runat="server" >
    
     </asp:DropDownList>
     &nbsp;to&nbsp;

     <asp:DropDownList ID="drpupprheight" runat="server">
     
     </asp:DropDownList></td>
                </tr>
                <tr>
                <td>
     <asp:Label ID="lbpartnermthrtongue" runat="server" Text="Mother Tongue"></asp:Label>
                    </td>
                    
                <td>
                <div class="scrolldiv">
                <asp:CheckBoxList ID="chkmthrtongue" runat="server">
     
     </asp:CheckBoxList></div>
     </td>
                </tr>
                <tr>
                <td>
     <asp:Label ID="lbpartnerreligion" runat="server" Text="Religion"></asp:Label>
                    </td>
                    
                <td>
                <div class="noscrolldiv">
                <asp:CheckBoxList ID="chkreligion" runat="server">
    
     </asp:CheckBoxList></div>
     </td>
                </tr>
                <tr>
                <td><asp:Label ID="lbpartnerincome" runat="server" Text="Annual Income"> </asp:Label></td>
              
                </tr>
                <tr>
                <td> Select Income range</td>
                <td><asp:DropDownList ID="drplwrincome" runat="server">
     
     </asp:DropDownList>
     &nbsp;to&nbsp;
     <asp:DropDownList ID="drpupperincome" runat="server">
     
     </asp:DropDownList></td>
                </tr>
                <tr>
                <td></td>
               <td> </td>
                </tr>
                <tr>
                <td>Describe your desired partner*<br /><span style=" font-size:14px" >(Tell us about your expectations & what you’re looking for)</span></td>
                <td><asp:TextBox ID="txtdesired" runat="server" TextMode="MultiLine" Height="182px" 
            Width="415px"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtdesired" ErrorMessage="Please enter atleast 100 characters" Display="Dynamic" Visible="true"></asp:RequiredFieldValidator>&nbsp;
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate ="txtdesired" ErrorMessage="Invalid range(It should be between 100 and 4000 characters)"
             ValidationExpression="^[\s\S]{100,4000}$"></asp:RegularExpressionValidator></td>

                </tr>
                </table>
                <center><asp:Button ID="btnsave" runat="server" Text="Save and Continue" Width="200px" CssClass="logbtn" onclick="btnsave_Click"/>
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton ID="linkskip" runat="server" Text="Skip>>" PostBackUrl="~/profile.aspx"  ></asp:LinkButton></center>
            
                </div>
   </div>
   </div>
   </div>
  
</asp:Content>

