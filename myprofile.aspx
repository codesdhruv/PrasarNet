<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myprofile.aspx.cs" Inherits="PrasarNet.myprofile"
    MasterPageFile="~/Site1.Master" %>

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
            -webkit-radial-gradient;
        }

        .grad4 {
            background: radial-gradient(#CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .grad5 {
            background: linear-gradient(to right, #F5DA81, #D8D8D8);
            min-height: 100px;
        }

        .gradformessage {
            background: linear-gradient(to bottom, #FAD7A0, #EAFAF1);
        }

        .font {
            font-weight: 700;
            font-size: medium;
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
        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto;">
            <div id="Div3" runat="server" align="right" style="padding-right: 30px; padding-bottom: 15px; margin: auto">
                <br />
                <asp:LinkButton ID="btnback" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Style="background-color: #99FFCC" runat="server" CssClass="btn grad4"
                    CausesValidation="False" OnClick="btnback_Click">
                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
                <br />
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div6">
            </div>
            <div align="left" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div4" style="padding-bottom: 20px">
                <%-- data-backdrop="static" to prevent the Modal closing when clicking outside the Modal--%>
                <div id="divempprofile" visible="false" runat="server" style="border: thin solid #000066;">
                    <div align="center" style="padding: 5px 0px 5px 0px;" class="gradformessage">
                        <div id="divempphotoupload" runat="server" align="center">
                            <div align="center" style="padding: 10px 0px 10px 0px">
                                <asp:Image ID="Image2" runat="server" class="img-responsive" Height="100%" ImageUrl='<%# Eval("") %>'
                                    Width="80px" AlternateText="No Profile Photo" GenerateEmptyAlternateText="True"
                                    ImageAlign="Middle" ToolTip="Profile Photo" />
                                <div id="div9" runat="server" align="center">
                                    <asp:LinkButton ID="LinkButton2" data-target="#loginModal" data-toggle="modal" runat="server"
                                        ForeColor="Blue">
                                        Upload/Change Photo</asp:LinkButton>
                                </div>
                            </div>
                            <div class="xs-12" style="padding-top: 0px">
                                <%--<asp:Button ID="Button1" runat="server" class="close" data-dismiss="modal" />--%><%--Station--%>
                                <div class="modal fade" data-keyboard="false" data-backdrop="static" id="loginModal"
                                    tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    &times;</button>
                                                <%-- data-keyboard="false" to prevent the Modal closing on clicking of escape Button--%>
                                                <h4 class="modal-title">Upload/Change Photo</h4>
                                            </div>
                                            <div class="modal-body" align="center">
                                                <div class="form-group">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                    <br />
                                                    <asp:Label ID="Label52" ForeColor="Red" Font-Italic="true" Font-Size="Small" runat="server"
                                                        Text="* Image Size should be between 20kB to 50 kB"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label53" ForeColor="Red" Font-Italic="true" Font-Size="Small" runat="server"
                                                        Text="* Image Dimensions should be between 0-230px X 0-200px."></asp:Label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <asp:Button ID="btnupload" runat="server" class="btn btn-primary" Text="Upload" OnClick="btnupload_Click"
                                                    CausesValidation="False" />
                                                <asp:Button ID="btnclose" runat="server" class="btn btn-primary" data-dismiss="modal"
                                                    Text="Close" CausesValidation="false" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <div align="center" style="padding: 20px;">
                                        <asp:LinkButton ID="LinkButton5" class="font2" runat="server" Font-Bold="true" ForeColor="Blue"
                                            CausesValidation="False" OnClick="LinkButton5_Click">
                                            History of Service</asp:LinkButton>
                                    </div>
                                </td>
                                <td runat="server" visible="false">
                                    <div class="pull-right" style="padding-right: 20px;">
                                        <asp:LinkButton ID="LinkButton4" class="font2" runat="server" Font-Bold="true" ForeColor="Blue"
                                            OnClick="LinkButton4_Click" CausesValidation="False">
                                            Edit Personal Details</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <div align="center" style="padding: 10px 0px 10px 0px" class="gradtab table-responsive">
                            <table class="table table-hover">
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblname" class="fontstyle font2" runat="server" Text="Name"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblNamedis" class="fontstyle font2" runat="server"></asp:Label>
                                        <asp:TextBox ID="txtnameemp" runat="server" Visible="false" class="select widthofboxes1"
                                            Height="22px">
                                        </asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lbldesignation" class="fontstyle font2" runat="server" Text="Designation"
                                            Style="font-weight: 700; color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lbldesignationdis" class="fontstyle font2" runat="server" Style="font-weight: 700; color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblDOB" runat="server" class="fontstyle font2" Text="DOB" Style="font-weight: 700; color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblDOBdis" runat="server" class="fontstyle font2" Style="font-weight: 700; color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblstation" runat="server" class="fontstyle font2" Text="Station/Office"
                                            Style="font-weight: 700; color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblstndis" runat="server" class="fontstyle font2" Style="font-weight: 700; color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblDOJpresent" runat="server" class="fontstyle font2" Text="DOJ at Present Station"
                                            Style="font-weight: 700; color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblDOJdis" runat="server" class="fontstyle font2" Style="font-weight: 700; color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblemail" runat="server" class="fontstyle font2" Text="Email" Style="font-weight: 700; color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblemaildis" runat="server" class="fontstyle font2" Style="font-weight: 700; color: Black"></asp:Label>
                                        <asp:TextBox ID="txtemailemp" runat="server" Visible="false" class="select widthofboxes1"
                                            Height="22px">
                                        </asp:TextBox>
                                        &nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtemailemp"
                                            CssClass="font" Display="Dynamic" ErrorMessage="Email Required!!" ForeColor="Red"
                                            SetFocusOnError="True" Style="color: #FF0000; font-weight: 700">
                                        </asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemailemp"
                                            CssClass="font" Display="Dynamic" ErrorMessage="Email Address is Not Valid!!"
                                            ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" width="50%" style="padding-right: 30px">
                                        <asp:Label ID="lblcontact" runat="server" class="fontstyle font2" Text="Contact No"
                                            Style="font-weight: 700; color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" width="50%" style="padding-left: 15px">
                                        <asp:Label ID="lblcontactdis" runat="server" class="fontstyle font2" Style="font-weight: 700; color: Black"></asp:Label>
                                        <asp:TextBox ID="txtcontactemp" runat="server" Visible="false" class="select widthofboxes1"
                                            Height="22px">
                                        </asp:TextBox>
                                        &nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtcontactemp"
                                            CssClass="font" Display="Dynamic" ErrorMessage="Mobile Number Required!!" ForeColor="Red"
                                            SetFocusOnError="True" Style="color: #FF0000; font-weight: 700">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtcontactemp"
                                            ForeColor="Red" SetFocusOnError="True" Font-Bold="true" CssClass="font" ErrorMessage="Not a Valid Mobile Number!!"
                                            ValidationExpression="[0-9]{10}">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr id="rowbtn" runat="server" visible="false">
                                    <td align="right" width="50%" style="padding-right: 30px">
                                        <asp:LinkButton ID="lnkupdate" runat="server" CssClass="btn " CausesValidation="true" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Width="130px"
                                            OnClick="lnkupdate_Click" BackColor="#99FFCC">
                                            <span style="font-weight: bold; font-size: medium; color: #000000">Update</span></asp:LinkButton>
                                        &nbsp;
                                    </td>
                                    <td align="left" width="50%" style="padding-left: 15px">&nbsp;
                                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn grad4" CausesValidation="false" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" Width="130px"
                                            OnClick="LinkButton3_Click">
                                            <span style="font-weight: bold; font-size: medium; color: #000000">Cancel</span></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                    </div>
                </div>
                <%-- data-backdrop="static" to prevent the Modal closing when clicking outside the Modal--%>
                <div id="divstationinfo" visible="false" runat="server" style="border: thin solid #000066;">
                    <div align="center" style="padding: 5px 0px 5px 0px;" class="gradformessage">
                        <div id="div10" runat="server" align="center">
                            <div align="center" style="padding: 10px 0px 10px 0px">
                                <asp:Image ID="imgstation" runat="server" class="img-responsive" Height="100%" ImageUrl='<%# Eval("") %>'
                                    Width="80px" AlternateText="No Profile Photo" GenerateEmptyAlternateText="True"
                                    ImageAlign="Middle" ToolTip="Profile Photo" />
                                <div id="divstnphotoupload" runat="server" align="center">
                                    <asp:LinkButton ID="lnkstnupload" data-target="#loginModal2" data-toggle="modal"
                                        runat="server" ForeColor="Blue">
                                        Upload/Change Photo</asp:LinkButton>
                                </div>
                            </div>
                            <div class="xs-12" style="padding-top: 10px">
                                <%--<asp:Button ID="Button1" runat="server" class="close" data-dismiss="modal" />--%><%--Section--%>
                                <div class="modal fade" data-keyboard="false" data-backdrop="static" id="loginModal2"
                                    tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    &times;</button>
                                                <%-- data-keyboard="false" to prevent the Modal closing on clicking of escape Button--%>
                                                <h4 class="modal-title">Upload/Change Photo</h4>
                                            </div>
                                            <div class="modal-body" align="center">
                                                <div class="form-group">
                                                    <asp:FileUpload ID="FileUpload2" runat="server" />
                                                    <br />
                                                    <asp:Label ID="Label54" ForeColor="Red" Font-Italic="true" Font-Size="Small" runat="server"
                                                        Text="* Image Size should be between 20kB to 50 kB"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label55" ForeColor="Red" Font-Italic="true" Font-Size="Small" runat="server"
                                                        Text="* Image Dimensions should be between 0-230px X 0-200px."></asp:Label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Upload" OnClick="Button1_Click"
                                                    CausesValidation="False" />
                                                <asp:Button ID="Button2" runat="server" class="btn btn-primary" data-dismiss="modal"
                                                    CausesValidation="False" Text="Close" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div align="center" id="divedit" runat="server">
                            <asp:LinkButton ID="LinkButton6" class="font2" runat="server" Font-Bold="true" ForeColor="Blue"
                                CausesValidation="False" OnClick="LinkButton61_Click">
                                Edit Profile</asp:LinkButton>
                        </div>
                        <br />
                        <br />
                        <div align="center" width="60%" style="padding: 10px 0px 10px 0px" class="table-responsive gradtab">
                            <table class="table table-hover" width="90%">
                                <tr runat="server" visible="false">
                                    <td align="right" width="40%" style="padding-right: 30px">
                                        <asp:Label ID="lblstn1" runat="server" Text="Station" class="fontstyle font2" Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" width="60%" style="padding-left: 15px">
                                        <asp:Label ID="lblstn" runat="server" Style="color: Black" class="fontstyle font2"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr id="trhooempcode" runat="server" visible="true">
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label18" runat="server" Text="HOO/HOS Employee Code" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <div runat="server" align="left">
                                            <asp:Label ID="lblhooempcode" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>

                                            <div id="divhooempcode" runat="server" visible="false">
                                                <asp:TextBox ID="txthooempcode" runat="server" PlaceHolder="HOO Employee Code" Style="padding-right: 4px; padding-left: 4px" CssClass="widthofboxes select" ValidationGroup="stationupdate" Height="28px" AutoPostBack="True" MaxLength="7" OnTextChanged="txthooempcode_TextChanged" Width="80%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="stationupdate" runat="server" class="font" ControlToValidate="txthooempcode" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>

                                        </div>
                                    </td>
                                </tr>
                                <tr runat="server" visible="true">
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label41" runat="server" Text="HOO/HOS Reference Order No" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">


                                        <div runat="server" align="left">
                                            <asp:Label ID="lblrefordernumber_stn" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                Style="color: Black"></asp:Label>
                                            <div id="divorder_stn" runat="server" visible="false">
                                                <asp:TextBox ID="txtreforderno_stn" runat="server" Style="padding-right: 4px; padding-left: 4px" PlaceHolder="Ref Order Number" CssClass="widthofboxes select" ValidationGroup="stationupdate" Height="28px" Width="80%"></asp:TextBox>
                                                &nbsp;
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ValidationGroup="stationupdate" runat="server" class="font" ControlToValidate="txtreforderno_stn" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" ControlToValidate="txtreforderno_stn" Display="Dynamic" ErrorMessage="Maximum 400 Characters are allowed!!" Font-Bold="true" Font-Size="Medium" Style="color: #FF0000" ValidationExpression="^[\s\S\d]{1,400}$" ValidationGroup="stationupdate"></asp:RegularExpressionValidator>

                                            </div>


                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label26" runat="server" Text="HOO/HOS Name" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>

                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblhos" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>
                                        <div id="divstnname" runat="server" visible="false">

                                            <asp:Label ID="lblfirst" runat="server" class="fontstyle font2" Style="color: Black"
                                                Text="First"></asp:Label>
                                            <br />

                                            <asp:TextBox ID="txtfirst" runat="server" PlaceHolder="First Name" Style="padding-right: 4px; padding-left: 4px" CssClass="widthofboxes select" ValidationGroup="stationupdate" Height="28px" ReadOnly="True" Width="80%"></asp:TextBox>
                                            &nbsp;
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="stationupdate" runat="server" class="font" ControlToValidate="txtfirst" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:Label ID="lblmiddle" runat="server" class="fontstyle font2" Style="color: Black"
                                                Text="Middle"></asp:Label>
                                            &nbsp;
                                                <br />
                                            <asp:TextBox ID="txtmiddle" runat="server" PlaceHolder="Middle Name" Style="padding-right: 4px; padding-left: 4px" CssClass="widthofboxes select" Height="28px" ReadOnly="True" Width="80%"></asp:TextBox>
                                            &nbsp;<br />
                                            <asp:Label ID="lbllast" runat="server" class="fontstyle font2" Style="color: Black"
                                                Text="Last"></asp:Label>
                                            &nbsp;
                                                <br />
                                            <asp:TextBox ID="txtlast" runat="server" PlaceHolder="Last Name" Style="padding-right: 4px; padding-left: 4px" CssClass="widthofboxes select" Height="28px" ReadOnly="True" Width="80%"></asp:TextBox>
                                            &nbsp;
                                          
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lbldesgn1" runat="server" Text="HOO Designation" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblstndesgn" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>
                                        <div id="divdesgnstn" runat="server" visible="false">
                                            <div runat="server" align="left">
                                                <asp:Label ID="lblwingstnl" runat="server" class="fontstyle font2" Style="color: Black" Visible="true"
                                                    Text="HOO/HOS Wing"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="ddlwingstn" runat="server" Style="padding-right: 4px; padding-left: 4px" AutoPostBack="True" class="select widthofboxes" Height="28px" Visible="false" ValidationGroup="stationupdate" OnSelectedIndexChanged="ddlwingstn_SelectedIndexChanged" Width="80%">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvwing0" runat="server" class="font" ControlToValidate="ddlwing" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="stationupdate"></asp:RequiredFieldValidator>
                                            </div>
                                            <div id="divdesgnhoowing" runat="server" align="left" visible="false">
                                                <asp:Label ID="lbldesgnstnl" runat="server" class="fontstyle font2" Style="color: Black"
                                                    Text="HOO/HOS Designation"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="ddldesgnstn" runat="server" Style="padding-right: 4px; padding-left: 4px" class="select widthofboxes" Height="28px" Visible="false" ValidationGroup="stationupdate" Width="80%">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" class="font" ControlToValidate="ddldesgnstn" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="stationupdate"></asp:RequiredFieldValidator>

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label6" runat="server" Text="HOO Mobile No" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblhosmobile" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>
                                        &nbsp;
                                        <br />
                                        <div id="divmobstn" runat="server" visible="false">
                                            <div runat="server" align="left">
                                                <asp:Label ID="Label11" runat="server" class="fontstyle font2" Style="color: Black"
                                                    Text="Personal"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txthoomob" runat="server" Style="padding-right: 4px; padding-left: 4px" PlaceHolder="Mobile(Per.)" CssClass="widthofboxes select" ValidationGroup="stationupdate" Height="28px" Width="80%"></asp:TextBox>
                                                &nbsp;
                                              <asp:RequiredFieldValidator ID="rfvhoomob" runat="server" ControlToValidate="txthoomob" ValidationGroup="stationupdate"
                                                  CssClass="font" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                                  SetFocusOnError="True" Style="color: #FF0000; font-weight: 700">
                                              </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="rfvhoomob1" runat="server" ControlToValidate="txthoomob" ValidationGroup="stationupdate"
                                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="true" CssClass="font" ErrorMessage="Not a Valid Mobile Number!!"
                                                    ValidationExpression="[0-9]{10}">
                                                </asp:RegularExpressionValidator>

                                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender2" runat="server" targetcontrolid="txthoomob" validchars="0123456789" />
                                                <br />
                                                <asp:Label ID="Label13" runat="server" class="fontstyle font2" Style="color: Black"
                                                    Text="Official"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtoffmob" runat="server" Style="padding-right: 4px; padding-left: 4px" PlaceHolder="Mobile(Off.)" CssClass="widthofboxes select" ValidationGroup="stationupdate" Height="28px" Width="80%"></asp:TextBox>
                                                &nbsp;
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtoffmob" ValidationGroup="stationupdate"
                                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="true" CssClass="font" ErrorMessage="Not a Valid Mobile Number!!"
                                                    ValidationExpression="[0-9]{10}">
                                                </asp:RegularExpressionValidator>

                                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender4" runat="server" targetcontrolid="txtoffmob" validchars="0123456789" />

                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr runat="server" visible="false">
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblnoemp1" runat="server" Text="Number of Employees" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:LinkButton ID="lblnoemp" runat="server" class="fontstyle font2" Style="color: Black"></asp:LinkButton>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblstnemail1" runat="server" Text="Station Email (Office E-Mail,Only)" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblstnemail" runat="server" class=" font2" Style="color: Black; font-weight: 700;"></asp:Label>
                                        &nbsp;
                                       
                                        <div id="divstnemail" runat="server" visible="false">
                                            <asp:Label ID="lblemail1" runat="server" class="fontstyle font2" Style="color: Black"
                                                Text="Email 1"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtEmail1" runat="server" PlaceHolder="Email-1" class="select widthofboxes" Height="28px" Width="80%" Style="padding-right: 4px; padding-left: 4px"></asp:TextBox>
                                            &nbsp;<asp:RequiredFieldValidator ID="rfvwing1" runat="server" class="font" ControlToValidate="ddlwing" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="stationupdate"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtEmail1" ErrorMessage="Invalid Email!!" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="stationupdate" CssClass="font"></asp:RegularExpressionValidator>
                                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender8" runat="server" invalidchars="*!~, "
                                                targetcontrolid="txtEmail1" filtermode="InvalidChars">
                                            </ajaxtoolkit:filteredtextboxextender>
                                            <br />
                                            <asp:Label ID="lblemail2" runat="server" class="fontstyle font2" Style="color: Black"
                                                Text="Email 2"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtEmail2" runat="server" PlaceHolder="Email-2" class="select widthofboxes" Height="28px" Width="80%" Style="padding-right: 4px; padding-left: 4px"></asp:TextBox>
                                            &nbsp;
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="txtEmail2" ErrorMessage="Invalid Email!!" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="stationupdate" CssClass="font"></asp:RegularExpressionValidator>
                                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender9" runat="server" invalidchars="*!~, "
                                                targetcontrolid="txtEmail2" filtermode="InvalidChars">
                                            </ajaxtoolkit:filteredtextboxextender>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblstncontact1" runat="server" Text="Station Contact No" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblstncontact" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>
                                        &nbsp;
                                        <br />
                                        <div id="divLLno" runat="server" visible="false">
                                            <asp:Label ID="Label1" runat="server" class="fontstyle font2" Style="color: Black"
                                                Text="Phone-1"></asp:Label>
                                            &nbsp;
                                            <br />
                                            <asp:TextBox ID="txtph1" runat="server" PlaceHolder="Phone-1" class="select widthofboxes" Height="28px" ValidationGroup="stationupdate" Width="80%" Style="padding-right: 4px; padding-left: 4px"></asp:TextBox>

                                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender5" runat="server" targetcontrolid="txtph1" validchars="0123456789-" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ValidationGroup="stationupdate" runat="server" class="font" ControlToValidate="txtph1" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <br />
                                            &nbsp;<asp:Label ID="Label2" runat="server" class="fontstyle font2" Style="color: Black"
                                                Text="Phone-2"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtph2" runat="server" PlaceHolder="Phone-2" class="select widthofboxes" Height="28px" ValidationGroup="stationupdate" Width="80%" Style="padding-right: 4px; padding-left: 4px"></asp:TextBox>

                                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender6" runat="server" targetcontrolid="txtph2" validchars="0123456789-" />
                                            <br />
                                            &nbsp;<asp:Label ID="lblemail3" runat="server" class="fontstyle font2" Style="color: Black"
                                                Text="Phone-3"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtph3" runat="server" PlaceHolder="Phone-3" class="select widthofboxes" Height="28px" ValidationGroup="stationupdate" Width="80%" Style="padding-right: 4px; padding-left: 4px"></asp:TextBox>
                                            &nbsp;
                                                                                  
                                                
                                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender7" runat="server" targetcontrolid="txtph3" validchars="0123456789-" />
                                        </div>
                                    </td>
                                </tr>
                                <tr id="trddoempcode" runat="server" visible="true">
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label23" runat="server" Text="DDO Employee Code" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">


                                        <div runat="server" align="left">
                                            <asp:Label ID="lblempcodeddo" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                Style="color: Black"></asp:Label>
                                            <div id="divddoempcode" runat="server" visible="false">
                                                <asp:TextBox ID="txtddoempcode" runat="server" Style="padding-right: 4px; padding-left: 4px" PlaceHolder="DDO EmpCode" CssClass="widthofboxes select" ValidationGroup="stationupdate" Height="28px" AutoPostBack="True" OnTextChanged="txtddoempcode_TextChanged" Width="80%"></asp:TextBox>
                                                &nbsp;
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="stationupdate" runat="server" class="font" ControlToValidate="txtddoempcode" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:Label ID="lblddoname" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                    Style="color: Black"></asp:Label>
                                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender14" runat="server" targetcontrolid="txtddoempcode" validchars="0123456789" />
                                            </div>


                                        </div>
                                    </td>
                                </tr>
                                <tr id="tr4" runat="server" visible="true">
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label38" runat="server" Text="Engineering Head Employee Code" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">


                                        <div runat="server" align="left">
                                            <asp:Label ID="lbleng_head_empcode" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                Style="color: Black"></asp:Label>
                                            <div id="divengg_head" runat="server" visible="false">
                                                <asp:TextBox ID="txtenggheadempcode" runat="server" Style="padding-right: 4px; padding-left: 4px" PlaceHolder="Engg. Head EmpCode" CssClass="widthofboxes select" Height="28px" AutoPostBack="True" Width="80%" OnTextChanged="txtenggheadempcode_TextChanged"></asp:TextBox>
                                                &nbsp;
                                               <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator14" ValidationGroup="stationupdate" runat="server" class="font" ControlToValidate="txtenggheadempcode" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                               --%><br />
                                                <asp:Label ID="lblenggheadname" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                    Style="color: Black"></asp:Label>
                                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender15" runat="server" targetcontrolid="txtenggheadempcode" validchars="0123456789" />
                                            </div>


                                        </div>
                                    </td>
                                </tr>
                                <tr id="tr5" runat="server" visible="true">
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label39" runat="server" Text="Programme Head Employee Code" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">


                                        <div runat="server" align="left">
                                            <asp:Label ID="lblproghead_empcode" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                Style="color: Black"></asp:Label>
                                            <div id="divprog_head" runat="server" visible="false">
                                                <asp:TextBox ID="txtprogH_empcode" runat="server" Style="padding-right: 4px; padding-left: 4px" PlaceHolder="Prog. Head EmpCode" CssClass="widthofboxes select" Height="28px" AutoPostBack="True" Width="80%" OnTextChanged="txtprogH_empcode_TextChanged"></asp:TextBox>
                                                &nbsp;
                                               <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator15" ValidationGroup="stationupdate" runat="server" class="font" ControlToValidate="txtprogH_empcode" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                               --%>
                                                <br />
                                                <asp:Label ID="lblprogheadname" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                    Style="color: Black"></asp:Label>
                                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender16" runat="server" targetcontrolid="txtprogH_empcode" validchars="0123456789" />
                                            </div>


                                        </div>
                                    </td>
                                </tr>
                                <tr runat="server" visible="true">
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label40" runat="server" Text="Security Officer Employee Code" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">


                                        <div runat="server" align="left">
                                            <asp:Label ID="lblsec_head_empcode" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                Style="color: Black"></asp:Label>
                                            <div id="divsec_head" runat="server" visible="false">
                                                <asp:TextBox ID="txtsec_head_empcode" runat="server" Style="padding-right: 4px; padding-left: 4px" PlaceHolder="Security Officer EmpCode" CssClass="widthofboxes select" Height="28px" AutoPostBack="True" Width="80%" OnTextChanged="txtsec_head_empcode_TextChanged"></asp:TextBox>
                                                &nbsp;
                                               <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="stationupdate" runat="server" class="font" ControlToValidate="txtsec_head_empcode" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                <br />
                                                <asp:Label ID="lblsecheadname" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                    Style="color: Black"></asp:Label>
                                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender17" runat="server" targetcontrolid="txtsec_head_empcode" validchars="0123456789" />
                                            </div>


                                        </div>
                                    </td>
                                </tr>
                                <tr id="trsection" runat="server" visible="false">
                                    <td align="right" style="padding-right: 30px">
                                        <span style="border: groove; border-color: black">
                                            <asp:LinkButton ID="LinkButton9" runat="server" CssClass="btn " CausesValidation="true" ValidationGroup="stationupdate" Width="130px" Height="35px" Font-Bold="true" Font-Size="Medium"
                                                BackColor="#99FFCC" OnClick="LinkButton9_Click">
                                                <span style="font-weight: bold; color: #000000">Update</span></asp:LinkButton></span>
                                    </td>
                                    <td align="left" style="padding-left: 15px">&nbsp;
                                       <span style="border: groove; border-color: black">
                                           <asp:LinkButton ID="LinkButton10" runat="server" CssClass="btn grad4" CausesValidation="false" OnClick="LinkButton10_Click" Width="130px" Height="35px" Font-Bold="true" Font-Size="Medium"><span style="font-weight: bold; color: #000000">Cancel</span></asp:LinkButton></span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <%-- data-backdrop="static" to prevent the Modal closing when clicking outside the Modal--%>
                <div id="divsection" visible="false" runat="server" style="border: thin solid #000066;">
                    <div align="center" style="padding: 5px 0px 5px 0px;" class="gradformessage">
                        <div id="div12" runat="server" align="center">
                            <div align="center" style="padding: 10px 0px 10px 0px">
                                <asp:Image ID="Image3" runat="server" class="img-responsive" Height="100%" ImageUrl='<%# Eval("") %>'
                                    Width="80px" AlternateText="No Profile Photo" GenerateEmptyAlternateText="True"
                                    ImageAlign="Middle" ToolTip="Profile Photo" />
                                <div id="div13" runat="server" align="center">
                                    <asp:LinkButton ID="LinkButton11" data-target="#Div14" data-toggle="modal"
                                        runat="server" ForeColor="Blue">
                                        Upload/Change Photo</asp:LinkButton>
                                </div>
                            </div>
                            <div class="xs-12" style="padding-top: 10px">
                                <%--<asp:Button ID="Button1" runat="server" class="close" data-dismiss="modal" />--%><%--<tr>
                                    <td align="right" width="50%" style="padding-right: 30px">
                                        <asp:Label ID="Label23" runat="server" Text="Number of Employees" class="fontstyle font2" Style="
                                            color: Black"></asp:Label>&nbsp;
                                    </td>
                                    <td align="left" width="50%" style="padding-left: 15px">
                                        <asp:LinkButton ID="LinkButton14" runat="server" class="fontstyle font2" Style="color: Black"></asp:LinkButton>&nbsp;
                                    </td>
                                </tr>--%>
                                <div class="modal fade" data-keyboard="false" data-backdrop="static" id="Div14" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    &times;</button>
                                                <%--   </div>--%>
                                                <h4 class="modal-title">Upload/Change Photo</h4>
                                            </div>
                                            <div class="modal-body" align="center">
                                                <div class="form-group">
                                                    <asp:FileUpload ID="FileUpload3" runat="server" />
                                                    <br />
                                                    <asp:Label ID="Label3" ForeColor="Red" Font-Italic="true" Font-Size="Small" runat="server"
                                                        Text="* Image Size should be between 20kB to 50 kB"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label4" ForeColor="Red" Font-Italic="true" Font-Size="Small" runat="server"
                                                        Text="* Image Dimensions should be between 0-230px X 0-200px."></asp:Label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <asp:Button ID="Button3" runat="server" class="btn btn-primary" Text="Upload" OnClick="Button1_Click"
                                                    CausesValidation="False" />
                                                <asp:Button ID="Button4" runat="server" class="btn btn-primary" data-dismiss="modal"
                                                    CausesValidation="False" Text="Close" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div id="diveditprofilesection" runat="server" align="center">
                            <asp:LinkButton ID="LinkButton13" class="font2" runat="server" Font-Bold="true" ForeColor="Blue"
                                CausesValidation="False" OnClick="LinkButton6_Click">
                                Edit Profile</asp:LinkButton>
                        </div>
                        <br />
                        <br />
                        <div align="center" width="60%" style="padding: 10px 0px 10px 0px" class="table-responsive gradtab">
                            <table class="table table-bordered" width="80%" border="3" rules="all">
                                <tr>
                                    <td align="right" width="40%" style="padding-right: 30px">
                                        <asp:Label ID="Label5" runat="server" Text="Section" class="fontstyle font2" Style="color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" width="60%" style="padding-left: 15px">
                                        <asp:Label ID="Label7" runat="server" Style="color: Black" class="fontstyle font2"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr id="trempcode_sec" runat="server" visible="true">
                                    <td align="right" width="40%" style="padding-right: 30px">
                                        <asp:Label ID="Label27" runat="server" Text="HOO/HOS Employee Code" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" width="60%" style="padding-left: 15px">
                                        <div runat="server" align="left">
                                            <asp:Label ID="lblempcodesec" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>

                                            <div id="divempcodesec" runat="server" visible="false">
                                                <asp:TextBox ID="txthoo_EmpCode_sec" runat="server" PlaceHolder="HOO Employee Code" Style="padding-right: 4px; padding-left: 4px" CssClass="widthofboxes select" ValidationGroup="secprofile" Height="28px" AutoPostBack="True" MaxLength="7" OnTextChanged="txthoo_EmpCode_sec_TextChanged" Width="80%"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ValidationGroup="secprofile" runat="server" class="font" ControlToValidate="txthoo_EmpCode_sec" Display="Dynamic" ErrorMessage="* Required" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            </div>

                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label8" runat="server" Text="HOO/HOS Name" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="Label9" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>
                                        <asp:TextBox ID="TextBox3" runat="server" PlaceHolder="Name" class="select widthofboxes1" Style="padding-right: 4px; padding-left: 4px"
                                            Visible="false" Height="28px" ValidationGroup="secprofile" ReadOnly="True" Width="80%">
                                        </asp:TextBox>
                                        &nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" CssClass="font"
                                            Display="Dynamic" ErrorMessage="* Required" Font-Bold="True" ForeColor="Red" ValidationGroup="secprofile">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label19" runat="server" Text="HOO Designation" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="Label20" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>
                                        &nbsp;
                                        <div id="divwingsec" runat="server" visible="false">
                                            <div runat="server" align="left">
                                                <asp:Label ID="Label36" runat="server" class="fontstyle font2" Style="color: Black" Visible="true"
                                                    Text="HOO/HOS Wing"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="ddlwing" runat="server" class="select widthofboxes1" Visible="false" Style="padding-right: 4px; padding-left: 4px"
                                                    Height="28px" AutoPostBack="True"
                                                    OnSelectedIndexChanged="ddlwing_SelectedIndexChanged" ValidationGroup="secprofile" Width="80%">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvwing" runat="server" ControlToValidate="ddlwing"
                                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                                    class="font" ValidationGroup="secprofile">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                            <br />
                                            <div runat="server" align="left">
                                                <asp:Label ID="Label37" runat="server" class="fontstyle font2" Style="color: Black" Visible="true"
                                                    Text="HOO/HOS Designation"></asp:Label>
                                                <br />
                                                <asp:DropDownList ID="ddldesgn" runat="server" class="select widthofboxes1" Visible="false" Style="padding-right: 4px; padding-left: 4px"
                                                    Height="28px" ValidationGroup="secprofile" Width="80%">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="rfvwing2" runat="server" ControlToValidate="ddldesgn"
                                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                                    class="font" ValidationGroup="secprofile">
                                                </asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label21" runat="server" Text="HOO-Mobile No" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="Label22" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>

                                        <div id="divmobilesec" runat="server" visible="false">
                                            <div runat="server" align="left">
                                                <asp:Label ID="Label30" runat="server" class="fontstyle font2" Style="color: Black"
                                                    Text="Personal"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="TextBox4" runat="server" Visible="false" class="select widthofboxes1" Height="28px" ValidationGroup="secprofile" Width="80%" Style="padding-right: 4px; padding-left: 4px"></asp:TextBox>
                                                &nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4"
                                            CssClass="font" Display="Dynamic" ErrorMessage="* Required " ForeColor="Red"
                                            SetFocusOnError="True" Style="color: #FF0000; font-weight: 700" ValidationGroup="secprofile">
                                        </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox4"
                                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="true" CssClass="font" ErrorMessage="Not a Valid Mobile Number!!"
                                                    ValidationExpression="[0-9]{10}" ValidationGroup="secprofile">
                                                </asp:RegularExpressionValidator>
                                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender3" runat="server" targetcontrolid="TextBox4" validchars="0123456789" />
                                                <br />
                                                <asp:Label ID="Label32" runat="server" class="fontstyle font2" Style="color: Black"
                                                    Text="Official"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="txtmobileoff" runat="server" PlaceHolder="Mobile(Off.)" CssClass="widthofboxes select" ValidationGroup="secprofile" Height="28px" Width="80%" Style="padding-right: 4px; padding-left: 4px"></asp:TextBox>
                                                &nbsp;
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtmobileoff" ValidationGroup="secprofile"
                                                    ForeColor="Red" SetFocusOnError="True" Font-Bold="true" CssClass="font" ErrorMessage="Not a Valid Mobile Number!!"
                                                    ValidationExpression="[0-9]{10}">
                                                </asp:RegularExpressionValidator>
                                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server" targetcontrolid="txtmobileoff" validchars="0123456789" />

                                            </div>
                                        </div>



                                    </td>
                                </tr>
                                <%--Management Profile--%>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label24" runat="server" Text="Section-Email" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="Label25" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>
                                        &nbsp;
                                        
                                         <div id="divemailsec" runat="server" visible="false">
                                             <asp:Label ID="Label33" runat="server" class="fontstyle font2" Style="color: Black"
                                                 Text="Email 1"></asp:Label>
                                             <br />
                                             <asp:TextBox
                                                 ID="TextBox5" runat="server" Visible="false" PlaceHolder="Email-1" class="select widthofboxes1" Style="padding-right: 4px; padding-left: 4px"
                                                 Height="28px" ValidationGroup="secprofile" Width="80%">
                                             </asp:TextBox>
                                             &nbsp; &nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5"
                                            CssClass="font" Display="Dynamic" ErrorMessage="* Required " ForeColor="Red"
                                            SetFocusOnError="True" Style="color: #FF0000; font-weight: 700" ValidationGroup="secprofile">
                                        </asp:RequiredFieldValidator>
                                             <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender10" runat="server" invalidchars="*!~, "
                                                 targetcontrolid="TextBox5" filtermode="InvalidChars">
                                             </ajaxtoolkit:filteredtextboxextender>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="Invalid Email!!" Font-Bold="True"
                                                 ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="secprofile" CssClass="font">
                                             </asp:RegularExpressionValidator>

                                             <br />
                                             <asp:Label ID="Label34" runat="server" class="fontstyle font2" Style="color: Black"
                                                 Text="Email 2"></asp:Label>
                                             <br />
                                             <asp:TextBox
                                                 ID="txtemail2sec" runat="server" Visible="false" PlaceHolder="Email-2" class="select widthofboxes1" Style="padding-right: 4px; padding-left: 4px"
                                                 Height="28px" ValidationGroup="secprofile" Width="80%">
                                             </asp:TextBox>
                                             &nbsp; 
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" ControlToValidate="txtemail2sec" ErrorMessage="Invalid Email!!" Font-Bold="True" ForeColor="Red"
                                                SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="secprofile" CssClass="font">
                                            </asp:RegularExpressionValidator>
                                             <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender11" runat="server" invalidchars="*!~, "
                                                 targetcontrolid="txtemail2sec" filtermode="InvalidChars">
                                             </ajaxtoolkit:filteredtextboxextender>
                                         </div>



                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label28" runat="server" Text="Section-Contact No/ LL No (with STD Code)" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <asp:Label ID="Label29" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>
                                        <asp:TextBox ID="TextBox7" runat="server" PlaceHolder="Landline Number" Visible="false" class="select widthofboxes1" Style="padding-right: 4px; padding-left: 4px"
                                            Height="28px" ValidationGroup="secprofile" Width="80%">
                                        </asp:TextBox>
                                        &nbsp; &nbsp;
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox7"
                                            CssClass="font" Display="Dynamic" ErrorMessage="* Required " ForeColor="Red"
                                            SetFocusOnError="True" Style="color: #FF0000; font-weight: 700" ValidationGroup="secprofile">
                                        </asp:RequiredFieldValidator>
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender12" runat="server" targetcontrolid="TextBox7" validchars="0123456789 ,-" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="Maximum 125 Characters/Digits are allowed!!"
                                            Font-Bold="true" Font-Size="Medium" Style="color: #FF0000" ValidationExpression="^[\s\S\d]{1,125}$" ValidationGroup="sub">
                                        </asp:RegularExpressionValidator>
                                        <br />
                                        <asp:Label ID="Label56" runat="server" Style="font-size: small; font-weight: 700; font-style: italic; color: #FF0000" Text="Multiple Contact No Must be seprated by Comma ','" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr id="tr2" runat="server" visible="true">
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label31" runat="server" Text="Office Duties/Work Allocation" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">
                                        <div runat="server" align="left">
                                            <asp:Label ID="lbldutiessec" runat="server" class="fontstyle font2" Style="color: Black"></asp:Label>

                                            <div id="divsecduties" runat="server" visible="false">
                                                <asp:TextBox ID="txtdutiessec" runat="server" CssClass="widthofboxes select" ValidationGroup="stationupdate" Height="125px" MaxLength="600" TextMode="MultiLine" Width="80%" Style="padding: 4px"></asp:TextBox>
                                                <br />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtdutiessec" Display="Dynamic" ErrorMessage="Maximum 500 Characters are allowed!!"
                                                    Font-Bold="true" Font-Size="Medium" Style="color: #FF0000" ValidationExpression="^[\s\S\d]{0,500}$" ValidationGroup="sub">
                                                </asp:RegularExpressionValidator>
                                            </div>

                                        </div>
                                    </td>
                                </tr>
                                <tr id="tr3" runat="server" visible="true">
                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label35" runat="server" Text="DDO Employee Code" class="fontstyle font2"
                                            Style="color: Black"></asp:Label>
                                    </td>
                                    <td align="left" style="padding-left: 15px">


                                        <div runat="server" align="left">
                                            <asp:Label ID="lblddoempsec" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                Style="color: Black"></asp:Label>
                                            <div id="div11" runat="server" visible="false">
                                                <asp:TextBox ID="txtddoempcode_sec" runat="server" PlaceHolder="DDO EmpCode" CssClass="widthofboxes select" Style="padding-right: 4px; padding-left: 4px" ValidationGroup="stationupdate" Height="28px" AutoPostBack="True" OnTextChanged="txtddoempcode_sec_TextChanged" Width="80%"></asp:TextBox>
                                                &nbsp;
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="secprofile" runat="server" class="font" ControlToValidate="txtddoempcode_sec" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                <br />
                                                <asp:Label ID="lblddoname_sec" runat="server" Text="" class="fontstyle font2" Font-Bold="true"
                                                    Style="color: Black"></asp:Label>
                                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender13" runat="server" targetcontrolid="txtddoempcode_sec" validchars="0123456789" />
                                            </div>


                                        </div>
                                    </td>
                                </tr>
                                <tr id="tr1" runat="server" visible="false">
                                    <td align="right" style="padding-right: 30px">
                                        <asp:LinkButton ID="LinkButton15" runat="server" CssClass="btn " CausesValidation="true" Width="130px" Height="35px" Font-Bold="true" Font-Size="Medium"
                                            BackColor="#99FFCC" OnClick="LinkButton15_Click" ValidationGroup="secprofile">
                                            <span style="font-weight: bold; color: #000000">Update</span></asp:LinkButton>
                                        &nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px">&nbsp;
                                        <asp:LinkButton ID="LinkButton16" runat="server" CssClass="btn grad4" CausesValidation="false" Width="130px" Height="35px" Font-Bold="true" Font-Size="Medium"
                                            OnClick="LinkButton16_Click">
                                            <span style="font-weight: bold; color: #000000">Cancel</span></asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <%--                </div>--%>                <%--                </div>--%>
                <div id="divmanagemntprofile" visible="false" runat="server" style="border: thin solid #000066;">
                    <div align="center" style="padding: 10px 0px 10px 0px">
                        <div id="div1" runat="server" align="center">
                            <asp:LinkButton ID="LinkButton1" data-target="#loginModal3" data-toggle="modal" runat="server"
                                ForeColor="Blue">
                                Upload/Change Photo</asp:LinkButton>
                            <br />
                            <br />
                            <asp:LinkButton ID="LinkButton12" runat="server" ForeColor="Blue">Edit Profile</asp:LinkButton>
                        </div>
                    </div>
                    <div align="center" width="60%" style="padding: 10px 0px 10px 0px" class="table-responsive">
                        <table class="table table-striped table-hover" width="90%">
                            <tr>
                                <td align="right" width="50%" style="padding-right: 30px">
                                    <asp:Label ID="lbloff" runat="server" Text="Office" Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" width="50%" style="padding-left: 15px">
                                    <asp:Label ID="lbloff1" runat="server" Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="50%" style="padding-right: 30px">
                                    <asp:Label ID="lblhoo" runat="server" Text="Head Of Office" Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" width="50%" style="padding-left: 15px">
                                    <asp:Label ID="lblhoo1" runat="server" Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="50%" style="padding-right: 30px">
                                    <asp:Label ID="lblhoodes" runat="server" Text="Designation" Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" width="50%" style="padding-left: 15px">
                                    <asp:Label ID="lblhoodes1" runat="server" Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="50%" style="padding-right: 30px">
                                    <asp:Label ID="lblhooEmail" runat="server" Text="Email" Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" width="50%" style="padding-left: 15px">
                                    <asp:Label ID="lblhooEmail1" runat="server" Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="50%" style="padding-right: 30px">
                                    <asp:Label ID="lblLLNO" runat="server" Text="Landline No." Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" width="50%" style="padding-left: 15px">
                                    <asp:Label ID="lblLLNO1" runat="server" Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td align="right" width="50%" style="padding-right: 30px">
                                    <asp:Label ID="lblhoomobile" runat="server" Text="Mobile No." Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" width="50%" style="padding-left: 15px">
                                    <asp:Label ID="lblhoomobile1" runat="server" Style="font-weight: 700; color: Black"></asp:Label>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr id="trmanagement" runat="server" visible="false">
                                <td align="right" width="50%" style="padding-right: 30px">
                                    <asp:LinkButton ID="LinkButton7" runat="server" CssClass="btn " CausesValidation="true"
                                        BackColor="#99FFCC">
                                        <span style="font-weight: bold; color: #000000">Update</span></asp:LinkButton>
                                    &nbsp;
                                </td>
                                <td align="left" width="50%" style="padding-left: 15px">&nbsp;
                                    <asp:LinkButton ID="LinkButton8" runat="server" CssClass="btn grad4" CausesValidation="false"><span style="font-weight: bold; color: #000000">Cancel</span></asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <div>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <br />
                <div align="center" class=" col-md-2 col-sm-3 col-lg-1" runat="server" id="div5">
                </div>
                <%--                </div>--%>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div8">
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
