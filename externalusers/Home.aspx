﻿<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="PrasarNet.externalusers.Home" %>--%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="PrasarNet.externalusers.Login" MasterPageFile="~/Site1.Master" %>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body { font-family: Arial; font-size: 10pt; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Welcome
            <asp:LoginName ID="LoginName1" runat="server" Font-Bold="true" />
            <br /><br />
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </div>
    </form>
</body>
</html>
