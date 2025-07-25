<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Start_Page.aspx.cs" Inherits="Start_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rediecting to PrasarNet</title>
    <%--<meta http-equiv="Refresh" content="5;url=Redirect_Page.aspx" />--%>

    <script type="text/javascript">
        var i = 0;
        function ShowCurrentTime() {
            var dt = new Date();
            document.getElementById("lblTime").innerHTML = 5 - i + " Seconds";
            i++;
            if (i == 5) {
                setTimeout("location.href='http://prasarnet.prasarbharati.org/'", 0);
            }
            window.setTimeout("ShowCurrentTime()", 1000); // Here 1000(milliseconds) means 1 sec
        }
        //        
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</head>

<body onload="ShowCurrentTime()" class="gradbody">
    <form id="form1" runat="server">
        <div style="vertical-align:middle;margin:50px" align="center">

            <h3>Redirecting to PrasarNet</h3>
       <%--     
            New url:prasarnet.prasarbharati.org</h3>
            This Page will Redirect to Prasarnet within:--%>
            <label id="Label2" style="font-weight: bold; font-size:x-large;" class="font">New url:<span style="color:Blue">prasarnet.prasarbharati.org</span></label>
            <br />
            <br />
            <label id="Label1" style="font-weight: bold ;font-size:x-large;" class="font">This Page will Redirect to Prasarnet within:</label>
            
            <label id="lblTime" style="font-weight: bold ;font-size:x-large;" class="font2"></label>



        </div>
    </form>
</body>
</html>
