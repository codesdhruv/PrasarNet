<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OfficeDetails.aspx.cs" Inherits="PrasarNet.Sta_Sec_Det.OfficeDetails" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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
        fieldset {
            background: linear-gradient(to right, #D5DBDB, #CACFD2);
            -webkit-radial-gradient;
            border-color: black;
        }

            fieldset legend {
                font-size: 18px;
                background: linear-gradient(to right, #E67E22, #E67E22);
                color: white;
                padding: 5px 10px;
                border: 1px solid #000;
                padding-left: calc(50% - 45px - 18px);
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

        .gradnewbutton2 {
            background: linear-gradient(to right, #F99B62, #E67E22);
            -webkit-radial-gradient;
        }

        .aligncenter {
            align-content: center;
            text-align: center;
        }

        .alignleft {
            align-content: flex-start;
            text-align: left;
        }

        .alignright {
            align-content: flex-end;
            text-align: right;
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
        function myfunc(val) {
            var orgDdl = document.getElementById('ddldesgnfrom');
            var org2ddl = document.getElementById('ddldesgnto');
            //           if (orgDdl.value != '')
            //               return;

            for (var i = 0, ii = org2ddl.options.length; i < ii; i++) {
                if (org2ddl.options[i].value == val) {
                    org2ddl.options[i].disabled = "disabled";
                    org2ddl.options[i].style.color = 'Red';
                }
                else {
                    org2ddl.options[i].disabled = false;
                    org2ddl.options[i].style.color = 'Black';
                }
            }
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
        <div id="empmenu" visible="false" runat="server" class="sticky">
            <nav class="navbar navbar-default row-no-padding">
                <%--    oiwqepiepqiep--%>
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar1">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <%--<li><a href="OrdernCircular.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-list-alt"></span>&nbsp;Orders/Circulars</a></li>
                    <li><a href="Policies.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>--%>
                </div>
                <%-- <ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Information Technology</span></a></li>
                                         <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                </ul>--%>

                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar1">
                    <ul class="nav navbar-nav">
                        <li><a href="../DashBoardNew.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                        <%-- </li>--%><%-- <li><a href="#"><span style="color: #000000">Orders/Circulars</a></li>--%><%--  <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-tasks"></span>
                                &nbsp;Rosters</a></li>--%>

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
                                <%-- <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                                <li><a href="#"><span style="color: #000000">Training Materials/Videos</a></li>
                            </ul>
                        </li>
                        <%--<li><a href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-globe"></span>&nbsp;Forum</a></li>--%>
                        <li><a href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span
                            class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                        <%-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-certificate">
                        </span>&nbsp;Welfare<span class="caret"></span></a>
                        <ul class="dropdown-menu grad3">
                            <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                            <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                            <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                            <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                        </ul>
                    </li>--%><%-- <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>--%><%-- <li><a href="#" runat="server" onserverclick="logout_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                        <li><a href="../utilityDownload.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>
                            &nbsp;Miscellaneous<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="../RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="../myprofile.aspx"><span style="color: #000000">My Profile</span></a></li>
                                <li><a href="../ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="../Logout.aspx" id="lgout" style="color: #000000" runat="server">LogOut</a></li>
                                <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
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

                                    <li id="divboardmeetingreport" runat="server" visible="false"><a href="../PBB_reports.aspx"><span style="color: #000000">Meeting Records</span></a></li>
                                    <li id="divresourcebooking" runat="server" visible="false"><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>
                                </ul>
                            </ul>
                        </li>
                        <li><a href="../utilityDownload.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
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
                                <li id="divRR" runat="server" visible="true"><a href="RREntry.aspx"><span style="color: #000000">Reservation Roster</span></a></li>
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
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar3">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar3">
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
                                <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                            </ul>
                        </li>
                        <li><a href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span
                            class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>
                            &nbsp;Miscellaneous<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <ul class="nav nav-list">
                                    <li><a href="../RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                    <li id="divmeetingrecordadmin" runat="server" visible="false"><a href="../PBB_reports.aspx"><span style="color: #000000">Meeting Records</span></a></li>
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
                                <li><a href="../ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="../Logout.aspx" id="A2" runat="server">LogOut</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div id="AdminMenuIT" visible="false" runat="server" class="sticky">
            <nav class="navbar navbar-default row-no-padding">
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                </div>
                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="../DashBoardNew.aspx" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>

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

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>&nbsp;Miscellaneous<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <ul class="nav nav-list">
                                    <li><a href="../RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
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
        <div id="Div1" class="row" runat="server" style="padding-right: 20px; padding-left: 20px; margin: auto">
            <div id="Div21" class="col-md-6 col-sm-12 col-lg-6 col-xs-6" runat="server" align="left">
                <br />

                <br />
                <br />
            </div>
            <div id="Div2" class="col-md-6 col-sm-12 col-lg-6 col-xs-6" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                    CausesValidation="False" OnClick="btnback_Click">
                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>

                <br />
                <br />
            </div>
        </div>
        <div class="row" style="margin: auto">

            <div align="center" class=" col-sm-1" runat="server" id="div3">
            </div>
            <div align="center" class=" col-md-12 col-sm-10 col-lg-12" runat="server" id="div12">
                <div id="divfilter" runat="server" style="padding-top: 25px; padding-bottom: 25px; margin-left: 20px; margin-right: 20px; border: medium groove #000000">
                    <div id="Div8" runat="server" align="center" class="grad3 row" style="padding-top: 15px; padding-bottom: 15px">
                        <asp:Label ID="Label4" runat="server" Text="Search Records" Style="font-weight: bold; color: Black;"
                            CssClass="font2"></asp:Label>
                        &nbsp;
                    </div>
                    <div id="Div5" runat="server" align="center" class="gradbody row" style="padding-top: 10px; padding-bottom: 10px; margin: auto;">


                        <div align="center" class=" col-md-4 col-sm-4 col-lg-4" runat="server" id="div17"
                            style="padding-top: 5px; padding-bottom: 5px;">
                            <div style="padding-bottom: 6px">
                                <asp:Label ID="Label3" runat="server" Text="Office-Type" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </div>
                            <asp:DropDownList ID="ddloffctype" runat="server" class="select widthofboxes" AutoPostBack="true" ValidationGroup="search"
                                Height="28px" Width="80%" Font-Bold="true" Font-Size="Medium" OnSelectedIndexChanged="ddloffctype_SelectedIndexChanged">
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator ID="rfvoffctype" runat="server" ControlToValidate="ddloffctype" ValidationGroup="search"
                                Display="Dynamic" ErrorMessage="Pls. Select an Office Type." ForeColor="Red" SetFocusOnError="True"
                                class="font" Style="font-size: small; font-weight: 700">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div align="center" class=" col-md-4 col-sm-4 col-lg-4" runat="server" id="div7"
                            style="padding-top: 5px; padding-bottom: 5px;">
                            <div style="padding-bottom: 6px">
                                <asp:Label ID="Label5" runat="server" Text="Organisation" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </div>
                            <asp:DropDownList ID="ddlorg" runat="server" class="select widthofboxes" AutoPostBack="true"
                                Height="28px" Width="80%" Font-Bold="true" Font-Size="Medium" OnSelectedIndexChanged="ddlorg_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div align="center" class=" col-md-4 col-sm-4 col-lg-4" runat="server" id="div11"
                            style="padding-top: 5px; padding-bottom: 5px;">
                            <div style="padding-bottom: 6px">
                                <asp:Label ID="lblsecstn" runat="server" Text="Section/Station" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </div>
                            <asp:DropDownList ID="ddlsecstn" runat="server" class="select widthofboxes" AutoPostBack="false"
                                Height="28px" Width="80%" Font-Bold="true" Font-Size="Medium">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div id="Div14" runat="server" align="center" class="grad3 row" style="padding-top: 6px; padding-bottom: 6px">
                        <div align="center" class=" col-md-12 col-sm-12 col-lg-12" runat="server" id="div15">
                            <asp:Button ID="btngetdata" runat="server" Text="Search" class="btn select font2" ValidationGroup="search" Width="160px"
                                Style="background-color: #99FFCC; color: Black; font-weight: bold"
                                Visible="true" OnClick="btngetdata_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" />
                        </div>
                    </div>
                </div>
            </div>
            <div align="center" class=" col-sm-1" runat="server" id="div6">
            </div>
        </div>
        <br />
        <br />
        <br />
        <div class="row" style="margin: auto">
            <div align="center" class=" col-sm-1 " runat="server" id="div4">
            </div>
            <div id="divstngrd" visible="false" align="center" class=" col-md-12 col-sm-10 col-lg-12"
                runat="server">
                <div runat="server" id="divnormal">
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="font-weight: bold; color: Black;" class="font2">Station Directory</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <div id="divprint" style="text-align: center" runat="server" visible="true" class="row">
                                <div class="col-lg-4 "></div>
                                <div class="col-lg-2 " style="padding: 7px">
                                    <asp:LinkButton ID="btnstnprint" runat="server" CssClass="btn" CausesValidation="False"
                                        BackColor="#F5B7B1" Font-Underline="False" OnClick="btnstnprint_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="160px">
                                        <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                        <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                </div>
                                <div class="col-lg-2 " style="padding: 7px">
                                    <asp:LinkButton ID="btnexporttoexcel" runat="server" CssClass="btn" CausesValidation="False"
                                        Width="160px" BackColor="LightGreen" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="btnexporttoexcel_Click">
                                        <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-export"></span>
                                        <span style="font-weight: bold; color: #000000">Export to Excel</span></asp:LinkButton>
                                </div>
                                <div class="col-lg-4 "></div>
                            </div>
                            <br />
                            <div style="overflow: auto">
                                <asp:Panel ID="panelprint" runat="server">
                                    <div id="divmsg" runat="server" visible="false" align="center">
                                        <asp:Label ID="lblmsg" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                    </div>

                                    <asp:GridView ID="grdstndirectory" runat="server" AutoGenerateColumns="false"
                                        AllowPaging="true" PageSize="15" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                        HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                        EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="96%"
                                        ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnPageIndexChanging="grdstndirectory_PageIndexChanging">
                                        <alternatingrowstyle backcolor="White" />
                                        <columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <itemtemplate>
                                                    <asp:Label ID="lblSNo" class="fontingrid" Font-Bold="true" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                </itemtemplate>
                                                <itemstyle horizontalalign="Center" />
                                                <headerstyle horizontalalign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Station-Name">
                                                <itemtemplate>
                                                    <asp:Label ID="lblstnname" runat="server" Text='<%#Eval("StationName") %>' class="fontingrid"
                                                        ForeColor="Black" />
                                                </itemtemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Organisation">
                                                <itemtemplate>
                                                    <asp:Label ID="lblstnorg" runat="server" Text='<%#Eval("organisation") %>' class="fontingrid"
                                                        ForeColor="Black" />
                                                </itemtemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="HOO-Details">
                                                <itemtemplate>
                                                    <div style="padding: 10px" align="left">
                                                        <asp:Label ID="Label7" runat="server" Text="Name" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label13" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="lblstnhooname" Font-Italic="true" runat="server" Text='<%#Eval("HOO") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="lblem" runat="server" Text="Designation" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="lblem1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="lblem2" Font-Italic="true" runat="server" Text='<%#Eval("HOO_Degn")%>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="Label8" runat="server" Text="Contact-No" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label9" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="Label12" Font-Italic="true" runat="server" Text='<%#Eval("HOO_contact") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="Label16" runat="server" Text="E-Mail" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label17" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="Label18" Font-Italic="true" runat="server" Text='<%#Eval("HOO_Email") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Engg. Head-Details">
                                                <itemtemplate>
                                                    <div style="padding: 10px" align="left">
                                                        <asp:Label ID="Label7" runat="server" Text="Name" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label13" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="lblstnhooname" Font-Italic="true" runat="server" Text='<%#Eval("EnggHeadName") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="lblem" runat="server" Text="Designation" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="lblem1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="lblem2" Font-Italic="true" runat="server" Text='<%#Eval("EnggHeaddesgn")%>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="Label8" runat="server" Text="Contact-No" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label9" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="Label12" Font-Italic="true" runat="server" Text='<%#Eval("EnggHeadMob") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="Label16" runat="server" Text="E-Mail" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label17" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="Label18" Font-Italic="true" runat="server" Text='<%#Eval("EnggHeadEmail") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Prog. Head-Details">
                                                <itemtemplate>
                                                    <div style="padding: 10px" align="left">
                                                        <asp:Label ID="Label7" runat="server" Text="Name" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label13" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="lblstnhooname" Font-Italic="true" runat="server" Text='<%#Eval("ProgheadName") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="lblem" runat="server" Text="Designation" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="lblem1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="lblem2" Font-Italic="true" runat="server" Text='<%#Eval("progdesgn")%>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="Label8" runat="server" Text="Contact-No" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label9" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="Label12" Font-Italic="true" runat="server" Text='<%#Eval("ProgHeadMob") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="Label16" runat="server" Text="E-Mail" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label17" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="Label18" Font-Italic="true" runat="server" Text='<%#Eval("progheadEmail") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Security Officer-Details">
                                                <itemtemplate>
                                                    <div style="padding: 10px" align="left">
                                                        <asp:Label ID="Label7" runat="server" Text="Name" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label13" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="lblstnhooname" Font-Italic="true" runat="server" Text='<%#Eval("SecOfficerName") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="lblem" runat="server" Text="Designation" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="lblem1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="lblem2" Font-Italic="true" runat="server" Text='<%#Eval("secdesgn")%>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="Label8" runat="server" Text="Contact-No" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label9" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="Label12" Font-Italic="true" runat="server" Text='<%#Eval("secofficerMob") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="Label16" runat="server" Text="E-Mail" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label17" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="Label18" Font-Italic="true" runat="server" Text='<%#Eval("SecOfficerEmail") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DDO-Details">
                                                <itemtemplate>
                                                    <div style="padding: 10px" align="left">
                                                        <asp:Label ID="Label7" runat="server" Text="Name" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label13" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="lblstnhooname" Font-Italic="true" runat="server" Text='<%#Eval("DDOName") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="lblem" runat="server" Text="Designation" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="lblem1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="lblem2" Font-Italic="true" runat="server" Text='<%#Eval("DDOdesgn")%>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="Label8" runat="server" Text="Contact-No" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label9" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="Label12" Font-Italic="true" runat="server" Text='<%#Eval("DDOMobile") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                        <br />
                                                        <asp:Label ID="Label16" runat="server" Text="E-Mail" Font-Size="9pt" Font-Bold="true"
                                                            ForeColor="Maroon" />
                                                        <asp:Label ID="Label17" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                        <asp:Label ID="Label18" Font-Italic="true" runat="server" Text='<%#Eval("DDOEmail") %>'
                                                            Font-Size="8pt" Font-Bold="true" />
                                                    </div>
                                                </itemtemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Station Contact-No">
                                                <itemtemplate>
                                                    <div style="padding: 10px">
                                                        <asp:Label ID="lblstncontact" runat="server" ForeColor="Black" CommandName="Download"
                                                            Font-Underline="false" Text='<%#Eval("stnPhone") %>' class="fontingrid" Font-Bold="True"
                                                            CausesValidation="False" />
                                                    </div>
                                                </itemtemplate>
                                                <itemstyle horizontalalign="Left" />
                                                <headerstyle horizontalalign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Station E-Mail">
                                                <itemtemplate>
                                                    <div style="padding: 10px">
                                                        <asp:Label ID="lblstnemail" runat="server" ForeColor="Black" CommandName="Download"
                                                            Font-Underline="false" Text='<%#Eval("Email") %>' class="fontingrid" Font-Bold="True"
                                                            CausesValidation="False" />
                                                    </div>
                                                </itemtemplate>
                                                <itemstyle horizontalalign="Left" />
                                                <headerstyle horizontalalign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Last Updated On">
                                                <itemtemplate>
                                                    <div style="padding: 6px">
                                                        <asp:Label ID="Label11" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("updatedOn_PN", "{0:dd-MMM-yyyy}") %>'
                                                            class="fontingrid" />
                                                        <%--Text='<%# Eval("tDate", "{0:dd-MMM-yyyy}") %>'--%>
                                                    </div>
                                                </itemtemplate>
                                                <itemstyle horizontalalign="Center" />
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

                                </asp:Panel>
                            </div>
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
            </div>


            <div id="divsecgrd" visible="false" align="center" class=" col-md-12 col-sm-10 col-lg-12"
                runat="server">
                <div runat="server" id="div13">
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="font-weight: bold; color: Black;" class="font2">Section Directory</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <div id="div16" style="text-align: center" runat="server" visible="true">
                                <table width="100%">
                                    <tr>
                                        <td align="center" width="100%" style="padding: 12px">
                                            <asp:LinkButton ID="btnsecprint" runat="server" CssClass="btn" CausesValidation="False"
                                                Width="90px" BackColor="#F5B7B1" Font-Underline="False" OnClick="btnsecprint_Click">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                                <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                    </tr>
                                </table>
                            </div>
                            <div style="overflow: auto">
                                <asp:GridView ID="grdsecdetails" runat="server" AutoGenerateColumns="false"
                                    AllowPaging="true" PageSize="15" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                    HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                    EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="96%"
                                    ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnPageIndexChanging="grdsecdetails_PageIndexChanging">
                                    <alternatingrowstyle backcolor="White" />
                                    <columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <itemtemplate>
                                                <asp:Label ID="lblSNo" class="fontingrid" Font-Bold="true" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Section-Name">
                                            <itemtemplate>
                                                <asp:Label ID="lblstnname" runat="server" Text='<%#Eval("secname") %>' class="fontingrid"
                                                    ForeColor="Black" />
                                            </itemtemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Organisation">
                                            <itemtemplate>
                                                <asp:Label ID="lblstnorg" runat="server" Text='<%#Eval("Abbreviation") %>' class="fontingrid"
                                                    ForeColor="Black" />
                                            </itemtemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="HOO-Details">
                                            <itemtemplate>
                                                <div style="padding: 10px" align="left">
                                                    <asp:Label ID="Label7" runat="server" Text="Name" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="Label13" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblstnhooname" Font-Italic="true" runat="server" Text='<%#Eval("Section_Head_Name") %>'
                                                        Font-Size="8pt" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblem" runat="server" Text="Designation" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lblem1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblem2" Font-Italic="true" runat="server" Text='<%#Eval("SecHOO_Desg")%>'
                                                        Font-Size="8pt" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="Label8" runat="server" Text="Contact-No" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="Label9" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="Label12" Font-Italic="true" runat="server" Text='<%#Eval("HOO_Mobile") %>'
                                                        Font-Size="8pt" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="Label16" runat="server" Text="E-Mail" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="Label17" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="Label18" Font-Italic="true" runat="server" Text='<%#Eval("sechead_email") %>'
                                                        Font-Size="8pt" Font-Bold="true" />
                                                </div>
                                            </itemtemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="DDO-Details">
                                            <itemtemplate>
                                                <div style="padding: 10px" align="left">
                                                    <asp:Label ID="Label7" runat="server" Text="Name" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="Label13" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblstnhooname" Font-Italic="true" runat="server" Text='<%#Eval("DDOName") %>'
                                                        Font-Size="8pt" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="lblem" runat="server" Text="Designation" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="lblem1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="lblem2" Font-Italic="true" runat="server" Text='<%#Eval("DDOdesgn")%>'
                                                        Font-Size="8pt" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="Label8" runat="server" Text="Contact-No" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="Label9" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="Label12" Font-Italic="true" runat="server" Text='<%#Eval("DDOMobile") %>'
                                                        Font-Size="8pt" Font-Bold="true" />
                                                    <br />
                                                    <asp:Label ID="Label16" runat="server" Text="E-Mail" Font-Size="9pt" Font-Bold="true"
                                                        ForeColor="Maroon" />
                                                    <asp:Label ID="Label17" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                    <asp:Label ID="Label18" Font-Italic="true" runat="server" Text='<%#Eval("DDOEmail") %>'
                                                        Font-Size="8pt" Font-Bold="true" />
                                                </div>
                                            </itemtemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Section Contact-No">
                                            <itemtemplate>
                                                <div style="padding: 10px">
                                                    <asp:Label ID="lblseccontact" runat="server" ForeColor="Black" CommandName="Download"
                                                        Font-Underline="false" Text='<%#Eval("seccontact") %>' class="fontingrid" Font-Bold="True"
                                                        CausesValidation="False" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Section E-Mail">
                                            <itemtemplate>
                                                <div style="padding: 10px">
                                                    <asp:Label ID="lblsecemail" runat="server" ForeColor="Black" CommandName="Download"
                                                        Font-Underline="false" Text='<%#Eval("sec_Email") %>' class="fontingrid" Font-Bold="True"
                                                        CausesValidation="False" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Section Duties">
                                            <itemtemplate>
                                                <div style="padding: 10px">
                                                    <asp:Label ID="lblsecduties" runat="server" ForeColor="Black" CommandName="Download"
                                                        Font-Underline="false" Text='<%#Eval("duties") %>' class="fontingrid" Font-Bold="True"
                                                        CausesValidation="False" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Left" />
                                            <headerstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Last Updated On">
                                            <itemtemplate>
                                                <div style="padding: 6px">
                                                    <asp:Label ID="Label11" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("UpdatedOn", "{0:dd-MMM-yyyy}") %>'
                                                        class="fontingrid" />
                                                    <%--Text='<%# Eval("tDate", "{0:dd-MMM-yyyy}") %>'--%>
                                                </div>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
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
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
            </div>
            <div align="center" class=" col-md-0 col-sm-1 col-lg-0" runat="server" id="div19">
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
    </div>
</asp:Content>
