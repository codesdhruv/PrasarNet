<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DashBoardNew.aspx.cs" Inherits="PrasarNet.DashBoardNew"
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
        .blink_me {
            animation: blinker 4s linear infinite;
        }

        html { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
            box-sizing: border-box;
        }

        *, *:before, *:after { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
            box-sizing: border-box;
        }

        .card { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
            box-shadow: 20px 20px 20px 0 rgba(0, 0, 0, 0.8);
        }

        .container11 { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
            padding: 0 16px;
        }

            .container11::after, .row::after { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
                content: "";
                clear: both;
                display: table;
            }

        .title { /* use on dashboard for showing the Message of Management i.e. CEO, DG:DD, DG:AIR ..... Added on 08-Aug-2018*/
            color: grey;
        }



        .groucho {
            position: relative;
            font-family: 'Sanchez', serif;
            font-size: $base-font-size;
            line-height: $base-line-height;
            footer;

        {
            font-family: 'Noto Sans', sans-serif;
            font-size: 0.6em;
            font-weight: 700;
            color: darken($white, 15%);
            float: right;
            &:before;

        {
            content: '\2015';
        }

        }

        &:after {
            content: '\201D';
            position: Relative;
            top: 0em;
            right: 0;
            font-size: 6em;
            font-style: italic;
            color: darken($white, 7%);
            z-index: -1;
        }

        }

        .divforwhatsnew1 {
            background-color: #ECF0F1;
            height: 525px;
            width: 100%;
            overflow-y: auto;
            overflow-x: auto;
        }

        .height1 {
            height: 600px;
        }

        .grad2 {
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .scrollnew {
            overflow-y: auto;
            overflow-x: auto;
        }

        .profilescroll {
            overflow-y: auto;
            overflow-x: auto;
        }

        .toc {
            margin: 0;
        }

        .gradquote {
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .gradtab {
            background: linear-gradient(to right, orange, #ECF0F1);
            background: radial-gradient(orange, #ECF0F1);
            -webkit-radial-gradient;
        }

        .gradtab1 {
            background: linear-gradient(to left, #FFAC49, #ECF0F1);
            -webkit-radial-gradient;
        }

        .gradtab12 {
            /*background: linear-gradient(to right, #FFAC49, #ECF0F1);*/
            background: radial-gradient(#ECF0F1,#FFAC49);
            -webkit-radial-gradient;
        }

        .gradh {
            background: radial-gradient(orange, #F4F6F7);
        }

        .gradformessage {
            background: linear-gradient(to bottom, #FAD7A0, #EAFAF1);
        }

        .grad4 {
            background: radial-gradient(#CACFD2, #E67E22);
            -webkit-radial-gradient;
        }
    </style>
    <script type='text/javascript'>
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
        function clearmodal() {
            $('#loginModal4').on('hide.bs.modal', function () {
                var emp = document.getElementById("txtemployee");
                var grd = document.getElementById("divgrd");
                //                var rev = document.getElementById("RegularExpressionValidator1");
                //                var rfv = document.getElementById("RequiredFieldValidator1");
                emp.value = "";


                if ($("#divgrd").is(':visible')) {
                    //                    alert("Room 1 is filled.");
                    grd.style.display = "none";
                }
            })
        }
        function popupfunction() {
            var popup = document.getElementById("myPopup");
            popup.classList.toggle("show");
        }
        function popupfunction2() {
            var popup = document.getElementById("myPopup2");
            popup.classList.toggle("show");
        }
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

    </script>
    <style type="text/css">
        .style1 {
            width: 14%;
        }

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
    <%--class="containernew"--%>
    <div class="row gradhead" runat="server" style="margin: auto">
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
                    <asp:Image ID="Image7" runat="server" class="img-responsive" Height="100%" align="center"
                        ImageUrl="~/images/Azadi.png" Width="100px" />
                </div>
            </div>

            <br />
            <asp:Label ID="Label14" runat="server" class="fontheader1" ForeColor="Blue" Font-Bold="false" Text=" An Intranet for Prasar Bharati Employees"></asp:Label>

        </div>
        <div class="col-xs-3 col-lg-3 text-center" style="padding-right: 25px; padding-top: 12px; padding-bottom: 5px">
            <asp:Image ID="Image8" runat="server" class="img-responsive pull-right" Width="123px" Height="100%"
                ImageAlign="Right" ImageUrl="~/images/pblogo.png" />
        </div>

    </div>
    <div class="row" style="margin: auto" runat="server">
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
                                <%--  <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>--%>
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
                                    <%-- <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>     --%>
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
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="content gradbody">
        <div class="row" style="padding: 10px 0px 0px 0px; margin: auto">
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 35px;">
                <asp:Label ID="Label16" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label17" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
            </div>
        </div>
        <div class="row container-fluid" style="padding: 10px 0px 0px 0px; margin: auto;">
            <%--<div class="row" style="padding-top: 15px">--%>
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding: 0px 0px 0px 0px;">
                <div>
                    <table class="table">
                        <tr class="gradquote">
                            <td align="center">
                                <div align="center" id="divmotquote" runat="server" visible="false">
                                    <asp:Label ID="Label1" runat="server" Text="Click" Style="font-weight: 700"></asp:Label>
                                    <asp:LinkButton ID="lnkhere" runat="server" OnClick="lnkhere_Click" CausesValidation="False"
                                        Font-Underline="False" ForeColor="Blue">
                                        &nbsp;Here&nbsp;</asp:LinkButton>
                                    <asp:Label ID="Label2" runat="server" Text="to Add/Edit/Change the Motivational Quote"
                                        Style="font-weight: 700"></asp:Label>
                                </div>
                                <asp:Label class="toc groucho font2" ForeColor="#1B2631" Font-Italic="true" ID="lblquote"
                                    runat="server" Text="" Style="font-weight: bold"></asp:Label>
                                <br />
                                -
                                <asp:Label ForeColor="Black" Font-Bold="true" class="toc groucho font" Font-Italic="true"
                                    ID="lblauthor" runat="server" Text=""></asp:Label>
                                -
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <%--</div>--%>
        </div>

        <%--<div class="row" style="padding-top: 10px; padding-bottom: 10px; margin: auto">
            <div class="col-md-10 col-lg-10 col-sm-10" style="padding-left: 20px" runat="server" align="left">
                <asp:LinkButton ID="LinkButton3" Text="Download Posters for Vigilance Awareness Week - 2019" CssClass="font2"
                    Font-Underline="true" Font-Bold="true" ForeColor="Blue" CausesValidation="false" runat="server" OnClick="LinkButton3_Click"></asp:LinkButton>

            </div>
        </div>--%>
        <div class="row" style="padding-top: 10px; padding-bottom: 10px; margin: auto">
            <div class="col-md-10 col-lg-10 col-sm-10" style="padding-left: 30px" runat="server" align="left">
                <asp:Image ID="imgcw" runat="server" Height="100%" Width="35px" ImageAlign="Middle" ImageUrl="~/images/iconforCovid.png" Class="image-responsive" />
                <asp:LinkButton ID="lnkcoronawarriors" Text="  Click here to see Covid-19 Updates" CssClass="font2 blink_me"
                    Font-Underline="true" Font-Bold="true" ForeColor="Blue" CausesValidation="false" runat="server" OnClick="lnkcoronawarriors_Click">
                </asp:LinkButton>
            </div>
        </div>
        <div id="divcoronavac" runat="server" class="row" style="padding-top: 10px; padding-bottom: 10px; margin: auto">
            <div class="col-md-10 col-lg-10 col-sm-10" style="padding-left: 30px" runat="server" align="left">
                <asp:LinkButton ID="LinkButton3" Text="  Click here to fill the Covid-19 Vaccination Details" CssClass="font2 blink_me"
                    Font-Underline="true" Font-Bold="true" ForeColor="Blue" CausesValidation="false" runat="server" OnClick="LinkButton3_Click1">
                </asp:LinkButton>
            </div>
        </div>
        <div id="divreports" visible="true" runat="server" class="row" style="padding-top: 10px; padding-bottom: 10px; margin: auto">
            <div class="col-md-10 col-lg-10 col-sm-10" style="padding-left: 30px" runat="server" align="left">
                <asp:Image ID="Image5" runat="server" Height="100%" Width="35px" ImageAlign="Middle" ImageUrl="~/images/reports.png" Class="image-responsive" />
                <asp:LinkButton ID="lnkreport" Text=" Reports" CssClass="font2 blink_me"
                    Font-Underline="true" Font-Bold="true" ForeColor="Blue" CausesValidation="false" runat="server" OnClick="lnkreport_Click">
                </asp:LinkButton>
            </div>
        </div>
        <div id="divmanagemodules" visible="false" runat="server" class="row" style="padding-top: 10px; padding-bottom: 10px; margin: auto">
            <div class="col-md-10 col-lg-10 col-sm-10" style="padding-left: 30px" runat="server" align="left">
                <asp:Image ID="Image6" runat="server" Height="100%" Width="35px" ImageAlign="Middle" ImageUrl="~/images/softwareManagement.png" Class="image-responsive" />
                <asp:LinkButton ID="LinkButton8" Text="Manage Modules/Software" CssClass="font2 blink_me"
                    Font-Underline="true" Font-Bold="true" ForeColor="Blue" CausesValidation="false" runat="server" OnClick="LinkButton8_Click">
                </asp:LinkButton>
            </div>
        </div>
        <div style="border: medium ridge #000000; padding-top: 10px; padding-bottom: 10px; margin: auto 30px auto 30px">
            <div runat="server" align="left" style="padding-left: 20px; padding-bottom: 10px">
                <asp:Label ID="lblquicklinks" Text="Quick Links: " CssClass="font2" Font-Bold="true" Font-Underline="true" ForeColor="Black"
                    runat="server"></asp:Label>
                <div class="scrollnew">

                    <div class="row" style="padding-top: 10px; padding-bottom: 5px; margin: auto 5px auto 5px">

                        <div class="col-md-3 col-lg-3 col-sm-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">
                            <%--<asp:LinkButton ID="btnhome" runat="server" CssClass="btn grad4" CausesValidation="False" OnClick="btnhome_Click" > 
    <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span>

</asp:LinkButton>--%>


                            <asp:HyperLink ID="HyperLink2" runat="server" ToolTip="Navigate to Members in Association" Width="250px" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                NavigateUrl="https://hris.prasarbharati.org/it_associationdetails.aspx" Text="Members in Association" CssClass="btn grad4" Font-Bold="true" ForeColor="Black"
                                Target="_blank">
                            </asp:HyperLink>
                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3" style="padding-left: 0; padding-bottom: 10px" runat="server" align="center">
                            <asp:LinkButton ID="LinkButton7" Text="Frequency Schedule" CssClass="btn grad4" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="250px" Font-Bold="true" ForeColor="Black"
                                CausesValidation="false" runat="server" OnClick="LinkButton7_Click">
                            </asp:LinkButton>


                        </div>

                        <div class="col-md-3 col-lg-3 col-sm-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">
                            <div id="divemail" runat="server" visible="true">
                                <asp:HyperLink ID="HyperLink3" runat="server" ToolTip="https://email.gov.in" Width="250px" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                    NavigateUrl="https://email.gov.in" Text="E-Mail" CssClass="btn grad4" Font-Bold="true" ForeColor="Black"
                                    Target="_blank">
                                </asp:HyperLink>
                            </div>
                            <div id="divstnsecdirectory" runat="server" visible="false">
                                <asp:LinkButton ID="lnkstn_sec_directory" Text="Station/Section Directory" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                    CausesValidation="false" runat="server" OnClick="lnkstn_sec_directory_Click">
                                </asp:LinkButton>
                            </div>


                        </div>
                        <div class="col-md-3 col-lg-3 col-sm-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">

                            <asp:LinkButton ID="LinkButton5" Text="OSD(PB) Funds Release" Width="250px" Font-Bold="true" ForeColor="Black" CssClass="btn grad4" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                CausesValidation="false" runat="server" OnClick="LinkButton5_Click">
                            </asp:LinkButton>



                        </div>
                    </div>
                    <div id="divrow2" runat="server" class="row" visible="false" style="padding-top: 5px; padding-bottom: 10px; margin: auto 5px auto 5px">
                        <div id="divfeedbacknGrievances" class="col-md-3 col-lg-3 col-sm-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">
                            <div style="padding-top: 5px">
                                <asp:LinkButton ID="lnkgrievances" Text="Grievances" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                    CausesValidation="false" runat="server" Visible="False" OnClick="lnkgrievances_Click">
                                </asp:LinkButton>
                            </div>

                            <div>
                                <asp:LinkButton ID="lnkfeedbackreports" Text="Feedbacks" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                    CausesValidation="false" runat="server" OnClick="lnkfeedbackreports_Click" Visible="False">
                                </asp:LinkButton>
                            </div>


                        </div>

                        <div id="divboardmembers" class="col-md-3 col-lg-3 col-sm-3" visible="false" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">
                            <div>
                                <asp:LinkButton ID="LinkButton6" Text="Board Meeting" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                    CausesValidation="false" runat="server" OnClick="LinkButton6_Click">
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div id="divcoronawarriors" visible="false" class="col-md-3 col-lg-3 col-sm-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">
                            <div>
                                <asp:LinkButton ID="lnkcoronawarriorsAdd" Text="Update Covid-19 Details" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                    CausesValidation="false" runat="server" OnClick="lnkcoronawarriorsAdd_Click">
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div id="divcoronaexp" visible="false" class="col-md-3 col-lg-3 col-sm-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">
                            <div>
                                <asp:LinkButton ID="lnkcoronaexp" Text="Expenditure-Covid-19" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" Visible="false"
                                    CausesValidation="false" runat="server" OnClick="lnkcoronaexp_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px">
                                </asp:LinkButton>
                                <asp:LinkButton ID="lnkcoronaexpreport" Text="Expenditure-Covid-19" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" Visible="false"
                                    CausesValidation="false" runat="server" OnClick="lnkcoronaexpreport_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px">
                                </asp:LinkButton>
                            </div>
                        </div>

                        <div class="col-md-3 col-lg-3 col-sm-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">
                        </div>
                        <div id="divextra" class="col-md-3 col-lg-3 col-sm-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">
                        </div>
                        <div id="divpbhswelfare" class="col-lg-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center" visible="false">

                            <asp:LinkButton ID="lbpbhswelfare" Text="PBHS Card" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                CausesValidation="false" runat="server" Visible="true" OnClick="lnkpbhs_Click">
                            </asp:LinkButton>


                        </div>
                        <div id="divCommonDPC" class="col-lg-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center" visible="false">

                            <asp:LinkButton ID="LinkButton9" Text="Common DPC Generate Tool" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                CausesValidation="false" runat="server" Visible="true" OnClick="lnkcommondpc_Click">
                            </asp:LinkButton>


                        </div>
                    </div>
                    <div id="divemppanel" runat="server" visible="false" class="row" style="padding-top: 5px; padding-bottom: 10px; margin: auto 5px auto 5px">
                        <%--<div id="Grievances" class="col-md-3 col-lg-3 col-sm-3" style="padding-left: 20px; padding-bottom: 10px" runat="server" align="center">

                   
                </div>--%>
                        <div id="div5" class="col-lg-3 " style="padding-left: 0px; padding-bottom: 10px;" runat="server" align="center">


                            <asp:LinkButton ID="lnktransferApplication" Text="TRAM" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black"
                                BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" CausesValidation="false" runat="server" Visible="true"
                                OnClick="lnktransferApplication_Click" ToolTip="Transfer Request Application Module">
                            </asp:LinkButton>



                        </div>

                        <div id="divpbhs" class="col-lg-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center" visible="false">

                            <asp:LinkButton ID="lnkpbhs" Text="PBHS Card" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                CausesValidation="false" runat="server" Visible="true" OnClick="lnkpbhs_Click">
                            </asp:LinkButton>


                        </div>
                        <div id="divCommonDPC1" class="col-lg-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center" visible="false">

                            <asp:LinkButton ID="lnkcommondpc" Text="Common DPC Generate Tool" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                CausesValidation="false" runat="server" Visible="true" OnClick="lnkcommondpc_Click">
                            </asp:LinkButton>


                        </div>
                         <div id="div7" class="col-lg-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center" >

                            <asp:LinkButton ID="lnkemailmig" Text="Check Email Migration Status" CssClass="btn grad4" Width="250px" Font-Bold="true" ForeColor="Black" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                                CausesValidation="false" runat="server" Visible="true" OnClick="lnkemailmig_Click" >
                            </asp:LinkButton>


                        </div>
                        <%--   <div id="div10" class="col-lg-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">
                        </div>--%>
                        <div id="div4" class="col-lg-3" style="padding-left: 0px; padding-bottom: 10px" runat="server" align="center">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="padding: 0px 10px 10px 10px; margin: auto">


            <div class="col-md-10 col-lg-10 col-sm-10" style="padding-left: 20px">
                <div align="center" style="padding-top: 10px">
                    <div id="divforwhatsnew" runat="server" class="divwidth1 divforwhatsnew1 gradtab1 height1"
                        style="border: thin solid #000066; padding-top: 5px">
                        <div runat="server" align="center" class="whatnewheading" style="height: 30px; padding-top: 5px; padding-bottom: 3px">
                            <asp:Label ID="Label6" runat="server" Font-Bold="true" ForeColor="Black" class="font2"
                                Text="What's New" Style="font-family: Sans-Serif, Arial"></asp:Label>
                        </div>
                        <div align="right" style="padding-right: 10px;">
                            <asp:LinkButton ID="LinkButton4" Font-Bold="True" class="font2" runat="server" ForeColor="Blue"
                                ToolTip="All Orders/Circulars" CausesValidation="false" OnClick="LinkButton4_Click"
                                Font-Underline="False">
                                ...more</asp:LinkButton>
                        </div>
                        <div runat="server" style="padding-top: 7px">
                            <asp:GridView ID="grdwhatsnew" runat="server" DataKeyNames="Docid" AutoGenerateColumns="false"
                                AllowPaging="true" PageSize="25" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="98%"
                                ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnRowCommand="grdwhatsnew_RowCommand" OnRowDataBound="grdwhatsnew_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-Width="4%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Uploaded By" ItemStyle-Width="11%">
                                        <ItemTemplate>
                                            <div style="padding-left: 7px; padding-right: 5px" align="left">
                                                <asp:Label ID="lbluploader" Font-Italic="true" runat="server" Text='<%#Eval("UploaderName") %>'
                                                    class="fontingrid" Font-Bold="true" />
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Title/Subject" ItemStyle-Width="57%">
                                        <ItemTemplate>
                                            <div style="padding-left: 10px; padding-top: 7px; padding-bottom: 7px; padding-right: 10px">
                                                <asp:LinkButton ID="lnktitle" runat="server" ForeColor="Blue" CommandName="Download"
                                                    OnClientClick="return confirm('Your download activities will be logged. Do you still want to continue?');"
                                                    Font-Underline="false" Text='<%#Eval("Doc_Title") %>' class="font" Font-Bold="True"
                                                    CausesValidation="False" />
                                                <br />
                                                <asp:Label ID="lbluplon" runat="server" Text="Uploaded On" class="font" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                    class="fontingrid" Font-Bold="true" />
                                                ,&nbsp
                                                <asp:Label ID="Label1" runat="server" Text="Doc-Category" class="font" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="Label6" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="Label7" Font-Italic="true" runat="server" Text='<%#Eval("Doc_Type") %>'
                                                    class="fontingrid" Font-Bold="true" />
                                                <asp:Label ID="lbldoctypeid" runat="server" Text='<%#Eval("Doc_Typeid") %>' Visible="false"
                                                    class="fontingrid" />
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Order-No." ItemStyle-Width="12%">
                                        <ItemTemplate>
                                            <div style="padding-left: 5px; padding-right: 2px" align="left">
                                                <asp:Label ID="Label3" runat="server" Text='<%#Eval("Doc_OrderNo") %>' class="fontingrid"
                                                    ForeColor="Black" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dated" ItemStyle-Width="12%">
                                        <ItemTemplate>
                                            <div style="padding-left: 2px; padding-right: 2px" align="center">
                                                <asp:Label ID="Label11" runat="server" Text='<%#Eval("Doc_Dated", "{0:dd-MMM-yyyy}") %>'
                                                    class="fontingrid" ForeColor="Black" />
                                                <%--Text='<%# Eval("tDate", "{0:dd-MMM-yyyy}") %>'--%>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" CssClass="centerHeaderText font"
                                    Wrap="True"></HeaderStyle>
                                <RowStyle BackColor="#F7F7F7" Font-Bold="True" Height="30px" HorizontalAlign="Center"
                                    VerticalAlign="Middle" />
                                <PagerSettings Position="TopAndBottom" />
                                <PagerStyle BackColor="#E67E22" CssClass="cssPager pag" ForeColor="White" Font-Size="Small"
                                    HorizontalAlign="Left" VerticalAlign="Middle" Font-Bold="True" BorderColor="Black"
                                    BorderWidth="2" />
                            </asp:GridView>
                        </div>
                        <div align="right" style="padding-right: 10px; padding-bottom: 7px; padding-top: 7px">
                            <asp:LinkButton ID="LinkButton2" Font-Bold="True" class="font2" runat="server" ForeColor="Blue"
                                ToolTip="All Orders/Circulars" CausesValidation="false" OnClick="LinkButton2_Click"
                                Font-Underline="False">
                                ...more</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2 col-lg-2 col-sm-2  scrollnew" style="padding-top: 10px; padding-left: 13px; padding-right: 15px;">
                <table class="table text-center table-bordered height1 gradtab12" width="98%">
                    <tr id="trempphoto" runat="server" visible="false">
                        <td colspan="2">
                            <div align="center" style="padding: 5px 0px 5px 0px;">
                                <asp:Image ID="ImageButton3" runat="server" class="img-responsive" Height="85%" Width="80px"
                                    AlternateText="No Profile Photo" GenerateEmptyAlternateText="True" ImageAlign="Middle"
                                    ToolTip="Profile Photo" />
                                <div id="divempphotoupload" runat="server" align="center">
                                    <asp:LinkButton ID="lnkempupload" runat="server" data-target="#loginModal" data-toggle="modal"
                                        OnClick="lnkempupload_Click" ForeColor="Blue">
                                        Upload/Change Photo</asp:LinkButton>
                                </div>
                            </div>
                            <div class="xs-12">
                                <%-- data-keyboard="false" to prevent the Modal closing on clicking of escape Button--%>
                                <%-- data-backdrop="static" to prevent the Modal closing when clicking outside the Modal--%>
                                <div class="modal fade" data-keyboard="false" data-backdrop="static" id="loginModal"
                                    tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    &times;</button>
                                                <%--<asp:Button ID="Button1" runat="server" class="close" data-dismiss="modal" />--%>
                                                <h4 class="modal-title">Upload/Change Photo</h4>
                                            </div>
                                            <div class="modal-body" align="center">
                                                <div class="form-group">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                    <%--<br />
                                                <asp:Label ID="lblcaptchaemp" runat="server" Text="pri" Font-Bold="True" Font-Italic="True" Font-Size="17" ForeColor="Maroon"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="TextBox1" runat="server" Width="200px" Height="28px"></asp:TextBox>--%>
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
                        </td>
                    </tr>
                    <tr id="trstationphoto" runat="server" visible="false">
                        <td colspan="2">
                            <div align="center" style="padding: 5px 0px 5px 0px">
                                <asp:Image ID="imgstation" runat="server" class="img-responsive" Height="85%" ImageUrl='<%# Eval("") %>'
                                    Width="80px" AlternateText="No Profile Photo" GenerateEmptyAlternateText="True"
                                    ImageAlign="Middle" ToolTip="Profile Photo" />
                                <div id="divstnphotoupload" runat="server" align="center">
                                    <asp:LinkButton ID="lnkstnupload" data-target="#loginModal2" data-toggle="modal"
                                        runat="server" OnClick="lnkstnupload_Click" ForeColor="Blue">
                                        Upload/Change Photo</asp:LinkButton>
                                </div>
                            </div>
                            <div class="xs-12">
                                <%-- data-keyboard="false" to prevent the Modal closing on clicking of escape Button--%>
                                <%-- data-backdrop="static" to prevent the Modal closing when clicking outside the Modal--%>
                                <div class="modal fade" data-keyboard="false" data-backdrop="static" id="loginModal2"
                                    tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    &times;</button>
                                                <%--<asp:Button ID="Button1" runat="server" class="close" data-dismiss="modal" />--%>
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
                        </td>
                    </tr>
                    <tr id="trmanagementphoto" runat="server" visible="false">
                        <td colspan="2">
                            <div align="center" style="padding: 5px 0px 5px 0px">
                                <asp:Image ID="Image2" runat="server" class="img-responsive" Height="85%" ImageUrl='<%# Eval("") %>'
                                    Width="80px" AlternateText="No Profile Photo" GenerateEmptyAlternateText="True"
                                    ImageAlign="Middle" ToolTip="Profile Photo" />
                                <div id="div2" runat="server" align="center">
                                    <asp:LinkButton ID="LinkButton1" data-target="#loginModal3" data-toggle="modal" runat="server"
                                        ForeColor="Blue">
                                        Upload/Change Photo</asp:LinkButton>
                                </div>
                            </div>
                            <div class="xs-12">
                                <%-- data-keyboard="false" to prevent the Modal closing on clicking of escape Button--%>
                                <%-- data-backdrop="static" to prevent the Modal closing when clicking outside the Modal--%>
                                <div class="modal fade" data-keyboard="false" data-backdrop="static" id="loginModal3"
                                    tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">
                                                    &times;</button>
                                                <%--<asp:Button ID="Button1" runat="server" class="close" data-dismiss="modal" />--%>
                                                <h4 class="modal-title">Upload/Change Photo</h4>
                                            </div>
                                            <div class="modal-body" align="center">
                                                <div class="form-group">
                                                    <asp:FileUpload ID="FileUpload3" runat="server" />
                                                    <br />
                                                    <asp:Label ID="Label56" ForeColor="Red" Font-Italic="true" Font-Size="Small" runat="server"
                                                        Text="* Image Size should be between 20kB to 50 kB"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label57" ForeColor="Red" Font-Italic="true" Font-Size="Small" runat="server"
                                                        Text="* Image Dimensions should be between 0-230px X 0-200px."></asp:Label>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <asp:Button ID="Button5" runat="server" class="btn btn-primary" Text="Upload" OnClick="Button5_Click"
                                                    CausesValidation="False" />
                                                <asp:Button ID="Button4" runat="server" class="btn btn-primary" data-dismiss="modal"
                                                    CausesValidation="False" Text="Close" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr id="divgrievanceemployee" runat="server">
                        <td colspan="2" align="center">
                            <asp:ImageButton ID="imggrievance" runat="server" class="img-responsive imground" Enabled="false"
                                Height="40px" ImageUrl="~/images/Grievance3.png" Width="40px" ToolTip="File your Grievances"
                                alt="Grievances" CausesValidation="False" OnClick="imggrievance_Click" />
                            <br />
                            <asp:Label ID="Label4" runat="server" Text="Grievances <br> [Under developement]" Style="font-weight: bold; color: Black"
                                class="font"></asp:Label>
                        </td>
                    </tr>
                    <tr id="divgemprocurements" runat="server" visible="false">
                        <td colspan="2" align="center">
                            <asp:ImageButton ID="imggemprocurement" runat="server" class="img-responsive imground"
                                Height="40px" ImageUrl="~/images/gem.png" Width="40px" ToolTip="GeM Procurement Entry"
                                alt="GeM Procurement Entry" CausesValidation="False" OnClick="imggemprocurement_Click" />
                            <asp:Label ID="Label23" runat="server" Text="GeM Statements" Style="font-weight: bold; color: Black"
                                class="font"></asp:Label>
                        </td>
                    </tr>
                    <tr id="divDPC" runat="server" visible="false">
                        <td colspan="2" align="center">
                            <asp:ImageButton ID="imgdpc" runat="server" class="img-responsive imground" Height="40px"
                                ImageUrl="~/images/promotion23.png" Width="40px" ToolTip="DPC Status Entry" alt="DPC Status"
                                CausesValidation="False" OnClick="imgdpc_Click" />
                            <asp:Label ID="Label22" runat="server" Text="DPC Status" Style="font-weight: bold; color: Black"
                                class="font"></asp:Label>
                        </td>
                    </tr>
                    <tr id="divcommercialrevenueimg" visible="false" runat="server">
                        <td colspan="2" align="center">
                            <asp:ImageButton ID="imgcomrevenue" runat="server" class="img-responsive imground"
                                ImageUrl="~/images/commercialrevenue(2).jpg" ToolTip="Commercial Revenue Entry"
                                Height="40px" Width="40px" alt="Commercial Revenue Entry" CausesValidation="False" OnClick="imgcomrevenue_Click" />
                            <asp:Label ID="Label24" runat="server" Text="Commercial Revenue" Style="font-weight: bold; color: Black"
                                class="font"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Image ID="ImageButton4" runat="server" class="img-responsive imground" Height="40px"
                                data-target="#loginModal42" data-toggle="modal" ImageUrl="~/images/birt3.png"
                                Width="40px" ToolTip="Today's Birthday" alt="Birthday" />
                            <asp:Label ID="lblbday" runat="server" Text="Today's Birthday" Style="font-weight: bold; color: Black"
                                class="font"></asp:Label>
                            <div class="modal fade" data-keyboard="false" data-backdrop="static" id="loginModal42"
                                tabindex="-1">
                                <div class="modal-dialog">
                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                        <ContentTemplate>
                                            <div class="modal-content gradbody">
                                                <div class="modal-header">
                                                    <button type="button" style="font-weight: bold; color: Black" class="close" data-dismiss="modal"
                                                        onclick="clearmodal()">
                                                        &times;</button>
                                                    <%--<asp:Button ID="Button1" runat="server" class="close" data-dismiss="modal" />--%>
                                                    <%-- <h4 class="modal-title" style="font-weight: bold; color: Black">
                                                        Today Birthdays</h4>--%>
                                                </div>
                                                <div class="modal-body">
                                                    <span class="popuptext" id="Span2">
                                                        <div class="form-group">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading grad3">
                                                                    <span style="color: Black; font-weight: 700" class="font2">:: Today Birthdays ::</span>
                                                                </div>
                                                                <div class="panel-body grad2 table-responsive">
                                                                    <asp:GridView ID="grdbday" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#61A6F8"
                                                                        HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center"
                                                                        HeaderStyle-VerticalAlign="Middle" EmptyDataText="  Opps...No BirthDays Today  "
                                                                        ShowHeaderWhenEmpty="True" Width="90%" ForeColor="#333333" BorderStyle="Solid"
                                                                        BorderWidth="2px">
                                                                        <AlternatingRowStyle BackColor="White" />
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No.">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Name Of Employee">
                                                                                <ItemTemplate>
                                                                                    <div style="padding: 10px">
                                                                                        <asp:Label ID="lnkbdayname" runat="server" ForeColor="Black" Text='<%#Eval("fullname") %>'
                                                                                            class="font" Font-Bold="True" />
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" CssClass="leftHeaderText fontingrid"
                                                                            Wrap="True"></HeaderStyle>
                                                                        <RowStyle BackColor="#EFF3FB" Font-Bold="True" Height="30px" HorizontalAlign="Center"
                                                                            VerticalAlign="Middle" />
                                                                        <PagerSettings Position="TopAndBottom" />
                                                                        <PagerStyle BackColor="#E67E22" CssClass="cssPager pag" ForeColor="White" Font-Size="Small"
                                                                            HorizontalAlign="Left" VerticalAlign="Middle" Font-Bold="True" BorderColor="Black"
                                                                            BorderWidth="2" />
                                                                    </asp:GridView>
                                                                    <div align="right" style="padding: 10px">
                                                                        <asp:LinkButton ID="lnkmorebirthday" CausesValidation="false" Font-Bold="true" class="font2"
                                                                            ForeColor="Blue" runat="server" ToolTip="Birthday List" OnClick="lnkmorebirthday_Click">
                                                                            ...more</asp:LinkButton>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </span>
                                                </div>
                                                <div class="modal-footer">
                                                    <asp:Button ID="Button7" runat="server" class="btn grad4" data-dismiss="modal" Font-Bold="true"
                                                        OnClick="Button6_Click" Text="Close" CausesValidation="false" OnClientClick="clearmodal();" />
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <%--<div class="popup" onclick="popupfunction2()">--%>
                            <asp:Image ID="Image4" runat="server" class="img-responsive imground" Height="40px"
                                data-target="#loginModal41" data-toggle="modal" ImageUrl="~/images/ret23.png"
                                Width="40px" ToolTip="Retiring this Month" alt="Retirements" />
                            <asp:Label ID="Label18" runat="server" Text="Retiring this Month" Style="font-weight: bold; color: Black"
                                class="font"></asp:Label>
                            <div class="modal fade" data-keyboard="false" data-backdrop="static" id="loginModal41"
                                tabindex="-1">
                                <div class="modal-dialog">
                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                        <ContentTemplate>
                                            <div class="modal-content gradbody">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" onclick="clearmodal()">
                                                        &times;</button>
                                                    <%--<asp:Button ID="Button1" runat="server" class="close" data-dismiss="modal" />--%>
                                                    <%--   <h4 class="modal-title" style="font-weight: bold; color: Black">
                                                       Retiring this Month </h4>--%>
                                                </div>
                                                <div class="modal-body">
                                                    <span class="popuptext" id="Span1">
                                                        <div class="form-group">
                                                            <div class="panel panel-primary">
                                                                <div class="panel-heading grad3">
                                                                    <span style="color: Black; font-weight: 700" class="font2">:: Retiring this Month ::</span>
                                                                </div>
                                                                <div class="panel-body grad2 table-responsive">
                                                                    <asp:GridView ID="grdretirement" runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#61A6F8"
                                                                        HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center"
                                                                        HeaderStyle-VerticalAlign="Middle" EmptyDataText="  Happy to Inform you that No Retirement(s) This Month  "
                                                                        ShowHeaderWhenEmpty="True" Width="90%" ForeColor="#333333" BorderStyle="Solid"
                                                                        BorderWidth="2px">
                                                                        <AlternatingRowStyle BackColor="White" />
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="S.No.">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Name Of Employee">
                                                                                <ItemTemplate>
                                                                                    <div style="padding: 10px">
                                                                                        <asp:Label ID="lnkretname" runat="server" ForeColor="Black" Text='<%#Eval("fullname") %>'
                                                                                            class="font" Font-Bold="True" />
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                                <ItemStyle HorizontalAlign="Left" />
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </asp:TemplateField>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" CssClass="leftHeaderText fontingrid"
                                                                            Wrap="True"></HeaderStyle>
                                                                        <RowStyle BackColor="#EFF3FB" Font-Bold="True" Height="30px" HorizontalAlign="Center"
                                                                            VerticalAlign="Middle" />
                                                                        <PagerSettings Position="TopAndBottom" />
                                                                        <PagerStyle BackColor="#E67E22" CssClass="cssPager pag" ForeColor="White" Font-Size="Small"
                                                                            HorizontalAlign="Left" VerticalAlign="Middle" Font-Bold="True" BorderColor="Black"
                                                                            BorderWidth="2" />
                                                                    </asp:GridView>
                                                                    <div align="right" style="padding: 10px">
                                                                        <asp:LinkButton ID="lnkretmore" Font-Bold="true" runat="server" class="font2" ForeColor="Blue"
                                                                            ToolTip="Retirement List" CausesValidation="false" OnClick="lnkretmore_Click">
                                                                            ...more</asp:LinkButton>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </span>
                                                </div>
                                                <div class="modal-footer">
                                                    <asp:Button ID="Button3" runat="server" class="btn grad4" data-dismiss="modal" Font-Bold="true"
                                                        OnClick="Button6_Click" Text="Close" CausesValidation="false" OnClientClick="clearmodal();" />
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <%-- <span class="popuptext" id="myPopup2">
                                    <div class="divp">
                                        <br />
                                        <div align="center">
                                            <h5 style="color: #922B21; font-weight: bold">
                                                Retiring this Month</h5>
                                        </div>
                                        
                                    </div>
                                </span>--%>
                            <%--  </div>--%>
                        </td>
                    </tr>
                    <tr id="Tr1">
                        <td colspan="2" align="center">
                            <asp:Image ID="Image51" runat="server" data-target="#loginModal4" data-toggle="modal"
                                class="img-responsive imground" Height="40px" ImageUrl="~/images/SearchEmployee.png"
                                Width="40px" ToolTip="Search Employee" alt="Search Employee" />
                            <asp:Label ID="Label19" runat="server" Text="Search Employee" Style="font-weight: bold; color: Black"
                                class="font"></asp:Label>
                            <div class="modal fade" data-keyboard="false" data-backdrop="static" id="loginModal4"
                                tabindex="-1">
                                <div class="modal-dialog">
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <div class="modal-content gradbody">
                                                <div class="modal-header">
                                                    <button type="button" style="color: Black" class="close" data-dismiss="modal" onclick="clearmodal()">
                                                        &times;</button>
                                                    <%--<asp:Button ID="Button1" runat="server" class="close" data-dismiss="modal" />--%>
                                                    <h4 class="modal-title" style="font-weight: bold; color: Black">Search Employee</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <asp:Label ID="lblnamesearch" ForeColor="Black" Font-Bold="true" class=" font2" runat="server"
                                                            Text="Name"></asp:Label>
                                                        &nbsp;
                                                        <asp:TextBox ID="txtemployee" class="select widthofboxes1 font2" runat="server" Height="22px"
                                                            BackColor="#F2F4F4" ForeColor="Black" ClientIDMode="Static">
                                                        </asp:TextBox>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" class=" fontingrid"
                                                            runat="server" ErrorMessage="Atleast 3 Chracters Reqd!!" Style="color: #FF0000; font-weight: 700;"
                                                            ControlToValidate="txtemployee" ValidationExpression="^[\s\S\d]{3,100}$"
                                                            Display="Dynamic" SetFocusOnError="True">
                                                        </asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Reqd.."
                                                            class=" fontingrid" ControlToValidate="txtemployee" ForeColor="Red" SetFocusOnError="True"
                                                            Style="font-size: small; font-weight: 700;" Display="Dynamic">
                                                        </asp:RequiredFieldValidator>
                                                        &nbsp;&nbsp;
                                                        <asp:Button ID="Button23" runat="server" class="btn grad4" Text="Search" Style="font-weight: bold"
                                                            OnClick="Button23_Click" />
                                                        <asp:Label ID="Label25" runat="server" Text="Label" Visible="false"></asp:Label>
                                                        <br />
                                                        <br />
                                                        <div id="divgrd" runat="server" visible="false" class="row" clientidmode="Static">
                                                            <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div5">
                                                    </div>--%>
                                                            <div align="center" class=" col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server"
                                                                id="div6">
                                                                <div class="panel panel-primary">
                                                                    <%--<div class="panel-heading" style="background-color: #3393FF">
                        <span style="font-size: medium; font-weight: 700">:: Employee Details ::</span></div>--%>
                                                                    <%--<br />--%>
                                                                    <div class="panel-body grad2 table-responsive">
                                                                        <%-- <div style="text-align: center">
                          
                        <asp:LinkButton ID="btnprint1" Style="background-color: #F1948A" runat="server" 
                                CssClass="btn" CausesValidation="False"> <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>                   
                        </div>--%>
                                                                        <asp:GridView ID="grddoc" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                                                            PageSize="20" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .."
                                                                            ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid"
                                                                            BorderWidth="2px" OnPageIndexChanging="grddoc_PageIndexChanging">
                                                                            <AlternatingRowStyle BackColor="White" />
                                                                            <Columns>
                                                                                <asp:TemplateField HeaderText="S.No.">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="lblSNo" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Name">
                                                                                    <ItemTemplate>
                                                                                        <div style="padding-left: 10px">
                                                                                            <asp:Label ID="lblnamegrd" ForeColor="Black" class="font2" runat="server" Text='<%#Eval("Nameofemployee") %>'
                                                                                                Font-Bold="True" CausesValidation="False" />
                                                                                            <br />
                                                                                            <%--<asp:Label ID="Label1" runat="server" Text="(" Font-Size="Smaller" />
                                        <asp:Label ID="lbldoctypename1" runat="server" Text='<%#Eval("Doc_Type") %>' Font-Size="Smaller" />
                                        <asp:Label ID="Lbbrac" runat="server" Text=")" Font-Size="Smaller" />--%>
                                                                                            <asp:Label ID="Label1" runat="server" ForeColor="Black" class="fontingrid" Text="(" />
                                                                                            <asp:Label ID="lbldesgngrd" Font-Italic="true" runat="server" Text='<%#Eval("DesignationName") %>'
                                                                                                ForeColor="Black" class="fontingrid" />
                                                                                            <asp:Label ID="Lbbrac" runat="server" Text=")" ForeColor="Black" class="fontingrid" />
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Station/Office">
                                                                                    <ItemTemplate>
                                                                                        <div style="padding-left: 10px">
                                                                                            <%-- <asp:Label ID="Label2" runat="server" Text="Order No." Font-Size="Smaller" />
                                        <asp:Label ID="Label5" runat="server" Text=" : " Font-Size="Smaller" />--%>
                                                                                            <asp:Label ID="lbloffc" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("NameofStation") %>' />
                                                                                            <%--<br />
                                        <asp:Label ID="Label6" runat="server" Text="File No." Font-Size="Smaller" />
                                        <asp:Label ID="Label7" runat="server" Text=" : " Font-Size="Smaller" />
                                        <asp:Label ID="Label8" runat="server" Text='<%#Eval("Doc_FileNo") %>' Font-Size="Smaller" />--%>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Left" />
                                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                                <asp:TemplateField HeaderText="Office LL">
                                                                                    <ItemTemplate>
                                                                                        <%--<asp:Label ID="Label9" runat="server" Text="Dated" Font-Size="Smaller" />
                                        <asp:Label ID="Label10" runat="server" Text=" : " Font-Size="Smaller" />--%>
                                                                                        <asp:Label ID="lblll" runat="server" Text='<%#Eval("llnum") %>' ForeColor="Black"
                                                                                            class="fontingrid" />
                                                                                        <%--Text='<%# Eval("tDate", "{0:dd-MMM-yyyy}") %>'--%>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle HorizontalAlign="Center" />
                                                                                </asp:TemplateField>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" />
                                                                            <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center"
                                                                                CssClass="centerHeaderText fontingrid" Wrap="True"></HeaderStyle>
                                                                            <PagerSettings Position="TopAndBottom" />
                                                                            <PagerStyle BackColor="#E67E22" CssClass="cssPager pag" ForeColor="White" Font-Size="Small"
                                                                                HorizontalAlign="Left" VerticalAlign="Middle" Font-Bold="True" BorderColor="Black"
                                                                                BorderWidth="2" />
                                                                            <RowStyle BackColor="#EFF3FB" Font-Bold="True" Height="30px" HorizontalAlign="Center"
                                                                                VerticalAlign="Middle" />
                                                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                                            <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                                        </asp:GridView>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%-- <div align="center" class=" col-md-2 col-sm-2 col-lg-2" runat="server" id="div7">
                                                    </div>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <asp:Button ID="Button6" runat="server" class="btn grad4" data-dismiss="modal" Font-Bold="true"
                                                        OnClick="Button6_Click" Text="Close" CausesValidation="false" OnClientClick="clearmodal();" />
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:ImageButton ID="ImageButton2" runat="server" class="img-responsive" Height="40px"
                                ImageUrl="~/images/cal3.png" Width="40px" ToolTip="Click here to download PB Calender"
                                alt="Cal.." OnClick="ImageButton2_Click" CausesValidation="False" />
                            <asp:Label ID="Label20" runat="server" Text="PB Calender" Style="font-weight: bold; color: Black"
                                class="font"></asp:Label>
                        </td>
                    </tr>
                    <tr id="divapprove" runat="server" visible="false">
                        <td colspan="2" align="center">
                            <asp:ImageButton ID="ImageButton1" runat="server" class="img-responsive imground"
                                Height="40px" ImageUrl="~/images/approve2.png" Width="40px" ToolTip="Approve the Images,Quotes & Others"
                                alt="Approve" OnClick="ImageButton1_Click" CausesValidation="False" />
                            <asp:Label ID="Label21" runat="server" Text="Approve" Style="font-weight: bold; color: Black"
                                class="font"></asp:Label>
                        </td>
                    </tr>
                    <%-- <tr id="divgemprocurementsreports" runat="server" visible="false">
                        <td colspan="2" align="center">
                            <asp:ImageButton ID="imggemprocreports" runat="server" class="img-responsive imground" Height="40px"
                                ImageUrl="~/images/gem.png" Width="40px" 
                                ToolTip="GEM Procurement Reports" alt="GEM Proc Reports"
                                CausesValidation="False" OnClick="imggemprocreports_Click" />
                                <asp:Label ID="Label24" runat="server" Text="GEM Procurement Reports" Style="font-weight: bold; color: Black" class="font"></asp:Label>
                        </td>
                    </tr>--%>
                    <%--<tr id="divhos" runat="server" visible="false">
                        <td colspan="2" align="center">
                            <asp:ImageButton ID="imghos" runat="server" class="img-responsive imground"
                                Height="44px" ImageUrl="~/images/history.jpg" Width="44px" ToolTip="Approve the Images,Quotes & Others"
                                alt="History of Service" CausesValidation="False" onclick="imghos_Click" />
                        </td>
                    </tr>--%>
                </table>
            </div>
        </div>
        <div class="row" style="padding: 0px 28px 10px 27px; margin: auto">
            <%--  <div class="col-md-1 col-lg-1 col-sm-1 col-xs-1 text-center">
            </div>--%>
            <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12 text-center" style="padding: 16px 0px 15px 0px">
                <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000">
                    <div class="carousel-inner" align="center">
                        <%--Wrapper for slides--%>
                        <asp:Repeater ID="Rgallary" runat="server">
                            <ItemTemplate>
                                <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %>">
                                    <asp:Image ID="Image3" runat="server" ImageUrl='<%#Eval("imagepath").ToString()%>'
                                        Width="100%" Height="380px" />
                                    <%--      <img src="<%# Eval("imagepath").ToString() %>" />--%>
                                    <div class="carousel-caption" align="center">
                                        <%--  <asp:Label ID="lblsub" runat="server" Text="Subject" Font-Bold="True" Font-Size="Medium"
                                                ForeColor="White"></asp:Label>
                                            <br />--%>
                                        <asp:Label ID="lblcaption" runat="server" Text='<%#Eval("PicDescription") %>' Font-Bold="True"
                                            Font-Size="Large" ForeColor="White"></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span><span class="sr-only">Previous</span>
                        </a><a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span><span class="sr-only">Next</span>
                        </a>
                    </div>
                    <%--  //This is used for manual navigation like for next or previous--%>
                </div>
            </div>
            <%--<div class="col-md-1 col-lg-1 col-sm-1 col-xs-1 text-center">
            </div>--%>
        </div>
        <div class="row containerdiv paddingforCEOdash" style="margin: auto;">
            <%--CEO--%>
            <%--check for new message profile of CEO and other management--%>
            <div class="col-lg-4 col-md-4 col-sm-4 paddingCEObot">
                <div id="divceon" runat="server" class="card scrollnew gradformessage" style="padding: 20px">
                    <div align="center">
                        <asp:Image ID="imgceo" runat="server" class="img-responsive" ImageUrl='<%# Eval("") %>'
                            Height="160px" Width="150px" AlternateText="CEO" GenerateEmptyAlternateText="True"
                            ImageAlign="Middle" ToolTip="CEO" />
                    </div>
                    <div class="container11">
                        <div align="center">
                            <div style="padding-top: 10px; padding-bottom: 5px">
                                <asp:Label ID="lblnameCEO" class="font2" Font-Bold="true" runat="server" Text=""></asp:Label>
                            </div>
                            <div style="padding-top: 0px; padding-bottom: 13px">
                                <asp:Label ID="Label39" class="font2" Font-Bold="true" runat="server" Text="Chief Executive Officer"></asp:Label>
                                <%--<h2>Shashi Shekhar Vempati</h2>--%>
                            </div>
                            <p class="title">
                                <span style="color: Blue; font-weight: bold; font-size: smaller; text-decoration: underline">Message from the Office of CEO</span>
                            </p>
                        </div>
                        <div id="divceo" runat="server" visible="false" align="center" style="padding-bottom: 7px">
                            <asp:LinkButton ID="btnaddnew" Style="background-color: #F1948A" runat="server" CssClass="btn"
                                CausesValidation="False" OnClick="btnaddnew_Click" Font-Underline="False">
                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-plus-sign"></span>&nbsp; <span style="font-weight: bold; color: #000000">Add/Change Message</span></asp:LinkButton>
                        </div>
                        <div style="border: medium ridge #000000; padding: 7px; min-height: 130px">
                            <asp:Label ID="lblceomessage" ForeColor="Black" class="font2" Font-Bold="true" runat="server"
                                Text=""></asp:Label>
                            <br />

                            <div id="divviewdoc" runat="server" visible="false" align="right" style="padding-right: 10px">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:LinkButton ID="lnkviewdoc" Font-Bold="True" Font-Size="Smaller" ForeColor="Blue"
                                            runat="server" ToolTip="View/Download" OnClick="lnkviewdoc_Click" CausesValidation="False"
                                            Font-Underline="False">
                                            <span aria-hidden="true" style="color: Black"></span>&nbsp;...View/Download</asp:LinkButton>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="lnkviewdoc" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                </asp:UpdateProgress>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>
                </div>

            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 paddingCEObot">
                <%--DGAIR--%>
                <div id="div1" runat="server" class="card scrollnew gradformessage" style="padding: 20px">
                    <div align="center">
                        <asp:Image ID="imgdgair" runat="server" class="img-responsive" ImageUrl='<%# Eval("") %>'
                            Height="160px" Width="150px" AlternateText="DG:AIR" GenerateEmptyAlternateText="True"
                            ImageAlign="Middle" ToolTip="DG:AIR" />
                    </div>
                    <div class="container11">
                        <div align="center">
                            <div style="padding-top: 10px; padding-bottom: 5px">
                                <asp:Label ID="lblDGAIRname" class="font2" Font-Bold="true" runat="server" Text=""></asp:Label>
                            </div>
                            <div style="padding-top: 0px; padding-bottom: 13px">
                                <asp:Label ID="Label40" class="font2" Font-Bold="true" runat="server" Text="DG:AIR"></asp:Label>
                                <%--<h2>Shashi Shekhar Vempati</h2>--%>
                            </div>
                            <p class="title">
                                <span style="color: Blue; font-weight: bold; font-size: smaller; text-decoration: underline">Message from the Office of DG:AIR</span>
                            </p>
                        </div>
                        <div id="divdgair" runat="server" visible="false" align="center">
                            <asp:LinkButton ID="lnkdgair" Style="background-color: #F1948A" runat="server" CssClass="btn"
                                CausesValidation="False" Font-Underline="False" OnClick="lnkdgair_Click">
                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-plus-sign"></span>&nbsp; <span style="font-weight: bold; color: #000000">Add/Change Message</span></asp:LinkButton>
                        </div>
                        <div style="border: medium ridge #000000; padding: 7px; min-height: 130px">
                            <asp:Label ID="lbldgair" ForeColor="Black" class="font2" Font-Bold="true" runat="server"
                                Text=""></asp:Label>
                            <br />

                            <div id="divviewdgair" runat="server" visible="false" align="right" style="padding-right: 10px">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <asp:LinkButton ID="lnkviewdgair" Font-Bold="True" Font-Size="Smaller" ForeColor="Blue"
                                            runat="server" ToolTip="View/Download" OnClick="lnkviewdgair_Click" CausesValidation="False"
                                            Font-Underline="False">
                                            ...View/Download</asp:LinkButton>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="lnkviewdgair" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                </asp:UpdateProgress>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 paddingCEObot">
                <div id="div3" runat="server" class="card scrollnew gradformessage" style="padding: 20px">
                    <div align="center">
                        <asp:Image ID="imgdgdd" runat="server" class="img-responsive" ImageUrl='<%# Eval("") %>'
                            Height="160px" Width="150px" AlternateText="DG:DD" GenerateEmptyAlternateText="True"
                            ImageAlign="Middle" ToolTip="DG:DD" />
                    </div>
                    <div class="container11">
                        <div align="center">
                            <div style="padding-top: 10px; padding-bottom: 5px">
                                <asp:Label ID="lbldgddn" class="font2" Font-Bold="true" runat="server" Text=""></asp:Label>
                            </div>
                            <div style="padding-top: 0px; padding-bottom: 13px">
                                <asp:Label ID="Label41" class="font2" Font-Bold="true" runat="server" Text="DG:DD"></asp:Label>
                            </div>
                            <p class="title">
                                <span style="color: Blue; font-weight: bold; font-size: smaller; text-decoration: underline">Message from the Office of DG:DD</span>
                            </p>
                        </div>
                        <div id="divdgdd" runat="server" visible="false" align="center">
                            <asp:LinkButton ID="lnkdgdd" Style="background-color: #F1948A" runat="server" CssClass="btn"
                                CausesValidation="False" OnClick="btnaddnew_Click" Font-Underline="False">
                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-plus-sign"></span>&nbsp; <span style="font-weight: bold; color: #000000">Add/Change Message</span></asp:LinkButton>
                        </div>
                        <div style="border: medium ridge #000000; padding: 7px; min-height: 130px">
                            <asp:Label ID="lbldgdd" ForeColor="Black" class="font2" Font-Bold="true" runat="server"
                                Text=""></asp:Label>
                            <br />

                            <div id="divviewdgdd" runat="server" visible="false" align="right" style="padding-right: 10px">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <asp:LinkButton ID="lnkviewdgdd" Font-Bold="True" Font-Size="Smaller" ForeColor="Blue"
                                            runat="server" ToolTip="View/Download" OnClick="lnkviewdgdd_Click" CausesValidation="False"
                                            Font-Underline="False">
                                            <span aria-hidden="true" style="color: Black"></span>&nbsp;...View/Download</asp:LinkButton>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="lnkviewdgdd" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:UpdateProgress ID="UpdateProgress3" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                </asp:UpdateProgress>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
