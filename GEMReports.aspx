<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GEMReports.aspx.cs" Inherits="PrasarNet.GEMReports"
    MasterPageFile="~/Site1.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--link of style sheet--%>
    <link rel="stylesheet" href="style/responsive.css" type="text/css" media="screen" />
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js"></script>
    <style type="text/css">
        .visible-md-block {
            display: block !important;
        }

        .container1 {
            min-height: 500px;
        }

        .tableView caption {
            font-size: medium;
            color: black;
            font-weight: bolder;
            text-align: center;
            align-content: center;
            align-items: center;
            background-color: darkkhaki;
        }

        .grad2 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .grad4 {
            background: radial-gradient(#CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
            }
    </style>
    <script type='text/javascript'>

        /* Begin jQuery */;
        (function ($) {

            $(window).scroll(function (e) {
                if ($(window).scrollTop() >= $("header").height() + 30) {
                    $(".sticky").addClass("fixed");
                    $(".content").addClass("margin");

                } else {
                    $(".sticky").removeClass("fixed");
                    $(".content").removeClass("margin");
                }
                e.stopPropagation();
            });

            // DOM ready


        })(jQuery);
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <script type="text/javascript">
        function myfunc(val) {
            var orgDdl = document.getElementById('ddldesgnfrom');
            var org2ddl = document.getElementById('ddldesgnto');
            //           if (orgDdl.value != '')
            //               return;

            for (var i = 0, ii = org2ddl.options.length; i < ii; i++) {
                if (org2ddl.options[i].value == val) {
                    org2ddl.options[i].disabled = "disabled";
                    org2ddl.options[i].style.color = 'Red';
                }
                else {
                    org2ddl.options[i].disabled = false;
                    org2ddl.options[i].style.color = 'Black';
                }
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
    <div id="Div9" class="row gradhead" runat="server" style="margin: auto">
        <div class="col-xs-3 col-lg-3 text-center" style="padding-left: 25px; padding-top: 12px; padding-bottom: 5px">
            <%--    <asp:Image ID="img1" runat="server" class="img-responsive pull-left" Height="100%"
                        ImageAlign="Left" ImageUrl="~/images/Emblem.png" Width="80px" />--%>
            <asp:Image ID="Image3" runat="server" class="img-responsive pull-left  img-fluid" Width="70px" Height="90%"
                ImageAlign="Left" ImageUrl="~/images/Emblem.png" />
            <%--<img src="images/AIRlogo.jpg" alt="AIR LOGO" width="120px" height="107px" />--%>
        </div>
        <div class="col-xs-6 col-lg-6 text-center" style="padding-top: 14px; padding-bottom: 5px">
            <div id="block_container">

                <div>
                    <asp:Label ID="Label10" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="PrasarNet"></asp:Label>

                    <br />

                    <asp:Label ID="Label6" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="(प्रसार नेट)"></asp:Label>

                </div>
                <div>
                    <asp:Image ID="Image2" runat="server" class="img-responsive" Height="100%" align="center"
                        ImageUrl="~/images/Azadi.png" Width="100px" />
                </div>
            </div>

            <br />
            <asp:Label ID="Label14" runat="server" class="fontheader1" ForeColor="Blue" Font-Bold="false" Text=" An Intranet for Prasar Bharati Employees"></asp:Label>

        </div>
        <div class="col-xs-3 col-lg-3 text-center" style="padding-right: 25px; padding-top: 12px; padding-bottom: 5px">
            <asp:Image ID="Image1" runat="server" class="img-responsive pull-right" Width="123px" Height="100%"
                ImageAlign="Right" ImageUrl="~/images/pblogo.png" />
        </div>

    </div>
    <div id="Div10" class="row" style="margin: auto" runat="server">
        <div id="StationSectionMenu" visible="false" runat="server" class="sticky">
            <nav class="navbar navbar-default row-no-padding">
                <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar2">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                </div>
                <%--  <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-tasks"></span>
                                &nbsp;Rosters</a></li>--%>
                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar2">
                    <ul class="nav navbar-nav">
                        <li><a href="DashBoardNew.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>


                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                            &nbsp;Documents <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">

                                <li><a href="OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                <li><a href="Policies.aspx"><span style="color: #000000">Policies</span></a></li>

                            </ul>
                        </li>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-wrench"></span>
                            &nbsp;Trainings <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                                <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                            </ul>
                        </li>
                        <%-- <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                        <li><a href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span
                            class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                        <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                        <%--<li><a href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-globe"></span>&nbsp;Forum</a></li>--%>
                        <%--    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black;
                            font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-certificate">
                            </span>&nbsp;Welfares<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <ul class="nav nav-list">
                                    <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                    <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                    <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                    <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                                </ul>
                            </ul>
                        </li>--%>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>
                            &nbsp;Miscellaneous<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <ul class="nav nav-list">
                                    <li id="divstafflist" runat="server" visible="false"><a href="#"><span style="color: #000000">Staff</span></a></li>
                                    <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                    <li id="divlandrecords" runat="server" visible="false"><a href="LandRecordEntry.aspx"><span style="color: #000000">Land Records</span></a></li>

                                    <li id="divboardmeetingreport" runat="server" visible="false"><a href="LandRecordEntry.aspx"><span style="color: #000000">Meeting Records</span></a></li>
                                    <li id="divresourcebooking" runat="server" visible="false"><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>
                                </ul>
                            </ul>
                        </li>
                        <li><a href="utilityDownload.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>
                            &nbsp;Upload <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                <%--<li><a href="#"><span style="color: #000000">Policies</span></a></li>--%>
                                <%--<li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                                <li><a href="PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>
                                <li id="divboradmeetingrecordsUpload" runat="server" visible="false"><a href="DocumentUpload_pbb.aspx"><span style="color: #000000">Upload Meeting Records</span></a></li>
                            </ul>
                        </li>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-book"></span>
                            &nbsp;Statements <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li id="divmonthlystationreports" runat="server" visible="false"><a href="PNET_Reports/HPTEntry.aspx"><span style="color: #000000">Monthly Station Reports</span></a></li>
                                <li id="divmonthlystationreportsforadg" runat="server" visible="false"><a href="PNET_Reports/MRAdmin/HPTEntry.aspx"><span style="color: #000000">Monthly Station Reports</span></a></li>
                                <li id="divRR" runat="server" visible="true"><a href="R_Roster/RREntry.aspx"><span style="color: #000000">Reservation Roster</span></a></li>
                                <%--<li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                            </ul>
                        </li>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="myprofile.aspx"><span style="color: #000000">My Profile</span></a></li>
                                <li><a href="ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="Logout.aspx" id="A1" runat="server">LogOut</a></li>
                                <%--<li><a href="#" runat="server" onserverclick="logoutstn_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div id="AdminMenu" visible="false" runat="server" class="sticky">
            <nav class="navbar navbar-default  row-no-padding">
                <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar3">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                </div>
                <%--    oiwqepiepqiep--%>
                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar3">
                    <ul class="nav navbar-nav">
                        <li><a href="DashBoardNew.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                        <%-- <li><a href="OrdernCircular.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-list-alt"></span>&nbsp;Orders/Circulars</a></li>
                    <li><a href="Policies.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>--%>
                        <%--<ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                       <li><a href="#"><span style="color: #000000">Information Technology</span></a></li>
                                         <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                </ul>--%>
                        <%-- </li>--%>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                            &nbsp;Documents <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">

                                <li><a href="OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                <li><a href="Policies.aspx"><span style="color: #000000">Policies</span></a></li>

                            </ul>
                        </li>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-wrench"></span>
                            &nbsp;Trainings <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                                <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                            </ul>
                        </li>
                        <%-- <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                        <li><a href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span
                            class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                        <%-- <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                        <%--  <li><a href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-globe"></span>&nbsp;Forum</a></li>--%>
                        <%--<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-certificate">
                        </span>&nbsp;Welfares<span class="caret"></span></a>
                        <ul class="dropdown-menu grad3">
                            <ul class="nav nav-list">
                                <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                            </ul>
                        </ul>
                    </li>--%>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>
                            &nbsp;Miscellaneous<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <ul class="nav nav-list">
                                    <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                    <li id="divmeetingrecordadmin" runat="server" visible="false"><a href="PBB_reports.aspx"><span style="color: #000000">Meeting Records</span></a></li>

                                    <%-- <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>--%>
                                </ul>
                            </ul>
                        </li>
                        <li><a href="utilityDownload.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                        <li id="divuploadadmin" runat="server" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>
                            &nbsp;Upload <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                <%--<li><a href="#"><span style="color: #000000">Policies</span></a></li>--%>
                                <%-- <li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                                <li><a href="PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>
                                <%--<li><a href="AdminCalender.aspx"><span style="color: #000000">Calender</span></a></li>   --%>
                            </ul>
                        </li>
                        <li runat="server" id="divstatementsmanagement" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-book"></span>
                            &nbsp;Statements <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li id="divRRReports_UM" runat="server" visible="false"><a href="R_Roster/RR_Reports.aspx"><span style="color: #000000">Reservation Roster</span></a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <%-- <li><a href="#"><span style="color: #000000">My Profile</span></a></li>--%>
                                <li><a href="ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="Logout.aspx" id="A2" runat="server">LogOut</a></li>
                                <%--  <li><a href="#" runat="server" onserverclick="logoutadmin_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="conheight gradbody">
        <div class="row" style="padding: 10px 0px 0px 0px; margin: auto">
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 35px;">
                <asp:Label ID="Label1" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label2" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
            </div>
        </div>
        <div class="row" style="margin: auto">
            <div>
                <div id="divoptions" runat="server" align="right">
                    <table>
                        <tr>
                            <td style="padding: 10px; padding-right: 34px">
                                <asp:LinkButton ID="btnback" runat="server" CssClass="btn" CausesValidation="False"
                                    Width="90px" BackColor="#F5B7B1" OnClick="btnback_Click" Font-Underline="False" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                    <span class="glyphicon glyphicon-arrow-left" style="color: black"></span><span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div runat="server" align="center">
                <div id="div18" runat="server">
                    <table>
                        <tr>
                            <td align="left" width="110%">
                                <div id="div19" runat="server" class="row">
                                    <div class="col-lg-3 col-md-3" style="padding-right: 0px; padding-bottom: 10px">
                                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#28FD41" OnClick="LinkButton4_Click" Font-Underline="False" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" Font-Size="Medium">
                                            <span style="font-weight: bold; color: #000000">Esclates the Records</span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn" CausesValidation="False"
                                            Visible="false" Width="220px" BackColor="#28FD41" OnClick="LinkButton5_Click"
                                            Font-Underline="False" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" Font-Size="Medium">
                                            <span style="font-weight: bold; color: #000000">Report in reqd. Format</span>
                                        </asp:LinkButton>
                                    </div>
                                    <div class="col-lg-3 col-md-3" style="padding-right: 0px; padding-bottom: 10px">
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#12D0E5" OnClick="LinkButton2_Click" Font-Underline="False" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" Font-Size="Medium">
                                            <span style="font-weight: bold; color: #000000">Customised Reports</span></asp:LinkButton>
                                    </div>
                                    <div class="col-lg-3 col-md-3" style="padding-right: 0px; padding-bottom: 10px">
                                        <asp:LinkButton ID="btneditddo" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#E4C051" OnClick="btneditddo_Click" Font-Underline="False" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" Font-Size="Medium">
                                            <span style="font-weight: bold; color: #000000">Consolidated Reports</span></asp:LinkButton>
                                    </div>
                                    <div class="col-lg-3 col-md-3" style="padding-right: 0px; padding-bottom: 5px">
                                        <asp:LinkButton ID="btngemreports" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#F2611E" OnClick="btngemreports_Click" Font-Underline="False" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" Font-Size="Medium">
                                            <span style="font-weight: bold; color: #000000">Defaulters</span></asp:LinkButton>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <br />
        </div>
        <div class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div1">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div12">
                <div id="divfilter" runat="server" visible="false">
                    <div id="Div8" runat="server" align="center" class="grad3 row" style="padding-top: 10px; padding-bottom: 10px; margin-left: 3px; margin-right: 2px">
                        <asp:Label ID="Label4" runat="server" Text="" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                        &nbsp;
                    </div>
                    <div id="Div5" runat="server" align="center" class="gradbody row" style="padding-top: 10px; padding-bottom: 10px">
                        <asp:UpdatePanel runat="server">
                            <contenttemplate>
                                <div align="center" class=" col-md-2 col-sm-2 col-lg-2" runat="server" id="div6" style="padding-top: 4px; padding-bottom: 4px">
                                    <asp:Label ID="lblorg" runat="server" Text="Organisation" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                    <br />
                                    <asp:DropDownList ID="ddlorg" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                        Height="30px" AutoPostBack="True" OnSelectedIndexChanged="ddlorg_SelectedIndexChanged" Font-Bold="True" Font-Size="Medium">
                                    </asp:DropDownList>
                                </div>
                                <div align="center" class=" col-md-2 col-sm-2 col-lg-2" runat="server" id="div17" style="padding-top: 4px; padding-bottom: 4px">
                                    <asp:Label ID="Label3" runat="server" Text="Uploaded By" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                    <br />
                                    <asp:DropDownList ID="ddluploadedby" runat="server" AutoPostBack="True" class="select widthofboxes"
                                        Height="30px" OnSelectedIndexChanged="ddluploadedby_SelectedIndexChanged" Font-Bold="True" Font-Size="Medium">
                                    </asp:DropDownList>
                                </div>
                                <div align="center" class=" col-md-2 col-sm-2 col-lg-2" runat="server" id="div7" style="padding-top: 4px; padding-bottom: 4px">
                                    <asp:Label ID="lblstn" runat="server" Text="Section/Station" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                    <br />
                                    <asp:DropDownList ID="ddlstation" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                        Height="30px" Font-Bold="True" Font-Size="Medium">
                                    </asp:DropDownList>
                                </div>
                                <div align="center" class=" col-md-2 col-sm-2 col-lg-2" runat="server" id="div11" style="padding-top: 4px; padding-bottom: 4px">
                                    <asp:Label ID="lblmonth" runat="server" Text="Month" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                    <br />
                                    <asp:DropDownList ID="ddlmonth" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                        Height="30px" OnSelectedIndexChanged="ddlmonth_SelectedIndexChanged" Font-Bold="True" Font-Size="Medium">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvmonthesc" runat="server" ControlToValidate="ddlmonth"
                                        Display="Dynamic" Enabled="False" ErrorMessage="*" Font-Bold="True" Font-Size="Medium"
                                        ForeColor="Red" SetFocusOnError="True">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div align="center" class=" col-md-2 col-sm-2 col-lg-2" runat="server" id="div13" style="padding-top: 4px; padding-bottom: 4px">
                                    <asp:Label ID="lblyear" runat="server" Text="Year" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                    <br />
                                    <asp:DropDownList ID="ddlyear" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                        Height="30px" OnSelectedIndexChanged="ddlyear_SelectedIndexChanged" Font-Bold="True" Font-Size="Medium">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvyearesc" runat="server" ControlToValidate="ddlyear"
                                        Display="Dynamic" Enabled="False" ErrorMessage="*" Font-Bold="True" Font-Size="Medium"
                                        ForeColor="Red" SetFocusOnError="True">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="divforwarded"
                                    visible="false" style="padding-top: 4px; padding-bottom: 4px">
                                    <asp:Label ID="Label8" runat="server" Text="Status" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                    <br />
                                    <asp:DropDownList ID="ddlforwarded" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                        Height="30px" Style="min-width: 70px" Font-Bold="True" Font-Size="Medium">
                                        <asp:ListItem Value="">--All-- </asp:ListItem>
                                        <asp:ListItem Value="1">Forwarded to PB</asp:ListItem>
                                        <asp:ListItem Value="2">Not-Forwarded to PB</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div16" style="padding-top: 4px; padding-bottom: 4px">
                                    <asp:Label ID="lblddo" runat="server" Text="DDO" ForeColor="Black" class="font" Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                    <br />
                                    <asp:DropDownList ID="ddlddo" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                        Height="30px" Style="min-width: 70px" Font-Bold="True" Font-Size="Medium">
                                    </asp:DropDownList>
                                </div>
                            </contenttemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="Div14" runat="server" align="center" class="grad3 row" style="padding-top: 4px; padding-bottom: 4px; margin-left: 3px; margin-right: 2px">
                        <div align="center" class=" col-md-12 col-sm-12 col-lg-12" runat="server" id="div15">
                            <asp:Button ID="btngetdata" runat="server" Text="Fetch Records" class="btn select button111"
                                Style="background-color: #99FFCC; color: Black; font-weight: bold" Visible="true"
                                OnClick="btngetdata_Click" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" />
                        </div>
                    </div>
                </div>
                <div id="divconsolidatedmonthnyear" runat="server" visible="false">
                    <div id="Div21" runat="server" align="center" class="grad3 row" style="padding-top: 15px; min-height: 45px; margin-left: 10px; margin-right: 10px; padding-bottom: 15px">
                        <asp:Label ID="Label5" runat="server" Text="Select Month & Year" Style="font-weight: bold; font-size: large; color: Black;"></asp:Label>
                        &nbsp;
                    </div>
                    <div id="Div22" runat="server" align="center" class="gradbody row" style="padding-top: 4px; padding-bottom: 4px">
                        <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div26" style="padding-top: 4px; padding-bottom: 4px">
                            <asp:Label ID="Label12" runat="server" Text="Month" ForeColor="Black" class="font"
                                Style="font-weight: bold;"></asp:Label>
                            &nbsp;
                            <br />
                            <asp:DropDownList ID="ddlmonthconsolidated" runat="server" AppendDataBoundItems="true"
                                class="select widthofboxes" Height="30px" Font-Bold="True" Font-Size="Medium">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlmonthconsolidated"
                                Display="Dynamic" ErrorMessage="*" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                SetFocusOnError="True">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div align="center" class="col-md-3 col-sm-3 col-lg-3" runat="server" id="div27" style="padding-top: 4px; padding-bottom: 4px">
                            <asp:Label ID="Label13" runat="server" Text="Year" ForeColor="Black" class="font"
                                Style="font-weight: bold;"></asp:Label>
                            &nbsp;
                            <br />
                            <asp:DropDownList ID="ddlyearconsolidated" runat="server" AppendDataBoundItems="true"
                                class="select widthofboxes" Height="30px" Font-Bold="True" Font-Size="Medium">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlyearconsolidated"
                                Display="Dynamic" ErrorMessage="*" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                SetFocusOnError="True">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div align="center" class="col-md-3 col-sm-3 col-lg-3" runat="server" id="div28"
                            visible="false" style="padding-top: 4px; padding-bottom: 4px">
                            <asp:Label ID="Label9" runat="server" Text="Status" ForeColor="Black" class="font"
                                Style="font-weight: bold;"></asp:Label>
                            &nbsp;
                            <br />
                            <asp:DropDownList ID="ddlstatuscon" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                Height="30px" Style="min-width: 70px" Font-Bold="True" Font-Size="Medium">
                                <asp:ListItem Value="">--All-- </asp:ListItem>
                                <asp:ListItem Value="1">Forwarded to PB</asp:ListItem>
                                <asp:ListItem Value="2">Not-Forwarded to PB</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div align="center" class="col-md-3 col-sm-3 col-lg-3" runat="server" id="div23"
                            visible="false" style="padding-top: 4px; padding-bottom: 4px">
                            <asp:Label ID="Label11" runat="server" Text="Organisation" ForeColor="Black" class="font"
                                Style="font-weight: bold;"></asp:Label>
                            &nbsp;
                            <br />
                            <asp:DropDownList ID="ddlorgconsolidated" runat="server" AppendDataBoundItems="true"
                                class="select widthofboxes" Height="30px" Style="min-width: 70px" Font-Bold="True" Font-Size="Medium">
                                <asp:ListItem Value="">--All-- </asp:ListItem>
                                <asp:ListItem Value="1">AIR</asp:ListItem>
                                <asp:ListItem Value="2">DD</asp:ListItem>
                                <asp:ListItem Value="3">PBSectt.</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div id="Div29" runat="server" align="center" class="grad3 row" style="padding-top: 10px; min-height: 50px; margin-left: 10px; margin-right: 10px; padding-bottom: 8px">
                        <div align="center" class=" col-md-12 col-sm-12 col-lg-12" runat="server" id="div30">
                            <asp:Button ID="btnconsolidatedfetch" runat="server" Text="Fetch Records" class="btn select button111"
                                Style="background-color: #99FFCC; color: Black; font-weight: bold" Visible="true"
                                OnClick="btnconsolidatedfetch_Click" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" />
                        </div>
                    </div>
                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div2">
            </div>
        </div>
        <br />
        <br />
        <div class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div3">
            </div>
            <div id="divgrd" visible="false" align="center" class=" col-md-10 col-sm-10 col-lg-10"
                runat="server">
                <div runat="server" id="divnormal" visible="false">
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="font-weight: bold; color: Black;" class="font2">:: GeM Procurement Statement(s)
                                ::</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <div id="divprisearch" style="text-align: center" runat="server" visible="true">
                                <table width="100%">
                                    <tr>
                                        <td align="center" width="100%" style="padding: 12px">
                                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                                Width="90px" BackColor="#F5B7B1" OnClick="btnprint1_Click" Font-Underline="False" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                                <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn" CausesValidation="False"
                                                Width="180px" BackColor="#808000" OnClick="LinkButton3_Click" Font-Underline="False" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                                <span style="font-weight: bold; color: whitesmoke">Forward to PBSectt</span></asp:LinkButton>
                                        </td>
                                        <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                    </tr>
                                </table>
                                <br />
                                <div id="divshow" runat="server" visible="false">
                                    <asp:Label ID="lbldefaulter2" runat="server" Style="color: #000000; font-weight: 700; font-size: small"
                                        Text="No. Of Defaulters: "></asp:Label>
                                    <asp:Label ID="Label1637" runat="server" Style="color: #000000; font-weight: 700; font-size: small"
                                        Text="No. Of Defaulters,also includes those Units whose records are not forwaded by thier respective Directorates (Present month): "></asp:Label>
                                    <asp:Label ID="lbldef" runat="server" Style="font-weight: 700; color: #FF0000; font-size: small"
                                        Text=""></asp:Label>
                                    &nbsp;&nbsp;&nbsp;
                                    <br />
                                    <asp:Label ID="lblsubmitted2" runat="server" Style="font-weight: 700; color: #000000; font-size: small"
                                        Text="No. Of Units Submitted the Reports: "></asp:Label>
                                    <asp:Label ID="Label1638" runat="server" Style="font-weight: 700; color: #000000; font-size: small"
                                        Visible="false" Text="No. Of GeM Statements forwarded by respective Directorates(Present Month): "></asp:Label>
                                    <asp:Label ID="lblsub" runat="server" Style="font-weight: 700; color: #0000FF; font-size: small"
                                        Text=""></asp:Label>
                                    <br />
                                    <br />
                                </div>
                            </div>
                            <div style="overflow: auto">
                                <asp:GridView ID="grdconsolidated0" runat="server" AllowPaging="true" AutoGenerateColumns="false"
                                    BorderStyle="Solid" BorderWidth="2px" EmptyDataText=".. Records Not Found .."
                                    ForeColor="#333333" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                    HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                    ShowHeaderWhenEmpty="True" Width="94%" Caption="Consolidated Report" CaptionAlign="Top"
                                    CssClass="tableView">
                                    <alternatingrowstyle backcolor="White" />
                                    <columns>
                                        <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                            <itemtemplate>
                                                <asp:Label ID="lblSNo0" runat="server" ForeColor="Black" Text="<%#Container.DataItemIndex+1 %>" />
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Month/Year" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="Label345" runat="server" Font-Bold="true" Font-Italic="true" ForeColor="Black"
                                                        Text='<%#Eval("monthname")  %>' />
                                                    <asp:Label ID="Label346" runat="server" Font-Bold="true" Font-Italic="true" ForeColor="Black"
                                                        Text="/" />
                                                    <asp:Label ID="Label347" runat="server" Font-Bold="true" Font-Italic="true" ForeColor="Black"
                                                        Text='<%#Eval("yearname")  %>' />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total No Of Orders Placed(Inc GeM & Non-GeM)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="Label16rt" runat="server" Font-Italic="true" Text='<%#Eval("TotalNoofOrders_ContractsPlaced_inc_GEM_NonGEM")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Contract Value(In Rs)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lbltotalcontractval" runat="server" Font-Italic="true" Text='<%#Eval("TotalContractValue_GEM_NonGEM")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No. Of Orders Placed through GeM" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lblordersplacedthrGEM" runat="server" Font-Italic="true" Text='<%#Eval("nooforders")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Amount of Procurement (ON GeM)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--   <asp:Label ID="Label24" runat="server" Text="Designation(To)" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label25" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="Label26" Font-Italic="true" runat="server" Text='<%#Eval("totalamount_gem") %>'
                                                        ForeColor="Black" Font-Bold="true" class="fontingrid" />
                                                    <%--<asp:Label ID="lbldpcid" runat="server" Text='<%#Eval("DPCid") %>' Visible="false"
                                                Font-Size="Smaller" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payments made for total No of Orders(In Rs)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lblpaymntmadefortotalgemnongem" runat="server" Font-Italic="true"
                                                        Text='<%#Eval("PaymentmadefortotalNoofOrders_Gem_NONGem")  %>' ForeColor="Black"
                                                        Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payments made against the Orders placed through GeM(In Rs)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lblpaymntmadeforgem" runat="server" Font-Italic="true" Text='<%#Eval("PaymentmadeforNoofOrders_Gem")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 10 Days Of CRAC (with Amount)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <asp:Label ID="lblnum1" runat="server" Text="Number" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum11" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_10DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblamt1" runat="server" Text="Amount" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld2" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblamt11" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_10DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 20 Days Of CRAC (with Amount)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <asp:Label ID="lblnum2" runat="server" Text="Number" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld3" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum22" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_20DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblamt2" runat="server" Text="Amount" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld4" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblamt22" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_20DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 30 Days Of CRAC (with Amount)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <asp:Label ID="lblnum3" runat="server" Text="Number" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld5" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum33" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_30DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblamt3" runat="server" Text="Amount" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld6" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblamt33" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_30DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No Of GeM Orders Declined By Seller" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="Label344" Font-Bold="true" runat="server" Text='<%#Eval("NoofGEMOrdersDeclinedBySeller") %>'
                                                        ForeColor="Black" class="fontingrid" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of GeM Orders accepted by seller but not delivered within expected time"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <asp:Label ID="Label121" Font-Bold="true" runat="server" Text='<%#Eval("NoofGEMOrdersAcceptedBySellerbutNotDeliveredin_ExpecDate") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of rejection due to non-confirming supplies" ItemStyle-Width="15%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="Label11s" Font-Bold="true" runat="server" Text='<%#Eval("NoOfRejectionduetoinferior_nonConfirmingSupply") %>'
                                                        ForeColor="Black" class="fontingrid" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of Incidents Raised against Seller & Resolved"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="lblnoofincidentsraS" runat="server" Text="Incidents Raised" Font-Size="9pt"
                                                        Font-Bold="true" ForeColor="Maroon" />
                                                    <asp:Label ID="lbld7" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum44" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsRaisedAgainstSellers")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblres1" runat="server" Text="Incident Resolved" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld8" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblres11" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsresolved_closedOut_asraisedagainstsellers")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of Incidents Raised By Seller & Resolved" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding: 6px">
                                                    <asp:Label ID="lblincrased" runat="server" Text="Incidents Raised" Font-Size="9pt"
                                                        Font-Bold="true" ForeColor="Maroon" />
                                                    <asp:Label ID="lbluplbllon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="Label1632" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsRaisedBySellersagainstDeptt")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblnoofincid2entsraSresolved" runat="server" Text="Incident Resolved"
                                                        Font-Size="9pt" Font-Bold="true" ForeColor="Maroon" />
                                                    <asp:Label ID="Label323" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="Label342" runat="server" Font-Italic="true" Text='<%#Eval("Noofincidentsresolved_closedout_asraisedbysellers")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="Any other Matter of Relevance" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="Labeloo3" ForeColor="Black" Font-Bold="true" runat="server" Text='<%#Eval("AnyOthersMattersofRelevance") %>'
                                                        class="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>--%>
                                    </columns>
                                    <headerstyle backcolor="#E67E22" cssclass="centerHeaderText fontingrid" font-bold="True"
                                        forecolor="Black" wrap="True" />
                                    <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                        verticalalign="Middle" />
                                    <pagersettings position="TopAndBottom" />
                                    <pagerstyle backcolor="#E67E22" bordercolor="Black" borderwidth="2" cssclass="cssPager pag"
                                        font-bold="True" font-size="Small" forecolor="White" horizontalalign="Left" verticalalign="Middle" />
                                </asp:GridView>
                            </div>
                            <br />
                            <br />
                            <div style="overflow: auto">
                                <asp:GridView ID="grdgemprocDetails" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                    DataKeyNames="gem_transid" PageSize="20" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                    HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                    EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="94%"
                                    ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnPageIndexChanging="grdgemprocDetails_PageIndexChanging"
                                    OnRowDataBound="grdgemprocDetails_RowDataBound" OnRowCommand="grdgemprocDetails_RowCommand"
                                    Caption="" CaptionAlign="Top" CssClass="tableView">
                                    <alternatingrowstyle backcolor="White" />
                                    <columns>
                                        <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                            <itemtemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Black" />
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Station" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lblstngrd" runat="server" Font-Italic="true" Text='<%#Eval("UploaderName")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <asp:Label ID="lblgemtrnid" runat="server" Visible="false" Font-Italic="true" Text='<%#Eval("gem_transid")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:LabegrdgemprocDetailsl ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Month/Year" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="Label16" runat="server" Font-Italic="true" Text='<%#Eval("monthyear")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total No Of Orders Placed(Inc GeM & Non-GeM)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="Label16vf" runat="server" Font-Italic="true" Text='<%#Eval("TotalNoofOrders_ContractsPlaced_inc_GEM_NonGEM")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Contract Value(In Rs)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lbltotalcontractval" runat="server" Font-Italic="true" Text='<%#Eval("TotalContractValue_GEM_NonGEM")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No. Of Orders Placed through GeM" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lblordersplacedthrGEM" runat="server" Font-Italic="true" Text='<%#Eval("No_Of_OrdersPlaced_byGEM")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Amount of Procurement (ON GeM)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--   <asp:Label ID="Label24" runat="server" Text="Designation(To)" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label25" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="Label26" Font-Italic="true" runat="server" Text='<%#Eval("TotalAmountofProcurement_GEM") %>'
                                                        ForeColor="Black" Font-Bold="true" class="fontingrid" />
                                                    <%--<asp:Label ID="lbldpcid" runat="server" Text='<%#Eval("DPCid") %>' Visible="false"
                                                Font-Size="Smaller" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payments made for total No of Orders(In Rs)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lblpaymntmadefortotalgemnongem" runat="server" Font-Italic="true"
                                                        Text='<%#Eval("PaymentmadefortotalNoofOrders_Gem_NONGem")  %>' ForeColor="Black"
                                                        Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payments made against the Orders placed through GeM(In Rs)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lblpaymntmadeforgem" runat="server" Font-Italic="true" Text='<%#Eval("PaymentmadeforNoofOrders_Gem")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 10 Days Of CRAC (with Amount)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <asp:Label ID="lblnum1" runat="server" Text="Number" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum11" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_10DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblamt1" runat="server" Text="Amount" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld2" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblamt11" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_10DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 20 Days Of CRAC (with Amount)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <asp:Label ID="lblnum2" runat="server" Text="Number" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld3" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum22" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_20DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblamt2" runat="server" Text="Amount" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld4" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblamt22" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_20DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 30 Days Of CRAC (with Amount)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <asp:Label ID="lblnum3" runat="server" Text="Number" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld5" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum33" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_30DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblamt3" runat="server" Text="Amount" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld6" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblamt33" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_30DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No Of GeM Orders Declined By Seller" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="Label344" Font-Bold="true" runat="server" Text='<%#Eval("NoofGEMOrdersDeclinedBySeller") %>'
                                                        ForeColor="Black" class="fontingrid" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of GeM Orders accepted by seller but not delivered within expected time"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <asp:Label ID="Label121" Font-Bold="true" runat="server" Text='<%#Eval("NoofGEMOrdersAcceptedBySellerbutNotDeliveredin_ExpecDate") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of rejection due to non-confirming supplies" ItemStyle-Width="15%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="Label11s" Font-Bold="true" runat="server" Text='<%#Eval("NoOfRejectionduetoinferior_nonConfirmingSupply") %>'
                                                        ForeColor="Black" class="fontingrid" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of Incidents Raised against Seller & Resolved"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="lblnoofincidentsraS" runat="server" Text="Incidents Raised" Font-Size="9pt"
                                                        Font-Bold="true" ForeColor="Maroon" />
                                                    <asp:Label ID="lbld7" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum44" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsRaisedAgainstSellers")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblres1" runat="server" Text="Incident Resolved" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld8" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblres11" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsresolved_closedOut_asraisedagainstsellers")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of Incidents Raised By Seller & Resolved" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="lblincrased" runat="server" Text="Incidents Raised" Font-Size="9pt"
                                                        Font-Bold="true" ForeColor="Maroon" />
                                                    <asp:Label ID="lbluplbllon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="Label1632" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsRaisedBySellersagainstDeptt")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblnoofincid2entsraSresolved" runat="server" Text="Incident Resolved"
                                                        Font-Size="9pt" Font-Bold="true" ForeColor="Maroon" />
                                                    <asp:Label ID="Label323" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="Label342" runat="server" Font-Italic="true" Text='<%#Eval("Noofincidentsresolved_closedout_asraisedbysellers")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Any other Matter of Relevance" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="Labeloo3" ForeColor="Black" Font-Bold="true" runat="server" Text='<%#Eval("AnyOthersMattersofRelevance") %>'
                                                        class="fontingrid" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <%--  <asp:Button ID="lnkbtnsearch" runat="server" CssClass="btn" CausesValidation="False" ForeColor="Blue" Font-Bold="true"
                                            OnClientClick="return confirm('Do you really want to forward?');" ToolTip="Forward to PBSectt" CommandName="forwardtopb" Text="Forward to PBSectt">                  
                                         </asp:Button>--%>
                                                <%--<asp:Button ID="btnfor" runat="server" CssClass="btn" CausesValidation="False" ForeColor="Blue" Font-Bold="true"
                                         OnClientClick="return confirm('Do you really want to forward?');" ToolTip="Forward to PBSectt" CommandName="forwardtopb" Text="Forward to PBSectt" />--%>
                                                <asp:LinkButton ID="lnkbtn1" CommandName="forwardtopb" runat="server" Visible="false"
                                                    CausesValidation="false" Text="Forwarded to PBSectt" ForeColor="Blue" Font-Bold="true"
                                                    CssClass="btn" ToolTip="Forward to PBSectt">
                                                </asp:LinkButton>
                                                <%--  <asp:Button ID="Button1" runat="server" CssClass="btn" CausesValidation="False" ForeColor="Blue" Font-Bold="true"
                                                    OnClientClick="return confirm('Do you really want to forward?');" ToolTip="Forward to PBSectt" CommandName="forwardtopb" Text="Forward to PBSectt" />--%>
                                                <asp:Label ID="lblfortopb" runat="server" Text="Forwared to PB" Font-Bold="true"
                                                    ForeColor="Green"></asp:Label>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                    </columns>
                                    <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                        wrap="True"></headerstyle>
                                    <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                        verticalalign="Middle" />
                                    <pagersettings position="TopAndBottom" />
                                    <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                        horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                        borderwidth="2" />
                                </asp:GridView>
                            </div>
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <div runat="server" id="divconsolidated" visible="false">
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="font-weight: bold; color: Black;" class="font2">:: GeM Procurement Statement(s)
                                ::</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <div id="div20" style="text-align: center" runat="server" visible="true">
                                <table width="100%">
                                    <tr>
                                        <td align="center" width="100%" style="padding: 12px">
                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" CausesValidation="False"
                                                Width="90px" BackColor="#F5B7B1" OnClick="LinkButton1_Click" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                                <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                        </td>
                                        <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                    </tr>
                                </table>
                                <br />
                                <asp:Label ID="Label1633" runat="server" Style="color: #000000; font-weight: 700; font-size: small"
                                    Text="No. Of Defaulters (Present month): "></asp:Label>
                                <asp:Label ID="Label1636" runat="server" Style="color: #000000; font-weight: 700; font-size: small"
                                    Text="No. Of Defaulters,also includes those Units whose records are not forwaded by thier respective Directorates (Present month): "></asp:Label>
                                <asp:Label ID="lblnoofdefaulters" runat="server" Style="font-weight: 700; color: #FF0000; font-size: small"
                                    Text=""></asp:Label>
                                &nbsp;&nbsp;&nbsp;
                                <br />
                                <asp:Label ID="Label1634" runat="server" Style="font-weight: 700; color: #000000; font-size: small"
                                    Text="No. Of Units Submitted the Reports(Present Month): "></asp:Label>
                                <asp:Label ID="Label1635" runat="server" Style="font-weight: 700; color: #000000; font-size: small"
                                    Visible="false" Text="No. Of GeM Statements forwarded by respective Directorates(Present Month): "></asp:Label>
                                <asp:Label ID="lbleportsub" runat="server" Style="font-weight: 700; color: #0000FF; font-size: small"
                                    Text=""></asp:Label>
                                <br />
                                <br />
                            </div>
                            <div align="center">
                                <asp:Label ID="Label7" ForeColor="Red" runat="server" Style="font-weight: 700; font-size: small"
                                    Text="**Below Report Only Includes those data which has been forwarded to PB Sectt."></asp:Label>
                            </div>
                            <div style="overflow: auto">
                                <asp:GridView ID="grdconsolidated" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                    HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                                    HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" EmptyDataText=".. Records Not Found .."
                                    ShowHeaderWhenEmpty="True" Width="94%" ForeColor="#333333" BorderStyle="Solid"
                                    BorderWidth="2px">
                                    <alternatingrowstyle backcolor="White" />
                                    <columns>
                                        <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                            <itemtemplate>
                                                <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Black" />
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total No Of Orders Placed(Inc GeM & Non-GeM)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="Label16e" runat="server" Font-Italic="true" Text='<%#Eval("TotalNoofOrders_ContractsPlaced_inc_GEM_NonGEM")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Contract Value(In Rs)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lbltotalcontractval" runat="server" Font-Italic="true" Text='<%#Eval("TotalContractValue_GEM_NonGEM")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No. Of Orders Placed through GeM" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lblordersplacedthrGEM" runat="server" Font-Italic="true" Text='<%#Eval("nooforders")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Amount of Procurement (ON GeM)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--   <asp:Label ID="Label24" runat="server" Text="Designation(To)" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label25" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="Label26" Font-Italic="true" runat="server" Text='<%#Eval("totalamount_gem") %>'
                                                        ForeColor="Black" Font-Bold="true" class="fontingrid" />
                                                    <%--<asp:Label ID="lbldpcid" runat="server" Text='<%#Eval("DPCid") %>' Visible="false"
                                                Font-Size="Smaller" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payments made for total No of Orders(In Rs)" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lblpaymntmadefortotalgemnongem" runat="server" Font-Italic="true"
                                                        Text='<%#Eval("PaymentmadefortotalNoofOrders_Gem_NONGem")  %>' ForeColor="Black"
                                                        Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payments made against the Orders placed through GeM(In Rs)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                    <asp:Label ID="lblpaymntmadeforgem" runat="server" Font-Italic="true" Text='<%#Eval("PaymentmadeforNoofOrders_Gem")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 10 Days Of CRAC (with Amount)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <asp:Label ID="lblnum1" runat="server" Text="Number" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum11" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_10DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblamt1" runat="server" Text="Amount" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld2" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblamt11" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_10DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 20 Days Of CRAC (with Amount)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <asp:Label ID="lblnum2" runat="server" Text="Number" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld3" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum22" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_20DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblamt2" runat="server" Text="Amount" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld4" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblamt22" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_20DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 30 Days Of CRAC (with Amount)"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 10px">
                                                    <asp:Label ID="lblnum3" runat="server" Text="Number" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld5" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum33" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_30DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblamt3" runat="server" Text="Amount" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld6" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblamt33" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_30DaysofCRAC")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No Of GeM Orders Declined By Seller" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="Label344" Font-Bold="true" runat="server" Text='<%#Eval("NoofGEMOrdersDeclinedBySeller") %>'
                                                        ForeColor="Black" class="fontingrid" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of GeM Orders accepted by seller but not delivered within expected time"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <asp:Label ID="Label121" Font-Bold="true" runat="server" Text='<%#Eval("NoofGEMOrdersAcceptedBySellerbutNotDeliveredin_ExpecDate") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of rejection due to non-confirming supplies" ItemStyle-Width="15%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="Label11s" Font-Bold="true" runat="server" Text='<%#Eval("NoOfRejectionduetoinferior_nonConfirmingSupply") %>'
                                                        ForeColor="Black" class="fontingrid" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of Incidents Raised against Seller & Resolved"
                                            ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="lblnoofincidentsraS" runat="server" Text="Incidents Raised" Font-Size="9pt"
                                                        Font-Bold="true" ForeColor="Maroon" />
                                                    <asp:Label ID="lbld7" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblnum44" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsRaisedAgainstSellers")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblres1" runat="server" Text="Incident Resolved" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lbld8" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblres11" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsresolved_closedOut_asraisedagainstsellers")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="No of Incidents Raised By Seller & Resolved" ItemStyle-Width="10%">
                                            <itemtemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="lblincrased" runat="server" Text="Incidents Raised" Font-Size="9pt"
                                                        Font-Bold="true" ForeColor="Maroon" />
                                                    <asp:Label ID="lbluplbllon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="Label1632" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsRaisedBySellersagainstDeptt")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblnoofincid2entsraSresolved" runat="server" Text="Incident Resolved"
                                                        Font-Size="9pt" Font-Bold="true" ForeColor="Maroon" />
                                                    <asp:Label ID="Label323" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="Label342" runat="server" Font-Italic="true" Text='<%#Eval("Noofincidentsresolved_closedout_asraisedbysellers")  %>'
                                                        ForeColor="Black" Font-Bold="true" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="Any other Matter of Relevance" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <div style="padding-left: 5px; padding-right: 5px">
                                                    <asp:Label ID="Labeloo3" ForeColor="Black" Font-Bold="true" runat="server" Text='<%#Eval("AnyOthersMattersofRelevance") %>'
                                                        class="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>--%>
                                    </columns>
                                    <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                        wrap="True"></headerstyle>
                                    <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                        verticalalign="Middle" />
                                    <pagersettings position="TopAndBottom" />
                                    <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                        horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                        borderwidth="2" />
                                </asp:GridView>
                            </div>
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div4">
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
