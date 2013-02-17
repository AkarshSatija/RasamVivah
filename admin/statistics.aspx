<%@ Page Title="" Language="C#" MasterPageFile="adminMaster.master" AutoEventWireup="true" CodeFile="statistics.aspx.cs" Inherits="statistics" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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

    <div class="content" style="float: left;    padding-top: 18px; ">

    <div class="adminlvout">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                                Select Start Date<asp:TextBox ID="tbstartdt" runat="server" Width="180px"></asp:TextBox>
                                
                                <%--<asp:CustomValidator ID="cvdob" runat="server" ErrorMessage="* Invalid Age(Should be in 18 to 65)"
                                    ClientValidationFunction="Validate" ControlToValidate="txtdob" ValidateEmptyText="true"
                                    ForeColor="Black"></asp:CustomValidator>--%>
                                <cc1:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" StartDate="01/01/2013"  runat="server" TargetControlID="tbstartdt">
                                </cc1:CalendarExtender>


                                 Select End Date<asp:TextBox ID="tbenddt" runat="server" Width="180px"></asp:TextBox>
                                
                                <%--<asp:CustomValidator ID="cvdob" runat="server" ErrorMessage="* Invalid Age(Should be in 18 to 65)"
                                    ClientValidationFunction="Validate" ControlToValidate="txtdob" ValidateEmptyText="true"
                                    ForeColor="Black"></asp:CustomValidator>--%>
                                <cc1:CalendarExtender ID="CalendarExtender2" Format="dd/MM/yyyy" StartDate="01/01/2013" runat="server" TargetControlID="tbenddt">
                                </cc1:CalendarExtender>
                                <asp:Button ID="btnsearch" runat="server" Text="search" 
            onclick="btnsearch_Click" />
    
    </div>
        <%--<div class="adminlvout">
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
        </div>--%>

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
        </div>
    </div>
    
</asp:Content>

