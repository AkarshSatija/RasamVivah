<%@ Page Title="" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<script type="text/javascript">
    function selectall(e) {
        if (e == null) { e = window.event; }
        var sender = e.target.id;
        
        if (document.getElementById(sender).checked) {
            $('.selectlist').children('input[type="checkbox"]').prop('checked', true);
        }
        else {
            $('.selectlist').children('input[type="checkbox"]').prop('checked', false);
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="leftpane">

        <ul style="list-style: none outside none;">
            
            <li><a href="admin.aspx?type=newusers">New Users</a>
            </li>
            <li><a href="admin.aspx?type=active">Active</a>
            </li>
            <li><a href="admin.aspx?type=deactive">Deactive</a>
            </li>
            <li><a href="admin.aspx?type=inactive">Inactive</a>
            </li>            
            <li><a href="admin.aspx?type=expiring">Expiring</a>
            </li>
            <li><a href="admin.aspx?type=expired">Expired</a>
            </li>
            <li><a href="admin.aspx?type=paid">Paid</a>
            </li>
            <li><a href="admin.aspx?type=approved">Approved</a>
            </li>
            <li><a href="admin.aspx?type=unapproved">Unapproved</a>
            </li>
            
            
        </ul>

    </div>
    <div class="content">
        <asp:ListView ID="lvprofiles" runat="server" 
            onitemdatabound="lvprofiles_ItemDataBound">
            <EmptyDataTemplate>
            
                            <div>
                                No Records available in this category
                            </div>
            </EmptyDataTemplate>
            <ItemTemplate>
                <tr>
                <td>
                <asp:CheckBox ID="cbselect" CssClass="selectlist" runat="server" />
                </td>
                <td><a target="_blank" href="viewuser.aspx?id=<%# Eval("id") %>">
                    <asp:Label ID="lbid" runat="server" Text='<%# Eval("id") %>' />
                    </a>
               </td>
               <td><a target="_blank" href="viewuser.aspx?id=<%# Eval("id") %>">
                    <asp:Label ID="lbname" runat="server" ></asp:Label>
                    </a>
               </td>
               <td>
              <asp:CheckBox ID="cbactive" runat="server" />              
               </td>
                <td>
              <asp:CheckBox ID="cbapproved" runat="server"  />              
               </td>
                <td>
              <asp:CheckBox ID="cbpaid" runat="server" Enabled="false" />              
               </td>
               
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
           
                <table id="itemPlaceholderContainer" runat="server" border="3" >
                
                <tr><td><asp:CheckBox ID="cbselectall" runat="server" onClick="selectall(event)" /></td>
                <td>id</td>
                <td>name</td>
                <td>active</td>
                <td>approve</td>
                <td>paid member</td>
                </tr>
                    <tr runat="server" id="itemPlaceholder" >
                    <th><td>id</td><td>name</td><td>active</td><td>approve</td></th>
                </tr>
                
                </table>
             
            </LayoutTemplate>
        </asp:ListView>
        <asp:DropDownList ID="ddlactions" runat="server">
        <asp:ListItem Value="0">Action</asp:ListItem>
        <asp:ListItem Value="1">Activate</asp:ListItem>
        <asp:ListItem Value="2">Deactivate</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btngo" runat="server" Text="Go" onclick="btngo_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button runat="server" ID="btnSave" Text="Save Changes" 
            onclick="btnSave_Click"  />
    </div>
    
</asp:Content>

