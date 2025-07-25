<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PBHSManageApp.aspx.cs" Inherits="PrasarNet.ManageSoft_Module.PBHSManageApp" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--link of style sheet--%>
    <link rel="stylesheet" href="../style/responsive.css" type="text/css" media="screen" />
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js"></script>
    <style type="text/css">
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

        #main {
            transition: margin-left .5s;
            padding: 16px;
        }

        .tablecus2 {
            background: linear-gradient(to right, #F2F3F4, #E5E8E8);
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=40);
            opacity: 0.4;
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

        .trnew {
            border-bottom: 2px ridge #F2F3F4;
            border-top: 2px ridge #F2F3F4;
            border-left: 2px ridge Black;
            border-right: 2px ridge #F2F3F4;
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

        .cancel {
            color: Red;
            font-weight: bold;
        }

        .inprocess {
            color: Green;
            font-weight: bold;
        }

        .pending {
            color: Blue;
            font-weight: bold;
        }

        fieldset > legend {
            height: 33px;
            position: relative;
            margin-top: -10px;
            background: #feb236;
            padding-top: 5px;
            padding-left: 5px;
            color: black;
            width: 98%;
            margin-left: 4px;
            margin-right: 4px;
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

        })(jQuery);

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
        <div id="empmenu" visible="true" runat="server" class="sticky">
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
                        <li><a href="../DashBoardNew.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
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

                                <li><a href="../OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                <li><a href="../Policies.aspx"><span style="color: #000000">Policies</span></a></li>

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
                        <li><a href="../utilityDownload.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>
                            &nbsp;Miscellaneous<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="../RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                <%--  <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>--%>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="../myprofile.aspx"><span style="color: #000000">My Profile</span></a></li>
                                <li><a href="../ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="../Logout.aspx" id="lgout" style="color: #000000" runat="server">LogOut</a></li>
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
                        <li><a href="../DashBoardNew.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>


                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                            &nbsp;Documents <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">

                                <li><a href="../OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                <li><a href="../Policies.aspx"><span style="color: #000000">Policies</span></a></li>

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
                                    <li><a href="../RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                    <li id="divlandrecords" runat="server" visible="false"><a href="../LandRecordEntry.aspx"><span style="color: #000000">Land Records</span></a></li>

                                    <li id="divboardmeetingreport" runat="server" visible="false"><a href="../LandRecordEntry.aspx"><span style="color: #000000">Meeting Records</span></a></li>
                                    <li id="divresourcebooking" runat="server" visible="false"><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>
                                </ul>
                            </ul>
                        </li>
                        <li><a href="utilityDownload.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>
                            &nbsp;Upload <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="../DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                <%--<li><a href="#"><span style="color: #000000">Policies</span></a></li>--%>
                                <%--<li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                                <li><a href="../PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>
                                <li id="divboradmeetingrecordsUpload" runat="server" visible="false"><a href="../DocumentUpload_pbb.aspx"><span style="color: #000000">Upload Meeting Records</span></a></li>
                            </ul>
                        </li>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-book"></span>
                            &nbsp;Statements <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li id="divmonthlystationreports" runat="server" visible="false"><a href="../PNET_Reports/HPTEntry.aspx"><span style="color: #000000">Monthly Station Reports</span></a></li>
                                <li id="divmonthlystationreportsforadg" runat="server" visible="false"><a href="../PNET_Reports/MRAdmin/HPTEntry.aspx"><span style="color: #000000">Monthly Station Reports</span></a></li>
                                <li id="divRR" runat="server" visible="true"><a href="../R_Roster/RREntry.aspx"><span style="color: #000000">Reservation Roster</span></a></li>
                                <%--<li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                            </ul>
                        </li>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="../myprofile.aspx"><span style="color: #000000">My Profile</span></a></li>
                                <li><a href="../ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="../Logout.aspx" id="A1" runat="server">LogOut</a></li>
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
                        <li><a href="../DashBoardNew.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
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

                                <li><a href="../OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                <li><a href="../Policies.aspx"><span style="color: #000000">Policies</span></a></li>

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
                                    <li><a href="../RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                    <li id="divmeetingrecordadmin" runat="server" visible="false"><a href="../PBB_reports.aspx"><span style="color: #000000">Meeting Records</span></a></li>

                                    <%-- <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>--%>
                                </ul>
                            </ul>
                        </li>
                        <li><a href="../utilityDownload.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                        <li id="divuploadadmin" runat="server" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>
                            &nbsp;Upload <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="../DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                <%--<li><a href="#"><span style="color: #000000">Policies</span></a></li>--%>
                                <%-- <li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                                <li><a href="../PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>
                                <%--<li><a href="AdminCalender.aspx"><span style="color: #000000">Calender</span></a></li>   --%>
                            </ul>
                        </li>
                        <li runat="server" id="divstatementsmanagement" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-book"></span>
                            &nbsp;Statements <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li id="divRRReports_UM" runat="server" visible="false"><a href="../R_Roster/RR_Reports.aspx"><span style="color: #000000">Reservation Roster</span></a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <%-- <li><a href="#"><span style="color: #000000">My Profile</span></a></li>--%>
                                <li><a href="../ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="../Logout.aspx" id="A2" runat="server">LogOut</a></li>
                                <%--  <li><a href="#" runat="server" onserverclick="logoutadmin_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                        </li>
                    </ul>
                </div>
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
                        <li><a href="../DashBoardNew.aspx" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
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

                                <li><a href="../OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                <li><a href="../Policies.aspx"><span style="color: #000000">Policies</span></a></li>

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
                                    <li><a href="../RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                    <%--  <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li> --%>
                                </ul>
                            </ul>
                        </li>
                        <li><a href="utilityDownload.aspx" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-download-alt"></span>
                            &nbsp;Downloads</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>&nbsp;Upload <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <ul class="nav nav-list">
                                    <li><a href="../DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                    <li><a href="../PoliciesUpload.aspx"><span style="color: #000000">Policies</span></a></li>
                                    <li><a href="../UtilityUpload.aspx"><span style="color: #000000">Utilities</span></a></li>
                                    <li><a href="../TrainingMaterial.aspx"><span style="color: #000000">Training Material</span></a></li>
                                    <li><a href="../PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>
                                    <li><a href="../AdminCalender.aspx"><span style="color: #000000">Calender</span></a></li>
                                </ul>
                            </ul>
                        </li>
                        <%--   <li><a href="ChangePassword.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Change Password</a></li>--%>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>&nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="../myprofile.aspx"><span style="color: #000000">My Profile</span></a></li>
                                <li><a href="../ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="../Logout.aspx" id="A3" runat="server">LogOut</a></li>
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
        <div class="row" style="margin: auto; padding: 10px">
            <div id="Div1" class="col-md-12 col-sm-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnhome" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" OnClick="btnhome_Click">
                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-menu-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
            </div>
            &nbsp;
        </div>
        <div class="row" style="margin: auto; padding: 10px; background-color: #66CCFF;">
            <div id="Div15" class="col-md-12 col-sm-12 col-lg-12" runat="server" align="center">

                <asp:Label ID="Label16" runat="server" Text="::PBHS User's Application Management::" style="font-weight: 700; font-size: x-large; color: #000000"></asp:Label>
                <br />
            </div>
        </div>
        <div class="row" style="margin: auto; padding: 10px">
            <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
            <div id="divfilter" visible="true" align="center" class=" col-md-12 col-sm-12 col-lg-12"
                runat="server">
                <div id="divfilterrec" style="text-align: left; padding: 10px" runat="server" visible="true">

                    <fieldset id="Fieldset1" runat="server" style="border: medium ridge #808080;">
                        <legend>Filter Record(s):</legend>



                        <div class="row" style="margin: auto; padding-left: 20px; padding-right: 20px; padding-bottom: 10px">


                            <div id="div12" visible="true" style="padding: 4px;" align="center" class="col-md-4 col-lg-4"
                                runat="server">
                                <asp:Label ID="Label18" runat="server" Text="Application No" CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtappno" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" Width="90%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off"></asp:TextBox>

                            </div>
                            <div id="div5" visible="true" style="padding: 4px;" align="center" class="col-md-4 col-lg-4"
                                runat="server">
                                <asp:Label ID="Label3" runat="server" Text="Application Active/InActive" CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlappstatus" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px">
                                    <asp:ListItem Value="" Text="All"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                                    <asp:ListItem Value="0" Text="In-Active"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div id="div13" visible="true" style="padding: 4px;" align="center" class="col-md-4 col-lg-4"
                                runat="server">
                                <asp:Label ID="Label8" runat="server" Text="Applicant's Name " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                <br />
                                <asp:TextBox ID="txtnameapplicant" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" Width="90%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off"></asp:TextBox>

                            </div>
                        </div>

                        <div class="row" style="margin: auto; padding-left: 20px; padding-right: 20px; padding-bottom: 10px">
                            <div id="div27" visible="true" style="padding: 4px;" align="center" class=" col-md-12 col-lg-12"
                                runat="server">
                                <asp:Button ID="btnfilter" runat="server" Style="font-size: Medium; font-weight: bolder; background-color: #b5e7a0; color: black; padding: 0.5vw; border-radius: 5px;" Text=" Filter " Visible="true" Width="200px" OnClick="btnfilter_Click" />

                            </div>
                        </div>
                    </fieldset>

                </div>
            </div>
        </div>
        <br />
        <div id="divgrdreports" runat="server" visible="false">
            <br />
            <br />
            <div id="divgrd" runat="server" visible="false">
                <div class="row" runat="server" align="center" style="margin: auto; padding-top: 7px; padding-bottom: 7px; padding-right: 0px; padding-left: 0px; align-items: center">
                    <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1" style="padding: 7px; margin: 3px"></div>--%>
                    <div align="center" class=" col-md-12 col-sm-12 col-lg-12" style="padding: 7px; margin: 3px">
                        <div class="panel panel-primary">
                            <div class="panel-heading grad3" align="center">
                                <span style="font-weight: bold; color: Black;" class="font2">:: PBHS Recieved Application with their Status ::</span>
                            </div>
                            <div class="panel-body grad2 table-responsive">
                                <div id="divprisearch" style="text-align: center" runat="server" visible="true">
                                    <table width="100%">
                                        <tr>
                                            <td align="center" style="padding: 10px">
                                                <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="200px"
                                                    BackColor="#F5B7B1" OnClick="btnprint1_Click">
                                                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                                    <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                            </td>
                                        </tr>


                                    </table>

                                </div>
                                <%-- <asp:Panel ID="pnlprint" runat="server">--%>
                                <div runat="server" id="pnlprint">
                                    <div id="divmsg" runat="server" visible="true" align="center">
                                        <asp:Label ID="lblmsgprint" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                    </div>
                                    <div id="div36" style="text-align: center; padding: 10px; margin: auto" runat="server" visible="true" class="row">
                                        <div class="col-lg-4 col-md-4"></div>
                                        <div class="col-lg-4 col-md-4" style="padding: 7px" align="center">
                                            <asp:Label ID="Label5" runat="server" Text="Record(s) Found:" ForeColor="Black" class="font2"
                                                Style="font-weight: bold;"></asp:Label>
                                            &nbsp;
                                        <asp:Label ID="lblrecordsfound" runat="server" Text="" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>
                                            &nbsp;
                                        </div>
                                        <div class="col-lg-4 col-md-4" style="padding: 7px">
                                            <%--<asp:Label ID="Label8" runat="server" Text="Filter Criterion:" ForeColor="Black" class="font2"
                                                    Style="font-weight: bold;"></asp:Label>
                                                &nbsp;
                                        <asp:Label ID="lblfiltercriterion" runat="server" Text="" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>--%>
                                                &nbsp;
                                        </div>

                                    </div>
                                    <asp:GridView ID="grdapplications" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" BackColor="#F8F9F9"
                                        DataKeyNames="id" ShowHeaderWhenEmpty="True" ToolTip="PBHS Application(s) Recieved" AllowPaging="true"
                                        Width="98%" OnPageIndexChanging="grdapplications_PageIndexChanging" OnRowCommand="grdapplications_RowCommand" OnRowCancelingEdit="grdapplications_RowCancelingEdit" OnRowEditing="grdapplications_RowEditing" OnRowUpdating="grdapplications_RowUpdating">
                                        <headerstyle backcolor="#0099FF" font-bold="True" forecolor="Black" horizontalalign="Center" />
                                        <columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <itemtemplate>
                                                    <div runat="server" align="center">

                                                        <asp:Label ID="lblSNo" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                        <%--<asp:Label ID="lblserialno" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Eval("serialno") %>' Visible="false" />
                                                        <asp:Label ID="lblcertify" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Eval("isapproved") %>' Visible="false" />--%>
                                                    </div>

                                                </itemtemplate>

                                                <%-- <ItemStyle Width="7%"></ItemStyle>--%>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Application No">
                                                <itemtemplate>
                                                    <div runat="server" align="left" style="padding-top: 15px; padding-bottom: 15px; padding-left: 15px; padding-right: 15px">

                                                        <asp:Label ID="Label52" Font-Bold="true" ForeColor="Brown" runat="server" Font-Size="Small" Text="Application No : " class="fontingrid" />
                                                        <asp:Label ID="lblappNo" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Eval("ApplicationNo") %>' />
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="Label49" Font-Bold="true" ForeColor="Brown" runat="server" Font-Size="Small" Text="Submitted On : " class="fontingrid" />
                                                        <asp:Label ID="Label50" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("createdon") %>' Font-Size="Small" class="fontingrid" />

                                                    </div>

                                                </itemtemplate>

                                                <%-- <ItemStyle Width="7%"></ItemStyle>--%>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Applicant Details">
                                                <itemtemplate>
                                                    <div style="padding: 15px" runat="server" align="left">
                                                        <asp:Label ID="lblop_1" Font-Bold="true" ForeColor="Brown" runat="server" Text="Name : " class="fontingrid" Font-Size="Small" />
                                                        <asp:Label ID="lblop1" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Name_emp") %>' Font-Size="Small" />
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="lblop_2" Font-Bold="true" ForeColor="Brown" runat="server" Text="Designation : " class="fontingrid" Font-Size="Small" />
                                                        <asp:Label ID="lblop2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Emp_Designation") %>' Font-Size="Small" />
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="lblop_3" Font-Bold="true" ForeColor="Brown" runat="server" Text="Station/Office : " class="fontingrid" Font-Size="Small" />
                                                        <asp:Label ID="lblop3" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("emp_present_place") %>' Font-Size="Small" />
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="Label13" Font-Bold="true" ForeColor="Brown" runat="server" Text="E-Mail : " class="fontingrid" Font-Size="Small" />
                                                        <asp:Label ID="Label18ee" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("emp_Email") %>' Font-Size="Small" />
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="Label19" Font-Bold="true" ForeColor="Brown" runat="server" Text="Contact No : " class="fontingrid" Font-Size="Small" />
                                                        <asp:Label ID="Label21" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("emp_contactno") %>' Font-Size="Small" />
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="Label4" Font-Bold="true" ForeColor="Brown" runat="server" Text="Forwarded to : " class="fontingrid" Font-Size="Small" />
                                                        <asp:Label ID="Label7" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("forwardedto") %>' Font-Size="Small" />


                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Approved/Issued Status">
                                                <itemtemplate>
                                                    <div runat="server" align="left" style="padding: 15px">

                                                        <asp:Label ID="Label22" Font-Size="Small" runat="server" ForeColor="brown" Text='Application Approved Status: ' />
                                                        <asp:Label ID="Label25" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Eval("approvedby") %>' />
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="Label11" Font-Size="Small" runat="server" ForeColor="brown" Text='Application Approved On: ' />
                                                        <asp:Label ID="Label12" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Eval("approvedon") %>' />
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="Label17" Font-Size="Small" runat="server" ForeColor="brown" Text='Final Decision: ' />
                                                        <asp:Label ID="Label1f8" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Eval("Cardissued") %>' />


                                                    </div>

                                                </itemtemplate>

                                                <%-- <ItemStyle Width="7%"></ItemStyle>--%>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Final Status">
                                                <itemtemplate>
                                                    <%-- <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server"
                                            Font-Size="Smaller" class="btn btn-info" Width="80px"></asp:LinkButton>--%>
                                                    <div style="padding: 15px" align="center" runat="server">
                                                        <asp:Label ID="lnkstatus" runat="server" Enabled="false" CssClass="btn font2" ForeColor="Black" Font-Bold="true"
                                                            CausesValidation="False" Text='<%#Eval("Status") %>' ToolTip="Final Status"></asp:Label>

                                                        <asp:Label ID="lblbasicid" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblemployeeid" runat="server" Text='<%#Eval("Employeeid") %>' Visible="false"></asp:Label>
                                                        <%--<asp:Label ID="lblfinalsubmitid" runat="server" Text='<%#Eval("finalstatusid") %>' Visible="false"></asp:Label>
                                                        <asp:Label ID="lblstatusid" runat="server" Text='<%#Eval("currenstatusid") %>' Visible="false"></asp:Label>--%>
                                                        <br />
                                                        <br />
                                                        <asp:LinkButton ID="lnktrack" CommandName="Trackinfo" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue" Font-Bold="true" Font-Size="Small"
                                                            CausesValidation="False" Text="Track Application">
                                                        </asp:LinkButton>
                                                        <br />
                                                        <br />
                                                        <asp:LinkButton ID="lnkviewapplication" CommandName="GetaPdf" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue" Font-Bold="true" Font-Size="Small"
                                                            CausesValidation="False" Text="View/Print Application">
                                                        </asp:LinkButton>

                                                    </div>
                                                </itemtemplate>

                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Application Active/In-Active">
                                                <itemtemplate>
                                                    <div align="center">
                                                        <asp:Label ID="lblst" runat="server" ForeColor="Black" Font-Bold="True" Text='<%#Eval("status_active") %>' Font-Size="Smaller" />
                                                        <asp:CheckBox ID="chkstatus" runat="server" Visible="false" Font-Bold="True" ForeColor="Black" Checked='<%#Eval("status_active") %>' Text="Check for Activating the User." />
                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Edit Active or InActive Status">
                                                <itemtemplate>
                                                    <div align="center">
                                                        <asp:ImageButton ID="imgedit" runat="server" Width="25px" Height="25px" CommandName="active_Inactive" class="img-responsive" ImageUrl="~/images/Edit.png" ToolTip="Activate/De-Activate the User's Application" alt="Active/Inactive" />

                                                        <asp:ImageButton ID="imgupdate" runat="server" Width="25px" Height="25px" class="img-responsive" CommandName="update" alt="Update" ToolTip="Update" ImageUrl="~/images/update.jpg" Visible="false" OnClientClick="return confirm('Are you sure to Update?')" />
                                                        <asp:ImageButton ID="imgcancel" runat="server" Width="25px" Height="25px" class="img-responsive" CommandName="cancel" alt="Cancel" ToolTip="Cancel" ImageUrl="~/images/cancel.png" Visible="false" />
                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>

                                        </columns>
                                        <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                            wrap="True" font-size="Small" verticalalign="Middle" horizontalalign="Center"></headerstyle>
                                        <rowstyle backcolor="White" font-bold="True" height="30px" horizontalalign="Center"
                                            verticalalign="Middle" />
                                        <pagersettings position="TopAndBottom" />
                                        <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                            horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                            borderwidth="2" />
                                    </asp:GridView>
                                </div>
                                <asp:LinkButton Text="" ID="lnkfaketrack" runat="server" />
                                <asp:LinkButton Text="" ID="lnkfake" runat="server" />
                                <ajaxtoolkit:modalpopupextender id="mpe1" runat="server" popupcontrolid="pnlPopupview" targetcontrolid="lnkfake"
                                    backgroundcssclass="modalBackground" cancelcontrolid="Button3">
                                </ajaxtoolkit:modalpopupextender>
                                <asp:Panel ID="pnlPopupview" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 95%;" Width="80%">
                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                        <triggers>
                                            <asp:PostBackTrigger ControlID="Button9" />
                                            <asp:PostBackTrigger ControlID="grdupload" />
                                            <asp:PostBackTrigger ControlID="grdhealth" />
                                            <%--<asp:PostBackTrigger ControlID="grdexpprev" />
                                <asp:PostBackTrigger ControlID="grdcerprev" />--%>
                                        </triggers>
                                        <contenttemplate>
                                            <div class="row" style="margin: auto; padding: 20px" runat="server" id="div2">
                                                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                                                <div align="center" class=" col-lg-12 col-md-12" runat="server" id="div14">
                                                    <div class="panel-heading gradheaderround">
                                                        <span style="font-size: large; font-weight: bold; color: Black;">:: View/Print Application ::</span>
                                                    </div>
                                                    <div id="Div3" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-top: 10px; margin-bottom: 100px">
                                                        <table>
                                                            <tr>
                                                                <td runat="server" align="right" style="padding-right: 30px" width="30%">
                                                                    <asp:Button ID="Button9" OnClick="Button9_Click" runat="server" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Text="Print" Width="160px" />
                                                                    &nbsp;

                                                                </td>
                                                                <td runat="server" align="left" style="padding-right: 30px" width="30%">
                                                                    <asp:Button ID="Button3" runat="server" Text="X Close" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="160px" />
                                                                </td>
                                                            </tr>

                                                        </table>

                                                        <div class="table table-bordered tablecus2" runat="server" style="width: 97%; padding: 10px">
                                                            <asp:Panel ID="panelprint" runat="server">
                                                                <div id="divmsg3" runat="server" visible="false" align="center">
                                                                    <asp:Label ID="lblmsg3" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                                                </div>
                                                                <br />
                                                                <table id="per" class="table table-bordered tablecus2">
                                                                    <tr runat="server" visible="true">
                                                                        <td align="center" runat="server" width="10%" class="auto-style1">
                                                                            <asp:Label ID="Label23" CssClass="font2" runat="server" Text="1." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%" class="auto-style1">
                                                                            <asp:Label ID="lbln" CssClass="font2" runat="server" Text="Name" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style1">
                                                                            <asp:Label ID="lblname_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label24" CssClass="font2" runat="server" Text="2." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="lbld2" CssClass="font2" runat="server" Text="Office/Department" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                                            <asp:Label ID="lbldeptt_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                        </td>


                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label29" CssClass="font2" runat="server" Text="3." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="lbld" CssClass="font2" runat="server" Text="Designation" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                                            <asp:Label ID="lbldesgn_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                        </td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label30" CssClass="font2" runat="server" Text="4." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="Label31" CssClass="font2" runat="server" Text="Contact No" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                                            <asp:Label ID="lblcontact_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                        </td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label32" CssClass="font2" runat="server" Text="5." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="Label33" CssClass="font2" runat="server" Text="E-Mail" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                                            <asp:Label ID="lblemail_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                        </td>

                                                                    </tr>

                                                                    <tr>
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label128" CssClass="font2" runat="server" Text="6." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="Label129" CssClass="font2" runat="server" Text="Date of Super-Annuation" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                                            <asp:Label ID="lbldate_superannu_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                        </td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label97" CssClass="font2" runat="server" Text="7." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="Label98" CssClass="font2" runat="server" Text="Would you like to renew your card?" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                                            <asp:Label ID="lblrenew_bas" CssClass="font2" Visible="true" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                            <br />
                                                                            <asp:Label ID="Label4w" CssClass="font2" Font-Bold="true" ForeColor="Brown" runat="server" Text="Old Card No(If Applicable): "></asp:Label>

                                                                            <asp:Label ID="lblrenew_no" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>

                                                                    </tr>
                                                                    <tr runat="server" visible="false">
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label34" CssClass="font2" runat="server" Text="8." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="Label35" CssClass="font2" runat="server" Text="Gazetted/Non-Gazetted" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                                            <asp:Label ID="lblgazetted" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label90" CssClass="font2" runat="server" Text="9." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="Label91" CssClass="font2" runat="server" Text="Basic Pay" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                                            <asp:Label ID="lblbasiclbl" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="lbl10" CssClass="font2" runat="server" Text="10." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="lbl10_1" CssClass="font2" runat="server" Text="Level in Pay Matrix" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                                            <asp:Label ID="lbllevelLBL" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label36" CssClass="font2" runat="server" Text="11." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="Label11_1" runat="server" Text="Official Address(max 300 Characters are allowed)" class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">

                                                                            <asp:Label ID="lblOfficialAdd" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label37" CssClass="font2" runat="server" Text="12." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="Label12_1" runat="server" Text="Residential Address(max 300 Characters are allowed)" class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">

                                                                            <asp:Label ID="lblresAdd_Lbl" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>
                                                                    </tr>

                                                                    <tr runat="server" visible="true">
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="Label13D" CssClass="font2" runat="server" Text="12.1." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="Label13_1" CssClass="font2" runat="server" Text="Are You on Deputation" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                                            <asp:Label ID="lblOnDep" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>
                                                                    </tr>
                                                                    <tr runat="server" visible="true">
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="lbl13_2" CssClass="font2" runat="server" Text="12.2." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="lbl13_2_1" CssClass="font2" runat="server" Text="If yes, likely completion of Deputation On" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                                            <asp:Label ID="lbldep_LBL" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>
                                                                    </tr>
                                                                    <tr runat="server" visible="true">
                                                                        <td align="center" runat="server" width="10%">
                                                                            <asp:Label ID="lbltransferable" CssClass="font2" runat="server" Text="13." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                            <asp:Label ID="lbl14_t" CssClass="font2" runat="server" Text="Are Your Services are transferrable" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                                            <asp:Label ID="lbltransfer_lbl" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>
                                                                    </tr>

                                                                </table>
                                                                <br />
                                                                <br />
                                                                <div class="panel-heading gradheaderround">
                                                                    <span style="font-size: large; font-weight: bold; color: Black;">:: Application Forwarded To ::</span>
                                                                </div>
                                                                <table id="tblfwdto" class="table table-bordered tablecus2">
                                                                    <tr runat="server" visible="true">
                                                                        <td align="center" runat="server" width="10%" class="auto-style1">
                                                                            <asp:Label ID="Label38" CssClass="font2" runat="server" Text="14." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="right" runat="server" style="padding-right: 30px" width="30%" class="auto-style1">
                                                                            <asp:Label ID="Label39" CssClass="font2" runat="server" Text="Application Marked to/ Forwarded To" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                                            <asp:Label ID="lblapplforwared_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <div class="panel-heading gradheaderround">
                                                                    <span style="font-size: large; font-weight: bold; color: Black;">15. Dependent/Family Details</span>
                                                                </div>
                                                                <br />
                                                                <br />
                                                                <asp:GridView ID="grdhealth" DataKeyNames="id" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                                                    CssClass="Gridview" ShowFooter="false" HeaderStyle-Font-Bold="true"
                                                                    PageSize="20" AllowPaging="true" HeaderStyle-ForeColor="White" Width="99%" ToolTip="Dependent Details" OnRowCommand="grdhealth_RowCommand">
                                                                    <alternatingrowstyle horizontalalign="Center" verticalalign="Middle" />

                                                                    <columns>

                                                                        <asp:TemplateField HeaderText="S.No.">
                                                                            <itemtemplate>
                                                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                                                    <asp:Label ID="lblrowid" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                                                                </div>
                                                                            </itemtemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Name of Family Member">

                                                                            <itemtemplate>
                                                                                <div style="padding: 6px" align="left">
                                                                                    <asp:Label ID="Label40" runat="server" Text="Name: " CssClass="fontingrid" ForeColor="Brown" Font-Bold="true" />
                                                                                    <asp:Label ID="lblhcName" runat="server" Text='<%#Eval("NameofMember") %>' CssClass="fontingrid" />
                                                                                    <br />
                                                                                    <br />
                                                                                    <asp:Label ID="Label41" runat="server" Text="Beneficiary Id: " CssClass="fontingrid" ForeColor="Brown" Font-Bold="true" />
                                                                                    <asp:Label ID="Label42" runat="server" Text='<%#Eval("BeneficiaryID") %>' CssClass="fontingrid" />

                                                                                </div>
                                                                            </itemtemplate>

                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Relationship">

                                                                            <itemtemplate>
                                                                                <div style="padding: 6px" align="center">
                                                                                    <asp:Label ID="lblrelation" runat="server" Text='<%#Eval("RelationShip") %>' CssClass="fontingrid" />
                                                                                </div>
                                                                            </itemtemplate>

                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="DOB">

                                                                            <itemtemplate>
                                                                                <asp:Label ID="lbldob" runat="server" Text='<%#Eval("DOB", "{0:dd-MMM-yyyy}") %>' CssClass="fontingrid" />
                                                                            </itemtemplate>

                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Blood Group">

                                                                            <itemtemplate>
                                                                                <div style="padding: 6px" align="center">
                                                                                    <asp:Label ID="lblbloodgroup" runat="server" Text='<%#Eval("BloodGrp") %>' CssClass="fontingrid" />
                                                                                </div>
                                                                            </itemtemplate>

                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Upload a Adhaar Card/Child Birth certificate">

                                                                            <itemtemplate>
                                                                                <div style="padding: 6px" align="left">
                                                                                    <%--<asp:Label ID="Label61d" runat="server" Text="Residing With Applicant: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                                    <br />
                                                                    <asp:Label ID="lblreswithapp" runat="server" Text='<%#Eval("residingwithApplicant") %>' CssClass="fontingrid" />
                                                                    <br />
                                                                    <br />--%>
                                                                                    <asp:ImageButton ID="imgresiding" CommandName="downloadresiding" runat="server" Height="35" Width="35" ToolTip="Download" ImageUrl="~/images/pdficon.png" />


                                                                                </div>
                                                                            </itemtemplate>

                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Photo">

                                                                            <itemtemplate>
                                                                                <div align="center" style="padding-top: 5px; padding-bottom: 5px">
                                                                                    <asp:Image ID="imgDownloadPH" runat="server" Height="100" Width="76" ToolTip="Photo" ImageUrl='<%#Eval("photo_Filename") %>' />
                                                                                    <br />
                                                                                </div>
                                                                            </itemtemplate>

                                                                        </asp:TemplateField>

                                                                    </columns>
                                                                    <editrowstyle horizontalalign="Center" verticalalign="Middle" />
                                                                    <footerstyle backcolor="#FBEDC4" horizontalalign="Center" verticalalign="Middle"
                                                                        font-bold="True" height="35px"></footerstyle>
                                                                    <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                                                        wrap="True"></headerstyle>
                                                                    <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                                                        verticalalign="Middle" />
                                                                    <pagersettings position="TopAndBottom" />
                                                                    <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                                                        horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                                                        borderwidth="2" />
                                                                </asp:GridView>
                                                                <br />

                                                                <table id="tblresidingAppl" class="table table-bordered tablecus2">
                                                                    <tr runat="server" visible="true">

                                                                        <td align="right" runat="server" style="padding-right: 30px" width="40%" class="auto-style1">
                                                                            <asp:Label ID="Label43" CssClass="font2" runat="server" Text="16. All the persons whose names are given above are dependent upon me and are residing with me." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                        </td>
                                                                        <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                                            <asp:Label ID="lblresidingwithme" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <br />
                                                                <div class="panel-heading gradheaderround">
                                                                    <span style="font-size: large; font-weight: bold; color: Black;">17. Upload Applicant&#39;s Document(s)</span>
                                                                </div>
                                                                <br />
                                                                <br />

                                                                <asp:GridView ID="grdupload" DataKeyNames="id" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                                                    CssClass="Gridview" HeaderStyle-Font-Bold="true"
                                                                    PageSize="20" AllowPaging="true" HeaderStyle-ForeColor="White" Width="99%" ToolTip="Uploaded Documents" OnRowCommand="grdupload_RowCommand">
                                                                    <alternatingrowstyle horizontalalign="Center" verticalalign="Middle" />

                                                                    <columns>

                                                                        <asp:TemplateField HeaderText="S.No.">
                                                                            <itemtemplate>
                                                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                                                    <asp:Label ID="Label44" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                                                                </div>
                                                                            </itemtemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Document Type">

                                                                            <itemtemplate>
                                                                                <div style="padding: 6px" align="center">
                                                                                    <asp:Label ID="lbldoctypei" runat="server" Text='<%#Eval("DocType") %>' CssClass="fontingrid" />
                                                                                </div>
                                                                            </itemtemplate>
                                                                        </asp:TemplateField>


                                                                        <asp:TemplateField HeaderText="Upload">
                                                                            <itemtemplate>
                                                                                <div style="padding: 6px" align="left">
                                                                                    <asp:ImageButton ID="imgdownload" Causesvalidation="False" CommandName="downloaddoc" runat="server" Height="35" Width="35" ToolTip="Download" ImageUrl="~/images/pdficon.png" />


                                                                                </div>
                                                                            </itemtemplate>
                                                                        </asp:TemplateField>
                                                                    </columns>
                                                                    <editrowstyle horizontalalign="Center" verticalalign="Middle" />
                                                                    <footerstyle backcolor="#FBEDC4" horizontalalign="Center" verticalalign="Middle"
                                                                        font-bold="True" height="35px"></footerstyle>
                                                                    <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                                                        wrap="True"></headerstyle>
                                                                    <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                                                        verticalalign="Middle" />
                                                                    <pagersettings position="TopAndBottom" />
                                                                    <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                                                        horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                                                        borderwidth="2" />
                                                                </asp:GridView>
                                                                <br />
                                                                <br />
                                                                <div class="header">
                                                                    <asp:Label ID="Label45" Visible="true" Text="Certificate from the Head of Office" Font-Bold="true" Font-Size="Medium" runat="server" />
                                                                </div>
                                                                <div class="panel-body" align="left" style="padding: 20px">
                                                                    <br />

                                                                    <div id="divapprovemsg2" runat="server" align="left" visible="true">
                                                                        <asp:Label ID="lblapprovemsg2" Font-Bold="true" ForeColor="Blue" Font-Size="Small" runat="server" Text=""></asp:Label>
                                                                    </div>
                                                                </div>

                                                            </asp:Panel>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </contenttemplate>
                                    </asp:UpdatePanel>
                                </asp:Panel>

                                <ajaxtoolkit:modalpopupextender id="mpetrack" runat="server" popupcontrolid="pnlPopuptrack" targetcontrolid="lnkfaketrack"
                                    backgroundcssclass="modalBackground" cancelcontrolid="btnClosetrack">
                                </ajaxtoolkit:modalpopupextender>
                                <asp:Panel ID="pnlPopuptrack" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 65%;" Width="80%">

                                    <asp:UpdatePanel ID="UpdatePaneltrack" runat="server">
                                        <contenttemplate>
                                            <div class="header">
                                                <asp:Label ID="Label53" Visible="true" Text="Track Your Transfer Application" Font-Bold="true" Font-Size="Medium" runat="server" />
                                            </div>
                                            <div id="Div11" class="body" runat="server">
                                                <div id="div16" class="body" runat="server" align="left" style="padding-top: 20px; padding-left: 20px">
                                                    <asp:Label ID="Label54" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" Text="Application Reference-ID: " />
                                                    <asp:Label ID="lbltrackApp" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                                                </div>
                                                <div class="table-responsive" runat="server" align="center" style="padding: 20px">
                                                    <asp:GridView ID="grdtrack" runat="server" AutoGenerateColumns="False" AllowPaging="false" ToolTip="Track Application"
                                                        PageSize="10" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .."
                                                        ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid"
                                                        BorderWidth="2px">
                                                        <alternatingrowstyle backcolor="White" />
                                                        <columns>
                                                            <asp:TemplateField HeaderText="S.No.">
                                                                <itemtemplate>
                                                                    <asp:Label ID="Label46" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                                </itemtemplate>
                                                                <itemstyle horizontalalign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Dealing Section/Station/Officer">
                                                                <itemtemplate>
                                                                    <div style="padding-left: 10px; right: 10px" align="left">
                                                                        <asp:Label ID="Label271" Font-Bold="true" ForeColor="Brown" runat="server" Text="Section/Station/Officer: " class="fontingrid" />
                                                                        <asp:Label ID="lbldealingsec" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("DealingOffc") %>'
                                                                            Font-Bold="True" />
                                                                        <br />
                                                                        <asp:Label ID="Label500" Font-Bold="true" ForeColor="Brown" runat="server" Text="Recieved On: " class="fontingrid" />
                                                                        <asp:Label ID="lblreqtrack" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("AppSubmitOn") %>'
                                                                            Font-Bold="True" />
                                                                    </div>
                                                                </itemtemplate>
                                                                <headerstyle horizontalalign="Center" />
                                                                <itemstyle horizontalalign="Left" />
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderText="Action Taken">
                                                                <itemtemplate>
                                                                    <div style="padding-left: 10px; right: 10px; right: 10px" align="left">
                                                                        <asp:Label ID="lblactiontrachk" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Status") %>'
                                                                            Font-Bold="True" />
                                                                    </div>
                                                                </itemtemplate>
                                                                <headerstyle horizontalalign="Center" />
                                                                <itemstyle horizontalalign="Left" />
                                                            </asp:TemplateField>
                                                        </columns>
                                                        <footerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" />
                                                        <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" horizontalalign="Center"
                                                            cssclass="centerHeaderText fontingrid" wrap="True"></headerstyle>
                                                        <pagersettings position="TopAndBottom" />
                                                        <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                                            horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                                            borderwidth="2" />
                                                        <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                                            verticalalign="Middle" />
                                                        <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
                                                        <sortedascendingcellstyle backcolor="#F5F7FB" />
                                                        <sortedascendingheaderstyle backcolor="#6D95E1" />
                                                        <sorteddescendingcellstyle backcolor="#E9EBEF" />
                                                        <sorteddescendingheaderstyle backcolor="#4870BE" />
                                                    </asp:GridView>
                                                </div>

                                            </div>
                                            <div class="footer" align="center" style="padding-bottom: 20px">
                                                <asp:Button ID="btnClosetrack" runat="server" Text="X Close" CssClass="btn" Font-Bold="true" Font-Size="Large" BackColor="#E67E22" ForeColor="Black" CausesValidation="False" />
                                            </div>
                                        </contenttemplate>
                                    </asp:UpdatePanel>

                                </asp:Panel>





                            </div>
                        </div>
                    </div>
                    <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1" style="padding: 7px; margin: 3px"></div>--%>
                </div>
            </div>

            <br />

        </div>

    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
