<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Salute_CoronaWarriors.aspx.cs" Inherits="PrasarNet.Add_Salute_CoronaWarriors" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>


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

        .auto-style1 {
            height: 77px;
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
        <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto">
            <div id="Div2" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" OnClick="btnback_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-arrow-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div id="Div7" class="row" runat="server" style="padding-right: 20px; padding-left: 20px; padding-top: 20px; margin: auto">
            <div id="Div13" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="left">
                <br />
                <asp:Label ID="lblnote" runat="server" ForeColor="Red" Font-Size="Medium" Font-Bold="true" Text="Note: For a Regular Employee (w.e.f. 15Jun2021)- During Add/Updation, If you select a Deceased, then the employee become deactivated from the both HRIS and PrasarNet. Also, Edit/Update option will become unavailable for the same. "></asp:Label>
                <br />
                <br />
            </div>
        </div>
        <div id="divOPTIONS" runat="server" visible="true" align="center" style="margin: 25px 65px 25px 65px; border: medium groove #000000; padding: 10px 20px 10px 20px;">
            <%--<div align="left" runat="server">
                <asp:Label ID="lbloption" runat="server" Text="Options:" CssClass="fontheader" Font-Bold="true" ForeColor="Black" ></asp:Label>
            </div>--%>

            <div class="row" style="margin: auto">
                <div runat="server" id="divtrack" align="center" visible="false" style="padding: 25px" class="col-lg-6 col-md-6">
                    <asp:Button ID="btnaddmsg" runat="server" Text="Add Message" class="btn select buttondocumentupload font2 gradnewbutton2"
                        Style="color: Black; font-weight: bold" CausesValidation="False" Width="80%" OnClick="btnaddmsg_Click" />

                </div>
                <div runat="server" id="div5" align="center" visible="true" style="padding: 25px" class="col-lg-2 col-md-2"></div>
                <div runat="server" id="divfileaGrievance" align="center" style="padding: 25px" class="col-lg-8 col-md-8">
                    <asp:Button ID="btnaddcorona" runat="server" Text="Add Corona Warriors " class="btn select buttondocumentupload font2 gradnewbutton2"
                        Style="color: Black; font-weight: bold" CausesValidation="False" Width="80%" OnClick="btnaddcorona_Click" BorderColor="White" BorderStyle="Groove" BorderWidth="2px" />

                </div>
                <div runat="server" id="div6" align="center" visible="true" style="padding: 25px" class="col-lg-2 col-md-2"></div>
            </div>
        </div>
        <div id="diventry" runat="server" visible="true">


            <div class="row" style="margin: auto" runat="server" id="diventryform">
                <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
                <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div12">

                    <div id="divmsg_entry" runat="server" visible="false" class="table-hover">
                        <div runat="server" align="right" style="padding-right: 10px; padding-bottom: 10px">
                            <asp:Button ID="Button1" runat="server" Text=" Back " class="btn select buttondocumentupload font2 grad4"
                                Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button1_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" />
                        </div>
                        <div id="divnote" runat="server" align="left" style="padding-top: 2px; padding-left: 10px; padding-right: 50px; padding-bottom: 8px">
                            <asp:Label runat="server" Font-Bold="true" Text="* New message will delete the old message(s) automatically..." ForeColor="Red" CssClass="fontingrid"></asp:Label>
                        </div>
                        <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                            <asp:Label ID="Label4" runat="server" Text="New Message" CssClass="fontheader1" Style="font-weight: bold; color: Black;"></asp:Label>
                            &nbsp;
                        </div>
                        <table class="table table table-bordered grad2">

                            <tr>
                                <td width="40%" align="right" style="padding-right: 30px">
                                    <asp:Label ID="Label13" runat="server" Text="Message" ForeColor="Black"
                                        class="font" Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="60%" align="left" style="padding-left: 15px">
                                    <asp:TextBox ID="txtmessage" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="sub"
                                        TextMode="MultiLine">
                                    </asp:TextBox>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Message can not exceed by 2000 Letters!!"
                                        Style="color: #FF0000" ControlToValidate="txtmessage" ValidationExpression="^[\s\S\d]{1,2000}$"
                                        Display="Dynamic" Font-Bold="true" Font-Size="Medium" ValidationGroup="sub">
                                    </asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Text Required!!"
                                        ControlToValidate="txtmessage" ForeColor="Red" SetFocusOnError="True" Font-Bold="true" Font-Size="Medium"
                                        Display="Dynamic" ValidationGroup="sub">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 10px">
                                    <asp:Button ID="btnsubmit" runat="server" Text="Add Message" Font-Size="Large" class="btn select buttondocumentupload" ValidationGroup="sub"
                                        Style="background-color: #99FFCC; color: Black; font-weight: bold" />
                                </td>
                                <td align="left" style="padding-left: 10px">
                                    <asp:Button ID="btncncl" runat="server" Text="Clear" Font-Size="Large" class="btn select gradbody buttondocumentupload"
                                        Style="color: Black; font-weight: bold" CausesValidation="False" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <div id="div4" runat="server" class="panel panel-primary">
                            <div class="panel-heading gradheader">
                                <span style="font-weight: 700; color: black" class="heading1">:: Message On Display ::</span>
                            </div>

                            <div class="panel-body gradpanel">


                                <br />
                                <div style='overflow-x: auto; overflow-y: auto; width: 100%; height: 100%'>
                                    <asp:GridView ID="grdmsg" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" PageSize="10"
                                        ShowHeaderWhenEmpty="True" ToolTip="Status"
                                        BackColor="#F8F9F9" Width="80%" CellPadding="1" CellSpacing="1">
                                        <headerstyle backcolor="#0099FF" font-bold="True" forecolor="White" cssclass="centerHeaderText gvhspadding" wrap="True"></headerstyle>

                                        <columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <itemtemplate>
                                                    <div runat="server" align="center">
                                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Message">
                                                <itemtemplate>
                                                    <div runat="server" align="left" style="padding: 10px">
                                                        <asp:Label ID="lblmsg1" runat="server" Text='<%#Eval("") %>' class="fontingrid" ForeColor="Black" />
                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Message Added By and On">
                                                <itemtemplate>
                                                    <div runat="server" align="left" style="padding: 10px">
                                                        <asp:Label ID="lbl1" runat="server" Text="Added By: " Font-Bold="true" ForeColor="Brown" class="fontingrid" />
                                                        <asp:Label ID="lbladdedby1" runat="server" Text='<%#Eval("") %>' class="fontingrid" ForeColor="Black" />
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="Label3" runat="server" Text="Added On: " Font-Bold="true" ForeColor="Brown" class="fontingrid" />
                                                        <asp:Label ID="lbladdedon1" runat="server" Text='<%#Eval("") %>' class="fontingrid" ForeColor="Black" />
                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>

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
                                    <br />



                                </div>
                            </div>
                        </div>


                    </div>
                    <div id="divcoronawarriors_entry" runat="server" visible="true">
                        <div runat="server" align="right" style="padding-right: 10px; padding-bottom: 10px" id="divbtnbckform" visible="false">
                            <asp:Button ID="Button2" runat="server" Text=" Back " class="btn select buttondocumentupload font2 grad4"
                                Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button2_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" />


                        </div>
                        <div id="divadd_Cwarriors" runat="server" visible="false">
                            <div id="Div3" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                                <asp:Label ID="Label5" runat="server" Text="Add Corona Warriors" CssClass="fontheader1" Style="font-weight: bold; color: Black;"></asp:Label>
                                &nbsp;
                            </div>
                            <table class="table table table-bordered grad2">
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label3" runat="server" Text="Employee Type" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:DropDownList ID="ddlemptype" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="add"
                                            Height="28px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlemptype_SelectedIndexChanged" AutoPostBack="True" Width="90%">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvsection" runat="server" ControlToValidate="ddlemptype"
                                            Display="Dynamic" ErrorMessage="Pls. Select a employee type!!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"
                                            Font-Bold="true" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="trempcode" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="lbl1" runat="server" Text="Employee Code" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:TextBox ID="txtempcode" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true"
                                            autocomplete="off" MaxLength="7" ValidationGroup="add" AutoPostBack="True" OnTextChanged="txtempcode_TextChanged" Width="90%">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvempcode" runat="server" ControlToValidate="txtempcode" ValidationGroup="add"
                                            Display="Dynamic" ErrorMessage="Employee Code Required!!" ForeColor="Red" SetFocusOnError="True"
                                            Font-Bold="true" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="trname" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label9" runat="server" Text="Name Of Employee" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:TextBox ID="txtname" runat="server" class="select widthofboxes1" Height="56px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                            autocomplete="off" TextMode="MultiLine" Width="90%">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname" ValidationGroup="add"
                                            Display="Dynamic" ErrorMessage="Employee Name Required!!" ForeColor="Red" SetFocusOnError="True"
                                            Font-Bold="true" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="trage" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label32" runat="server" Text="Age Of Employee" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:TextBox ID="txtage" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                            autocomplete="off" TextMode="SingleLine" MaxLength="2" Width="90%">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtage" ValidationGroup="add"
                                            Display="Dynamic" ErrorMessage="Age Required!!" ForeColor="Red" SetFocusOnError="True"
                                            Font-Bold="true" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender5" runat="server"
                                            targetcontrolid="txtage" validchars="0123456789">
                                        </ajaxtoolkit:filteredtextboxextender>

                                    </td>
                                </tr>
                                <tr id="trstate" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label33" runat="server" Text="State in which Section/Office Reside" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:DropDownList ID="ddlstate" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="add"
                                            Height="28px" Width="90%">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlstate" ValidationGroup="add"
                                            Display="Dynamic" ErrorMessage="Pls. Select a State!!" ForeColor="Red" SetFocusOnError="True"
                                            Font-Bold="true" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="trdeptt_sec" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label11" runat="server" Text="Name Of Station/Section" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:TextBox ID="txtsec_stn" runat="server" class="select widthofboxes1" Height="56px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                            autocomplete="off" TextMode="MultiLine" Width="90%">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtsec_stn" ValidationGroup="add"
                                            Display="Dynamic" ErrorMessage="Section/Station Required!!" ForeColor="Red" SetFocusOnError="True"
                                            Font-Bold="true" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="trdesignation_reg_emp" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label12" runat="server" Text="Designation" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:TextBox ID="txtdesgn" runat="server" class="select widthofboxes1" Height="56px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                            autocomplete="off" TextMode="MultiLine" Width="90%">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdesgn" ValidationGroup="add"
                                            Display="Dynamic" ErrorMessage="Designation Required!!" ForeColor="Red" SetFocusOnError="True"
                                            Font-Bold="true" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="trrelationshipwithpb" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label16" runat="server" Text="Relationship with PB" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:DropDownList ID="ddlcat_nonemp" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="add"
                                            Height="28px" AppendDataBoundItems="true" Width="90%">
                                            <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Staff of Outsourced Service Providers"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Casual Assignees delivering Onsite Assignments"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="Staff of Vendors delivering any Onsite Services or Projects"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="Stringers or PTCs visiting News premises for any reasons"></asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlcat_nonemp"
                                            Display="Dynamic" ErrorMessage="Pls. Select a valid Relationship!!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"
                                            Font-Bold="true" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label18" runat="server" Text="Whether Corona-Positive?" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;</td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:RadioButtonList ID="rblcorona" runat="server" CellPadding="1" CellSpacing="1" RepeatDirection="Horizontal" ValidationGroup="add" Font-Bold="true" Font-Size="Medium">
                                            <asp:ListItem Selected="True" Value="1">Yes</asp:ListItem>
                                            <asp:ListItem Value="0">No</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label77" runat="server" Text="Date of Detection of Corona-Positive" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtD_O_CPositive" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                            autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Width="90%" AutoPostBack="True" OnTextChanged="txtD_O_CPositive_TextChanged">
                                        </asp:TextBox>
                                        <%--   <asp:ImageButton ID="imgbtnCalendar" runat="server" Height="100%" Width="32px" ImageUrl="~/images/cal.png"
                                    AlternateText="Calender" CausesValidation="false" />--%>
                                        <ajaxtoolkit:calendarextender id="txtD_O_C_CalendarExtender" runat="server" behaviorid="txtD_O_C_CalendarExtender"
                                            format="dd-MM-yyyy" targetcontrolid="txtD_O_CPositive" />
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender4" runat="server"
                                            targetcontrolid="txtD_O_CPositive" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>

                                        <br />

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Date Reqd!!"
                                            ControlToValidate="txtD_O_CPositive" ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"
                                            Font-Bold="true" Font-Size="Medium"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>



                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label7" runat="server" Text="Date of last visited inside a office premises before being detected corona positive" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtlastvisit" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                            autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Width="90%">
                                        </asp:TextBox>
                                        <%--   <asp:ImageButton ID="imgbtnCalendar" runat="server" Height="100%" Width="32px" ImageUrl="~/images/cal.png"
                                    AlternateText="Calender" CausesValidation="false" />--%>
                                        <ajaxtoolkit:calendarextender id="CalendarExtender1" runat="server" behaviorid="CalendarExtender1"
                                            format="dd-MM-yyyy" targetcontrolid="txtlastvisit" />
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                            targetcontrolid="txtlastvisit" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>

                                        <br />

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Date Reqd!!"
                                            ControlToValidate="txtlastvisit" ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"
                                            Font-Bold="true" Font-Size="Medium"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>



                                    </td>
                                </tr>
                                <tr id="trmobile" runat="server">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label8" runat="server" Text="Employee Mobile No." ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:TextBox ID="txtmob" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true"
                                            autocomplete="off" MaxLength="10" ValidationGroup="add" Width="90%">
                                        </asp:TextBox>
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderThours" runat="server"
                                            targetcontrolid="txtmob" validchars="0123456789">
                                        </ajaxtoolkit:filteredtextboxextender>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtmob" ValidationGroup="add"
                                            Display="Dynamic" ErrorMessage="Mobile No. Required!!" ForeColor="Red" SetFocusOnError="True"
                                            Font-Bold="true" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="trmobnumnearestfamily" runat="server">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label17" runat="server" Text="Mobile No. of the nearest family member" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:TextBox ID="txtnearfamily" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true"
                                            autocomplete="off" MaxLength="10" ValidationGroup="add" Width="90%">
                                        </asp:TextBox>
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender6" runat="server"
                                            targetcontrolid="txtnearfamily" validchars="0123456789">
                                        </ajaxtoolkit:filteredtextboxextender>
                                        <br />
                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtnearfamily" ValidationGroup="add"
                                            Display="Dynamic" ErrorMessage="Mobile No. Required!!" ForeColor="Red" SetFocusOnError="True"
                                            Font-Bold="true" Font-Size="Medium"></asp:RequiredFieldValidator>--%>
                                    </td>
                                </tr>
                                <tr id="tr1" runat="server">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label19" runat="server" Text="Type of quarantine" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:DropDownList ID="ddltypofquar" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="add"
                                            Height="28px" AppendDataBoundItems="true" Width="90%">
                                            <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Home"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="Hospitalised"></asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddltypofquar"
                                            Display="Dynamic" ErrorMessage="Pls. Select a valid Type!!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"
                                            Font-Bold="true" Font-Size="Medium">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label20" runat="server" Text="Details of Hospital/Home" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtdetailsofHospital" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="add"
                                            TextMode="MultiLine">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Details can not exceed by 1500 Characters!!"
                                            Style="color: #FF0000" ControlToValidate="txtdetailsofHospital" ValidationExpression="^[\s\S\d]{1,1500}$" ValidationGroup="add"
                                            Display="Dynamic" Font-Bold="true" Font-Size="Medium">
                                        </asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Text Required!!"
                                            ControlToValidate="txtdetailsofHospital" ForeColor="Red" SetFocusOnError="True" Font-Bold="true" Font-Size="Medium"
                                            Display="Dynamic" ValidationGroup="add">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label22" runat="server" Text="Whether Deceased/Discharged/Completed a Home-Quarantine?" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;</td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:RadioButtonList ID="rbldeceased" runat="server" CellPadding="1" CellSpacing="1" RepeatDirection="Horizontal" ValidationGroup="add" Font-Bold="true" Font-Size="Small" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="True">
                                            <asp:ListItem Selected="True" Value="0" Text=" Not-Yet "></asp:ListItem>
                                            <asp:ListItem Value="1" Text=" Discharged "></asp:ListItem>
                                            <asp:ListItem Value="2" Text=" Completed a Home-Quarantine "></asp:ListItem>
                                            <asp:ListItem Value="3" Text=" Deceased "></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr id="trdateofdischarge" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label21" runat="server" Text="Date of Discharge/ completion of Home Quarantine/ Date of Mishappening, if any" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtdateofdischarged" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                            autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Width="90%">
                                        </asp:TextBox>
                                        <%--   <asp:ImageButton ID="imgbtnCalendar" runat="server" Height="100%" Width="32px" ImageUrl="~/images/cal.png"
                                    AlternateText="Calender" CausesValidation="false" />--%>
                                        <ajaxtoolkit:calendarextender id="CalendarExtender2" runat="server" behaviorid="CalendarExtender2"
                                            format="dd-MM-yyyy" targetcontrolid="txtdateofdischarged" />
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender2" runat="server"
                                            targetcontrolid="txtdateofdischarged" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>

                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvdateofdischarge" runat="server" ErrorMessage="Date Required!!"
                                            ControlToValidate="txtdateofdischarged" ForeColor="Red" SetFocusOnError="True" Font-Bold="true" Font-Size="Medium"
                                            Display="Dynamic" ValidationGroup="add">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr id="trdateofjoining" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style1">
                                        <asp:Label ID="Label23" runat="server" Text="Date of Joining back/ Resumption of Duties" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style1">
                                        <asp:TextBox ID="txtjoiningback" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                            autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Width="90%">
                                        </asp:TextBox>
                                        <%--   <asp:ImageButton ID="imgbtnCalendar" runat="server" Height="100%" Width="32px" ImageUrl="~/images/cal.png"
                                    AlternateText="Calender" CausesValidation="false" />--%>
                                        <ajaxtoolkit:calendarextender id="CalendarExtender3" runat="server" behaviorid="CalendarExtender3"
                                            format="dd-MM-yyyy" targetcontrolid="txtjoiningback" />
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender3" runat="server"
                                            targetcontrolid="txtjoiningback" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvdateofjoining" runat="server" ErrorMessage="Date Required!!"
                                            ControlToValidate="txtjoiningback" ForeColor="Red" SetFocusOnError="True" Font-Bold="true" Font-Size="Medium"
                                            Display="Dynamic" ValidationGroup="add">
                                        </asp:RequiredFieldValidator>

                                    </td>
                                </tr>
                                <tr id="trfinaladd" runat="server" visible="true">
                                    <td align="right" style="padding-right: 10px">
                                        <asp:Button ID="Button3" runat="server" Text="Add" Font-Size="Large" class="btn select buttondocumentupload" ValidationGroup="add"
                                            Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="Button3_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" />
                                    </td>
                                    <td align="left" style="padding-left: 10px">
                                        <asp:Button ID="Button4" runat="server" Text="Clear" Font-Size="Large" class="btn select gradbody buttondocumentupload"
                                            Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button4_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" />
                                        &nbsp;
                                    </td>
                                </tr>

                            </table>
                        </div>

                        <div id="divtrackgridprimary" runat="server" visible="true">

                            <div class="row" style="margin: auto; padding-top: 10px">
                                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>

                                <%--  <div  runat="server" class="row" style="margin: auto">--%>
                                <div class="panel panel-primary">
                                    <div class="panel-heading grad3">
                                        <span style="font-weight: bold; color: Black;" class="font2">:: Corona Warriors List ::</span>
                                    </div>
                                    <div class="panel-body grad2 table-responsive">
                                        <div id="divprisearch" style="text-align: center" runat="server" visible="true">
                                            <table width="100%">
                                                <tr>
                                                    <td align="center" style="padding: 10px">
                                                        <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                                            Width="90px" BackColor="#F5B7B1" OnClick="btnprint1_Click" BorderColor="White" BorderStyle="Groove" BorderWidth="1px">
                                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                                            <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <br />
                                        </div>
                                        <asp:GridView ID="grdcon_war_details" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" BackColor="#F8F9F9"
                                            DataKeyNames="CoronaWarriorId" PageSize="20" ShowHeaderWhenEmpty="True" ToolTip="Grievances"
                                            Width="98%" AllowPaging="True" OnPageIndexChanging="grdcon_war_details_PageIndexChanging" OnRowDataBound="grdcon_war_details_RowDataBound" OnRowCommand="grdcon_war_details_RowCommand" OnRowEditing="grdcon_war_details_RowEditing" OnRowUpdated="grdcon_war_details_RowUpdated" OnRowUpdating="grdcon_war_details_RowUpdating">
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
                                                            <asp:Label ID="Label34" Font-Bold="true" ForeColor="Brown" runat="server" Text="State : " class="fontingrid" />
                                                            <asp:Label ID="Label35" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("StateName") %>' class="fontingrid" />
                                                            <br />
                                                            <br />
                                                            <asp:Label ID="Label26" Font-Bold="true" ForeColor="Brown" runat="server" Text="Station/Section : " class="fontingrid" />
                                                            <asp:Label ID="Label27" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Sec_Stn") %>' class="fontingrid" />
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
                                                <asp:TemplateField HeaderText="Employee Contact Details" ItemStyle-Width="25%">
                                                    <itemtemplate>
                                                        <div style="padding: 15px" runat="server" align="left">
                                                            <asp:Label ID="lbln545" Font-Bold="true" ForeColor="Brown" runat="server" Text="Personal: " class="fontingrid" />
                                                            <asp:Label ID="lblnss2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("MobileNo") %>' class="fontingrid" />
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
                                                            <asp:Label ID="Label26ss" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date Of Joining Office : " class="fontingrid" />
                                                            <asp:Label ID="Label27s" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("dateofjoiningbackoffc", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />

                                                            <asp:Label ID="lbluplon2" Font-Bold="true" ForeColor="Black" runat="server" Visible="false" Text='<%#Eval("createdon") %>' class="fontingrid" />

                                                        </div>
                                                    </itemtemplate>

                                                    <itemstyle width=""></itemstyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Edit">
                                                    <itemtemplate>
                                                        <div style="padding: 10px" align="center" runat="server">
                                                            <asp:LinkButton ID="imgedit" CommandName="Edit" runat="server" CausesValidation="false"
                                                                CssClass="btn btn-primary" ToolTip="Edit">
                                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                                                <span style="font-weight: bold; color: #000000"></span>
                                                            </asp:LinkButton>
                                                        </div>
                                                    </itemtemplate>

                                                    <itemstyle horizontalalign="Center" />
                                                    <headerstyle horizontalalign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Update Status Of health on every alternate day" ItemStyle-Width="13%">
                                                    <itemtemplate>
                                                        <div align="center" runat="server">
                                                            <asp:LinkButton ID="lnkstatus" CommandName="status" runat="server" Enabled="true" CssClass="btn btn-info font2" ForeColor="Blue"
                                                                CausesValidation="False" Text="Update Status">
                                                            </asp:LinkButton>
                                                        </div>

                                                    </itemtemplate>

                                                    <itemstyle width="13%"></itemstyle>
                                                </asp:TemplateField>
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
                                    </div>
                                    <asp:LinkButton Text="" ID="lnkfakeupdate" runat="server" />
                                    <ajaxtoolkit:modalpopupextender id="mpeupdate" runat="server" popupcontrolid="pnlPopupupdate" targetcontrolid="lnkfakeupdate"
                                        backgroundcssclass="modalBackground" behaviorid="behmod">
                                    </ajaxtoolkit:modalpopupextender>
                                    <asp:Panel ID="pnlPopupupdate" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 65%;" Width="80%">
                                        <asp:UpdatePanel ID="UpdatePanelstatus" runat="server">
                                            <contenttemplate>
                                                <div class="header">
                                                    <asp:Label ID="Label53" Visible="true" Text="Update Status of " Font-Bold="true" Font-Size="Medium" runat="server" />
                                                    <asp:Label ID="lblnameUpdate" Visible="true" Text="" Font-Bold="true" Font-Size="Medium" runat="server" />
                                                </div>
                                                <div id="Div11" class="body" runat="server">
                                                    <asp:Label ID="lblresult" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                                    <div class="table-responsive" runat="server" align="center" style="padding: 20px">
                                                        <asp:GridView ID="gvDetails" DataKeyNames="statusid,coronawarriorsid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                                            CssClass="Gridview" ShowFooter="true" HeaderStyle-Font-Bold="true" BorderStyle="Solid"
                                                            OnRowCommand="gvDetails_RowCommand1" OnPageIndexChanging="gvDetails_PageIndexChanging" OnRowDeleting="gvDetails_RowDeleting"
                                                            BorderWidth="2px"
                                                            PageSize="5" AllowPaging="true" HeaderStyle-ForeColor="White" Width="94%" ToolTip="Status">
                                                            <alternatingrowstyle horizontalalign="Center" verticalalign="Middle" />
                                                            <columns>
                                                                <asp:TemplateField HeaderText="S.No.">
                                                                    <edititemtemplate>
                                                                        <asp:Label ID="lblRow" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                                                    </edititemtemplate>
                                                                    <itemtemplate>
                                                                        <asp:Label ID="lblrowid" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                                                    </itemtemplate>
                                                                    <footertemplate>
                                                                        <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                                            <asp:Label ID="lblfooterstatus" runat="server" Text="Status Of Employee"></asp:Label>
                                                                        </div>
                                                                    </footertemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Status">
                                                                    <edititemtemplate>
                                                                        <asp:TextBox ID="txtstatusedit" runat="server" Text='<%#Eval("status") %>' Font-Bold="true" Font-Size="Small" Width="90%" TextMode="MultiLine" Height="120px"
                                                                            ValidationGroup="updatestatus" />
                                                                        <asp:RegularExpressionValidator ID="revtitle" runat="server" ErrorMessage="Status can not exceed by 500 Letters!!"
                                                                            Style="color: #FF0000" ControlToValidate="txtstatusedit" ValidationExpression="^[\s\S\d]{1,500}$"
                                                                            Display="Dynamic" class="font">
                                                                        </asp:RegularExpressionValidator>
                                                                        <asp:RequiredFieldValidator ID="rqrdcat13" runat="server" ControlToValidate="txtstatusedit"
                                                                            Text="*" ValidationGroup="updatestatus" />
                                                                    </edititemtemplate>
                                                                    <itemtemplate>
                                                                        <asp:Label ID="lblstatusitem" runat="server" Text='<%#Eval("status") %>' CssClass="fontingrid" />
                                                                    </itemtemplate>
                                                                    <footertemplate>
                                                                        <div style="padding: 6px;" align="center">
                                                                            <asp:TextBox ID="txtstatusAdd" runat="server" Width="90%" Font-Bold="true" Font-Size="Small" TextMode="MultiLine" Height="120px" ValidationGroup="addstatus" />
                                                                            <asp:RequiredFieldValidator ID="rqrdcat33" ForeColor="Red" runat="server" ControlToValidate="txtstatusAdd"
                                                                                Text="*" ValidationGroup="addstatus" />
                                                                            <asp:RegularExpressionValidator ID="revtitle" runat="server" ErrorMessage="Status can not exceed by 500 Letters!!"
                                                                                Style="color: #FF0000" ControlToValidate="txtstatusAdd" ValidationExpression="^[\s\S\d]{1,500}$"
                                                                                Display="Dynamic" class="font">
                                                                            </asp:RegularExpressionValidator>
                                                                        </div>
                                                                    </footertemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderText="Date Of Status">
                                                                    <edititemtemplate>
                                                                        <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                                            <asp:TextBox ID="txtdatestatusgrd" autocomplete="off" runat="server" Text='<%#Eval("Statusdate", "{0:dd-MMM-yyyy}") %>' Width="150px" Height="28px" ValidationGroup="updatestatus" placeholder="DD-MM-YYYY" />
                                                                            <asp:RequiredFieldValidator ID="rqrdcat1" runat="server" ControlToValidate="txtdatestatusgrd"
                                                                                Text="*" ValidationGroup="updatestatus" />
                                                                            <ajaxtoolkit:calendarextender id="txtD_O_C_CalendarExtender" runat="server" behaviorid="txtD_O_C_CalendarExtender"
                                                                                format="dd-MM-yyyy" targetcontrolid="txtdatestatusgrd" />
                                                                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender4" runat="server"
                                                                                targetcontrolid="txtdatestatusgrd" validchars="0123456789-">
                                                                            </ajaxtoolkit:filteredtextboxextender>
                                                                        </div>
                                                                    </edititemtemplate>
                                                                    <itemtemplate>
                                                                        <asp:Label ID="lblstatusdate" runat="server" Text='<%#Eval("Statusdate", "{0:dd-MMM-yyyy}") %>' CssClass="fontingrid" />
                                                                    </itemtemplate>
                                                                    <footertemplate>
                                                                        <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                                            <asp:TextBox ID="txtdatestatusfooter" runat="server" Width="150px" Height="28px" ValidationGroup="addstatus" placeholder="DD-MM-YYYY" />
                                                                            <ajaxtoolkit:calendarextender id="txtD_O_C1_CalendarExtender" runat="server" behaviorid="txtD_O_C1_CalendarExtender"
                                                                                format="dd-MM-yyyy" targetcontrolid="txtdatestatusfooter" />
                                                                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtendepr4" runat="server"
                                                                                targetcontrolid="txtdatestatusfooter" validchars="0123456789-">
                                                                            </ajaxtoolkit:filteredtextboxextender>
                                                                            <asp:RequiredFieldValidator ID="rqrdcat" ForeColor="Red" runat="server" ControlToValidate="txtdatestatusfooter"
                                                                                Text="*" ValidationGroup="addstatus" />

                                                                        </div>
                                                                    </footertemplate>
                                                                </asp:TemplateField>



                                                                <asp:TemplateField HeaderText="Action">
                                                                    <edititemtemplate>
                                                                        <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                                            <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg"
                                                                                ToolTip="Update" Height="25px" Width="25px" ValidationGroup="updatestatus" />
                                                                            &nbsp;&nbsp;
                                                                        <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/Images/Cancel.png"
                                                                            ToolTip="Cancel" Height="25px" Width="25px" />
                                                                        </div>
                                                                    </edititemtemplate>
                                                                    <itemtemplate>
                                                                        <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                                            <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" OnClientClick="return confirm('Are you sure to Edit?');"
                                                                                ImageUrl="~/Images/Edit.png" ToolTip="Edit" Height="25px" Width="25px" Visible="false" />
                                                                            &nbsp;&nbsp;
                                    <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server"
                                        ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Height="25px" Width="25px" OnClientClick="return confirm('Are you sure to delete?');" />
                                                                        </div>
                                                                    </itemtemplate>
                                                                    <footertemplate>
                                                                        <div style="padding-left: 6px; padding-right: 6px; padding-top: 8px; padding-bottom: 8px" align="center">
                                                                            <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Images/AddNewitem.jpg"
                                                                                CommandName="AddNew" Width="28px" Height="28px" ToolTip="Add" ValidationGroup="addstatus" />
                                                                            &nbsp;
                                    <asp:Label ID="lblupdatestbtn" runat="server" Text="Add New Status" Style="font-size: medium; font-family: Calibri; color: Black; font-weight: bold"></asp:Label>
                                                                        </div>
                                                                    </footertemplate>
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
                                                    <asp:Button ID="btnCloseupdate" runat="server" Text="X Close" CssClass="btn" Font-Bold="true" Font-Size="Large" OnClientClick="javascript:$find('behmod').hide(); return false;" BackColor="#E67E22" ForeColor="Black" CausesValidation="False" />
                                                </div>
                                            </contenttemplate>
                                        </asp:UpdatePanel>

                                    </asp:Panel>
                                </div>
                                <%--</div>--%>

                                <%-- <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
            </div>




        </div>

    </div>
</asp:Content>
