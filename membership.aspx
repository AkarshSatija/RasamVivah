<%@ Page Title="" Language="C#" MasterPageFile="~/MasterLoginOptional.master" AutoEventWireup="true"
    CodeFile="membership.aspx.cs" Inherits="membership" %>

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
        <div class="qsearch" style="top: -50px;">
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
        <div class="rightpane">
            <div style="padding: 5px;">
                <table width="100%" border="0" cellpadding="4">
                    <tr>
                        <td>
                            <a href="/">Home</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="aboutus.aspx">About Us</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="services.aspx">Services</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="membership.aspx">Membership Plans</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="javascript:redirectToLogin()">Login</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="help.aspx">Help</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="contactus.aspx">Contact Us</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>


        <div class="static" style="top: 75px; width: 75.5%; padding-top:25px; padding-bottom:50px;">
           <span style="color: Red; font-size: 16px; font-weight: 700;">Membership Options </span>

            <br />
            <br />
            
            
            
                <table class="membership-table">
                    <tr style="font-weight:bold;">
                        <td>
                            Benefits
                        </td>
                        <td>
                            Paid Member
                        </td>
                        <td>
                            Free Member
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Create Profile, Create Album, Define Partner Profile, Search and Express Interest
                        </td>
                        <td>
                            <img src="images/right.png" alt="right" />
                        </td>
                        <td>
                            <img src="images/right.png" alt="right" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Contact Members
                        </td>
                        <td>
                           <img src="images/right.png" alt="right" class="membership-detailIMG"/>
                        </td>
                        <td>
                        <img src="images/wrong.png" alt="right" class="membership-detailIMG"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            View Contact Details of accepted members
                        </td>
                        <td>
                           <img src="images/right.png" alt="right" class="membership-detailIMG"/>
                        </td>
                        <td>
                        <img src="images/wrong.png" alt="right" class="membership-detailIMG"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            View Contact Details instantly with direct calls
                        </td>
                        <td>
                           <img src="images/right.png" alt="right" class="membership-detailIMG"/>
                        </td>
                        <td>
                        <img src="images/wrong.png" alt="right" class="membership-detailIMG"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Send Messages along with your Contact Details
                       </td>
                        <td>
                           <img src="images/right.png" alt="right" class="membership-detailIMG"/>
                        </td>
                        <td>
                        <img src="images/wrong.png" alt="right" class="membership-detailIMG"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Start Online Chat
                        </td>
                        <td>
                           <img src="images/right.png" alt="right" class="membership-detailIMG"/>
                        </td>
                        <td>
                        <img src="images/wrong.png" alt="right" class="membership-detailIMG"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Let others see your contact details
                         </td>
                        <td>
                           <img src="images/right.png" alt="right" class="membership-detailIMG"/>
                        </td>
                        <td>
                        <img src="images/wrong.png" alt="right" class="membership-detailIMG"/>
                            
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Feature in searches for members, with contact details visible
                        </td>
                        <td>
                           <img src="images/right.png" alt="right" class="membership-detailIMG"/>
                        </td>
                        <td>
                        <img src="images/wrong.png" alt="right" class="membership-detailIMG"/>
                            
                        </td>
                   
                    </tr>
                </table>
           
        </div>
   
   
   
        <div class="static" style="top: 75px; width: 75.5%; padding-top:25px; ">
            <div>
                <span style="font-size:16px; font-weight:bold;  color: #3C3CFF">Services</span>
                <br />
                <br />
                <asp:ListView ID="lvplan" runat="server" DataSourceID="XmlDataSource1" OnItemDataBound="lvplan_ItemDataBound"
                    OnItemCommand="lvplan_ItemCommand">
                    <EmptyDataTemplate>
                    <td>No plans Available rite now</td>
                    </EmptyDataTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <%--<td>
                                <asp:Label ID="planLabel" runat="server" Text='<%# Eval("Plan") %>' />
                            </td>--%>
                            
                            <td>
                                <asp:Label ID="durationLabel" runat="server" Text='<%# Eval("Duration")+" Months" %>' />
                            </td>
                            <td>
                                Rs.
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("Price") %>' />
                            </td>
                           <%-- <td>
                                <asp:Button ID="btnAnswers" CommandName='<%# Eval("value") %>' runat="server" Text="Buy Now" />
                            </td>--%>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table width="100%" id="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr align="center" style="text-align: center;" runat="server">
                                            <%--<th runat="server">
                                                Plan
                                            </th>--%>
                                            <th runat="server">
                                                Service Period
                                            </th>
                                          <th runat="server" >
                                                &nbsp;&nbsp;&nbsp;&nbsp; Price INR
                                            </th>
                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
               
                </asp:ListView>
                <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/xml/plan.xml">
                </asp:XmlDataSource>
                <br />
            </div>




            <div>
                <center>
                    <div runat="server" id="divPayNow" visible="false">
                       
                        <asp:Label ID="lbservices" runat="server"></asp:Label>
                        
                        <asp:Label ID="lbamount" runat="server" Text="" Visible="false"></asp:Label>
                        <br />
                        <br />
                        <h1>
                            <asp:Label ID="lbvalue" runat="server" Text="Your Total Rs."></asp:Label><asp:Label
                                ID="lbprice" runat="server" Text="0"></asp:Label></h1>
                        <h1>
                            &nbsp;</h1>
                        &nbsp;<asp:Button ID="btnbuy" runat="server" Text="Proceed to buy" Height="44px"
                            Width="140px" OnClick="btnbuy_Click" CssClass="grnbtn" />
                        <br />
                        <br />
                    </div>
                    
                 
                </center>
            </div>
        </div>

        <div class="static" style="top: 60px; width: 75.5%; padding-top:25px; padding-bottom:50px;">
           <span style="color: Red; font-size: 16px; font-weight: 700;">Payment Details </span>

            <br />
           <br />
            <table>
            <tr>
            <td>
            Bank To Bank Fund Transfers
            </td>
            </tr>
            <tr>
            <td>
              <img src="images/D_13340620453.gif" alt="right" />
            </td>
            </tr>
            <tr>
            <td style="color:Green">
            Bank Account Details
            <br />
            <br />
            </td>
            </tr>
            <tr>
            <td>
             Payee Name  </td>
             <td>:</td>
             <td> Stralend Info India Pvt. Ltd.</td>
            
            </tr>
            <tr>
            <td>
            Kotak Mahindra Bank A/c No </td>
            <td>:</td>
            <td>
             0711231021
            </td>
            </tr>
            <tr>
            <td>
            Branch </td> 
            <td>:</td>  <td>Preet Vihar, New Delhi-110092
            </td>
            </tr>
            <tr>
            <td>IFSC Code </td>
            <td>:</td>
            <td>KKBK0000138</td>
            </tr>
            </table>
            </div>
    </div>


    <div style="height:100px;"></div>
</asp:Content>
