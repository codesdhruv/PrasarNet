<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="commondpc.aspx.cs" Inherits="PrasarNet.CommonDPC.commondpc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentSection" runat="server">



    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />

        <asp:Button ID="btnUpload" runat="server" Text="Upload"
            OnClick="btnUpload_Click" />

        <br />

        <asp:Label ID="Label1" runat="server" Text="Has Header ?" />

        <asp:RadioButtonList ID="rbHDR" runat="server">

            <asp:ListItem Text="Yes" Value="Yes" Selected="True">

            </asp:ListItem>

            <asp:ListItem Text="No" Value="No"></asp:ListItem>

        </asp:RadioButtonList>

        <asp:GridView ID="GridView1" runat="server"
            OnPageIndexChanging="PageIndexChanging" AllowPaging="true">
        </asp:GridView>
    </div>


</asp:Content>
