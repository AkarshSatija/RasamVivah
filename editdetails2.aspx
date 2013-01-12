<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="editdetails2.aspx.cs" Inherits="editdetails2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Details 2</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:ImageButton ID="prof_image" runat="server" Style="width: 300px; height: auto;"
            alt="" ImageUrl='<%# "~/image.ashx?id=" + Session["id"].ToString() %>' />
        <br />
        <br />
        <asp:FileUpload ID="fuplddp" CssClass="uploadbtn" runat="server" />
        <asp:Button ID="btnupld" runat="server" Text="Upload" OnClick="btnupld_Click" />
        <asp:RequiredFieldValidator Font-Size="12px" ForeColor="Red" runat="server" ControlToValidate="fuplddp"
            ErrorMessage="*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="uplValidator" runat="server" ValidationGroup="upload"
            ControlToValidate="fuplddp" ErrorMessage="only .jpg, .jpeg & png formats are allowed"
            ValidationExpression="(.+\.([Jj][Pp][Gg])|.+\.([Pp][Nn][Gg])|.+\.([Bb][Mm][Pp])|.+\.([Gg][Ii][Ff])|.+\.([Jj][Pp][Ee][Gg]))"
            Font-Size="14px" ForeColor="Red"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Continue" CssClass="logbtn" CausesValidation="false"
            OnClick="Button1_Click" />
    </div>
    <div style="min-height: 300px">
    </div>
</asp:Content>
