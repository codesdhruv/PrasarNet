<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetaPDF_Grievance.aspx.cs" Inherits="PrasarNet.GetaPDF_Grievance" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--link of style sheet--%>
    <link rel="stylesheet" href="style/responsive.css" type="text/css" media="screen" />
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js"></script>
    <style type="text/css">
        .btncomplete {
            background-color: greenyellow;
        }

        .btnpending {
            background-color: orangered;
        }

        .underline {
            text-decoration: underline;
        }

        .nounderline {
            text-decoration: none;
        }

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

        .blink_me {
            animation: blinker 4s linear infinite;
        }

        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }

        .auto-style3 {
            height: 47px;
        }

        .auto-style4 {
            color: #0000FF;
            font-size: small;
        }

        .font2 {
            font-weight: 700;
        }

        .modalPopup {
            background: linear-gradient(to right, #E5E7E9, #F8F9F9);
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

    </script>
    <script type="text/javascript">

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
    </div>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">

    <div class="content gradbody" style="margin-bottom: 150px">
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
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" style="">
                <div runat="server" align="right" style="padding-right: 0px; padding-bottom: 10px; padding-top: 15px">
                    <asp:Button ID="btnback" runat="server" Text=" Back " class="btn select buttondocumentupload font2 grad4"
                        Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btnback_Click" />
                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
        </div>
        <div class="row" style="margin: auto">

            <div id="divforwardedaction" runat="server" align="center" style="padding: 20px;">
                <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
                <div align="center" class=" col-md-10 col-sm-10 col-lg-10" style="padding: 20px; border: medium groove #000000;">

                    <div align="center" style="padding: 10px">
                        <div align="left" style="padding-left: 50px">
                            <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Text="Label" Visible="False"></asp:Label>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Get a pdf" class="btn grad4 font2" ForeColor="Black" OnClick="Button1_Click1" />

                    </div>
                    <div align="left" style="padding: 10px" class="table-responsive">

                        <asp:Label ID="Label22" runat="server" Text="Details of Grievance having Grievance Reference Id " ForeColor="Black" class="font"
                            Style="font-weight: bold;"></asp:Label>
                        <asp:Label ID="Label23" runat="server" Text="" ForeColor="Black" class="font"
                            Style="font-weight: bold;"></asp:Label>
                        <br />
                    </div>
                    <br />
                    <table class="table table-bordered modalPopup" style="padding: 8px; vertical-align: top;" border="2" rules="all" title="Grievance:PrasarNet">
                        <tr>
                            <td width="5%" align="center" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label13" runat="server" Text="1." ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="30%" align="left" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label20" runat="server" Text="Grievance" ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="65%" align="left" style="padding-left: 15px; padding-top: 10px" class="auto-style3">
                                <asp:Label ID="lblgrievance" runat="server" Text="" CssClass="font2" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td width="5%" align="center" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label16" runat="server" Text="2." ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="30%" align="left" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label3" runat="server" Text="Grievance Regd On" ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="65%" align="left" style="padding-left: 15px; padding-top: 10px" class="auto-style3">
                                <asp:Label ID="lbldateofGrie" runat="server" Text="" CssClass="font2" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%" align="center" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label24" runat="server" Text="3." ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="30%" align="left" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label25" runat="server" Text="Department/Section for which Grievance has been raised (as quoted by Complainant)" ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="65%" align="left" style="padding-left: 15px; padding-top: 10px" class="auto-style3">
                                <asp:Label ID="Label26" runat="server" Text="" CssClass="font2" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <td width="5%" align="center" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label17" runat="server" Text="4." ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="30%" align="left" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label4" runat="server" Text="Status" ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="65%" align="left" style="padding-left: 15px; padding-top: 10px" class="auto-style3">
                                <asp:Label ID="lblstatus" runat="server" Text="" CssClass="font2" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%" align="center" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label18" runat="server" Text="5." ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="30%" align="left" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label5" runat="server" Text="Name Of Complainant" ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="65%" align="left" style="padding-left: 15px; padding-top: 10px" class="auto-style3">
                                <asp:Label ID="Label7" runat="server" Text="" CssClass="font2" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%" align="center" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label19" runat="server" Text="6." ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="30%" align="left" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label8" runat="server" Text="Email Of Complainant" ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="65%" align="left" style="padding-left: 15px; padding-top: 10px" class="auto-style3">
                                <asp:Label ID="Label9" runat="server" Text="" CssClass="font2" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="5%" align="center" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label21" runat="server" Text="7." ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="30%" align="left" style="vertical-align: top; padding-top: 10px; padding-left: 15px" class="auto-style3">
                                <asp:Label ID="Label11" runat="server" Text="Mobile No Of Complainant" ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp; </td>
                            <td width="65%" align="left" style="padding-left: 15px; padding-top: 10px" class="auto-style3">
                                <asp:Label ID="Label12" runat="server" Text="" CssClass="font2" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
            </div>
        </div>
    </div>
</asp:Content>
