<%@ Page Title="" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                    <asp:Label ID="lbid" runat="server" Text='<%# Eval("id") %>' />
               </td>
               <td>
                    <asp:Label ID="lbname" runat="server" ></asp:Label>
               </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
           
                <table id="itemPlaceholderContainer" runat="server" border=3 >
                    <tr runat="server" id="itemPlaceholder" >
                    </tr>
                </table>
             
            </LayoutTemplate>
        </asp:ListView>

    </div>
    
</asp:Content>

