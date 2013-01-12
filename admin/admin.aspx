<%@ Page Title="" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="leftpane">

        <ul style="list-style: none outside none;">
            <li><a href="admin.aspx?type=active">Active</a>
            </li>
            <li><a href="admin.aspx?type=deactive">Deactive</a>
            </li>
            <li><a href="admin.aspx?type=search">Search</a>
            </li>
            <li><a href="admin.aspx?type=expiring">Expiring</a>
            </li>
            <li><a href="admin.aspx?type=expired">Expired</a>
            </li>
            <li><a href="admin.aspx?type=paid">Paid</a>
            </li>
            <li><a href="admin.aspx?type=manage">Manage Packages/Rates</a>
            </li>
            <li><a href="admin.aspx?type=email">Send E-mail to all</a>
            </li>
            <li><a href="admin.aspx?type=approved">Approved Users</a>
            </li>
            <li><a href="admin.aspx?type=unapproved">Unapproved Users</a>
            </li>
            <li><a href="admin.aspx?type=newusers">New Users</a>
            </li>
            <li><a href="admin.aspx?type=banners">Change Banners</a>
            </li>
            <li><a href="admin.aspx?type=ads">Manage Ads</a>
            </li>
        </ul>

    </div>
    <div class="content">
        <asp:ListView ID="lvprofiles" runat="server">
            <EmptyDataTemplate>
            
                            <div>
                                No Records available in this category
                            </div>
            </EmptyDataTemplate>
            <ItemTemplate>
                <li>
                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' Visible="false" />
                    <%--<asp:Label ID="Label2" runat="server" Text='<%# Eval("fname").ToString()+" "+ Eval("mname").ToString()+" "+Eval("lname").ToString() %>' />--%>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("id").ToString() %>' />
                </li>
            </ItemTemplate>
            <LayoutTemplate>

                <ul id="itemPlaceholderContainer" runat="server">
                    <ul runat="server" id="itemPlaceholder" />
                </ul>
                </div>
            </LayoutTemplate>
        </asp:ListView>

    </div>
    <div class="rightpane">
        <ul>
            <li>1.
            </li>
            <li>3.
            </li>
            <li>3.
            </li>
            <li>1.
            </li>
        </ul>
    </div>
</asp:Content>

