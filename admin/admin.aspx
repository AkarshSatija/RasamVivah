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

    
    <div class="content" style="float: left; padding-top: 18px; ">
        <div class="adminlvout">
        <asp:DropDownList ID="DropDownList1" runat="server">
        <asp:ListItem Value="0">Action</asp:ListItem>
        <asp:ListItem Value="1">Activate</asp:ListItem>
        <asp:ListItem Value="2">Deactivate</asp:ListItem>
        <asp:ListItem Value="3">Approve</asp:ListItem>
        <asp:ListItem Value="4">Unpprove</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Go" onclick="btngo_Click"  />
            <asp:Button ID="Button3" runat="server" Text="Refresh" 
                onclick="Button3_Click"  />
        <asp:Button runat="server" ID="Button2" Text="Save Changes" onclick="btnSave_Click" style="float:right"  />
        </div>


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
               <td>
               <asp:HyperLink runat="server" NavigateUrl='<%# "makepaid.aspx?whom="+Eval("id") %>' >Make Paid</asp:HyperLink>
               
               </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
           
                <table id="itemPlaceholderContainer" runat="server" style=" border:3px solid #C3D9FF; border-bottom:0; width:100%" >
                
                <tr style="border-bottom:2px solid black; ">
                <td><asp:CheckBox ID="cbselectall" runat="server" onClick="selectall(event)" /></td>
                <td>Id</td>
                <td>Name</td>
                <td>Active</td>
                <td>Approve</td>
                <td>Paid Member</td>
                </tr>

                    <tr runat="server" id="itemPlaceholder" >
                    <th><td>id</td><td>Name</td><td>Active</td><td>Approve</td></th>
                </tr>
                
                </table>
             
            </LayoutTemplate>
            
        </asp:ListView>
        <div class="adminlvout">
        <asp:DropDownList ID="ddlactions" runat="server">
        <asp:ListItem Value="0">Action</asp:ListItem>
        <asp:ListItem Value="1">Activate</asp:ListItem>
        <asp:ListItem Value="2">Deactivate</asp:ListItem>
        <asp:ListItem Value="3">Approve</asp:ListItem>
        <asp:ListItem Value="4">Unpprove</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="btngo" runat="server" Text="Go" onclick="btngo_Click" />
               
                 
        
        <asp:Button runat="server" ID="btnSave" Text="Save Changes" style="float:right" onclick="btnSave_Click"  />
        <asp:Button runat="server" ID="Button5" Text="Export" style="float:right" 
                onclick="Button5_Click"   />
        </div>
    </div>
    
</asp:Content>

