<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentUpload.aspx.cs"
    Inherits="PrasarNet.DocumentUpload" MasterPageFile="~/Site1.Master" EnableEventValidation="false" MaintainScrollPositionOnPostback="true" %>

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
        .visible-md-block {
            display: block !important;
        }

        .container1 {
            min-height: 500px;
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

        .style1 {
            font-size: small;
            color: #FF0000;
        }

        .padtext {
            padding: 6px;
        }


        .auto-style1 {
            font-size: small;
            color: #000000;
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
                                    <%--  <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>  --%>
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
                                <li><a href="Logout.aspx" id="A3" runat="server">LogOut</a></li>
                                <%-- <li><a href="#" runat="server" onserverclick="logoutIT_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                            </ul>
                        </li>

                    </ul>
                </div>
            </nav>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="content gradbody">
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
        <div class="row" runat="server" style="padding-right: 20px; margin: auto">
            <div id="Div1" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False"
                    OnClick="btnback_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px">
                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div class="row" style="margin: auto">
            <div align="center" class="col-md-8 col-sm-8 col-lg-8" runat="server" id="div3" style="padding-left: 20px; padding-right: 20px;">
                <asp:Label ID="Label12" runat="server" Style="font-weight: 700; color: White; font-size: medium"
                    Text=""></asp:Label>
                <asp:Label ID="lblexception" runat="server" Style="font-weight: bold; color: Red; font-size: medium" Visible="false"
                    Text=""></asp:Label>
                <div class="table-hover table">
                    <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 10px; padding-bottom: 10px">
                        <asp:Label ID="Label4" runat="server" Text="Orders/Circulars Upload" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                        &nbsp;
                    </div>
                    <table class="table table table-bordered grad2" style="min-height: 625px">
                        <tr>
                            <td align="right" style="padding-right: 15px; width: 40%">
                                <asp:Label ID="lbldoctype" runat="server" Text="Category" ForeColor="Black" class="font2" Font-Size="Medium"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px">
                                <asp:DropDownList ID="ddldoctype" runat="server" AutoPostBack="false" class="select widthofboxes1" Width="90%" Font-Bold="true" Font-Size="Medium" ValidationGroup="upload"
                                    Height="32px" AppendDataBoundItems="true" CssClass="padtext">
                                    <%--  <asp:ListItem Text="All" Value=""> </asp:ListItem>--%>
                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="rfvdoctype" runat="server" ControlToValidate="ddldoctype" ValidationGroup="upload"
                                    Display="Dynamic" ErrorMessage="Pls select a Document-Type.." ForeColor="Black"
                                    SetFocusOnError="True" Font-Size="small" Font-Bold="true">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" class="tdalign">
                                <asp:Label ID="lbltitle" runat="server" Text="Title/Subject" ForeColor="Black" class="font2" Font-Size="Medium"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px">
                                <asp:TextBox ID="txttitle" runat="server" class="select widthofboxes1" Height="150px" Width="90%" Font-Bold="True" Font-Size="Medium" ValidationGroup="upload"
                                    TextMode="MultiLine" CssClass="padtext">
                                </asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="rfvtitle" runat="server" ErrorMessage="Title Required!!" ValidationGroup="upload"
                                    ControlToValidate="txttitle" ForeColor="Black" SetFocusOnError="True" Font-Size="small" Font-Bold="true"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revtitle" runat="server" ErrorMessage="Title is not allowed to exceed by 250 characters!!" ValidationGroup="upload"
                                    Style="color: black" ControlToValidate="txttitle" ValidationExpression="^[\s\S\d]{1,250}$"
                                    Display="Dynamic" Font-Size="Small" Font-Bold="True">
                                </asp:RegularExpressionValidator>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender72" runat="server" filtertype="Custom" filtermode="InvalidChars"
                                    targetcontrolid="txttitle" invalidchars="*~!^">
                                </ajaxtoolkit:filteredtextboxextender>

                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px">
                                <asp:Label ID="lbldatofdoc" runat="server" Text="Dated" ForeColor="Black" class="font2" Font-Size="Medium"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px">
                                <asp:UpdatePanel runat="server">
                                    <contenttemplate>
                                        <asp:TextBox ID="txtdatedoc" runat="server" class="select widthofboxes1" Font-Bold="true" Font-Size="Medium" ValidationGroup="upload"
                                            Height="32px" Width="90%" CssClass="padtext" autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10">
                                        </asp:TextBox>
                                        <%--   <asp:ImageButton ID="imgbtnCalendar" runat="server" Height="100%" Width="32px" ImageUrl="~/images/cal.png"
                                    AlternateText="Calender" CausesValidation="false" />--%>
                                        <ajaxtoolkit:calendarextender id="txtdatedoc_CalendarExtender" runat="server" behaviorid="txtdatedoc_CalendarExtender"
                                            format="dd-MM-yyyy" targetcontrolid="txtdatedoc" />
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderThours" runat="server"
                                            targetcontrolid="txtdatedoc" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvdateofdoc" runat="server" ErrorMessage="Doc-Date Required!!" ValidationGroup="upload"
                                            ControlToValidate="txtdatedoc" ForeColor="Black" SetFocusOnError="True" Font-Size="small" Font-Bold="true"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </contenttemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px">
                                <asp:Label ID="lblorderno" runat="server" Text="Order No." ForeColor="Black" class="font2" Font-Size="Medium"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px">
                                <asp:TextBox ID="txtordernum" runat="server" class="select widthofboxes1" Font-Bold="true" Font-Size="Medium" ValidationGroup="upload"
                                    Height="54px" CssClass="padtext" Width="90%" TextMode="MultiLine">
                                </asp:TextBox>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtyear"
                                        Display="Dynamic" ErrorMessage="Pl. Fill the Year" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtyear"
                                        Display="Dynamic" ErrorMessage="Pl. Enter a Valid Year" ForeColor="Red" ValidationExpression="\d{4}"></asp:RegularExpressionValidator>--%>
                                &nbsp;
                                <br />
                                <asp:RequiredFieldValidator ID="rfvorderno" runat="server" ControlToValidate="txtordernum" ValidationGroup="upload"
                                    Display="Dynamic" ErrorMessage="Doc-OrderNo Required!!" ForeColor="Black" SetFocusOnError="True"
                                    Font-Size="small" Font-Bold="true">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revorderno" runat="server" ErrorMessage="Order No. is not allowed to exceed by 150 characters!!" ValidationGroup="upload"
                                    Style="color: black" ControlToValidate="txtordernum" Font-Size="Small" Font-Bold="True" ValidationExpression="^[\s\S\d]{1,150}$"
                                    Display="Dynamic">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px">
                                <asp:Label ID="lblfileno" runat="server" Text="File No." ForeColor="Black" class="font2" Font-Size="Medium"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px">
                                <asp:TextBox ID="txtfilenum" runat="server" class="select  widthofboxes1" Font-Bold="true" Font-Size="Medium" ValidationGroup="upload" CssClass="padtext" Width="90%"
                                    Height="54px" TextMode="MultiLine">
                                </asp:TextBox>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtyear"
                                        Display="Dynamic" ErrorMessage="Pl. Fill the Year" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtyear"
                                        Display="Dynamic" ErrorMessage="Pl. Enter a Valid Year" ForeColor="Red" ValidationExpression="\d{4}"></asp:RegularExpressionValidator>--%>
                                <br />
                                <asp:RequiredFieldValidator ID="rfvfile" runat="server" ControlToValidate="txtfilenum" ValidationGroup="upload"
                                    Display="Dynamic" ErrorMessage="Doc-FileNo Required!!" ForeColor="black" SetFocusOnError="True"
                                    Font-Size="small" Font-Bold="true">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revfile" runat="server" ErrorMessage="File No. is not allowed to exceed by 150 characters!!" ValidationGroup="upload"
                                    Style="color: black" ControlToValidate="txtordernum" ValidationExpression="^[\s\S\d]{1,150}$"
                                    Display="Dynamic" Font-Size="Small" Font-Bold="True">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px">
                                <asp:Label ID="lblcal" runat="server" Text="Upload" class="font2" ForeColor="Black" Font-Size="Medium"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px">
                                <asp:FileUpload ID="FileUpload1" runat="server" class="select widthofboxes1" Font-Bold="true" Font-Size="Medium" Width="100%" ForeColor="Black"
                                    Height="32px" />
                                <asp:Label ID="Label13" runat="server" Text="* Only .pdf files are allowed." class="fontingrid"
                                    Font-Italic="True" ForeColor="Blue" Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 10px">
                                <asp:Button ID="btnupload" runat="server" Text="Upload" class="btn select buttondocumentupload" ValidationGroup="upload"
                                    Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnupload_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Font-Size="Medium" Width="120px" />
                            </td>
                            <td align="left" style="padding-left: 10px">
                                <asp:Button ID="btncncl" runat="server" Text="Cancel" class="btn select gradbody buttondocumentupload"
                                    Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Font-Size="Medium" Width="120px" />
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div align="center" class=" col-md-4 col-sm-4 col-lg-4" runat="server" id="div4"
                style="padding-bottom: 20px; padding-right: 20px; padding-left: 20px; top: 0px; left: 0px;">
                <div style="border: thin ridge #000000; padding-right: 35px; padding-left: 35px; padding-top: 35px; padding-bottom: 35px; min-height: 663px;"
                    class="justify-text gradhead wrap">
                    <div runat="server">
                        <asp:Label ID="Label18" runat="server" Font-Bold="true" Font-Underline="true" Text="Guidelines to include/Upload Links in Main document"
                            class="font2"></asp:Label>
                    </div>
                    <br />
                    <asp:Label ID="Label16" runat="server" Font-Bold="true" Text="1." class="font2"></asp:Label>
                    <asp:Label ID="Label17" runat="server" Font-Bold="true" Text="First Upload the main document, with the help of Orders/Circulars Upload  Block, given on the left hand side."
                        class="font2"></asp:Label>
                    <br />
                    <asp:Label ID="Label19" runat="server" Font-Bold="true" Text="2." class="font2"></asp:Label>
                    <asp:Label ID="Label20" runat="server" Font-Bold="true" Text="For Uploading the Linked Files, to the main Documents, Click on the Link Given Below: "
                        class="font2"></asp:Label>
                    <br />
                    <br />
                    <div id="Div2" runat="server" align="center">
                        <span class="btn select grad3 button111" style="border: ridge; border-color: black; border-width: 2px"><a href="UploadLinkedDocuments.aspx"><span
                            class="font2" style="font-size: small; color: #000000">Upload Linked Documents</span></a></span>
                    </div>
                    <br />
                    <br />
                    <asp:Label ID="Label21" runat="server" Font-Bold="true" Text="3." class="font2"></asp:Label>
                    <asp:Label ID="Label22" runat="server" Font-Bold="true" Text="Before Uploading the Linked and Main Documents, User need to include a hyperlink(s) in the Main document as :"
                        class="font2"></asp:Label>
                    <asp:Label ID="Label23" runat="server" ForeColor="Blue" Font-Italic="true" Font-Bold="true"
                        Text="https://prasarnet.prasarbharati.org/LinkedDocuments/filename(with extension)" class="font"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="Label5" runat="server" Font-Bold="true" Text="4." class="font2"></asp:Label>
                    <asp:Label ID="Label7" runat="server" Font-Bold="true" Text="Note that, the filename of linked documents must be unique i.e. should not match with the existing files in our system. To ensure the filename or document name is unique click on the link given below. "
                        class="font2"></asp:Label>
                    <br />
                    <asp:Label ID="Label9" runat="server" ForeColor="Red" Font-Italic="false" Font-Bold="true"
                        Text="** It is always advisable to check the uniqueness of filename before embedded a link in a main document" class="font"></asp:Label>
                    <br />
                    <br />
                    <div id="Div11" runat="server" align="center">

                        <span class="btn select grad3 button111" style="border: ridge; border-color: black; border-width: 2px;">
                            <asp:LinkButton ID="LinkButton1" CausesValidation="false" class="font2" Font-Size="Small" Style="color: #000000" runat="server" OnClick="LinkButton1_Click">Check the uniqueness of FileName</asp:LinkButton>
                        </span>
                    </div>
                    <div id="Div12" runat="server" align="center" visible="false" style="border: thin ridge #000000">
                        <div runat="server" align="right" style="padding-right: 10px; padding-top: 10px">
                            <asp:LinkButton ID="lnkclosesearch" CssClass="font2" runat="server" ForeColor="Blue" OnClick="lnkclosesearch_Click" CausesValidation="False">XClose</asp:LinkButton>
                        </div>
                        <table>
                            <tr>
                                <td align="right" style="padding-right: 10px">
                                    <asp:Label ID="Label8" runat="server" Text="FileName" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 10px">

                                    <asp:TextBox ID="txtfilenamesearch" runat="server" class="select widthofboxes1" Height="26px" ValidationGroup="search"
                                        autocomplete="off" placeholder="fileName" MaxLength="150">
                                    </asp:TextBox>
                                    <asp:Label ID="lblmsg2" runat="server" Text="* To avoid a error, While writing a name of file in the Box, Please do not use extension i.e. .pdf here" Style="font-weight: 700; font-size: x-small; color: #000000"></asp:Label>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Doc-Date Required"
                                        ControlToValidate="txtdatedoc" ForeColor="Red" SetFocusOnError="True" class="font"
                                        Display="Dynamic">
                                    </asp:RequiredFieldValidator>

                                </td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="Check" class="btn select buttondocumentupload" ValidationGroup="search"
                                        Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="Button1_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" runat="server" align="center">
                                    <br />
                                    <asp:Label ID="Label27" runat="server" Text="" Font-Bold="true" ForeColor="Red" Font-Size="Medium"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto">
            <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div5">
            </div>--%>
            <div align="center" class=" col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server"
                id="div6" style="padding-left: 20px; padding-right: 20px;">
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="color: Black; font-weight: 700" class="font2">:: Documents ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <div style="text-align: center">
                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn gradbody" CausesValidation="False"
                                OnClick="btnprint_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px">
                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp;
                    <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                            <br />
                            <br />
                            <strong><span class="auto-style1">*Please Note, After the click on edit button, you 
                            need to upload a file again before updating.</span><span class="style1"> </span></strong>
                            <br />
                            <br />
                        </div>
                        <asp:GridView ID="grddoc" runat="server" DataKeyNames="Docid" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="25" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                            HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            EmptyDataText=".. No Record(s) Found.." ShowHeaderWhenEmpty="True" Width="95%"
                            OnRowCommand="grddoc_RowCommand" OnRowDeleted="grddoc_RowDeleted" OnRowDeleting="grddoc_RowDeleting"
                            OnRowEditing="grddoc_RowEditing" OnPageIndexChanging="grddoc_PageIndexChanging"
                            ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnRowDataBound="grddoc_RowDataBound" BorderColor="Black">
                            <alternatingrowstyle backcolor="White" />
                            <columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title/Subject" ItemStyle-Width="57%">
                                    <itemtemplate>
                                        <div style="padding: 10px">
                                            <asp:LinkButton ID="lnktitle" runat="server" ForeColor="Blue" CommandName="Download" Font-Underline="false"
                                                Text='<%#Eval("Doc_Title") %>' OnClientClick="return confirm('Your download activities will be logged. Do you still want to continue?');"
                                                class="font2" Font-Bold="True" CausesValidation="False" />
                                            <br />
                                            <asp:Label ID="lbluplon" runat="server" Text="Uploaded On" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />
                                            <br />
                                            <asp:Label ID="Label24" runat="server" Text="Doc-Category" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label25" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="Label26" Font-Italic="true" runat="server" Text='<%#Eval("Doc_Type") %>'
                                                Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lbldoctypeid" runat="server" Text='<%#Eval("Doc_Typeid") %>' Visible="false"
                                                Font-Size="Smaller" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
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
                                        <%--   <asp:Label ID="lbldoctypeid" runat="server" Text='<%#Eval("Doc_Typeid") %>' Visible="false"
                                                Font-Size="Small" />--%>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="13%">
                                    <itemtemplate>
                                        <asp:LinkButton ID="imgedit" CommandName="Edit" runat="server" CausesValidation="false"
                                            CssClass="btn btn-primary" ToolTip="Edit">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="Imgdelete" CommandName="Delete" runat="server" CausesValidation="false" Visible="false"
                                            CssClass="btn btn-danger" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete?');">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-trash"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                            </columns>
                            <emptydatarowstyle backcolor="#CCCCCC" font-bold="True" font-size="Small" forecolor="Black" height="32px" horizontalalign="Center" verticalalign="Middle" />
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
                </div>
            </div>
            <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div7">
            </div>--%>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
