<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="contacts.aspx.cs" Inherits="contacts" %>

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

      <style type="text/css">
    @charset "utf-8";

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
                    <td class="active" align="center" valign="middle">
                        <a href="contacts.aspx">My Contacts</a>
                    </td>
                    <td align="center" valign="middle">
                        <a href="messages.aspx">Messages</a>
                    </td>
                    <!--<td align="center" valign="middle">Membership</td>-->
                </tr>
            </table>
        </div>
        <div class="sidebar" style="width:230px;" >
            <table class="connav" width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="middle" id="tdReqRec" runat="server">
                        <a href="contacts.aspx?type=ReqRec">Contact Request Received</a>
                    </td>
                </tr>
                <%--<tr>
               <td valign="middle" id="tdMemAwaiting" runat="server">
                   <a href="contacts.aspx?type=MemAwaiting">Members awaiting my response: </a>
               </td>
           </tr>--%>
                <%--<tr>
               <td valign="middle" id="tdFilteredByMe" runat="server">
                   <a href="contacts.aspx?type=FilteredByMe">Filtered By Me: </a>
               </td>
           </tr>--%>
                <tr>
                    <td valign="middle" id="tdMemAcceptedbyme" runat="server">
                        <a href="contacts.aspx?type=MemAcceptedbyme">Members I Accepted</a>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" id="tdMemRejected" runat="server">
                        <a href="contacts.aspx?type=MemRejectedByMe">Members I Rejected</a>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" id="tdReqSent" runat="server">
                        <a href="contacts.aspx?type=ReqSent">Contact Request Sent</a>
                    </td>
                </tr>
                <%--<tr>
               <td valign="middle" id="tdMemRespond" runat="server">
                   <a href="contacts.aspx?type=MemRespond"
                       >Members who are yet to respond:"></a>
               </td>
           </tr>--%>
                <%--<tr>
               <td valign="middle" id="tdFilteredMe" runat="server">
                   <a href="contacts.aspx?type=FilteredMe"
                       >Members who Filtered me:</a>
               </td>
           </tr>--%>
                <tr>
                    <td valign="middle" id="tdMemAccepted" runat="server">
                        <a href="contacts.aspx?type=memwhoacceptedme">Members accepted me</a>
                    </td>
                </tr>
                <tr>
                    <td valign="middle" id="tdMemRejectedMe" runat="server">
                        <a href="contacts.aspx?type=MemRejectedMe">Members rejected me</a>
                    </td>
                </tr>
            </table>
        </div>
    
   
        <div id="divlistview" class="content">
            <div >
                <asp:ListView ID="lvcontacts" runat="server" DataKeyNames="id">
                    <EmptyDataTemplate>
                        <div class="statbox" style=" height: 150px">
                            <div class="heading">
                                No Records available in this category
                            </div>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <div class="statbox" style="width: 775px">
                            <div class="heading">
                                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("fname").ToString()+" "+ Eval("mname").ToString()+" "+Eval("lname").ToString() %>' />
                                <asp:Label ID="Label3" runat="server" Text='<%# " ( RV"+ Eval("id").ToString()+" )" %>' />
                                <%--  <asp:Label ID="Label3" runat="server" Text='<%# Eval("mname") %>' />
                           
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("lname") %>' />--%>
                            </div>
                            <table width="770px" border="0" cellspacing="0" cellpadding="0" style="margin-left: 5px;
                                font-size: 16px; color: #000">
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
                                </tr>
                                <%-- <tr>
        <td colspan="3" style="padding:5px; background-color:#FFC "><asp:Label ID="lbnotif" runat="server" Text="notif"></asp:Label></td>
      </tr>--%>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 155px">
                                        <asp:ImageButton ID="pictureControlID" runat="server" alt="" align="top" border="2"
                                            Style="width: 150px; height: auto; border: 2px #666666 solid;" ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>'
                                            PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="lbaboutme" runat="server" Text='<%# p.getAboutMeString(Eval("id").ToString(), Server.MapPath("xml//")) %>'></asp:Label>
                                        <br />
                                        <div style="max-height: 100px; width: auto; overflow: hidden">
                                            About Me:
                                            <asp:Label ID="Label1" runat="server" Text='<%# p.descAboutMe(Eval("id").ToString()) %>'></asp:Label>
                                        </div>
                                        Marital Status:
                                        <asp:Label ID="m_statusLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("xml//marital.xml"), "status", Eval("m_status").ToString()) %>' />
                                        <br />
                                        Mother Tongue:
                                        <asp:Label ID="mother_tongueLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("xml//mother_tongue.xml"), "language", Eval("mother_tongue").ToString())%>' />
                                        <br />
                                        <%--State:
                            <asp:Label ID="stateLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("xml//state.xml"), "option", Eval("state").ToString()) %>' />
                            <br />--%>
                                        <td>
                                            &nbsp;
                                        </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="right">
                                        <asp:LinkButton Font-Underline="false" Font-Size="14px" ID="lbtngotoprofile" runat="server"
                                            PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>'> Go to Profile</asp:LinkButton>
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <div id="divcontactinfo" visible="false" runat="server" style="border: solid 1px #CCCCCC;
                                margin: 10px; font-weight: normal; font-family: Verdana, Geneva, sans-serif;
                                font-size: 15px; padding: 3px">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td colspan="4" style="color: #274fb6">
                                            Contact Details
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            abc
                                        </td>
                                        <td>
                                            xyz
                                        </td>
                                        <td>
                                            abc
                                        </td>
                                        <td>
                                            xyz
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            abc
                                        </td>
                                        <td>
                                            xyz
                                        </td>
                                        <td>
                                            abc
                                        </td>
                                        <td>
                                            xyz
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            abk
                                        </td>
                                        <td>
                                            mjdks
                                        </td>
                                        <td>
                                            ksjd
                                        </td>
                                        <td>
                                            sdjsk
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="divfuncbtns" visible="false" runat="server" style="float: right; margin: 5px">
                                <input class="grnbtn" name="ogin" type="button" value="Login">
                                <input class="grnbtn" name="ogin" type="button" value="Login">
                            </div>
                        </div>
                        </span>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;
                            height: auto;">
                            <span runat="server" id="itemPlaceholder" />
                        </div>
                        <div style="text-align: center; height: auto; background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif;
                            color: #333333;">
                        </div>

                        <br /><br />
                    </LayoutTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

    <%--<div style="min-height:2000px;">
    
    </div>--%>
</asp:Content>
