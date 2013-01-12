<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="messages.aspx.cs" Inherits="messages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Messages</title>
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
    <style type="text/css">
    

.footer {
	
	display:none;
	
}

</style>
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
        <div class="commonbox" style="top: 120px; height: 40px; border: 0px">
            <table class="navigation" width="100%" height="100%" border="1" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" valign="middle">
                        <a href="home.aspx">My Vivah</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="profile.aspx">My Profile</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="photos.aspx">My Photos</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="mypartner.aspx">My Partner</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="contacts.aspx">My Contacts</a>
                    </td>
                    <td class="active" align="center" valign="middle">
                        <a href="messages.aspx">Messages</a>
                    </td>
                    <!--<td align="center" valign="middle">Membership</td>-->
                </tr>
            </table>
        </div>
        <!--conversation div-->

        <div class="sidebar">
            <hr />
            <asp:ListView ID="lv" runat="server" OnItemDataBound="lv_ItemDataBound">
               
                <ItemTemplate>
                <asp:LinkButton runat="server" Width="100%" Height="100%" ID="linkbtn" Font-Underline="False" ForeColor="Black">
              <a href="#" style="width:100%; height:100%; border:0px;">
                <div>
                            <asp:Label ID="lbid" runat="server" Text='<%# Eval("convid") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lbread_status" Visible="false" runat="server"></asp:Label>
                            <asp:Label ID="lbu1" runat="server" Text='<%# Eval("user1") %>' Visible="false"></asp:Label>
                            <asp:Label ID="lbu2" runat="server" Text='<%# Eval("user2") %>' Visible="false"></asp:Label>
                    <!--reapeat-->
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    
                        
                            <tr>
                                <td>
                                    <asp:Label ID="lbconvname" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: #999; font-size: 14px">
                                    <div style="width: 200px; height: 20px; overflow: hidden">
                                        <asp:Label ID="lbmsg" runat="server"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle" style="color: #999; font-size: 14px">
                                    <asp:Image ID="imgreply" runat="server" ImageUrl="~/assets/img/back.png" Visible="false"
                                        Style="width: 15px; height: 15px" />
                                    <span style="float: right">
                                        <asp:Label ID="lbdatetime" runat="server"></asp:Label></span>
                                </td>
                            </tr>
                        
                    </table>
                    </div>
</a>
                    </asp:LinkButton>
                    <hr>
                    <!--reapeat end-->
                </ItemTemplate>
            </asp:ListView>
            <br />
        </div>
        <div class="content">
            
            
        
        <%--==================if msg selected====================<br />--%>
      
        <div runat="server" id="divmsgs" >
        <div class="bannerbox" style="padding: 5px">
        
            <asp:TextBox ID="txtsendmsg" runat="server" TextMode="MultiLine" AutoCompleteType="Disabled"
                Width="221px"></asp:TextBox>
            <asp:Button runat="server" ID="btnsend" Text="Send" OnClick="btnsend_Click" />
          </div>  
                        
                   <div class="bannerbox" style="padding: 5px">
                <!--reapeat-->
               
                <!--reapeat end-->
                
                        
                        
                        <asp:ListView ID="lvallmsg" runat="server">
                            <ItemTemplate>
                                <asp:Label ID="lbmsgid" runat="server" Visible="false" Text='<%# Eval("msgid") %>'></asp:Label>
                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <%--<td rowspan="2" align="left" valign="top">
                            <img style="width: 70px; height: auto" src="assets/img/shadi.jpg">
                        </td>--%>
                        <td style="color: #03F; font-size: 22px">
                            <asp:Label ID="lbsendername" runat="server" Text='<%# Eval("fname")+" "+Eval("lname") %>'></asp:Label>
                        </td>
                        <td style="font-size: 14px" align="right">
                            <asp:Label ID="lbmsgtime" runat="server" Text='<%# Eval("msgtime") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="font-size: 14px">
                            
                                <asp:Label ID="lbmsgtext" runat="server" Text='<%# Eval("msgtext") %>'></asp:Label>
                            <br>
                        </td>
                    </tr>
                </table>
                <hr>
                                
                                
                                
                            </ItemTemplate>
                        </asp:ListView>


                </div> 
                   
        </div>
        <div id="divemptymsg" runat="server">
            <div class="bannerbox" style="padding: 5px">
        
           No conversation Selected!
          </div>
        </div>
        </div>
       
    </div>

    <%--<div style="min-height:1000px;">
    </div>--%>
</asp:Content>
