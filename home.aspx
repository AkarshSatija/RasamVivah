<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="home.aspx.cs" Inherits="home" %>

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
                    <td class="active" align="center" valign="middle">
                        <a href="home.aspx">My Vivah</a>
                    </td>
                    <td  align="center" valign="middle">
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
                     <td align="center" valign="middle">
                        <a href="messages.aspx">Messages</a>
                    </td>
                    <!--<td align="center" valign="middle">Membership</td>-->
                </tr>
            </table>
        </div>
        <div class="sidebar">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="border: solid 1px #000099; font-size: 0px; line-height: 0px">
                        <asp:Image ID="prof_image" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td id="tdverification" runat="server" align="right" valign="middle" class="verified">
                        <asp:Label ID="lbverified" runat="server"></asp:Label>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td valign="middle" class="name">
                        <asp:Label ID="lbname" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbage" runat="server"></asp:Label>&nbsp;Years
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbgender" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbprofession" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbreligion" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbcaste" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbcity" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        India
                        <%--<asp:Label ID="lbcountry" runat="server"></asp:Label>--%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <%--  Last login:<asp:Label ID="lbLastLogin" runat="server"  />--%>
                    </td>
                </tr>
            </table>
        </div>
        <div class="content">
            <div class="xbox" style="width: 100%; min-height: 150px;">
                <div class="heading">
                    Contact Statistics
                </div>
                <div>
                    <table width="100%">
                        <tr valign="top">
                            <td>
                                <div>
                                    <asp:LinkButton ID="linkReqRec" PostBackUrl="~/contacts.aspx?type=ReqRec" runat="server"
                                        Text="Request Received:" Enabled="false"></asp:LinkButton>
                                    <br />
                                    <br />
                                    <%--<asp:LinkButton ID="linkMemAwaiting"  runat="server" PostBackUrl="~/contacts.aspx?type=MemAwaiting" Text="Members awaiting my response: " Enabled="false"></asp:LinkButton>
<br />
<br />
<asp:LinkButton ID="linkFilteredByMe"  runat="server" PostBackUrl="~/contacts.aspx?type=FilteredByMe" Text="Filtered: " Enabled="false"></asp:LinkButton>
<br />
<br />--%>
                                    <asp:LinkButton ID="linkMemAcceptbyme" runat="server" PostBackUrl="~/contacts.aspx?type=MemAcceptbyme"
                                        Text="Members accepted by me: " Enabled="false"></asp:LinkButton>
                                    <br />
                                    <br />
                                    <asp:LinkButton ID="linkMemMenotIntr" runat="server" PostBackUrl="~/contacts.aspx?type=MemMenotIntr"
                                        Text="Members I rejected: " Enabled="false"></asp:LinkButton>
                                </div>
                            </td>
                            <td>
                                <div>
                                    <asp:LinkButton ID="linkIntSent" runat="server" PostBackUrl="~/contacts.aspx?type=IntSent"
                                        Text="Request Sent:" Enabled="false"></asp:LinkButton>
                                    <br />
                                    <br />
                                    <%--<asp:LinkButton ID="linkMemRespond"  runat="server" PostBackUrl="~/contacts.aspx?type=MemRespond" Text="Members who are yet to respond:" Enabled="false"></asp:LinkButton>
<br />
<br />
<asp:LinkButton ID="linkFilteredMe"  runat="server" PostBackUrl="~/contacts.aspx?type=FilteredMe" Text="Members who Filtered me: " Enabled="false"></asp:LinkButton>
<br />
<br />--%>
                                    <asp:LinkButton ID="linkMemAccepted" runat="server" PostBackUrl="~/contacts.aspx?type=MemAccepted"
                                        Text="Members who accepted me:" Enabled="false"></asp:LinkButton>
                                    <br />
                                    <br />
                                    <asp:LinkButton ID="linkMemNotIntMe" runat="server" PostBackUrl="~/contacts.aspx?type=MemNotIntMe"
                                        Text="Members who rejected me:" Enabled="false"></asp:LinkButton>
                                    <br />
                                    <br />
                                    <%--<asp:LinkButton ID="linkPplVisitedMe" runat="server" PostBackUrl="~/contacts.aspx?type=MemNotIntMe"
                                Text="Members who rejected me:" Enabled="false"></asp:LinkButton>--%>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div runat="server" visible="false">
                <div id="divMemWhoAcceptedMe" runat="server" style="border-style: solid; border-width: 2px;
                    border-color: inherit; position: relative; overflow: hidden; top: 0px; left: 0px;
                    height: 194px; width: 802px;">
                    <asp:DataPager ID="DataPager2" runat="server" PagedControlID="lvMemWhoAcceptedMe"
                        PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField NextPageText=" " />
                        </Fields>
                    </asp:DataPager>
                    <asp:ListView ID="lvMemWhoAcceptedMe" runat="server">
                        <LayoutTemplate>
                            <table>
                                <tr>
                                    <td runat="server" id="itemplaceholder">
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Label1" Text='<% #Eval("id") %>'></asp:Label>
                            <asp:ImageButton ID="pictureControlID" runat="server" alt="" align="top" border="2"
                                Style="width: 158px; height: 182px; border: 2px #666666 solid;" ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>'
                                PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lvMemWhoAcceptedMe"
                        PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ButtonCssClass="style=width:30px;"
                                NextPageImageUrl="" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div id="divMemacceptedByMe" runat="server" style="border-style: solid; border-width: 2px;
                    border-color: inherit; position: relative; overflow: hidden; top: 0px; left: 0px;
                    height: 194px; width: 802px;">
                    <asp:DataPager ID="DataPager3" runat="server" PagedControlID="lvMemacceptedByMe"
                        PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField NextPageText=" " />
                        </Fields>
                    </asp:DataPager>
                    <asp:ListView ID="lvMemacceptedByMe" runat="server">
                        <LayoutTemplate>
                            <tr runat="server" id="itemplaceholder">
                            </tr>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Label2" Text='<% #Eval("id") %>'></asp:Label>
                            <asp:ImageButton ID="pictureControlID" runat="server" alt="" align="top" border="2"
                                Style="width: 158px; height: 182px; border: 2px #666666 solid;" PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>'
                                ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager4" runat="server" PagedControlID="lvMemacceptedByMe"
                        PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ButtonCssClass="style=width:30px;"
                                NextPageImageUrl="" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div id="divreqrec" runat="server" style="border-style: solid; border-width: 2px;
                    border-color: inherit; position: relative; overflow: hidden; top: 0px; left: 0px;
                    height: 194px; width: 802px;">
                    <asp:DataPager ID="DataPager5" runat="server" PagedControlID="lvreqrec" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField NextPageText=" " />
                        </Fields>
                    </asp:DataPager>
                    <asp:ListView ID="lvreqrec" runat="server">
                        <LayoutTemplate>
                            <tr runat="server" id="itemplaceholder">
                            </tr>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Label3" Text='<% #Eval("id") %>'></asp:Label>
                            <asp:ImageButton ID="pictureControlID" runat="server" alt="" align="top" border="2"
                                Style="width: 158px; height: 182px; border: 2px #666666 solid;" PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>'
                                ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager6" runat="server" PagedControlID="lvreqrec" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ButtonCssClass="style=width:30px;"
                                NextPageImageUrl="" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div id="divreqsent" runat="server" style="border-style: solid; border-width: 2px;
                    border-color: inherit; position: relative; overflow: hidden; top: 0px; left: 0px;
                    height: 194px; width: 802px;">
                    <asp:DataPager ID="DataPager7" runat="server" PagedControlID="lvreqsent" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField NextPageText=" " />
                        </Fields>
                    </asp:DataPager>
                    <asp:ListView ID="lvreqsent" runat="server">
                        <LayoutTemplate>
                            <tr runat="server" id="itemplaceholder">
                            </tr>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Label4" Text='<% #Eval("id") %>'></asp:Label>
                            <asp:ImageButton ID="pictureControlID" runat="server" alt="" align="top" border="2"
                                Style="width: 158px; height: 182px; border: 2px #666666 solid;" PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>'
                                ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager8" runat="server" PagedControlID="lvreqsent" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ButtonCssClass="style=width:30px;"
                                NextPageImageUrl="" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div id="divMemAwaiting" runat="server" style="border-style: solid; border-width: 2px;
                    border-color: inherit; position: relative; overflow: hidden; top: 0px; left: 0px;
                    height: 194px; width: 802px;">
                    <asp:DataPager ID="DataPager9" runat="server" PagedControlID="lvMemAwaiting" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField NextPageText=" " />
                        </Fields>
                    </asp:DataPager>
                    <asp:ListView ID="lvMemAwaiting" runat="server">
                        <LayoutTemplate>
                            <tr runat="server" id="itemplaceholder">
                            </tr>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Label5" Text='<% #Eval("id") %>'></asp:Label>
                            <asp:ImageButton ID="pictureControlID" runat="server" alt="" align="top" border="2"
                                Style="width: 158px; height: 182px; border: 2px #666666 solid;" PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>'
                                ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager10" runat="server" PagedControlID="lvMemAwaiting" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ButtonCssClass="style=width:30px;"
                                NextPageImageUrl="" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div id="divMemRespond" runat="server" style="border-style: solid; border-width: 2px;
                    border-color: inherit; position: relative; overflow: hidden; top: 0px; left: 0px;
                    height: 194px; width: 802px;">
                    <asp:DataPager ID="DataPager11" runat="server" PagedControlID="lvMemRespond" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField NextPageText=" " />
                        </Fields>
                    </asp:DataPager>
                    <asp:ListView ID="lvMemRespond" runat="server">
                        <LayoutTemplate>
                            <tr runat="server" id="itemplaceholder">
                            </tr>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Label6" Text='<% #Eval("id") %>'></asp:Label>
                            <asp:ImageButton ID="pictureControlID" runat="server" alt="" align="top" border="2"
                                Style="width: 158px; height: 182px; border: 2px #666666 solid;" PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>'
                                ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager12" runat="server" PagedControlID="lvMemRespond" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ButtonCssClass="style=width:30px;"
                                NextPageImageUrl="" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div id="divFilteredbyme" runat="server" style="border-style: solid; border-width: 2px;
                    border-color: inherit; position: relative; overflow: hidden; top: 0px; left: 0px;
                    height: 194px; width: 802px;">
                    <asp:DataPager ID="DataPager13" runat="server" PagedControlID="lvFilteredbyme" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField NextPageText=" " />
                        </Fields>
                    </asp:DataPager>
                    <asp:ListView ID="lvFilteredbyme" runat="server">
                        <LayoutTemplate>
                            <tr runat="server" id="itemplaceholder">
                            </tr>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Label7" Text='<% #Eval("id") %>'></asp:Label>
                            <asp:Image ID="pictureControlID" runat="server" alt="" align="top" border="2" Style="width: 158px;
                                height: 182px; border: 2px #666666 solid;" PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>'
                                ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager14" runat="server" PagedControlID="lvFilteredbyme" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ButtonCssClass="style=width:30px;"
                                NextPageImageUrl="" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div id="divMemwhofilteredme" runat="server" style="border-style: solid; border-width: 2px;
                    border-color: inherit; position: relative; overflow: hidden; top: 0px; left: 0px;
                    height: 194px; width: 802px;">
                    <asp:DataPager ID="DataPager15" runat="server" PagedControlID="lvMemwhofilteredme"
                        PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField NextPageText=" " />
                        </Fields>
                    </asp:DataPager>
                    <asp:ListView ID="lvMemwhofilteredme" runat="server">
                        <LayoutTemplate>
                            <tr runat="server" id="itemplaceholder">
                            </tr>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Label8" Text='<% #Eval("id") %>'></asp:Label>
                            <asp:ImageButton ID="pictureControlID" runat="server" alt="" align="top" border="2"
                                Style="width: 158px; height: 182px; border: 2px #666666 solid;" PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>'
                                ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager16" runat="server" PagedControlID="lvMemwhofilteredme"
                        PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ButtonCssClass="style=width:30px;"
                                NextPageImageUrl="" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div id="divmemnotIntrme" runat="server" style="border-style: solid; border-width: 2px;
                    border-color: inherit; position: relative; overflow: hidden; top: 0px; left: 0px;
                    height: 194px; width: 802px;">
                    <asp:DataPager ID="DataPager17" runat="server" PagedControlID="lvmemnotIntrme" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField NextPageText=" " />
                        </Fields>
                    </asp:DataPager>
                    <asp:ListView ID="lvmemnotIntrme" runat="server">
                        <LayoutTemplate>
                            <tr runat="server" id="itemplaceholder">
                            </tr>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Label9" Text='<% #Eval("id") %>'></asp:Label>
                            <asp:ImageButton ID="pictureControlID" runat="server" alt="" align="top" border="2"
                                Style="width: 158px; height: 182px; border: 2px #666666 solid;" PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>'
                                ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager18" runat="server" PagedControlID="lvmemnotIntrme" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ButtonCssClass="style=width:30px;"
                                NextPageImageUrl="" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
                <div id="divMemmenotIntr" runat="server" style="border-style: solid; border-width: 2px;
                    border-color: inherit; position: relative; overflow: hidden; top: 0px; left: 0px;
                    height: 194px; width: 802px;">
                    <asp:DataPager ID="DataPager19" runat="server" PagedControlID="lvMemmenotIntr" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField NextPageText=" " />
                        </Fields>
                    </asp:DataPager>
                    <asp:ListView ID="lvMemmenotIntr" runat="server">
                        <LayoutTemplate>
                            <tr runat="server" id="itemplaceholder">
                            </tr>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="Label10" Text='<% #Eval("id") %>'></asp:Label>
                            <asp:ImageButton ID="pictureControlID" runat="server" alt="" align="top" border="2"
                                Style="width: 158px; height: 182px; border: 2px #666666 solid;" PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>'
                                ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="DataPager20" runat="server" PagedControlID="lvMemmenotIntr" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ButtonCssClass="style=width:30px;"
                                NextPageImageUrl="" ShowNextPageButton="true" ShowPreviousPageButton="false" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </div>
        </div>
        
    </div>


     <div style="min-height:1000px;">
    
    </div>
</asp:Content>
