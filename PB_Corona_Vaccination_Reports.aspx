<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PB_Corona_Vaccination_Reports.aspx.cs" Inherits="PrasarNet.PB_Corona_Vaccination_Reports" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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

        .gradnewbutton2 {
            background: linear-gradient(to right, #F99B62, #E67E22);
            -webkit-radial-gradient;
        }

        .gradcured {
            background-image: linear-gradient(-45deg, #A9F5D0, #81F7BE);
        }

        .gradtotal {
            background-image: linear-gradient(-45deg, #CEECF5, #58ACFA);
        }

        .graddeceased {
            background-image: linear-gradient(-45deg, #F7819F, #FE2E64);
        }

        .gradactive {
            background-image: linear-gradient(-45deg, #F6CECE, #FA5858);
        }

        .grad2 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .grad4 {
            background: radial-gradient(#F5CBA7, #E67E22);
            -webkit-radial-gradient;
        }

        .gradquote {
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
        }

        hr.new5 {
            /*border: 6px solid green;
            border-radius: 5px;*/
            border: 2px solid #5C5C5C;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 300px;
            border: 3px solid #0DA9D0;
        }

            .modalPopup .header {
                background-color: #2FBDF1;
                height: 30px;
                color: White;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .body {
                min-height: 50px;
                line-height: 30px;
                text-align: center;
                font-weight: bold;
            }

            .modalPopup .footer {
                padding: 3px;
            }

            .modalPopup .yes, .modalPopup .no {
                height: 23px;
                color: White;
                line-height: 23px;
                text-align: center;
                font-weight: bold;
                cursor: pointer;
            }

            .modalPopup .yes {
                background-color: #2FBDF1;
                border: 1px solid #0DA9D0;
            }

            .modalPopup .no {
                background-color: #9F9F9F;
                border: 1px solid #5C5C5C;
            }

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
            }

        .statusupdate {
            background-color: #ABEBC6;
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
        function openAction() {
            //            var Userid = "234";
            window.open("PBB_reports.aspx", "_self");
            //            window.open("myprofile.aspx?Id=" +"2"+"&Code=" + Userid ,"_self");

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

                    <asp:Label ID="Label12" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="(प्रसार नेट)"></asp:Label>

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
        <div id="guestmenu" visible="false" runat="server" class="sticky">
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
                        <li><a href="Logout.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-off"></span>&nbsp;LogOut</a></li>
                        <%-- <li><a href="Logout.aspx" id="lgout" style="color: #000000" runat="server">LogOut</a></li>--%>
                    </ul>
                </div>
            </nav>
        </div>
    </div>


    </span>

       
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
        <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto">
            <div id="Div2" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" OnClick="btnback_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"> <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-arrow-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <br />
        <div id="div3" style="text-align: left; padding-left: 25px; padding-bottom: 10px" runat="server" visible="true">
            <%-- <asp:LinkButton ID="lnkviewdet" ForeColor="Blue" Font-Underline="true" Font-Bold="true" Font-Size="Large" runat="server" OnClick="lnkviewdet_Click" >View Details</asp:LinkButton>
            --%>
            <asp:LinkButton ID="LinkButton1" ForeColor="Blue" Font-Underline="true" Font-Bold="true" Font-Size="Large" runat="server" Text="View Details" OnClick="LinkButton1_Click1"></asp:LinkButton>
        </div>
        <br />

        <div id="divgrdstats" runat="server" visible="true" class="row" style="margin: auto">

            <div align="center" class=" col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server"
                id="div6" style="padding-left: 20px; padding-right: 20px;">
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="color: Black; font-weight: 700" class="font2">:: Vaccination Analysis inside the Prasar Bharati ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <div id="divprisearch" style="text-align: center; padding: 10px; margin: auto" runat="server" visible="true" class="row">
                            <div class="col-lg-2 col-md-2"></div>
                            <div class="col-lg-2 col-md-2"></div>
                            <div class="col-lg-2 col-md-2" style="padding: 7px">
                                <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                    Width="160px" BackColor="#F5B7B1" OnClick="btnprint1_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"> <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-print"></span><span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                            </div>
                            <div class="col-lg-2 col-md-2" style="padding: 7px">
                                <asp:LinkButton ID="btnexporttoexcel" runat="server" CssClass="btn" CausesValidation="False"
                                    Width="160px" BackColor="LightGreen" OnClick="btnexporttoexcel_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"> <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-export"></span><span style="font-weight: bold; color: #000000">Export to Excel</span></asp:LinkButton>
                            </div>
                            <div class="col-lg-2 col-md-2"></div>
                            <div class="col-lg-2 col-md-2"></div>
                        </div>
                        <br />
                        <asp:Panel ID="panelprint" runat="server">
                            <div id="divmsg" runat="server" visible="false" align="center">
                                <asp:Label ID="lblmsg" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                            </div>

                            <asp:GridView ID="grddoc" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                AllowPaging="false" PageSize="8" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                EmptyDataText=".. No Record(s) Found.." ShowHeaderWhenEmpty="True" Width="95%"
                                ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" BorderColor="Black" OnRowDataBound="grddoc_RowDataBound">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No.">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' class="font2" />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type Of Employee">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="Label39" Font-Bold="true" runat="server" Text='<%#Eval("TypeofEmp") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>

                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Age-Group">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="Label3" Font-Bold="true" runat="server" Text='<%#Eval("age") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">
                                                <div style="padding-top: 23px; padding-bottom: 10px">
                                                    <asp:Label ID="lbltot_r" Font-Bold="true" runat="server" Text="Total Regular" Font-Size="Small" ForeColor="Brown"
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 7px">
                                                    <asp:Label ID="lbltot_c" Font-Bold="true" runat="server" Text="Total Contractual" Font-Size="Small" ForeColor="Brown"
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">
                                                    <asp:Label ID="lbltot" Font-Bold="true" runat="server" Text="Total (Reg + Con)" Font-Size="Small" ForeColor="Brown"
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total No active Employee as on today">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lbltotal" Font-Bold="true" runat="server" Text='<%#Eval("Active_employee") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">
                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <%--<asp:Label ID="lbltot_r" Font-Bold="true" runat="server" Text="Total Regular" Font-Size="Small" ForeColor="Brown"
                                                    class="font2" />--%>
                                                    <asp:Label ID="lbltotemp_r" Font-Bold="true" runat="server" Text="Total"
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lbltotemp_c" Font-Bold="true" runat="server" Text="Total"
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">
                                                    <asp:Label ID="lbltotemp" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Total No of Employee Taken Vaccination">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblempvaccination" Font-Bold="true" runat="server" Text='<%#Eval("TakenVac") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">
                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lblvac_r" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lblvac_c" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">

                                                    <asp:Label ID="lblvac" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total No of Non-Vaccinated Employees" Visible="true">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblempnonvaccination" Font-Bold="true" runat="server" Text='<%#Eval("NV") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">

                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lbltotnonvac_r" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lbltotnonvac_c" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">

                                                    <asp:Label ID="lbltotnonvac" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No of Employees taken CoVaxin">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblcovaxin" Font-Bold="true" runat="server" Text='<%#Eval("Covaxin") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">
                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lbltotcovaxin_r" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lbltotcovaxin_c" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">

                                                    <asp:Label ID="lbltotcovaxin" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No of Employees taken Covisheild">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblcovisheild" Font-Bold="true" runat="server" Text='<%#Eval("Covishield") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">
                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lbltotcovsheild_r" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lbltotcovsheild_c" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">
                                                    <asp:Label ID="lbltotcovsheild" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No of Employee taken Sputnik">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblsputnik" Font-Bold="true" runat="server" Text='<%#Eval("Sputnik") %>'
                                                    class="font2" />

                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">
                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lblsputnik_r" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lblsputnik_c" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">
                                                    <asp:Label ID="lbltotsputnik" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No of Employee taken Other Vaccine">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblother" Font-Bold="true" runat="server" Text='<%#Eval("Other") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">
                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lbltototh_r" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lbltototh_c" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">
                                                    <asp:Label ID="lbltototh" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No of Employee taken Ist Dose">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblvaccinationist" Font-Bold="true" runat="server" Text='<%#Eval("vaccination1_Done") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">
                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lbltotvac1_r" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lbltotvac1_c" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">
                                                    <asp:Label ID="lbltotvac1" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No of Employee taken IInd Dose">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblvaccination2" Font-Bold="true" runat="server" Text='<%#Eval("vaccination2_Done") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">

                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lbltotvac2_r" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lbltotvac2_c" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">
                                                    <asp:Label ID="lbltotvac2" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="% of Employee taken Ist Dose">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblpercentIstdose" ForeColor="Blue" Font-Bold="true" runat="server" Text='<%#Eval("Istper") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">

                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lblper_istr" ForeColor="Blue" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lblper_istc" ForeColor="Blue" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">
                                                    <asp:Label ID="lblperistT" ForeColor="Blue" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="% of Employee taken Both Ist & IInd Dose">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblpercentIIdose" ForeColor="OrangeRed" Font-Bold="true" runat="server" Text='<%#Eval("IIndper") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">

                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lblper_iir" ForeColor="OrangeRed" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lblper_iic" ForeColor="OrangeRed" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">
                                                    <asp:Label ID="lblperiiT" ForeColor="OrangeRed" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="% of Employee Updated Info">
                                        <ItemTemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblpercent" ForeColor="Red" Font-Bold="true" runat="server" Text='<%#Eval("per") %>'
                                                    class="font2" />
                                            </div>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <div style="padding: 10px" align="center">

                                                <div style="padding-top: 21px; padding-bottom: 10px">
                                                    <asp:Label ID="lblper_r" ForeColor="Red" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 21px; padding-bottom: 7px">
                                                    <asp:Label ID="lblper_c" ForeColor="Red" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>
                                                <hr class="new5" />
                                                <div style="padding-top: 10px; padding-bottom: 20px">
                                                    <asp:Label ID="lblperT" ForeColor="Red" Font-Bold="true" runat="server" Text=""
                                                        class="font2" />
                                                </div>

                                            </div>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>


                                </Columns>
                                <EmptyDataRowStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="Small" ForeColor="Black" Height="32px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" CssClass="centerHeaderText font2"
                                    Wrap="True"></HeaderStyle>
                                <FooterStyle BackColor="#CCFFCC" HorizontalAlign="Center" VerticalAlign="Middle"
                                    Font-Bold="True" Height="35px"></FooterStyle>
                                <RowStyle BackColor="#EFF3FB" Font-Bold="True" Height="30px" HorizontalAlign="Center"
                                    VerticalAlign="Middle" />
                                <PagerSettings Position="TopAndBottom" />
                                <PagerStyle BackColor="#E67E22" CssClass="cssPager pag" ForeColor="White" Font-Size="Small"
                                    HorizontalAlign="Left" VerticalAlign="Middle" Font-Bold="True" BorderColor="Black"
                                    BorderWidth="2" />
                            </asp:GridView>
                        </asp:Panel>
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
    </div>

</asp:Content>
