<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterLoginOptional.master"
    CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        document.onclick = hideall;
        function checklogin() {
            var ses = '<%= s %>';
            if (ses == '') {

                var r = window.confirm("Login To Proceed");
                if (r == true) {

                    window.location = "login.aspx?goto=" + document.URL;
                }
                else {
                    return false;
                }

            }
            else
                return true;
        }
        function hideall() {
            hideSaveSearchDiv();
            hidedivsavedsearches()


        }

        function hideSaveSearchDiv() {


            var div1;
            if (div1 = document.getElementById("divsavesearch")) {

                div1.style.display = 'none';
            }

        }

        function showSaveSearchDiv() {
            if (checklogin()) {
                var div1 = document.getElementById("divsavesearch");
                div1.style.display = '';
            }


        }

        function hidedivsavedsearches() {



            var div1;
            if (div1 = document.getElementById("divsavedsearches")) {

                div1.style.display = 'none';
            }
        }

        function showdivsavedsearches() {

            if (checklogin()) {
                var div1 = document.getElementById("divsavedsearches");
                div1.style.display = '';
            }
        }

        function cancelfurther(e) {
            if (!e) var e = window.event;
            e.cancelBubble = true;
            if (e.stopPropagation) e.stopPropagation();
        }
    
    </script>
    <script type="text/javascript">
        function Compare(sender, args) {



            var ddl1 = document.getElementById(("<%=drpadvlwrage.ClientID %>")).value;
            var ddl2 = document.getElementById(("<%=drpadvuprage.ClientID %>")).value;
            args.IsValid = true;

            if (ddl1 > ddl2) {
                window.alert("Please enter valid age range!!");
                args.IsValid = false;


            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
        <div>
            <div id="divfilldetails" runat="server" style="height:2550px">
                <div class="registerbox">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="rheading" colspan="2">
                                <center>
                                    Advance Search</center>
                            </td>
                        </tr>
                    </table>
                </div>
                <hr />
                <div class="searchbox">
                    <table>
                        <tr>
                            <td class="hdng" colspan="2">
                                Basic Details
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblooking" runat="server" Text="Looking for"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbtnlooking" runat="server" Width="200px" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0">Bride</asp:ListItem>
                                    <asp:ListItem Value="1">Groom</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvage" runat="server" Text="Age"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpadvlwrage" runat="server">
                                </asp:DropDownList>
                                to<asp:DropDownList ID="drpadvuprage" runat="server">
                                </asp:DropDownList>
                                <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="Compare" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvheight" runat="server" Text="Height"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="drpadvlwrheight" runat="server">
                                </asp:DropDownList>
                                to<asp:DropDownList ID="drpadvupprheight" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvmarital" runat="server" Text="Marital Status"></asp:Label>
                            </td>
                            <td>
                                <div class="noscrolldiv">
                                    <asp:CheckBoxList ID="chkadvmarital" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <%--<tr>
                            <td>
                                <asp:Label ID="lbadvchildren" runat="server" Text="Have Children"></asp:Label>
                            </td>
                            <td>
                                <div class="noscrolldiv">
                                    <asp:CheckBoxList ID="chkadvchildren" runat="server">
                                        <asp:ListItem>No</asp:ListItem>
                                        <asp:ListItem>Yes, living together</asp:ListItem>
                                        <asp:ListItem>Yes, living seperately</asp:ListItem>
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>--%>
                    </table>
                </div>
                <hr />
                <div class="searchbox">
                    <table>
                        <tr>
                            <td class="hdng" colspan="2">
                                Religion and Ethnicity
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvreligion" runat="server" Text="Religion"></asp:Label>
                            </td>
                            <td>
                                <div class="scrolldiv">
                                    <asp:CheckBoxList ID="chkadvreligion" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvmthrtongue" runat="server" Text="Mother Tongue"></asp:Label>
                            </td>
                            <td>
                                <div class="scrolldiv">
                                    <asp:CheckBoxList ID="chkadvmthrtongue" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <hr />
                <div class="searchbox">
                    <table>
                        <tr>
                            <td class="hdng" colspan="2">
                                Career, Education & Location
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvworkstatus" runat="server" Text="Work Status"></asp:Label>
                            </td>
                            <td>
                                <div class="scrolldiv">
                                    <asp:CheckBoxList ID="chkadvworkstatus" runat="server" Height="16px">
                                        <%-- <asp:ListItem>Not Working</asp:ListItem>
                                    <asp:ListItem>Employed</asp:ListItem>
                                    <asp:ListItem>Entrepreneur</asp:ListItem>
                                    <asp:ListItem>Consultant</asp:ListItem>
                                    <asp:ListItem>Student</asp:ListItem>
                                    <asp:ListItem>Academia</asp:ListItem>
                                    <asp:ListItem>Defence</asp:ListItem>
                                    <asp:ListItem>Independent worker/Free lancer</asp:ListItem>--%>
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvoccupation" runat="server" Text="Occupation"></asp:Label>
                            </td>
                            <td>
                                <div class="scrolldiv">
                                    <asp:CheckBoxList ID="chkadvoccupation" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadveducation" runat="server" Text="Education"></asp:Label>
                            </td>
                            <td>
                                <div class="scrolldiv">
                                    <asp:CheckBoxList ID="chkadveducation" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvincome" runat="server" Text="Annual Income"> </asp:Label>
                            </td>
                            <td colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Indian Rupees
                            </td>
                            <td>
                                <asp:DropDownList ID="drpadvlwrincome" runat="server">
                                    <asp:ListItem>Please select</asp:ListItem>
                                </asp:DropDownList>
                                to
                                <asp:DropDownList ID="drpadvupperincome" runat="server">
                                    <asp:ListItem>Please select</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvcountry" runat="server" Text="Country living in"></asp:Label>
                            </td>
                            <td>
                                <div class="scrolldiv">
                                    <asp:CheckBoxList ID="chkadvcountry" runat="server" OnSelectedIndexChanged="chkadvcountry_SelectedIndexChanged">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr id="trcity" visible="false" runat="server">
                            <td>
                                <asp:Label ID="lbadvcity" runat="server" Text="City"></asp:Label>
                            </td>
                            <td>
                                <div class="scrolldiv">
                                    <asp:CheckBoxList ID="chkadvcity" runat="server">
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <hr />
                <div class="searchbox">
                    <table>
                        <tr>
                            <td class="hdng" colspan="2">
                                Lifestyle & Attributes
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvdiet" runat="server" Text="Diet"></asp:Label>
                            </td>
                            <td>
                                <div class="noscrolldiv">
                                    <asp:CheckBoxList ID="chkadvdiet" runat="server">
                                        <%--<asp:ListItem Selected="True" Value="0">Doesn't Matter</asp:ListItem>--%>
                                        <asp:ListItem Value="1">Veg</asp:ListItem>
                                        <asp:ListItem Value="2">Non-Veg</asp:ListItem>
                                        <asp:ListItem Value="3">Occasionally Non-Veg</asp:ListItem>
                                        <asp:ListItem Value="4">Eggetarian</asp:ListItem>
                                        <asp:ListItem Value="5">Jain</asp:ListItem>
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvdrink" runat="server" Text="Drink"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbtnadvdrink" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="0">Doesn't Matter</asp:ListItem>
                                    <asp:ListItem Value="1">No</asp:ListItem>
                                    <asp:ListItem Value="2">Yes</asp:ListItem>
                                    <asp:ListItem Value="3">Occasionally</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvsmoke" runat="server" Text="Smoke"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbtnadvsmoke" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="0">Doesn't Matter</asp:ListItem>
                                    <asp:ListItem Value="1">No</asp:ListItem>
                                    <asp:ListItem Value="2">Yes</asp:ListItem>
                                    <asp:ListItem Value="3">Occasionally</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvbodytype" runat="server" Text="Body Type"></asp:Label>
                            </td>
                            <td>
                                <div class="noscrolldiv">
                                    <asp:CheckBoxList ID="chkadvbodytype" runat="server">
                                        <%--   <asp:ListItem Selected="True" Value="0">Doesn't Matter</asp:ListItem>--%>
                                        <asp:ListItem Value="1">Slim</asp:ListItem>
                                        <asp:ListItem Value="2">Athletic</asp:ListItem>
                                        <asp:ListItem Value="3">Average</asp:ListItem>
                                        <asp:ListItem Value="4">Heavy</asp:ListItem>
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvcomplexion" runat="server" Text="Complexion"></asp:Label>
                            </td>
                            <td>
                                <div class="noscrolldiv">
                                    <asp:CheckBoxList ID="chkadvcomplexion" runat="server">
                                        <%--   <asp:ListItem Selected="True" Value="0">Doesn't Matter</asp:ListItem>--%>
                                        <asp:ListItem Value="1">Very Fair</asp:ListItem>
                                        <asp:ListItem Value="2">Fair</asp:ListItem>
                                        <asp:ListItem Value="3">Wheatish</asp:ListItem>
                                        <asp:ListItem Value="4">Dark</asp:ListItem>
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvhiv" runat="server" Text="HIV positive"></asp:Label>
                            </td>
                            <td>
                                <asp:RadioButtonList ID="rbtnadvhiv" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True" Value="-1">Doesn't matter</asp:ListItem>
                                    <asp:ListItem Value="1">Positive</asp:ListItem>
                                    <asp:ListItem Value="0">Negative</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbadvspecialcase" runat="server" Text="Challenged"></asp:Label>
                            </td>
                            <td>
                                <div class="scrolldiv">
                                    <asp:CheckBoxList ID="chkadvspecialcase" runat="server" Height="93px">
                                        <asp:ListItem Value="1">None</asp:ListItem>
                                        <asp:ListItem Value="2">Physically challenged from birth</asp:ListItem>
                                        <asp:ListItem Value="3">Physically challenged due to accident</asp:ListItem>
                                        <asp:ListItem Value="4">Mentally challenged from birth</asp:ListItem>
                                        <asp:ListItem Value="5">Mentally challenged due to accident</asp:ListItem>
                                        <asp:ListItem Value="6">Physical abnormality affecting only looks</asp:ListItem>
                                        <asp:ListItem Value="7">Physical abnormality affecting bodily functions</asp:ListItem>
                                        <asp:ListItem Value="8">Physically and mentally challenged</asp:ListItem>
                                    </asp:CheckBoxList>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <br />
                <center>
                    <asp:Button ID="btsearch" CssClass="logbtn" runat="server" Text="Search" Height="31px"
                        Width="145px" PostBackUrl="~/search.aspx" OnClick="btsearch_Click" />
                    <br />
                    <br />
                </center>
            </div>

            <div id="divresult" runat="server" visible="false" onclick="hideall();" style="height:1500px">
                <div style="width: 82%; height: 70px;">
                    <br />
                    <table style="width: 100%">
                        <tr valign="top">
                            <td>
                                <label class="advSHeading">
                                    Search results
                                </label>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td align="left">
                                <asp:LinkButton ID="lnkrefine" runat="server" Text="Click Here to Refine Your search"
                                    PostBackUrl="~/search.aspx" Font-Underline="False" CssClass="linking"></asp:LinkButton>
                                <%--<asp:LinkButton ID="lnknext" runat="server" Text="next" OnClick="lnknext_Click"></asp:LinkButton>--%>
                            </td>
                            <td align="right" style="position: relative;">
                                <div id="divsavedsearches" class="customPopUp rounded-corners" onclick="cancelfurther(); "
                                    style="display: none; width: 186px; height: auto; top: -15px; left: 93px;">
                                    <div style="background-size: 100% 100%; font-size: 15px; color: #274fb6; background-color: #FA9C1F;
                                        font-weight: bold;">
                                        My Saved Searches:</div>
                                    <br />
                                    <asp:ListView ID="lvSavedSearches" runat="server" DataSourceID="SqlDataSourceSavedSearches">
                                        <EmptyDataTemplate>
                                            <span>No Saved searches</span>
                                        </EmptyDataTemplate>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="search_nameLabel" runat="server" Text='<%# Eval("search_name") %>'
                                                NavigateUrl='<%# "~/search.aspx?" + Eval("search_link") %>' />
                                            <br />
                                        </ItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSourceSavedSearches" runat="server" ConnectionString="<%$ ConnectionStrings:matrimonialConnectionString %>"
                                        SelectCommand="SELECT top 10 [search_name], [search_link], [user_id] FROM [saved_searches] WHERE ([user_id] = @user_id)
                                         order by created_at desc">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="user_id" SessionField="Id" Type="Int64" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <br />
                                    <a href="javascript:hidedivsavedsearches()">[close X]</a>
                                </div>
                                <a href="javascript:showdivsavedsearches()" class="linking">My Saved searches </a>
                            </td>
                            <td align="right" style="position: relative;">
                                <div id="divsavesearch" class="advancePopUp rounded-corners" onclick="cancelfurther(); "
                                    style="width: 218px; display: none; height: 90px; top: -13px; left: 63px;">
                                    <div>
                                        Save Your Search:</div>
                                    <br />
                                    <asp:TextBox ID="txtsavesearch" runat="server" MaxLength="18"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtsavesearch" SetFocusOnError="true"
                                        ValidationGroup="savesearch"></asp:RequiredFieldValidator>
                                    <asp:Button ID="btnsavesearch" runat="server" Text="Save" OnClick="btnsavesearch_Click"
                                        Height="22px" ValidationGroup="savesearch" />
                                    <br />
                                    <a href="javascript:hideSaveSearchDiv()">[close X]</a>
                                </div>
                                <a href="javascript:showSaveSearchDiv()" class="linking">Save Search for future use</a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Label ID="lbnosresults" runat="server" Visible="false"></asp:Label>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <br />
                <div>
                    <asp:ListView ID="lvsearch" runat="server" GroupItemCount="4">
                        <%--         
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td id="Td1" runat="server" />
        </EmptyItemTemplate>--%>
                        <GroupTemplate>
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4">
                                    <hr style="width: 100%" />
                                </td>
                            </tr>
                        </GroupTemplate>
                        <LayoutTemplate>
                            <table width="100%" style="width:100%">
                                <tr>
                                    <td>
                                        <table id="groupPlaceholderContainer" runat="server">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <td>
                                <div class="rounded-corners search-result-box">
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:ImageButton runat="server" ID="imgsearch" ImageUrl='<%# "~/image.ashx?id=" + Eval("id") %>'
                                                    PostBackUrl='<%# "~/viewprofile.aspx?user=" + Eval("id") %>' align="top" border="2"
                                                    Style="width: 158px; height: 182px; border: 2px #666666 solid;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                RV<asp:Label runat="server" ID="Label1" Text='<%# Eval("id") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label Width="150px" ID="lbaboutme" runat="server" Text='<%# p.getAboutMeString(Eval("id").ToString(), Server.MapPath("xml//")) %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>

</asp:Content>
