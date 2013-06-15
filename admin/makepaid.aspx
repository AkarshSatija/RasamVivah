<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminMaster.master" AutoEventWireup="true" CodeFile="makepaid.aspx.cs" Inherits="admin_makepaid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Label ID="lbnotif" runat="server" Visible="false"></asp:Label>

<div >
<div id="divnotif" runat="server">
Are You sure You want to add plan to <%= p.getAboutMeString(user, Server.MapPath("xml//").ToString(),2) %> (RV<%=user %>) ???
</div>
<br />

Select a plan
<asp:DropDownList ID="ddlplans" runat="server" DataSourceID="XmlDataSource1" 
        DataTextField="Plan" DataValueField="Duration">
</asp:DropDownList>

    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/xml/plan.xml">
    </asp:XmlDataSource>

<br />
Add commment 
<asp:TextBox ID="tbcomment" runat="server" TextMode="MultiLine" Height="88px" 
        Width="204px"></asp:TextBox>
        <br />

<asp:Button ID="btngo" runat="server" Text="Go" onclick="btngo_Click" 
        Width="120px" />
</div>


</asp:Content>


