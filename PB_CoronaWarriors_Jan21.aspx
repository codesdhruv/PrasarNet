<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PB_CoronaWarriors_Jan21.aspx.cs" Inherits="PrasarNet.PB_CoronaWarriors_Jan21"
    MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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

        .statusupdate {
            background-color: #ABEBC6;
        }

        hr.new5 {
            /*border: 6px solid green;
            border-radius: 5px;*/
            border: 2px solid #5C5C5C;
        }

        #Panel1 legend {
            color: black;
            font-size: 25px;
            text-align: left;
        }

        legend {
            color: black;
            font-size: 25px;
            text-align: left;
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
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="btnback_Click"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-arrow-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
    </div>

    <div id="Div3" class="row" runat="server" style="padding-right: 20px; margin: auto">
        <div id="Div4" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="center">
            <asp:Panel ID="panel1" runat="server" Width="85%" CssClass="grad2" Style="padding: 20px" GroupingText="Filter Record(s)" Font-Size="Medium" Font-Bold="True" BorderColor="#666666" BorderWidth="2" BorderStyle="Groove">


                <div runat="server" align="center">
                    <div id="Div26" class="row" runat="server" style="padding-right: 20px; margin: auto">
                        <div id="Div28" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div29" class="col-md-2 col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div30" class="col-md-1  col-lg-1" runat="server" align="left">
                            <asp:Label ID="Label5" runat="server" Text="Status:" ForeColor="Black" class="font2"
                                Style="font-weight: bold;"></asp:Label>
                            &nbsp;
                        </div>
                        <div id="Div31" class="col-md-1 col-lg-1" runat="server" align="left">
                            <asp:DropDownList ID="ddlstatus" runat="server" class="select widthofboxes1 font2" Width="220px"
                                Height="32px" AppendDataBoundItems="true">
                                <asp:ListItem Text="--All--" Value=""></asp:ListItem>
                                <asp:ListItem Text="Active Cases" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Cured Cases" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Deceased Cases" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div id="Div32" class="col-md-4  col-lg-4" runat="server" align="left">
                        </div>
                        <div id="Div33" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                    </div>
                    <hr class="new5" />
                    <div id="Div5" class="row" runat="server" style="padding-right: 20px; margin: auto">
                        <div id="Div6" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div7" class="col-md-2 col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div8" class="col-md-1  col-lg-1" runat="server" align="left">
                            <asp:Label ID="lblzone" runat="server" Text="Zone:" ForeColor="Black" class="font2"
                                Style="font-weight: bold;"></asp:Label>
                            &nbsp;
                        </div>
                        <div id="Div11" class="col-md-1 col-lg-1" runat="server" align="left">
                            <asp:DropDownList ID="ddlzone" runat="server" AutoPostBack="true" class="select widthofboxes1 font2" Width="220px"
                                Height="32px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlzone_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div id="Div12" class="col-md-4  col-lg-4" runat="server" align="left">
                        </div>
                        <div id="Div13" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                    </div>
                    <br />
                    <div id="Div44" class="row" runat="server" style="padding-right: 20px; margin: auto">
                        <div id="Div45" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div46" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div47" class="col-md-1  col-lg-1" runat="server" align="left">
                            <asp:Label ID="Label9" runat="server" Text="State:" ForeColor="Black" class="font2"
                                Style="font-weight: bold;"></asp:Label>
                            &nbsp;
                        </div>
                        <div id="Div48" class="col-md-1  col-lg-1" runat="server" align="left">
                            <asp:DropDownList ID="ddlstate" runat="server" class="select widthofboxes1 font2" Width="220px"
                                Height="32px" AppendDataBoundItems="true">
                            </asp:DropDownList>

                        </div>
                        <div id="Div49" class="col-md-4  col-lg-4" runat="server" align="left">
                        </div>
                        <div id="Div50" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                    </div>
                    <hr class="new5" />
                    <div id="Div14" class="row" runat="server" style="padding-right: 20px; margin: auto">
                        <div id="Div15" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div24" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div21" class="col-md-1  col-lg-1" runat="server" align="left">
                            <asp:Label ID="Label4" runat="server" Text="Date (From):" ForeColor="Black" class="font2"
                                Style="font-weight: bold;"></asp:Label>
                            &nbsp;
                        </div>
                        <div id="Div22" class="col-md-1  col-lg-1" runat="server" align="left">
                            <asp:TextBox ID="txtdatefrom" runat="server" class="select widthofboxes1" Width="220px" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="txtdatefrom_CalendarExtender" runat="server" behaviorid="txtdatefrom_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtdatefrom" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender4" runat="server"
                                targetcontrolid="txtdatefrom" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>

                        </div>
                        <div id="Div25" class="col-md-4  col-lg-4" runat="server" align="left">
                        </div>

                        <div id="Div20" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                    </div>
                    <br />
                    <div id="Div16" class="row" runat="server" style="padding-right: 20px; margin: auto">
                        <div id="Div19" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div23" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div17" class="col-md-1  col-lg-1" runat="server" align="left">
                            <asp:Label ID="Label3" runat="server" Text="Date (To):" ForeColor="Black" class="font2"
                                Style="font-weight: bold;"></asp:Label>
                            &nbsp;
                        </div>
                        <div id="Div18" class="col-md-1  col-lg-1" runat="server" align="left">
                            <asp:TextBox ID="txtdateto" runat="server" class="select widthofboxes1" Width="220px" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="CalendarExtender1" runat="server" behaviorid="txtdateto_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtdateto" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                targetcontrolid="txtdateto" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>

                        </div>
                        <div id="Div238" class="col-md-4  col-lg-4" runat="server" align="left">
                        </div>
                        <div id="Div27" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                    </div>
                    <hr class="new5" />

                    <div id="Div37" class="row" runat="server" style="padding-right: 20px; margin: auto">
                        <div id="Div38" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div39" class="col-md-1  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div40" class="col-md-3  col-lg-2" runat="server" align="left" style="padding-top: 2px; padding-bottom: 2px">
                            <asp:Button ID="btnsearch" runat="server" Text="Filter Record(s)" Font-Size="medium" class="btn select buttondocumentupload" ValidationGroup="sub" Width="150px"
                                Style="background-color: #99FFCC; color: Black; font-weight: bold" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="2" OnClick="btnsearch_Click" />
                        </div>
                        <div id="Div41" class="col-md-3  col-lg-2" runat="server" align="left" style="padding-top: 2px; padding-bottom: 2px">
                            <asp:Button ID="btncncl" runat="server" Text="Refresh" Font-Size="medium" class="btn select gradbody buttondocumentupload" Width="150px"
                                Style="color: Black; font-weight: bold" CausesValidation="False" BorderWidth="2" BorderStyle="Ridge" BorderColor="#CCCCCC" OnClick="btncncl_Click" />

                        </div>
                        <div id="Div42" class="col-md-1  col-lg-2" runat="server" align="left">
                        </div>
                        <div id="Div43" class="col-md-2  col-lg-2" runat="server" align="left">
                        </div>
                    </div>



                </div>
                <br />
            </asp:Panel>


        </div>
    </div>
    <br />
    <br />
    <div id="Div34" class="row" runat="server" style="margin: auto">
        <%-- <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
        <div align="center" class=" col-md-12 col-sm-12 col-lg-12" style="padding-top: 2px">


            <div id="divtrackgridprimary" runat="server" visible="true">

                <div class="row" style="margin: auto; padding-top: 0px">
                    <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>

                    <%--  <div  runat="server" class="row" style="margin: auto">--%>
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="font-weight: bold; color: Black;" class="font2">::Covid-19 Updates & Status List::</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <%--<div id="divprisearch" style="text-align: center" runat="server" visible="true">
                                <table width="100%">
                                    <tr>
                                        <td align="center" style="padding: 10px">
                                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                                Width="90px" BackColor="#F5B7B1">
                    <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-print"></span>
                    <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />

                            </div>--%>
                            <div id="divprisearch" style="text-align: center; padding: 10px; margin: auto" runat="server" visible="true" class="row">
                                <div class="col-lg-2 col-md-2"></div>
                                <div class="col-lg-2 col-md-2"></div>
                                <div class="col-lg-2 col-md-2" style="padding: 7px">
                                    <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                        Width="160px" BackColor="#F5B7B1" OnClick="btnprint1_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px">
                                        <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                        <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                </div>
                                <div class="col-lg-2 col-md-2" style="padding: 7px">
                                    <asp:LinkButton ID="btnexporttoexcel" runat="server" CssClass="btn" CausesValidation="False"
                                        Width="160px" BackColor="LightGreen" OnClick="btnexporttoexcel_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px">
                                        <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-export"></span>
                                        <span style="font-weight: bold; color: #000000">Export to Excel</span></asp:LinkButton>
                                </div>
                                <div class="col-lg-2 col-md-2"></div>
                                <div class="col-lg-2 col-md-2"></div>
                            </div>

                            <asp:Panel ID="panelprint" runat="server">
                                <div id="divmsg" runat="server" visible="false" align="center">
                                    <asp:Label ID="lblmsg" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                </div>
                                <div id="div36" style="text-align: center; padding: 10px; margin: auto" runat="server" visible="true" class="row">
                                    <div class="col-lg-2 col-md-2"></div>
                                    <div class="col-lg-2 col-md-2"></div>
                                    <div class="col-lg-2 col-md-2" style="padding: 7px">
                                        <asp:Label ID="Label7" runat="server" Text="Record(s) Found:" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                        <asp:Label ID="lblrecordsfound" runat="server" Text="" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </div>
                                    <div class="col-lg-2 col-md-2" style="padding: 7px">
                                        <asp:Label ID="Label8" runat="server" Text="Filter Criterion:" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                        <asp:Label ID="lblfiltercriterion" runat="server" Text="" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </div>
                                    <div class="col-lg-2 col-md-2"></div>
                                    <div class="col-lg-2 col-md-2"></div>
                                </div>


                                <asp:GridView ID="grdcon_war_details" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" BackColor="#F8F9F9"
                                    PageSize="15" ShowHeaderWhenEmpty="True" ToolTip="Corona Warriors" DataKeyNames="CoronaWarriorId"
                                    Width="95%" AllowPaging="True" OnRowDataBound="grdcon_war_details_RowDataBound" OnPageIndexChanging="grdcon_war_details_PageIndexChanging" OnRowCommand="grdcon_war_details_RowCommand">
                                    <headerstyle backcolor="#0099FF" font-bold="True" forecolor="Black" horizontalalign="Center" />
                                    <columns>
                                        <asp:TemplateField HeaderText="S.No." ItemStyle-Width="7%">
                                            <itemtemplate>
                                                <div runat="server" align="center">

                                                    <asp:Label ID="lblSNo" ForeColor="Black" CssClass="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                    <asp:Label ID="lblcoronawarid" Visible="false" ForeColor="Black" CssClass="fontingrid" runat="server" Text='<%#Eval("CoronaWarriorId") %>' />

                                                </div>

                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Emp-Type" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="lblemptypg" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Emp_Type") %>' class="fontingrid" />

                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Details of Employees" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="lbln" Font-Bold="true" ForeColor="Brown" runat="server" Text="Name : " class="fontingrid" />
                                                    <asp:Label ID="lbln2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("name") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label30" Font-Bold="true" ForeColor="Brown" runat="server" Text="Age : " class="fontingrid" />
                                                    <asp:Label ID="Label31" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("age") %>' class="fontingrid" />
                                                    <br />
                                                    <br />

                                                    <asp:Label ID="Label24" Font-Bold="true" ForeColor="Brown" runat="server" Text="Designation : " class="fontingrid" />
                                                    <asp:Label ID="Label25" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("designation") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <div id="divrelationwithPB" runat="server">
                                                        <asp:Label ID="Label28" Font-Bold="true" ForeColor="Brown" runat="server" Text="Relation with PB : " class="fontingrid" />
                                                        <asp:Label ID="Label29" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("relationwithPB_nonEmp") %>' class="fontingrid" />
                                                    </div>
                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="State/Station/Office" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="Label342" Font-Bold="true" ForeColor="Brown" runat="server" Text="State : " class="fontingrid" />
                                                    <asp:Label ID="Label352" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("StateName") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label262" Font-Bold="true" ForeColor="Brown" runat="server" Text="Station/Section : " class="fontingrid" />
                                                    <asp:Label ID="Label272" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Sec_Stn") %>' class="fontingrid" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Date Of Detection Of Corona Positive" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="center">

                                                    <asp:Label ID="lbldateofdetection" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("coronapositiveon", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />


                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date of last visited inside a office premises before being detected corona positive" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="center">

                                                    <asp:Label ID="lbllast2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("lastdateofvisit_Offc", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />


                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Employee Contact Details" ItemStyle-Width="25%" Visible="false">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="lbln122" Font-Bold="true" ForeColor="Brown" runat="server" Text="Personal: " class="fontingrid" />
                                                    <asp:Label ID="lbln2s2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("MobileNo") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblcon2" Font-Bold="true" ForeColor="Brown" runat="server" Text="His/Her Nearest Family Member: " class="fontingrid" />
                                                    <asp:Label ID="lblcon21" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("MobileNo_Of_NearestFamilyMem") %>' class="fontingrid" />
                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type Of Quarantine" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="lbltypQ" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Hospitalised_HomeQurantine") %>' class="fontingrid" />
                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Details of Hospital/Home" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="center">
                                                    <asp:Label ID="lblhome" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("DetailsofHospital") %>' class="fontingrid" />
                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Final Status" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="Lf" Font-Bold="true" ForeColor="Brown" runat="server" Text="Status : " class="fontingrid" />
                                                    <asp:Label ID="lblf2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("discharged_deceased_completionhomequran") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lbl" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date of Discharge/Home Quarantine/Deceased : " class="fontingrid" />
                                                    <asp:Label ID="lbldesignation2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("dateofdischarged_deceased_home", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label26" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date Of Joining Office : " class="fontingrid" />
                                                    <asp:Label ID="Label27" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("dateofjoiningbackoffc", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />


                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Station/Section/Office who provide this Information" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="center">

                                                    <asp:Label ID="lblby" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("createdby") %>' class="fontingrid" />
                                                    <asp:Label ID="lbluplon2" Font-Bold="true" ForeColor="Black" runat="server" Visible="false" Text='<%#Eval("createdon") %>' class="fontingrid" />
                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="Check the Status" ItemStyle-Width="13%">
                                            <ItemTemplate>
                                                <div align="center" runat="server">
                                                    <asp:LinkButton ID="lnkstatus" CommandName="status" runat="server" Enabled="true" CssClass="btn btn-info font2" ForeColor="Blue"
                                                        CausesValidation="False" Text="Check Status">
                                                    </asp:LinkButton>
                                                </div>

                                            </ItemTemplate>

                                            <ItemStyle Width="13%"></ItemStyle>
                                        </asp:TemplateField>--%>
                                    </columns>
                                    <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                        wrap="True"></headerstyle>
                                    <rowstyle backcolor="White" font-bold="True" height="30px" horizontalalign="Center"
                                        verticalalign="Middle" />
                                    <pagersettings position="TopAndBottom" />
                                    <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                        horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                        borderwidth="2" />
                                </asp:GridView>

                            </asp:Panel>
                            <asp:LinkButton Text="" ID="lnkfakeupdate" runat="server" />

                            <ajaxtoolkit:modalpopupextender id="mpeupdate" runat="server" popupcontrolid="pnlPopupupdate" targetcontrolid="lnkfakeupdate"
                                backgroundcssclass="modalBackground" cancelcontrolid="btnCloseupdate">
                            </ajaxtoolkit:modalpopupextender>
                            <asp:Panel ID="pnlPopupupdate" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 65%;" Width="80%">
                                <asp:UpdatePanel ID="UpdatePanelstatus" runat="server">
                                    <contenttemplate>
                                        <div class="header">
                                            <asp:Label ID="Label53" Visible="true" Text=" Status of " Font-Bold="true" Font-Size="Medium" runat="server" />
                                            <asp:Label ID="lblnameUpdate" Visible="true" Text="" Font-Bold="true" Font-Size="Medium" runat="server" />
                                        </div>
                                        <div id="Div35" class="body" runat="server">
                                            <asp:Label ID="lblresult" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                            <div class="table-responsive" runat="server" align="center" style="padding: 20px">
                                                <asp:GridView ID="gvDetails" DataKeyNames="statusid,coronawarriorsid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                                    CssClass="Gridview" HeaderStyle-Font-Bold="true" BorderStyle="Solid" EmptyDataText="--No Result Found--"
                                                    BorderWidth="2px" PageSize="5" AllowPaging="true" HeaderStyle-ForeColor="White" Width="94%" ToolTip="Status">
                                                    <alternatingrowstyle horizontalalign="Center" verticalalign="Middle" />
                                                    <columns>
                                                        <asp:TemplateField HeaderText="S.No.">

                                                            <itemtemplate>
                                                                <asp:Label ID="lblrowid" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />

                                                            </itemtemplate>

                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Status">

                                                            <itemtemplate>
                                                                <asp:Label ID="lblstatusitem" runat="server" Text='<%#Eval("status") %>' CssClass="fontingrid" />
                                                            </itemtemplate>

                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Date Of Status">

                                                            <itemtemplate>
                                                                <asp:Label ID="lblstatusdate" runat="server" Text='<%#Eval("Statusdate", "{0:dd-MMM-yyyy}") %>' CssClass="fontingrid" />
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
                                            </div>

                                        </div>
                                        <div class="footer" align="center" style="padding-bottom: 20px">
                                            <asp:Button ID="btnCloseupdate" runat="server" Text="X Close" CssClass="btn" Font-Bold="true" Font-Size="Large" BackColor="#E67E22" ForeColor="Black" CausesValidation="False" />
                                        </div>
                                    </contenttemplate>
                                </asp:UpdatePanel>

                            </asp:Panel>
                        </div>
                        <asp:LinkButton Text="" ID="lnkfaketrack" runat="server" />

                    </div>
                    <%--</div>--%>

                    <%-- <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                </div>
            </div>
        </div>

        <%--  <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>

