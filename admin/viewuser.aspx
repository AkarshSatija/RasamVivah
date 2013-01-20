<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="adminMaster.master"
    CodeFile="viewuser.aspx.cs" Inherits="viewuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                        &nbsp;&nbsp;<asp:DropDownList ID="drpcity" runat="server" Width="100px">
                            <asp:ListItem>City</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:DropDownList ID="drpadvcountry" runat="server" Width="100px" AutoPostBack="true"
                            OnSelectedIndexChanged="drpadvcountry_SelectedIndexChanged">
                            <asp:ListItem Text="Country"></asp:ListItem>
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
                        <a href="../search.aspx">Advance search</a>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </asp:Panel>
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
                    Last login:<asp:Label ID="lblogindetails" runat="server" />
                </td>
            </tr>
        </table>
    </div>
    <div class="content">
        <div>
            <div class="xbox">
                <div class="heading">
                    About Me
                </div>
                <div>
                    <table cellpadding="1">
                        <tr>
                            <td>
                                <div>
                                    <asp:Label ID="lbaboutme" runat="server"></asp:Label></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="xbox">
                <div class="heading">
                    About My Family
                </div>
                <div>
                    <table cellpadding="1">
                        <tr>
                            <td>
                                <div>
                                    <asp:Label ID="lbaboutfamily" runat="server"></asp:Label></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="xbox">
                <div class="heading">
                    About My Occupation
                </div>
                <div>
                    <table cellpadding="1">
                        <tr>
                            <td>
                                <div>
                                    <asp:Label ID="lbabouteducation" runat="server"></asp:Label></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="xbox">
                <div class="heading">
                    My Desired Partner
                </div>
                <div>
                    <table cellpadding="1" style="width: 100%">
                        <tr>
                            <td>
                                Age:
                            </td>
                            <td>
                                <asp:Label ID="lbPartnerAge" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Height:
                            </td>
                            <td>
                                <asp:Label ID="lbPartnerHeight" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Marrital Status:
                            </td>
                            <td>
                                <div style="max-width: 200px;">
                                    <asp:Label ID="lbPartnerM_Status" runat="server"></asp:Label></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Religion:
                            </td>
                            <td>
                                <div style="max-width: 200px;">
                                    <asp:Label ID="lbPartnerReligion" runat="server"></asp:Label></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mother Tongue:
                            </td>
                            <td>
                                <div style="max-width: 200px;">
                                    <asp:Label ID="lbPartnerMotherTongue" runat="server"></asp:Label></div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Income:
                            </td>
                            <td>
                                <asp:Label ID="lbPartnerIncome" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Description:
                            </td>
                            <td>
                                <div style="max-width: 200px; overflow: hidden;">
                                    <asp:Label ID="lbPartnerDesc" runat="server"></asp:Label></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="xbox">
                <div class="heading">
                    Contact Me at:
                </div>
                <div id="divContactInfo" runat="server" visible="false">
                    <asp:ListView ID="lvcontactInfo" runat="server" DataSourceID="SqlDataSourceContactInfo">
                        <EmptyDataTemplate>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        emailid:
                                    </td>
                                    <td>
                                        <asp:Label ID="emailidLabel" runat="server" Text='<%# Eval("emailid") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        mobile:
                                    </td>
                                    <td>
                                        <asp:Label ID="mobileLabel" runat="server" Text='<%# Eval("mobile") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        address:
                                    </td>
                                    <td>
                                        <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        city:
                                    </td>
                                    <td>
                                        <asp:Label ID="cityLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//cities.xml"), "option", Eval("city").ToString()) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        state:
                                    </td>
                                    <td>
                                        <asp:Label ID="stateLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//state.xml"), "option", Eval("state").ToString()) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        country:
                                    </td>
                                    <td>
                                        <%--<asp:Label ID="countryLabel" runat="server" Text='<%# Eval("country") %>' />--%>
                                        India
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceContactInfo" runat="server" ConnectionString="<%$ ConnectionStrings:matrimonialConnectionString %>"
                        SelectCommand="SELECT logins.emailid, p_details.mobile, p_details.address, p_details.city, p_details.state, p_details.country FROM logins CROSS JOIN p_details WHERE (logins.id = @id) AND (p_details.id = @id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                
            </div>
            <div class="xbox">
                <div class="heading">
                    Basic Information
                </div>
                <div>
                    <asp:ListView ID="lv" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1"
                        OnItemDataBound="lv_ItemDataBound">
                        <EmptyDataTemplate>
                            <span>
                                <% lv.Visible = false; %></span>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <span style="">
                               
                                <table>
                                    <tr>
                                        <td>
                                            Date of Birth:
                                        </td>
                                        <td>
                                            <asp:Label ID="dobLabel" runat="server" Text='<%# Eval("dob","{0:MMM d, yyyy}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Gender:
                                        </td>
                                        <td>
                                            <asp:Label ID="genderLabel" runat="server" Text="Female" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Marital Status:
                                        </td>
                                        <td>
                                            <asp:Label ID="m_statusLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//marital.xml"), "status", Eval("m_status").ToString())  %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Country Living in:
                                        </td>
                                        <td>
                                            <asp:Label ID="countryLabel" runat="server" Text="India" />
                                            <%-- Text='<%# Eval("country") %>' --%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            State:
                                        </td>
                                        <td>
                                            <asp:Label ID="stateLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//state.xml"), "option", Eval("state").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            City:
                                        </td>
                                        <td>
                                            <asp:Label ID="cityLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//cities.xml"), "option", Eval("city").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mother Tongue:
                                        </td>
                                        <td>
                                            <asp:Label ID="mother_tongueLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//mother_tongue.xml"), "language", Eval("mother_tongue").ToString()) %>' />
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:matrimonialConnectionString %>"
                        SelectCommand="SELECT [id], [fname], [mname], [lname], [dob], [gender], [mobile], [m_status], [country], [state], [city], [address], [mother_tongue] FROM [p_details] WHERE ([id] = @id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="xbox">
                <div class="heading">
                    Family Details
                </div>
                <div>
                    <asp:ListView ID="lv1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource2"
                        OnItemDataBound="lv1_ItemDataBound">
                        <ItemTemplate>
                            <span style="">
                                <table>
                                    <tr>
                                        <td>
                                            Family Values:
                                        </td>
                                        <td>
                                            <asp:Label ID="f_valuesLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//family_values.xml"), "option", Eval("f_values").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Family Type:
                                        </td>
                                        <td>
                                            <asp:Label ID="f_typeLabel" runat="server" Text='<%#p.getTextXml(Server.MapPath("..//xml//family_type.xml"), "option", Eval("f_type").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Family Status:
                                        </td>
                                        <td>
                                            <asp:Label ID="f_statusLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//family_status.xml"), "option", Eval("f_status").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Father:
                                        </td>
                                        <td>
                                            <asp:Label ID="father_occLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//father_occ.xml"), "option", Eval("father_occ").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mother:
                                        </td>
                                        <td>
                                            <asp:Label ID="mother_occLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//mother_occ.xml"), "option", Eval("mother_occ").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Brother(s):
                                        </td>
                                        <td>
                                            <asp:Label ID="brothersLabel" runat="server" Text='<%# Eval("brothers") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Sister(s):
                                        </td>
                                        <td>
                                            <asp:Label ID="sistersLabel" runat="server" Text='<%# Eval("sisters") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Living with Parents:
                                        </td>
                                        <td>
                                            <asp:Label ID="liv_withlabel" runat="server" Text="Yes" />
                                            <%--<asp:CheckBox ID="liv_withCheckBox" runat="server" Checked='<%# Eval("liv_with") %>'
                                                Enabled="false" Text="Living with Parents" />--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Residency Status:
                                        </td>
                                        <td>
                                            <asp:Label ID="residency_statusLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//residency.xml"), "option", Eval("residency_status").ToString()) %>' />
                                        </td>
                                    </tr>
                                </table>
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:matrimonialConnectionString %>"
                        SelectCommand="SELECT [id], [f_values], [f_type], [f_status], [father_occ], [mother_occ], [brothers], [sisters], [liv_with], [other], [residency_status] FROM [family] WHERE ([id] = @id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="xbox">
                <div class="heading">
                    Religion and Ethnicity
                </div>
                <div>
                    <asp:ListView ID="lv2" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource3">
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <span style="">
                                <table>
                                    <tr>
                                        <td>
                                            Caste:
                                        </td>
                                        <td>
                                            <asp:Label ID="casteLabel" runat="server" Text='<%# p.getCaste(Eval("religion").ToString(),Eval("caste").ToString(),Server.MapPath("..//xml//")) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Religion:
                                        </td>
                                        <td>
                                            <asp:Label ID="religionLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//religion.xml"), "option", Eval("religion").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Sub caste:
                                        </td>
                                        <td>
                                            <asp:Label ID="sub1Label" runat="server" Text='<%# Eval("sub1") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:matrimonialConnectionString %>"
                        SelectCommand="SELECT [id], [caste], [religion], [sub1] FROM [religion] WHERE ([id] = @id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="xbox">
                <div class="heading">
                    Education and Occupation
                </div>
                <div>
                    <asp:ListView ID="lv3" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource4">
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <span style="">
                                <table>
                                    <tr>
                                        <td>
                                            Highest degree:
                                        </td>
                                        <td>
                                            <asp:Label ID="highest_degLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//degree.xml"), "courses", Eval("highest_deg").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Work Status:
                                        </td>
                                        <td>
                                            <asp:Label ID="work_statusLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//working_with.xml"), "with", Eval("work_status").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Occupation:
                                        </td>
                                        <td>
                                            <asp:Label ID="work_areaLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//occupation.xml"), "occupation", Eval("work_area").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Annual Income:
                                        </td>
                                        <td>
                                            <asp:Label ID="Annual_salaryLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//income.xml"), "rupee", Eval("Annual_salary").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Plan to work after marriage?
                                        </td>
                                        <td>
                                            <asp:Label ID="work_preferLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//work_prefer.xml"), "option", Eval("work_prefer").ToString()) %>' />
                                        </td>
                                    </tr>
                                </table>
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:matrimonialConnectionString %>"
                        SelectCommand="SELECT [id], [highest_deg], [work_status], [work_area], [other], [Annual_salary], [work_prefer] FROM [education] WHERE ([id] = @id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="xbox">
                <div class="heading">
                    Lifestyle and Attributes
                </div>
                <div>
                    <asp:ListView ID="lv4" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource5"
                        OnItemDataBound="lv4_ItemDataBound">
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <span style="">
                                <table>
                                    <tr>
                                        <td>
                                            Height:
                                        </td>
                                        <td>
                                            <asp:Label ID="heightLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//height.xml"), "height", Eval("height").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Weight:
                                        </td>
                                        <td>
                                            <asp:Label ID="weightLabel" runat="server" Text='<%# Eval("weight") %>' />kg
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Body type:
                                        </td>
                                        <td>
                                            <asp:Label ID="body_typeLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//body_type.xml"), "option", Eval("body_type").ToString())  %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Smoke:
                                        </td>
                                        <td>
                                            <asp:Label ID="smokeLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//smoke.xml"), "option", Eval("smoke").ToString())  %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Drink:
                                        </td>
                                        <td>
                                            <asp:Label ID="drinkLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//drink.xml"), "option", Eval("drink").ToString())  %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Diet:
                                        </td>
                                        <td>
                                            <asp:Label ID="dietLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//diet.xml"), "option", Eval("diet").ToString())  %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Complexion:
                                        </td>
                                        <td>
                                            <asp:Label ID="complexionLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//complexion.xml"), "option", Eval("complexion").ToString())  %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Challenged:
                                        </td>
                                        <td>
                                            <asp:Label ID="challengedLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//challenged.xml"), "option", Eval("challenged").ToString())  %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Blood group:
                                        </td>
                                        <td>
                                            <asp:Label ID="blood_groupLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//bloodgroup.xml"), "option", Eval("blood_group").ToString())  %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            HIV:
                                        </td>
                                        <td>
                                            <asp:Label ID="HIVlabel" runat="server" Text="Positive" />
                                            <%--<asp:CheckBox ID="HIVCheckBox" runat="server" Checked='<%# Eval("HIV") %>' Enabled="false"
                                                Text="HIV" />--%>
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:matrimonialConnectionString %>"
                        SelectCommand="SELECT [id], [height], [weight], [body_type], [smoke], [drink], [diet], [complexion], [other], [challenged], [blood_group], [HIV] FROM [physical] WHERE ([id] = @id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="xbox">
                <div class="heading">
                    Astro/ Kundali Details
                </div>
                <div>
                    <asp:ListView ID="lv5" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource6">
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
                        <ItemTemplate>
                            <span style="">
                                <table>
                                    <tr>
                                        <td>
                                            Time of Birth:
                                        </td>
                                        <td>
                                            <asp:Label ID="birth_timeLabel" runat="server" Text='<%# Eval("birth_time","{0: hh:mm tt }") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Gotra Paternal:
                                        </td>
                                        <td>
                                            <asp:Label ID="gotra_paternalLabel" runat="server" Text='<%# Eval("gotra_paternal") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Gotra Maternal:
                                        </td>
                                        <td>
                                            <asp:Label ID="gotra_maternalLabel" runat="server" Text='<%# Eval("gotra_maternal") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            City of Birth:
                                        </td>
                                        <td>
                                            <asp:Label ID="ancestral_originLabel" runat="server" Text='<%# Eval("ancestral_origin") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Manglik/Chevvai Dosham:
                                        </td>
                                        <td>
                                            <asp:Label ID="manglikLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//manglik.xml"), "option", Eval("manglik").ToString())  %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Nakshatra:
                                        </td>
                                        <td>
                                            <asp:Label ID="nakshatraLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//nakshtra.xml"), "horo", Eval("nakshatra").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Rashi/Moon Sign:
                                        </td>
                                        <td>
                                            <asp:Label ID="moon_signLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//moon.xml"), "rashi", Eval("moon_sign").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Sun Sign:
                                        </td>
                                        <td>
                                            <asp:Label ID="sun_signLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//sun.xml"), "zodiac", Eval("sun_sign").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Horoscope Match needed:
                                        </td>
                                        <td>
                                            <asp:Label ID="horoscope_matchLabel" runat="server" Text='<%# p.getTextXml(Server.MapPath("..//xml//Horoscope_match.xml"), "option", Eval("horoscope_match").ToString()) %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Kundli:
                                        </td>
                                        <td>
                                            &nbsp;<asp:LinkButton ID="linkkundli" runat="server" Text="View Kundli" PostBackUrl='<%# "~/viewpdf.aspx?id="+Eval("id").ToString() %>'
                                                Font-Size="Small"></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:matrimonialConnectionString %>"
                        SelectCommand="SELECT * FROM [horoscope] WHERE ([id] = @id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <div class="login" style="top: 190px;">
        
        <ul>
        
        <li>
        <asp:Label ID="lbactive" runat="server" Text="active" ></asp:Label>
        </li>
        
        </ul>
        
    </div>
    <div style="min-height: 2800px;">
    <!-- --->

    </div>
</asp:Content>
