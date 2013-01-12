<%@ Page Title="" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="leftpane">

        <ul style="list-style: none outside none;">
            <li><a href="admin.aspx?opt=1">option1</a>
            </li>
            <li><a href="admin.aspx?opt=2">option2</a>
            </li>
            <li><a href="admin.aspx?opt=3">option3</a>
            </li>
            <li><a href="admin.aspx?opt=3">option3</a>
            </li>
        </ul>

    </div>
    <div class="content">
        <asp:ListView ID="lvprofiles" runat="server">
            <EmptyDataTemplate>
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

