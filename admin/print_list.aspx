<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_list.aspx.cs" Inherits="admin_print_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="assets/stylesheets/adminlayout.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <!-- top bar! -->

        <div class="adminlvout">
        <asp:Button ID="btnexcel" runat="server" Text="Excel" onclick="btnexcel_Click" />
        </div>

        <!-- top bar! -->

        <div>
            <asp:ListView ID="lvprofiles" runat="server" OnItemDataBound="lvprofiles_ItemDataBound">
                
                <EmptyDataTemplate>
                    <div>
                        No Records available
                    </div>
                </EmptyDataTemplate>
                
                <ItemTemplate>
                    <tr>
                        
                        <td>
                            <a target="_blank" href="viewuser.aspx?id=<%# Eval("id") %>">
                                <asp:Label ID="lbid" runat="server" Text='<%# Eval("id") %>' />
                            </a>
                        </td>
                        <td>
                            <a target="_blank" href="viewuser.aspx?id=<%# Eval("id") %>">
                                <asp:Label ID="lbname" runat="server"></asp:Label>
                            </a>
                        </td>
                        <td>
                            <asp:Label ID="lbactive" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lbapproved" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lbpaid" runat="server" />
                        </td>
                        
                        <td>
                            <asp:Label ID="lbplan" runat="server" />
                        </td>
                        <td>
                            <asp:Label ID="lbplanExpDate" runat="server" />
                        </td>
                        
                    </tr>
                </ItemTemplate>
                
                <LayoutTemplate>
                    <table id="itemPlaceholderContainer" runat="server" style="border: 3px solid #C3D9FF; width: 100%; text-align:left;">
                        <tr align="left">
                            
                            <th>
                                Id
                            </th>
                            <th>
                                Name
                            </th>
                            <th>
                                Active
                            </th>
                            <th>
                                Approve
                            </th>
                            <th>
                                Paid Member
                            </th>
                            <th>
                                Plan
                            </th>
                            <th>
                                Membership Expiring on
                            </th>
                        </tr>
                        <tr runat="server" id="itemPlaceholder">
                            
                        </tr>
                    </table>
                </LayoutTemplate>
            
            
            
            </asp:ListView>
        </div>
    </div>
    </form>
</body>
</html>
