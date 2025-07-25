<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrdernCircular.aspx.cs"
    Inherits="PrasarNet.OrdernCircular" MasterPageFile="~/Site1.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--link of style sheet--%>
    <link rel="stylesheet" href="style/responsive.css" type="text/css" media="screen" />
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js"></script>
    <style type="text/css">
        #main {
            transition: margin-left .5s;
            padding: 16px;
        }


        .grad2 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient
        }

        .grad4 {
            background: radial-gradient(#CACFD2, #E67E22);
            -webkit-radial-gradient
        }

        .grad5 {
            background: linear-gradient(to right, #F5DA81, #D8D8D8);
            min-height: 100px;
        }

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
            }
    </style>
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script type='text/javascript'>
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
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

        (function ($) {

            $(document).width(function (e) {
                if ($(document).width() <= 768) {
                    document.getElementById("lnksearch").style.display = "none"
                    document.getElementById("lblsearchw").style.visibility = 'visible'

                } else {
                    document.getElementById("lnksearch").style.visibility = "visible"
                    document.getElementById("lblsearchw").style.visibility = 'none'
                }

            });

            // DOM ready


        })(jQuery);


        //        (function ($) {
        //            if ($(window).width() <= 768)
        //            // returns width of browser viewport
        //            {
        //                document.getElementById("lnksearch").style.display = "none"
        //                document.getElementById("lblsearchw").style.visibility = 'visible'
        //                //                document.getElementById("mySidenav").style.width = $(window).width();
        //                //                document.getElementById("main").style.marginLeft = "0";
        //            }
        //            else {
        //                document.getElementById("lnksearch").style.visibility = "visible"
        //                document.getElementById("lblsearchw").style.visibility = 'none'
        //            }
        //        });
        //        function openNav() {

        //            document.getElementById("mySidenav").style.width = "250px";
        //            document.getElementById("main").style.marginLeft = "250px";
        //            document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
        //        }

        //        function closeNav() {
        //            document.getElementById("mySidenav").style.width = "0";
        //            document.getElementById("main").style.marginLeft = "0";
        //            document.body.style.backgroundColor = "white";
        //        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
    <div id="Div2" class="row gradhead" runat="server" style="margin: auto">
        <div class="col-xs-3 col-lg-3 text-center" style="padding-left: 25px; padding-top: 12px; padding-bottom: 5px">
            <%--    <asp:Image ID="img1" runat="server" class="img-responsive pull-left" Height="100%"
                        ImageAlign="Left" ImageUrl="~/images/Emblem.png" Width="80px" />--%>
            <asp:Image ID="Image1" runat="server" class="img-responsive pull-left  img-fluid" Width="70px" Height="90%"
                ImageAlign="Left" ImageUrl="~/images/Emblem.png" />
            <%--<img src="images/AIRlogo.jpg" alt="AIR LOGO" width="120px" height="107px" />--%>
        </div>
        <div class="col-xs-6 col-lg-6 text-center" style="padding-top: 14px; padding-bottom: 5px">
            <div id="block_container">

                <div>
                    <asp:Label ID="Label10" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="PrasarNet"></asp:Label>

                    <br />

                    <asp:Label ID="Label12" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="(प्रसार नेट)"></asp:Label>

                </div>
                <div>
                    <asp:Image ID="Image4" runat="server" class="img-responsive" Height="100%" align="center"
                        ImageUrl="~/images/Azadi.png" Width="100px" />
                </div>
            </div>

            <br />
            <asp:Label ID="Label14" runat="server" class="fontheader1" ForeColor="Blue" Font-Bold="false" Text=" An Intranet for Prasar Bharati Employees"></asp:Label>

        </div>
        <div class="col-xs-3 col-lg-3 text-center" style="padding-right: 25px; padding-top: 12px; padding-bottom: 5px">
            <asp:Image ID="Image5" runat="server" class="img-responsive pull-right" Width="123px" Height="100%"
                ImageAlign="Right" ImageUrl="~/images/pblogo.png" />
        </div>

    </div>
    <div id="Div7" class="row" style="margin: auto" runat="server">
        <div id="empmenu" visible="false" runat="server" class="sticky">
            <nav class="navbar navbar-default row-no-padding">
                <%--nav and nav default hav a default magin and padding--%>
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar1">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                </div>
                <%--    oiwqepiepqiep--%>

                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar1">
                    <ul class="nav navbar-nav">
                        <li><a href="DashBoardNew.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                        <%--<li><a href="OrdernCircular.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-list-alt"></span>&nbsp;Orders/Circulars</a></li>
                    <li><a href="Policies.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>--%>
                        <%-- <ul class="dropdown-menu">
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

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-wrench"></span>
                            &nbsp;Trainings <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <%-- <li><a href="#"><span style="color: #000000">Orders/Circulars</a></li>--%>
                                <li><a href="#"><span style="color: #000000">Training Materials/Videos</a></li>
                            </ul>
                        </li>
                        <%--  <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-tasks"></span>
                                &nbsp;Rosters</a></li>--%>
                        <li><a href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span
                            class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                        <%-- <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                        <%--<li><a href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-globe"></span>&nbsp;Forum</a></li>--%>
                        <%-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-certificate">
                        </span>&nbsp;Welfare<span class="caret"></span></a>
                        <ul class="dropdown-menu grad3">
                            <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                            <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                            <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                            <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                        </ul>
                    </li>--%>
                        <li><a href="utilityDownload.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>
                            &nbsp;Miscellaneous<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="myprofile.aspx"><span style="color: #000000">My Profile</span></a></li>
                                <li><a href="ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="Logout.aspx" id="lgout" style="color: #000000" runat="server">LogOut</a></li>
                                <%-- <li><a href="#" runat="server" onserverclick="logout_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
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
        <div id="AdminMenuIT" visible="false" runat="server" class="sticky">
            <nav class="navbar navbar-default row-no-padding">
                <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                </div>


                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="DashBoardNew.aspx" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                        <%-- <li><a href="OrdernCircular.aspx" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Orders/Circulars</a></li>
                         
                         
                                                   
                          <li><a href="Policies.aspx" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>  --%> <%-- <ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Employee HandBook</span></a></li>
                                </ul>--%>
                        <%--</li>--%>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                            &nbsp;Documents <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">

                                <li><a href="OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                <li><a href="Policies.aspx"><span style="color: #000000">Policies</span></a></li>

                            </ul>
                        </li>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Trainings <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                                <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                            </ul>
                        </li>
                        <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                        <li><a href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                        <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                        <%-- <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-globe"></span> &nbsp;Forum</a></li>--%>

                        <%-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-certificate"></span>&nbsp;Welfares<span class="caret"></span></a>
                                <ul class="dropdown-menu grad3">
                                     <ul class="nav nav-list">
                                        <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                                    </ul>
                                </ul>
                            </li>--%>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>&nbsp;Miscellaneous<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <ul class="nav nav-list">
                                    <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                    <%--  <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li> --%>
                                </ul>
                            </ul>
                        </li>
                        <li><a href="utilityDownload.aspx" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-download-alt"></span>
                            &nbsp;Downloads</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>&nbsp;Upload <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <ul class="nav nav-list">
                                    <li><a href="DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                    <li><a href="PoliciesUpload.aspx"><span style="color: #000000">Policies</span></a></li>
                                    <li><a href="UtilityUpload.aspx"><span style="color: #000000">Utilities</span></a></li>
                                    <li><a href="TrainingMaterial.aspx"><span style="color: #000000">Training Material</span></a></li>
                                    <li><a href="PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>
                                    <li><a href="AdminCalender.aspx"><span style="color: #000000">Calender</span></a></li>
                                </ul>
                            </ul>
                        </li>
                        <%--   <li><a href="ChangePassword.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Change Password</a></li>--%>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>&nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="myprofile.aspx"><span style="color: #000000">My Profile</span></a></li>
                                <li><a href="ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <%--         <li><a href="Logout.aspx" id="A3" runat="server">LogOut</a></li>--%>
                                <%-- <li><a href="#" runat="server" onserverclick="logoutIT_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                            </ul>
                        </li>

                    </ul>
                </div>
            </nav>
        </div>
    </div>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="content gradbody">
        <div class="row" style="padding: 10px 0px 10px 0px; margin: auto">
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 35px;">
                <asp:Label ID="Label16" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label17" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
            </div>
        </div>
        <div id="Div9" class="col-md-12 col-sm-12 col-lg-12" runat="server" align="right">
            <br />
            <asp:LinkButton ID="btnhome" runat="server" CssClass="btn grad4" CausesValidation="False" OnClick="btnhome_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
            <br />
            <br />
        </div>
        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto">
            <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div5">
                <div id="divsearch2" class="table-responsive grad5 table-hover" runat="server" visible="false"
                    style="padding: 20px">
                    <div id="Div1" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                        <asp:Label ID="Label4" runat="server" Text="Search Document" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                        &nbsp;
                    </div>
                    <table class="table table-bordered grad2">
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lbldoctyp" runat="server" class="font" Text="Category" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:DropDownList ID="ddldoctyp" runat="server" AutoPostBack="false" class="select widthofboxes"
                                    Height="22px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblorg" runat="server" Text="Organisation" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:DropDownList ID="ddlorg" runat="server" AutoPostBack="True" class="select widthofboxes"
                                    Height="22px" OnSelectedIndexChanged="ddlorg_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr id="uploadedbyrow" runat="server" visible="false">
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lbluploadedby" runat="server" Text="UploadedBy" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:DropDownList ID="ddluploadedby" runat="server" AutoPostBack="True" class="select widthofboxes"
                                    Height="22px" OnSelectedIndexChanged="ddluploadedby_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr id="stationrow" runat="server" visible="false">
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblstation" runat="server" Text="Station" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:DropDownList ID="ddlstation" runat="server" AutoPostBack="false" class="select widthofboxes"
                                    Height="22px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr id="SectionRow" runat="server" visible="false">
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblSection" runat="server" class="font" Text="Section" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:DropDownList ID="ddlsection" runat="server" AutoPostBack="false" class="select widthofboxes"
                                    Height="22px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lbltitle" runat="server" Text="Title/Subject" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:TextBox ID="txttitle" class="select widthofboxes" Height="50px" runat="server" autocomplete="off"
                                    TextMode="MultiLine">
                                </asp:TextBox>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender72" runat="server" filtertype="Custom" filtermode="InvalidChars"
                                    targetcontrolid="txttitle" invalidchars="*~!^">
                                </ajaxtoolkit:filteredtextboxextender>

                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblfileno" runat="server" Text="File-No" ForeColor="Black" Style="font-weight: bold;"
                                    class="font"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:TextBox ID="txtfileno" runat="server" class="select widthofboxes" Height="22px" autocomplete="off"></asp:TextBox>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender2" runat="server"
                                    targetcontrolid="txtfileno" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)(&-_%?/\][{} ">
                                </ajaxtoolkit:filteredtextboxextender>

                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lbldatedoc" runat="server" Text="Date(From)" ForeColor="Black" Style="font-weight: bold;"
                                    class="font"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:TextBox ID="txtdatedoc" runat="server" class="select widthofboxes" Height="22px"
                                    autocomplete="off" placeholder="DD-MM-YYYY">
                                </asp:TextBox>
                                <ajaxtoolkit:calendarextender id="txtdatedoc_CalendarExtender" runat="server" behaviorid="txtdatedoc_CalendarExtender"
                                    format="dd-MM-yyyy" targetcontrolid="txtdatedoc" />
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderThours" runat="server"
                                    targetcontrolid="txtdatedoc" validchars="0123456789-">
                                </ajaxtoolkit:filteredtextboxextender>
                                <%-- <br />--%>
                                <%--<asp:CompareValidator ID="cValFrom" runat="server" ErrorMessage="<br>Date(From) must not be later than today"
                                    Operator="LessThanEqual" ControlToValidate="txtdatedoc" Type="Date" Display="Dynamic"
                                    SetFocusOnError="True" Style="color: #FF0000; font-size: small"></asp:CompareValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="Label2" runat="server" Text="Date(To)" ForeColor="Black" Style="font-weight: bold;"
                                    class="font"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:TextBox ID="txttodate" runat="server" class="select widthofboxes" Height="22px"
                                    autocomplete="off" placeholder="DD-MM-YYYY">
                                </asp:TextBox>
                                <ajaxtoolkit:calendarextender id="txttodate_CalendarExtender" runat="server" behaviorid="txttodate_CalendarExtender"
                                    format="dd-MM-yyyy" targetcontrolid="txttodate" />
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                    targetcontrolid="txttodate" validchars="0123456789-">
                                </ajaxtoolkit:filteredtextboxextender>
                                <br />
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txttodate"
                                    ControlToCompare="txtdatedoc" Display="Dynamic" Operator="GreaterThanEqual" Type="Date"
                                    ErrorMessage="Date(To) must be later than the Date(From).." SetFocusOnError="True"
                                    Font-Bold="True" Font-Size="Small" ForeColor="Black">
                                </asp:CompareValidator>

                                <br />

                                <asp:CompareValidator ID="cValTo" runat="server" ErrorMessage="Date(To) must not be later than today.."
                                    Operator="LessThanEqual" ControlToValidate="txttodate" Type="Date" Display="Dynamic"
                                    SetFocusOnError="True" Font-Bold="True" Font-Size="Small" ForeColor="Black">
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblorderno" runat="server" Text="OrderNo" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:TextBox ID="txtorder" runat="server" class="select widthofboxes" Height="22px" autocomplete="off"></asp:TextBox>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender42" runat="server"
                                    targetcontrolid="txtorder" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)(&-_%?/\][{} ">
                                </ajaxtoolkit:filteredtextboxextender>

                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 10px">
                                <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn select buttondocumentupload"
                                    Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnsearch_Click"
                                    ToolTip="Search" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btncncl" runat="server" Text="Close" class="btn select gradbody buttondocumentupload"
                                    Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divcat" runat="server" class="grad5 table-hover" style="padding: 20px; margin: auto;"
                    visible="true" align="left">
                    <asp:Repeater ID="RepDetails" runat="server" OnItemCommand="RepDetails_ItemCommand">
                        <headertemplate>
                            <table cellpadding="0">
                                <tr style="color: Black">
                                    <td>
                                        <span style="font-weight: bold; text-decoration: underline;" class="font2">Filter by Document
                                            Category</span>
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                        </headertemplate>
                        <itemtemplate>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="lnkelg" runat="server" CssClass="btn gradbody21 font button112"
                                        CausesValidation="False" CommandName="catsearch" Style="color: #000000" Text='<%#Eval("Doc_Type") %>'>
                                    </asp:LinkButton>
                                    <asp:Label ID="lbldoccatid" runat="server" Text='<%#Eval("Docid") %>' Visible="false"></asp:Label>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </itemtemplate>
                        <footertemplate>
                            </table>
                        </footertemplate>
                    </asp:Repeater>
                </div>
                <br />
                <br />
            </div>
            <div align="center" class=" col-md-9 col-sm-9 col-lg-9" runat="server" id="div6">
                <div id="divsrch1" runat="server" visible="true" align="center">
                    <%--<asp:LinkButton ID="lnksearch1" runat="server" Font-Bold="True" Font-Size="Medium"
                        ForeColor="#000099" OnClick="lnksearch_Click">Search Document</asp:LinkButton>--%>
                    <asp:LinkButton runat="server" CssClass="btn grad4" CausesValidation="False" Height="40px" width="190px"
                        OnClick="lnksearch_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2">
                        <span aria-hidden="true" style="padding-top: 4px; color: Black" class="glyphicon glyphicon-search"></span>&nbsp;<span style="padding-top: 4px; font-weight: bold; color: #000000">Search Document</span></asp:LinkButton>
                </div>
                <br />
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="font-size: medium; font-weight: bold; color: Black;">:: Documents ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <%-- <div style="text-align: center">
                          
                        <asp:LinkButton ID="btnprint1" Style="background-color: #F1948A" runat="server" 
                                CssClass="btn" CausesValidation="False"> <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>                   
                        </div>--%>
                        <div class="row" id="divshow" runat="server" visible="false" style="margin: auto;">
                            <div style="padding-left: 50px" class="col-md-6 col-sm-6 col-xs-12 col-lg-6">
                                <asp:Label ID="Label5" Visible="false" runat="server" class="font2 pull-left" Text="Selected Document Type: "
                                    Style="font-weight: 700; font-family: 'Baskerville Old Face'; color: #800000"></asp:Label>
                                <asp:Label ID="lblcat" runat="server" Text="" class="font2 pull-left" Style="font-weight: 700; color: #800000; font-family: 'Baskerville Old Face'; background-color: #FFFFCC"></asp:Label>
                            </div>
                            <div style="padding-right: 50px" class="col-md-6 col-sm-6 col-xs-12 col-lg-6 pull-right">
                                <asp:LinkButton ID="lnkshowall" runat="server" CssClass="btn gradbody font button111 pull-right"
                                    CausesValidation="False" CommandName="catsearch" Style="color: #000000" Text="Show All"
                                    OnClick="lnkshowall_Click">
                                </asp:LinkButton>
                            </div>
                        </div>
                        <br />
                        <asp:GridView ID="grddoc" runat="server" DataKeyNames="Docid" AutoGenerateColumns="False"
                            AllowPaging="True" PageSize="25" EmptyDataText=".. No Record(s) Found .." ShowHeaderWhenEmpty="True"
                            Width="95%" OnPageIndexChanging="grddoc_PageIndexChanging" OnRowCommand="grddoc_RowCommand"
                            ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnRowDataBound="grddoc_RowDataBound" BorderColor="Black">
                            <alternatingrowstyle backcolor="White" />
                            <columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="8%">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" Font-Bold="true" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Uploaded By" ItemStyle-Width="8%">
                                    <itemtemplate>
                                        <div style="padding-left: 7px; padding-right: 5px" align="left">
                                            <asp:Label ID="lbluploader" Font-Italic="true" runat="server" Text='<%#Eval("UploaderName") %>'
                                                class="fontingrid" Font-Bold="true" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title/Subject" ItemStyle-Width="59%">
                                    <itemtemplate>
                                        <div style="padding: 10px">
                                            <asp:LinkButton ID="lnktitle" OnClientClick="return confirm('Your download activities will be logged. Do you still want to continue?');"
                                                runat="server" CommandName="Download" Text='<%#Eval("Doc_Title") %>' Font-Underline="false"
                                                class="fontingrid" Font-Bold="True" CausesValidation="False" ForeColor="Blue" />
                                            <br />
                                            <%--<asp:Label ID="Label1" runat="server" Text="(" Font-Size="Smaller" />
                                        <asp:Label ID="lbldoctypename1" runat="server" Text='<%#Eval("Doc_Type") %>' Font-Size="Smaller" />
                                        <asp:Label ID="Lbbrac" runat="server" Text=")" Font-Size="Smaller" />--%>
                                            <asp:Label ID="lbluplon" runat="server" Text="Uploaded On" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="Doc-Category" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label6" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="Label7" Font-Italic="true" runat="server" Text='<%#Eval("Doc_Type") %>'
                                                Font-Size="8pt" Font-Bold="true" />
                                        </div>
                                    </itemtemplate>
                                    <headerstyle horizontalalign="Center" />
                                    <itemstyle horizontalalign="Left" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Order No. " ItemStyle-Width="15%">
                                    <itemtemplate>
                                        <div style="padding-left: 5px; padding-right: 5px">
                                            <%-- <asp:Label ID="Label2" runat="server" Text="Order No." Font-Size="Smaller" />
                                        <asp:Label ID="Label5" runat="server" Text=" : " Font-Size="Smaller" />--%>
                                            <asp:Label ID="Label3" Font-Bold="true" runat="server" Text='<%#Eval("Doc_OrderNo") %>'
                                                class="fontingrid" />
                                            <%--<br />
                                        <asp:Label ID="Label6" runat="server" Text="File No." Font-Size="Smaller" />
                                        <asp:Label ID="Label7" runat="server" Text=" : " Font-Size="Smaller" />
                                        <asp:Label ID="Label8" runat="server" Text='<%#Eval("Doc_FileNo") %>' Font-Size="Smaller" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dated" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <%--<asp:Label ID="Label9" runat="server" Text="Dated" Font-Size="Smaller" />
                                        <asp:Label ID="Label10" runat="server" Text=" : " Font-Size="Smaller" />--%>
                                        <asp:Label ID="Label11" Font-Bold="true" runat="server" Text='<%#Eval("Doc_Dated", "{0:dd-MMM-yyyy}") %>'
                                            class="fontingrid" />
                                        <%--Text='<%# Eval("tDate", "{0:dd-MMM-yyyy}") %>'--%>
                                        <asp:Label ID="lbldoctypeid" runat="server" Text='<%#Eval("Doc_Typeid") %>' Visible="false"
                                            Font-Size="Small" />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                            </columns>
                            <emptydatarowstyle backcolor="#CCCCCC" font-bold="True" font-size="Small" forecolor="Black" height="32px" horizontalalign="Center" verticalalign="Middle" />
                            <editrowstyle backcolor="#2461BF" />
                            <footerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" />
                            <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" horizontalalign="Center"
                                cssclass="centerHeaderText fontingrid" wrap="True"></headerstyle>
                            <pagersettings position="TopAndBottom" />
                            <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                borderwidth="2" />
                            <rowstyle backcolor="#EFF3FB" />
                            <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
                            <sortedascendingcellstyle backcolor="#F5F7FB" />
                            <sortedascendingheaderstyle backcolor="#6D95E1" />
                            <sorteddescendingcellstyle backcolor="#E9EBEF" />
                            <sorteddescendingheaderstyle backcolor="#4870BE" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
