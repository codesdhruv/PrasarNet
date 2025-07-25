<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="G_Rpt_SubjectWise.aspx.cs" Inherits="PrasarNet.EGrievance.G_Rpt_SubjectWise" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--link of style sheet--%>
    <link rel="stylesheet" href="../style/responsive.css" type="text/css" media="screen" />
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
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

        .wrap {
            white-space: normal;
            /*width: 50px;*/
            padding: 5px;
        }

        hr.new5 {
            /*border: 6px solid green;
            border-radius: 5px;*/
            border: 2px solid #5C5C5C;
        }

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
            }
    </style>
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {

            var options = {
                title: 'Subject Wise Grievances',
                subtitle: 'Recieved vs Resolved',
                width: 950,
                height: 520,
                bar: { groupWidth: "110%" },
                legend: { position: "top", alignment: "end" },
                isStacked: false,
                colors: ['Blue', 'Green'],
                is3D: true,
                //animation: {
                //    duration: 1000,
                //    easing: 'out'
                //},
                vAxis: {
                    title: 'No of Grievances Recieved/Resolved',
                    color: 'Red',

                },
                hAxis:
                {
                    title: 'Subject', direction: -1, slantedText: true, slantedTextAngle: 65
                    // ticks: [5,20, 40, 60, 80, 100, 120, 140, 160, 180]
                },
            };
            //console.log("data 2")
            $.ajax({
                type: "POST",
                url: "G_Rpt_SubjectWise.aspx/GetChartDatarvd",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.ColumnChart($("#chart")[0]);
                    chart.draw(data, options);
                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
        }
    </script>
    <%--<script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        //Do not call this method on pageload
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                title: 'Subject Wise Grievance Resolved',
                width: 600,
                height: 400,
                //bar: { groupWidth: "95%" },
                //legend: { position: "none" },
                isStacked: true
            };

            $.ajax({
                type: "POST",
                url: "G_Rpt_Deptt.aspx/GetChartDatares",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart;
                    chart = new google.visualization.BarChart($("#chartres")[0]);
                    chart.draw(data, options);
                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }

            });

        }
    </script>--%>
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
                            </ul>
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
        <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto" visible="false">
            <div id="Div2" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="btnback_Click"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-arrow-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div id="Div6" runat="server" style="padding-top: 20px; padding-bottom: 23px; margin: auto">
            <div id="div4" style="text-align: left; padding-left: 25px; padding-bottom: 10px" runat="server" visible="true">
                <asp:LinkButton ID="lnkdashboard" ForeColor="Blue" Font-Underline="true" Font-Bold="true" Font-Size="Large" runat="server" OnClick="lnkdashboard_Click">Grievance DashBoard</asp:LinkButton>
            </div>
            <div id="div3" style="text-align: left; padding-left: 25px; padding-bottom: 10px" runat="server" visible="true">
                <asp:LinkButton ID="lnkdepttwisegrievance" ForeColor="Blue" Font-Underline="true" Font-Bold="true" Font-Size="Large" runat="server" OnClick="lnkdepttwisegrievance_Click">Department Wise Reports</asp:LinkButton>
            </div>
            <div id="div5" style="text-align: left; padding-left: 25px; padding-bottom: 10px" runat="server" visible="false">
                <asp:LinkButton ID="lnkofficewise" ForeColor="Blue" Font-Underline="true" Font-Bold="true" Font-Size="Large" runat="server" OnClick="lnkofficewise_Click">Station/Section Wise Reports</asp:LinkButton>
            </div>
        </div>
        <div class="row" runat="server" width="95%" align="center" style="margin: auto; padding-top: 0px; padding-bottom: 7px; padding-right: 0px; padding-left: 0px; align-items: center">
            <div align="center" runat="server" class="col-md-1  col-lg-1 " style="padding-top: 0px; padding-bottom: 25px"></div>
            <div align="center" runat="server" class="col-md-10  col-lg-10 " style="padding-top: 0px; padding-bottom: 25px" visible="true">
                <div runat="server" align="center" style="border: medium ridge #000000; margin: 0 20px 10px 20px;">
                    <div runat="server" align="center" style="padding: 7px">
                        <asp:Label runat="server" ID="Label3" CssClass="font2" ForeColor="Black" Font-Underline="true" Font-Bold="true" Text=":: Subject Wise Grievance Received ::"></asp:Label>
                        <br />
                        <br />
                    </div>
                    <div class="table-responsive" runat="server" align="center">
                        <div id="chart" style="width: 900px; height: 540px;">
                        </div>
                    </div>


                </div>
            </div>
            <div align="center" runat="server" class="col-md-1  col-lg-1 " style="padding-top: 0px; padding-bottom: 25px"></div>
        </div>
        <div class="row" runat="server" width="95%" align="center" style="margin: auto; padding-top: 7px; padding-bottom: 0px; padding-right: 0px; padding-left: 0px; align-items: center">

            <div align="center" runat="server" class="col-md-12 col-lg-12 " style="padding-top: 0px; padding-bottom: 5px">
                <%-- <div runat="server" align="center" style="border: medium ridge #000000; margin: 0 20px 10px 20px;">--%>
                <div id="divgrid" runat="server" visible="true">

                    <div class="row" style="margin: auto; padding: 5px">
                        <div align="center" runat="server" class="col-md-1  col-lg-1 " style="padding-top: 5px; padding-bottom: 0px"></div>
                        <div align="center" runat="server" class="col-md-10  col-lg-10 " style="padding-top: 5px; padding-bottom: 0px">
                            <%--  <div  runat="server" class="row" style="margin: auto">--%>
                            <div class="panel panel-primary">
                                <div class="panel-heading grad3">
                                    <span style="font-weight: bold; color: Black;" class="font2">:: Subject Wise Report ::</span>
                                </div>
                                <div class="panel-body grad2 table-responsive">
                                    <div id="divprisearch" style="text-align: center; padding: 10px; margin: auto" runat="server" visible="false" class="row">
                                        <div class="col-lg-2 "></div>
                                        <div class="col-lg-4 " style="padding: 7px">
                                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                                Width="160px" BackColor="#F5B7B1" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="btnprint1_Click"> <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span><span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                        </div>
                                        <div class="col-lg-4 " style="padding: 7px">
                                            <asp:LinkButton ID="btnexporttoexcel" runat="server" CssClass="btn" CausesValidation="False"
                                                Width="160px" BackColor="LightGreen" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="btnexporttoexcel_Click"> <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-export"></span><span style="font-weight: bold; color: #000000">Export to Excel</span></asp:LinkButton>
                                        </div>
                                        <div class="col-lg-2 "></div>
                                    </div>

                                    <asp:Panel ID="panelprint" runat="server">

                                        <div id="divmsg" runat="server" visible="false" align="center">
                                            <asp:Label ID="lblmsg" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                        </div>
                                        <asp:GridView ID="grdsubwise" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" BackColor="#F8F9F9"
                                            PageSize="20" ShowHeaderWhenEmpty="True" ToolTip="click to see subject Wise summary"
                                            Width="95%" AllowPaging="True">
                                            <HeaderStyle BackColor="#0099FF" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <ItemTemplate>
                                                        <div runat="server" align="center">

                                                            <asp:Label ID="lblSNo" ForeColor="Black" CssClass="font2" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                            <%--     <asp:Label ID="lblid" Visible="false" ForeColor="Black" CssClass="fontingrid" runat="server" Text='<%#Eval("id") %>' />--%>
                                                        </div>

                                                    </ItemTemplate>

                                                    <ItemStyle Width=""></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Subject" Visible="true">
                                                    <ItemTemplate>
                                                        <div style="padding: 15px" runat="server" align="center">
                                                            <asp:Label ID="lblsub" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Subject") %>' class="font2" Visible="false" />
                                                            <asp:LinkButton ID="lbrvd" Font-Bold="true" ForeColor="BLue" runat="server" Text='<%#Eval("Subject") %>' class="font2" CommandArgument='<%#Eval("subjectid") %>' CommandName="grvDetails" OnClick="lbrvd_Click" OnClientClick="openPopup();"></asp:LinkButton>
                                                           <script type="text/javascript">
                                                               function openPopup() {
                                                                   // Replace 'YourPage.aspx' with the URL you want to open in the popup
                                                                   var url = 'SubGrvDetails.aspx';

                                                                   // Define the window features (size, position, etc.)
                                                                   var features = 'width=1000,height=800,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes';

                                                                   // Open the popup window with the specified URL and features
                                                                   window.open(url, '_blank', features);

                                                                   return false; // Prevent the default behavior of the button click
                                                               }
</script>

                                                            <script type="text/javascript">
                                                                function openInNewWindow() {
                                                                    // Replace 'YourPage.aspx' with the URL you want to open in the new window
                                                                    var url = 'SubGrvDetails.aspx';
                                                                    window.open(url, '_blank');
                                                                    return false; // Prevent the default behavior of the button click
                                                                }

                                                                function SetTarget() {
                                                                    document.forms[0].target = "_blank";
                                                                    document.forms[0].setAttribute("rel", "noopener noreferrer"); // Add this line for security reasons
                                                                }

                                                                function ShowPopup(title, body) {
                                                                    $("#MyPopup .modal-title").html(title);
                                                                    $("#MyPopup .modal-body").html(body);
                                                                    $("#MyPopup").modal("show");
                                                                }
                                                            </script>
                                                        </div>
                                                    </ItemTemplate>

                                                    <ItemStyle Width=""></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="No of Grievance Recieved" Visible="true">
                                                    <ItemTemplate>
                                                        <div style="padding: 15px" runat="server" align="center">
                                                            <asp:Label ID="lblrvd" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("rvd") %>' class="font2" />


                                                        </div>
                                                    </ItemTemplate>

                                                    <ItemStyle Width=""></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Initial Action Taken By PBGS inc Forwarded & Resolved" Visible="true">
                                                    <ItemTemplate>
                                                        <div style="padding: 15px" runat="server" align="center">
                                                            <asp:Label ID="lblinitial1" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("fwd_PBGS") %>' class="font2" />
                                                        </div>
                                                    </ItemTemplate>

                                                    <ItemStyle Width=""></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="No of Grievance Resolved" Visible="true">
                                                    <ItemTemplate>
                                                        <div style="padding: 15px" runat="server" align="center">
                                                            <asp:Label ID="lblres" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Res") %>' class="font2" />
                                                        </div>
                                                    </ItemTemplate>
                                                    <ItemStyle Width=""></ItemStyle>
                                                </asp:TemplateField>
                                            </Columns>
                                            <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" CssClass="centerHeaderText font2"
                                                Wrap="True"></HeaderStyle>
                                            <RowStyle BackColor="White" Font-Bold="True" Height="30px" HorizontalAlign="Center"
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
                        <div align="center" runat="server" class="col-md-1  col-lg-1 " style="padding-top: 5px; padding-bottom: 0px"></div>
                    </div>


                </div>
                <%-- </div>--%>
            </div>

        </div>

        <br />
        <br />

    </div>

</asp:Content>
