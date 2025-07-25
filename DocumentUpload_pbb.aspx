<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocumentUpload_pbb.aspx.cs"
    Inherits="PrasarNet.DocumentUpload_pbb" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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

        .gradnewbutton {
            background: linear-gradient(to right, #E67E22, #F99B62);
            -webkit-radial-gradient;
        }

        .gradnewbutton2 {
            background: linear-gradient(to right, #F99B62, #E67E22);
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


        function openAction() {
            //            var Userid = "234";
            window.open("PBB_reports.aspx", "_self");
            //            window.open("myprofile.aspx?Id=" +"2"+"&Code=" + Userid ,"_self");

        }
        function openAction2() {
            //            var Userid = "234";
            window.open("Pbb_ShareDocuments.aspx", "_self");
            //            window.open("myprofile.aspx?Id=" +"2"+"&Code=" + Userid ,"_self");
        }
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
            <div id="Div2" class="col-lg-6 col-md-6 sm-6 xs-6" runat="server" style="padding-left: 25px;" align="Left">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False"
                    OnClick="btnback_Click">
                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
                <br />
                <br />
            </div>
            <div class="col-lg-6 col-md-6 sm-6 xs-6" style="padding-right: 25px;">
                <asp:Label ID="Label1" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label2" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
            </div>
        </div>
        <%-- <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto">
              <div id="Div11" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn grad4" CausesValidation="False"
                    OnClick="btnback_Click"> <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
                <br />
                <br />
            </div> 
        </div>--%>
        <div style="border: medium groove #000000; margin-top: 8px; margin-right: 80px; margin-left: 80px; margin-bottom: 30px">
            <div id="Div4" runat="server" align="center" class="row" style="margin: auto;">
                <div align="center" class=" col-lg-3">
                </div>
                <div align="center" class=" col-lg-2" style="padding-top: 20px; padding-bottom: 20px">
                    <asp:LinkButton ID="lnkupload" runat="server" CssClass="btn gradnewbutton2" CausesValidation="False"
                        Width="200px" OnClick="lnkupload_Click">
                        <span style="font-weight: bold; color: #000000">Add Records</span></asp:LinkButton>
                </div>
                <div align="center" class="  col-lg-2" style="padding-top: 20px; padding-bottom: 20px">
                    <asp:Label ID="lnkdownload" runat="server" CssClass="btn gradnewbutton" CausesValidation="False"
                        Width="200px" onclick="openAction()">
                        <span style="font-weight: bold; color: #000000">PBB Reports</span></asp:Label>
                </div>
                <div align="center" class="  col-lg-2" style="padding-top: 20px; padding-bottom: 20px">
                    <asp:Label ID="lblsharedoc" runat="server" CssClass="btn gradnewbutton2" CausesValidation="False"
                        Width="200px" onclick="openAction2()">
                        <span style="font-weight: bold; color: #000000">Share Documents</span></asp:Label>
                </div>
                <div align="center" class="col-lg-3">
                </div>




            </div>
        </div>

        <div class="row" style="margin: auto" id="divupload" runat="server" visible="false">
            <div align="center" class="col-md-1 col-sm-1 col-lg-1">
            </div>
            <div align="center" class="col-md-10 col-sm-10 col-xs-12 col-lg-10" runat="server" id="div3" style="padding-left: 20px; padding-right: 20px;">


                <asp:Label ID="Label12" runat="server" Style="font-weight: 700; color: White; font-size: medium"
                    Text=""></asp:Label>
                <asp:Label ID="lblexception" runat="server" Style="font-weight: bold; color: Red; font-size: medium"
                    Visible="false" Text=""></asp:Label>
                <div class="table-hover table">
                    <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                        <asp:Label ID="Label4" runat="server" CssClass="font2" Text="Upload the Meeting Records" Style="font-weight: bold; color: Black;"></asp:Label>
                        &nbsp;
                    </div>
                    <table class="table table table-bordered grad2">
                        <tr>
                            <td align="right" style="padding-right: 30px" width="35%">
                                <asp:Label ID="lbldoccat" runat="server" Text="Category" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:DropDownList ID="ddldoccat" runat="server" AutoPostBack="false" class="select widthofboxes1 font2"
                                    Height="28px" AppendDataBoundItems="true">
                                </asp:DropDownList>

                                <%--  <asp:ListItem Text="All" Value=""> </asp:ListItem>--%>
                                <%-- </asp:DropDownList>--%>
                                <br />
                                <asp:RequiredFieldValidator ID="rfvdoccat" runat="server" ControlToValidate="ddldoccat"
                                    Display="Dynamic" ErrorMessage="Pl. Select a category!!" ForeColor="Red" SetFocusOnError="True"
                                    Font-Bold="true" Font-Size="Medium">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 30px" width="35%">
                                <asp:Label ID="lbldoctype" runat="server" Text="Document-Type" ForeColor="Black"
                                    class="font2" Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:DropDownList ID="ddldoctype" runat="server" AutoPostBack="false" class="select widthofboxes1 font2"
                                    Height="28px" AppendDataBoundItems="true">
                                </asp:DropDownList>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddldoctype"
                                    Display="Dynamic" ErrorMessage="Pl. Select a Document-Type!!" ForeColor="Red"
                                    SetFocusOnError="True" Font-Bold="true" Font-Size="Medium">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 30px" width="35%">
                                <asp:Label ID="lbltitle" runat="server" Text="Title/Subject" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:TextBox ID="txttitle" runat="server" class="select widthofboxes1 fontingrid" Height="55px"
                                    TextMode="MultiLine">
                                </asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="rfvtitle" runat="server" ErrorMessage="Title Required!!"
                                    ControlToValidate="txttitle" ForeColor="Red" SetFocusOnError="True" Font-Bold="true" Font-Size="Medium"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="revtitle" runat="server" ErrorMessage="Title can not exceed the 250 Characters!!"
                                    Style="color: #FF0000" ControlToValidate="txttitle" ValidationExpression="^[\s\S\d]{1,250}$"
                                    Display="Dynamic" Font-Bold="true" Font-Size="Medium">
                                </asp:RegularExpressionValidator>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender72" runat="server"
                                    targetcontrolid="txttitle" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#+_-)(&%$!|\}{] [/?';:,.">
                                </ajaxtoolkit:filteredtextboxextender>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 30px" width="35%">
                                <asp:Label ID="lbldatofmeeting" runat="server" Text="Date Of Meeting" ForeColor="Black"
                                    class="font2" Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <contenttemplate>
                                        <asp:TextBox ID="txtdatemeeting" runat="server" class="select widthofboxes1 font2" Height="28px"
                                            autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10">
                                        </asp:TextBox>
                                        <ajaxtoolkit:calendarextender id="txtdatemeeting_CalendarExtender" runat="server"
                                            behaviorid="txtdatemeeting_CalendarExtender" format="dd-MM-yyyy" targetcontrolid="txtdatemeeting" />
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderThours" runat="server"
                                            targetcontrolid="txtdatemeeting" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvdateofmeeting" runat="server" ErrorMessage="Meeting-Date Required!!"
                                            ControlToValidate="txtdatemeeting" ForeColor="Red" SetFocusOnError="True" Font-Bold="true" Font-Size="Medium"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                    </contenttemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 30px" width="35%">
                                <asp:Label ID="Label17" runat="server" Text="Keyword(s)" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:TextBox ID="txtkeyword" runat="server" class="select widthofboxes1 fontingrid" Height="135px" Width="90%" Font-Size="Small"
                                    TextMode="MultiLine">
                                </asp:TextBox>
                                <br />
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Title Required!!"
                                    ControlToValidate="txtkeyword" ForeColor="Red" SetFocusOnError="True" Font-Bold="true" Font-Size="Medium"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                <br />--%>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                    targetcontrolid="txtkeyword" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#+_-)(&%$!|\}{] [/?';:,. ">
                                </ajaxtoolkit:filteredtextboxextender>
                            </td>
                        </tr>

                        <tr>
                            <td align="right" style="padding-right: 30px" width="35%">
                                <asp:Label ID="lblfileupload" runat="server" Text="Upload" class="font2" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 10px" width="65%">
                                <asp:FileUpload ID="FileUpload1" runat="server" class="select widthofboxes1" Height="22px" Font-Bold="true" Font-Size="Medium" />
                                <asp:Label ID="Label13" runat="server" Text="* Only .pdf,.doc,.docx files are allowed to Upload."
                                    Font-Bold="true" Font-Size="Small" Font-Italic="True" ForeColor="Blue"></asp:Label>
                                <br />
                                <asp:Label ID="Label18" runat="server" Text="** During Update, If you are not selecting any file for upload then last uploaded file will be retained.."
                                    Font-Bold="true" Font-Size="Small" Font-Italic="True" ForeColor="Blue" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 10px" width="35%">
                                <asp:Button ID="btnupload" runat="server" Text="Save & Upload" class="btn select buttondocumentupload"
                                    Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnupload_Click" />
                            </td>
                            <td align="left" style="padding-left: 10px" width="65%">
                                <asp:Button ID="btncncl" runat="server" Text="Cancel" class="btn select gradbody buttondocumentupload"
                                    Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" />
                                &nbsp;
                                <%--<asp:Label ID="Label27" runat="server" Text="new" onclick="openAction()"></asp:Label>--%>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div align="center" class="col-md-1 col-sm-1 col-lg-1">
            </div>
        </div>
        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div5">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-xs-12 col-lg-10" runat="server"
                id="div6" style="padding-left: 30px; padding-right: 25px;">
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="color: Black; font-weight: 700" class="font2">List of Meeting Records with Detail</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <div style="text-align: center">
                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn gradbody" CausesValidation="False"
                                OnClick="btnprint1_Click">
                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp;
                    <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                            <br />
                            <br />
                            <%-- <strong><span class="style1">*Please Note, After the click on edit button, you need
                                to upload a file again before updating. </span></strong>
                            <br />
                            <br />--%>
                        </div>
                        <asp:GridView ID="grddoc" runat="server" DataKeyNames="Id" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="25" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                            HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="85%"
                            ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnRowCommand="grddoc_RowCommand"
                            OnPageIndexChanging="grddoc_PageIndexChanging" OnRowDeleted="grddoc_RowDeleted"
                            OnRowDeleting="grddoc_RowDeleting" OnRowEditing="grddoc_RowEditing" OnRowDataBound="grddoc_RowDataBound">
                            <alternatingrowstyle backcolor="White" />
                            <columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" runat="server" CssClass="fontingrid" ForeColor="Black" Font-Bold="true" Text='<%#Container.DataItemIndex+1 %>' />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title/Subject" ItemStyle-Width="30%">
                                    <itemtemplate>
                                        <div style="padding: 10px">
                                            <asp:LinkButton ID="lnktitle" runat="server" ForeColor="Blue" CommandName="Download"
                                                Font-Underline="false" Text='<%#Eval("Title") %>' class="font2" Font-Bold="True"
                                                CausesValidation="False" />
                                            <br />
                                            <asp:Label ID="lbluplon" runat="server" Text="Uploaded On" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("CreatedOn", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />
                                            <br />
                                            <asp:Label ID="Label24" runat="server" Text="Category" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label25" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="Label26" Font-Italic="true" runat="server" Text='<%#Eval("Category") %>'
                                                Font-Size="8pt" Font-Bold="true" />
                                            <br />
                                            <asp:Label ID="Label5" runat="server" Text="Document-Type" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label7" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="Label8" Font-Italic="true" runat="server" Text='<%#Eval("DocumentType") %>'
                                                Font-Size="8pt" Font-Bold="true" />
                                            <br />
                                            <asp:Label ID="Label3" runat="server" Text="Document-Extension" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label9" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="Label16" Font-Italic="true" runat="server" Text='<%#Eval("Docextension") %>'
                                                Font-Size="8pt" Font-Bold="true" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Keyword(s)/Tag(s)" ItemStyle-Width="30%">
                                    <itemtemplate>
                                        <div style="padding: 10px">
                                            <asp:Label ID="lblkeywrd" runat="server" ForeColor="Black" CommandName="Download"
                                                Font-Underline="false" Text='<%#Eval("Keyword") %>' class="fontingrid" Font-Bold="True"
                                                CausesValidation="False" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Of Meeting" ItemStyle-Width="8%">
                                    <itemtemplate>
                                        <asp:Label ID="Label11" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("DateOfMeeting", "{0:dd-MMM-yyyy}") %>'
                                            class="fontingrid" />
                                        <%--Text='<%# Eval("tDate", "{0:dd-MMM-yyyy}") %>'--%>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="11%">
                                    <itemtemplate>
                                        <asp:LinkButton ID="imgedit" CommandName="Edit" runat="server" CausesValidation="false"
                                            CssClass="btn btn-primary" ToolTip="Edit">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="Imgdelete" CommandName="Delete" runat="server" CausesValidation="false"
                                            CssClass="btn btn-danger" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete?');">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-trash"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
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
                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div7">
            </div>
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
</asp:Content>
