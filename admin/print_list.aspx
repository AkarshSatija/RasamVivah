<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_list.aspx.cs" Inherits="admin_print_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

    <!-- top bar! -->
    <div>
    
    </div>
    
    
    
    
    <div>
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
               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "makepaid.aspx?whom="+Eval("id") %>' >Make Paid</asp:HyperLink>
               
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
    
    
    </div>
    </div>
    </form>
</body>
</html>
