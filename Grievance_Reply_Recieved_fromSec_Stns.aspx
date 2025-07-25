<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grievance_Reply_Recieved_fromSec_Stns.aspx.cs" Inherits="PrasarNet.Grievance_Reply_Recieved_fromSec_Stns"
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
        .chk input {
            width: 22px;
            height: 22px;
        }

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

        td {
            cursor: default;
        }

        .def {
            cursor: default;
        }

        .trnew {
            border-bottom: 2px ridge #F2F3F4;
            border-top: 2px ridge #F2F3F4;
            border-left: 2px ridge Black;
            border-right: 2px ridge #F2F3F4;
        }

        .selected_row {
            background-color: #A1DCF2;
        }

        .auto-style1 {
            font-size: small;
            color: #FF0000;
        }

        .gradnewbutton2 {
            background: linear-gradient(to right, #F99B62, #E67E22);
            -webkit-radial-gradient;
        }

        .auto-style2 {
            height: 453px;
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

        .auto-style3 {
            height: 67px;
        }

        .grad2new {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #F2F4F4, #E67E22);
            -webkit-radial-gradient;
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
        function MutExChkList(chk) {
            var chkList = chk.parentNode.parentNode.parentNode;
            var chks = chkList.getElementsByTagName("input");
            for (var i = 0; i < chks.length; i++) {
                if (chks[i] != chk && chk.checked) {
                    chks[i].checked = false;
                }
            }
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
    <script type="text/javascript">
        var prevRowIndex;

        function ChangeRowColor(row, rowIndex) {
            var parent = document.getElementById(row);
            var currentRowIndex = parseInt(rowIndex) + 1;

            if (prevRowIndex == currentRowIndex) {
                return;
            } else if (prevRowIndex != null) {
                parent.rows[prevRowIndex].style.backgroundColor = "#FFFFFF";
            }

            parent.rows[currentRowIndex].style.backgroundColor = "#FFFFD6";
            prevRowIndex = currentRowIndex;

            $('#<%= Label1.ClientID %>').text(currentRowIndex);

            $('#<%= hfParentContainer.ClientID %>').val(row);
            $('#<%= hfCurrentRowIndex.ClientID %>').val(rowIndex);
        }

        $(function () {
            RetainSelectedRow();
        });

        function RetainSelectedRow() {
            var parent = $('#<%= hfParentContainer.ClientID %>').val();
            var currentIndex = $('#<%= hfCurrentRowIndex.ClientID %>').val();
            if (parent != null) {
                ChangeRowColor(parent, currentIndex);
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
        <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto">
            <div id="Div5" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="center">
                <br />
                <br />
                <br />
            </div>
            <div id="Div3" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="center">
                <br />
                <asp:Label ID="Label43" Style="font-weight: bold; color: Black; background-color: lightyellow"
                    runat="server" Text=":: Latest Replies Recieved from Sections/Stations ::" CssClass="fontforlargebtn"></asp:Label>
                <br />
                <br />
            </div>
            <div id="Div2" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="right">
                <br />
                <asp:LinkButton BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" OnClick="btnback_Click"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-arrow-left"></span>&nbsp; <span style="font-weight: bold; font-size: medium; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div id="divsearch" runat="server" visible="false">
            <div runat="server" align="right" style="padding-right: 10px; padding-bottom: 10px">
                <asp:Button ID="Button1" runat="server" Text=" Back " class="btn select buttondocumentupload font2 grad4" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                    Style="color: Black; font-weight: bold" CausesValidation="False" />
            </div>
            <div class="row" style="margin: auto" runat="server" id="divsearchform">
                <div align="center" class=" col-md-2 col-sm-2 col-lg-2"></div>
                <div align="center" class=" col-md-8 col-sm-8 col-lg-8" runat="server" id="div12">
                    <div id="divgriesearch" runat="server" visible="true" class="table-hover">
                        <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                            <asp:Label ID="Label4" runat="server" Text="Search Grievance" CssClass="fontheader1" Style="font-weight: bold; color: Black;"></asp:Label>
                            &nbsp;
                        </div>
                        <table class="table table table-bordered grad2">
                            <tr>
                                <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label ID="lblDept" runat="server" Text="Department to which the Grievance is related(as referenced by complainant)" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:DropDownList ID="ddldept" runat="server" AutoPostBack="True" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true"
                                        ValidationGroup="sub" Height="30px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddldept_SelectedIndexChanged">
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label ID="Label3" runat="server" Text="Section to which the Grievance is related(as referenced by complainant)" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:DropDownList ID="ddlsection" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub"
                                        Height="30px" AppendDataBoundItems="true">
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label ID="Label5" runat="server" Text="Type Of User" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:DropDownList ID="ddlregdusertype" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub"
                                        Height="30px" AppendDataBoundItems="true">
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label ID="Label7" runat="server" Text="Complaint Status(Final)" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:DropDownList ID="ddlstatus" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub"
                                        Height="30px" AppendDataBoundItems="true">
                                        <asp:ListItem Value="" Text="All"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="Pending"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Answered and Closed"></asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                            </tr>
                            <tr>
                                <td width="40%" align="right" style="padding-right: 30px">
                                    <asp:Label ID="Label13" runat="server" Text="Grievance Reference ID" ForeColor="Black"
                                        class="font" Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="60%" align="left" style="padding-left: 15px">
                                    <asp:TextBox ID="TextBox1" runat="server" Placeholder="GrievanceID" CssClass="select font2 widthofboxes1" Height="30px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 10px" class="auto-style3">
                                    <asp:Button ID="btnsearch" runat="server" Text="Search" Font-Size="Large" class="btn select buttondocumentupload" ValidationGroup="sub"
                                        Style="background-color: #99FFCC; color: Black; font-weight: bold" width="130px" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" />
                                </td>
                                <td align="left" style="padding-left: 10px" class="auto-style3">
                                    <asp:Button ID="btncncl" runat="server" Text="Clear" Font-Size="Large" class="btn select gradbody buttondocumentupload"
                                        Style="color: Black; font-weight: bold" CausesValidation="False" width="130px" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
                <div align="center" class=" col-md-2 col-sm-2 col-lg-2"></div>
            </div>




        </div>
        <div id="divtrackgridprimary" runat="server" visible="true">
            <%--<div runat="server" align="right" style="padding-right: 10px; padding-bottom: 10px">
                <asp:Button ID="Button2" runat="server" Text=" Back " class="btn select buttondocumentupload font2 grad4"
                    Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button2_Click" />
            </div>--%>
            <div align="left" style="padding-left: 100px">
                <asp:Label ID="lblresult" runat="server" Text="" ForeColor="Red" Font-Bold="true" CssClass="font2"></asp:Label>
            </div>
            <div id="divgenusers" runat="server" visible="true" style="border: medium groove #000000; margin-top: 10px; margin-right: 40px; margin-left: 50px; margin-bottom: 10px">

                <div align="center" class="row">

                    <div runat="server" id="div24" align="center" style="padding-top: 15px; padding-bottom: 15px;" class="col-lg-12">
                        <asp:LinkButton ID="lnkallgrievances" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px"
                            Width="350px" OnClick="lnkallgrievances_Click">
                            <span style="font-weight: bold; font-size: large; color: #000000">All Grievances</span></asp:LinkButton>
                    </div>
                    <%-- <div runat="server" id="div23" style="padding-top: 15px;padding-bottom:15px;" class="col-lg-3">
                       
                    </div>
                    
                     <div runat="server" id="div22" class="col-lg-3"></div>
                    
                    <div runat="server" id="div26"  class="col-lg-3">
                    </div>--%>
                </div>
            </div>
            <div class="row" style="margin: auto; padding: 30px">
                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                <div id="divgrd" visible="true" align="center" class=" col-md-12 col-sm-12 col-lg-12"
                    runat="server">
                    <%--  <div  runat="server" class="row" style="margin: auto">--%>
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="font-weight: bold; color: Black;" class="font2">:: Grievance Details ::</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <div id="divprisearch" style="text-align: center" runat="server" visible="true">
                                <table width="100%">
                                    <tr>
                                        <td align="center" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;">
                                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" width="130px"
                                                BackColor="#F5B7B1" OnClick="btnprint1_Click">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span><span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                        </td>
                                        <td align="left" style="padding-top: 10px; padding-left: 10px; padding-right: 10px;" runat="server" visible="false">
                                            <asp:LinkButton ID="lnksearch" runat="server" CssClass="btn" CausesValidation="False"
                                                BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" width="130px" BackColor="#99FFCC">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-search"></span><span style="font-weight: bold; color: #000000">Search</span></asp:LinkButton>

                                        </td>


                                    </tr>
                                    <tr runat="server" align="center">
                                        <td align="center" style="padding: 10px" colspan="2">
                                            <asp:Label ID="lblseacrh" runat="server" Text="Search Grievance By Grievance-ID" Style="font-weight: 700" class="font2"></asp:Label>
                                            &nbsp;&nbsp;
                                            <asp:TextBox ID="txtsearch" runat="server" Placeholder=" By GrievanceID" CssClass="select font2" AutoPostBack="True" OnTextChanged="txtsearch_TextChanged" Height="28px"></asp:TextBox>
                                        </td>
                                    </tr>

                                </table>
                            </div>
                            <div align="left" style="padding-left: 25px; padding-top: 5px; padding-bottom: 5px" class="auto-style1">
                                <strong>* Action is prohibited for closed or forwared Grievances.
                                </strong>
                            </div>
                            <asp:HiddenField ID="hfCurrentRowIndex" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="hfParentContainer" runat="server"></asp:HiddenField>
                            <asp:GridView ID="grdcomdetails" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" BackColor="#F8F9F9" DataKeyNames="Gre_Id" ShowHeaderWhenEmpty="True" ToolTip="Complaints and their Status" Width="98%" OnRowCommand="grdcomdetails_RowCommand" OnRowDataBound="grdcomdetails_RowDataBound" OnPageIndexChanging="grdcomdetails_PageIndexChanging" AllowPaging="True" PageSize="7">
                                <headerstyle backcolor="#0099FF" font-bold="True" forecolor="Black" horizontalalign="Center" />
                                <columns>
                                    <asp:TemplateField HeaderText="S.No.">
                                        <itemtemplate>
                                            <div runat="server" align="center">

                                                <asp:Label ID="lblSNo" ForeColor="Black" CssClass="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />

                                                <asp:Label ID="lbltrnid" Font-Bold="true" ForeColor="Black" runat="server" Visible="false" Text='<%#Eval("trnId") %>' class="fontingrid" />

                                            </div>

                                        </itemtemplate>


                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Complainant Details">
                                        <itemtemplate>
                                            <div style="padding: 15px" runat="server" align="left">
                                                <asp:Label ID="lblname" Font-Bold="true" ForeColor="Brown" runat="server" Text="Name : " class="fontingrid" />
                                                <asp:Label ID="lblname2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("NameofComplainant") %>' class="fontingrid" />
                                                <br />
                                                <br />
                                                <asp:Label ID="lblemail" Font-Bold="true" ForeColor="Brown" runat="server" Text="Email : " class="fontingrid" />
                                                <asp:Label ID="lblemail2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("EmailOfComplainant") %>' class="fontingrid" />
                                                <br />
                                                <br />
                                                <asp:Label ID="lblmob" Font-Bold="true" ForeColor="Brown" runat="server" Text="Mobile Number : " class="fontingrid" />
                                                <asp:Label ID="lblmob2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("MobileNoOfComplainant") %>' class="fontingrid" />

                                            </div>
                                            <div style="padding: 15px" runat="server" align="left" visible="false">
                                                <asp:Label ID="lblDept33" Font-Bold="true" ForeColor="Brown" runat="server" Text="Department : " class="fontingrid" />
                                                <asp:Label ID="lbldept2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("department") %>' class="fontingrid" />
                                                <br />
                                                <br />
                                                <asp:Label ID="lblsectionr" Font-Bold="true" ForeColor="Brown" runat="server" Text="Section : " class="fontingrid" />
                                                <asp:Label ID="lblsection2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Section") %>' class="fontingrid" />

                                            </div>
                                        </itemtemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText=" Grievance Reference ID and Regd on">
                                        <itemtemplate>
                                            <div align="left" style="padding: 15px" runat="server">
                                                <asp:Label ID="lblrefid1" Font-Bold="true" ForeColor="Brown" runat="server" Text=" Reference Id: " class="fontingrid" />
                                                <asp:Label ID="lblrefid" Font-Underline="false" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("referenceid") %>' class="fontingrid" />

                                            </div>
                                            <div align="left" runat="server" style="padding-left: 15px; right: 15px; bottom: 15px">
                                                <asp:Label ID="lblregdon1" Font-Bold="true" ForeColor="Brown" runat="server" Text=" Regd On: " class="fontingrid" />

                                                <asp:Label ID="lblgrievanceregon" runat="server" ForeColor="Black" Text='<%#Eval("Grievance_regdOn") %>' class="fontingrid" />
                                            </div>
                                        </itemtemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Grievance/Download Supported Document (If Any)">
                                        <itemtemplate>
                                            <div align="left" style="padding: 15px" runat="server">
                                                <asp:Label ID="lblSubject1" Font-Bold="true" ForeColor="Brown" runat="server" Text=" Subject: " class="fontingrid" />
                                                <asp:Label ID="lblsubject" Font-Underline="false" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("subject") %>' class="fontingrid" />

                                            </div>
                                            <div align="left" runat="server" style="padding-left: 15px; right: 15px; bottom: 15px">
                                                <asp:Label ID="lblgrievance1" Font-Bold="true" ForeColor="Brown" runat="server" Text=" Grievance: " class="fontingrid" />

                                                <asp:LinkButton ID="lblgrievancegrid" CommandName="download" Font-Underline="false" Font-Bold="true" ForeColor="Blue" runat="server" Text='<%#Eval("Grievance") %>' class="fontingrid" />
                                                <asp:Label ID="lblfileuploadoutput" runat="server" Text='<%#Eval("fileuploadoutput") %>' Visible="false"></asp:Label>
                                            </div>
                                        </itemtemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Reply/Download File(If Attached)">
                                        <itemtemplate>
                                            <div align="left" runat="server" style="padding-top: 15px; padding-bottom: 15px; padding-left: 15px; padding-right: 15px">
                                                <asp:Label ID="Label51" Font-Bold="true" ForeColor="Brown" runat="server" Text="Reply Given By: " class="fontingrid" />
                                                <asp:Label ID="Label50" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("prevStationname") %>' class="fontingrid" />
                                                <br />
                                                <br />
                                                <asp:Label ID="lblpbgson" Font-Bold="true" ForeColor="Brown" runat="server" Text="Reply Given On: " class="fontingrid" />
                                                <asp:Label ID="lblpbgson2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("forwardedOn") %>' class="fontingrid" />
                                                <br />
                                                <br />
                                                <asp:Label ID="lblpbgsdownload" Font-Bold="true" ForeColor="Brown" runat="server" Text="Download: " class="fontingrid" />
                                                <asp:LinkButton ID="lnkviewdownloadpbgs" CommandName="downloadpbgsForwarded" Font-Underline="false" Font-Bold="true" ForeColor="Blue" runat="server" Text="" class="fontingrid" />
                                                <br />
                                                <br />
                                                <asp:Label ID="lblrmkpbgs" Font-Bold="true" ForeColor="Brown" runat="server" Text="Reply: " class="fontingrid" />
                                                <asp:Label ID="lblrmkpbgs2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("prevremarks") %>' class="fontingrid" />

                                                <asp:Label ID="lblpbgsfileuploadoutput" runat="server" Text='<%#Eval("prevfileuploadoutput") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblprevfilename" runat="server" Text='<%#Eval("fileforwardedbyprevOffc") %>' Visible="false"></asp:Label>
                                            </div>
                                        </itemtemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Action Taken with Remarks">
                                        <itemtemplate>
                                            <%-- <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server"
                                            Font-Size="Smaller" class="btn btn-info" Width="80px"></asp:LinkButton>--%>
                                            <div align="left" runat="server" style="padding-top: 15px; padding-bottom: 15px; padding-left: 15px; padding-right: 15px">
                                                <asp:Label ID="lblac" Font-Bold="true" ForeColor="Brown" runat="server" Text="Action : " class="fontingrid" />
                                                <asp:Label ID="lblaction" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                    CausesValidation="False" Text='<%#Eval("currentstatus") %>'></asp:Label>
                                                <asp:Label ID="lblcurrentstatus" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                    CausesValidation="False" Visible="false" Text='<%#Eval("currentstatusID") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="lblFilefwd" Font-Bold="true" ForeColor="Brown" runat="server" Text="Document Forwarded : " class="fontingrid" />
                                                <asp:LinkButton ID="lblfilefwd2" Font-Bold="true" ToolTip="File Forwarded Status" CommandName="fwddownload2" ForeColor="Blue" runat="server" Text="" class="fontingrid"></asp:LinkButton>

                                                <asp:Label ID="lblfilefwdupldoutput" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                    CausesValidation="False" Visible="false" Text='<%#Eval("forwardedfileuploadoutput") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="Label21" Font-Bold="true" ForeColor="Brown" runat="server" Text="Email sent to : " class="fontingrid" />
                                                <asp:Label ID="Label22" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Emailsendto") %>' class="fontingrid" />
                                                <br />
                                                <br />
                                                <asp:Label ID="Label29" Font-Bold="true" ForeColor="Brown" runat="server" Text="CC to : " class="fontingrid" />
                                                <asp:Label ID="Label30" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("ccmailto") %>' class="fontingrid" />
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="lnkresend_details" runat="server" CommandName="ShowPopup" Text=""></asp:LinkButton>


                                            </div>
                                        </itemtemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Final Status">
                                        <itemtemplate>

                                            <%-- <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server"
                                            Font-Size="Smaller" class="btn btn-info" Width="80px"></asp:LinkButton>--%>
                                            <div align="center" runat="server" style="padding: 8px">
                                                <asp:Label ID="lnkstatus" CommandName="statusdetails" runat="server" CssClass="btn btn-info font2" ForeColor="Blue"
                                                    CausesValidation="False" Text='<%#Eval("GreStatus") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="lblres0" Font-Bold="true" ForeColor="Brown" runat="server" Text="Resolved On : " class="fontingrid" />
                                                <asp:Label ID="lblre" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                    CausesValidation="False" Text='<%#Eval("ResolvedOn") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="lnktrack" CommandName="Trackinfo" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue"
                                                    CausesValidation="False" Text="Track Grievance">
                                                </asp:LinkButton>
                                                <%--     <asp:Label ID="lblrem" Font-Bold="true" ForeColor="Brown" runat="server" Text="Resolved By : " class="fontingrid" />--%>
                                                <%--<asp:Label ID="lblremarkbydealingoffr" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("") %>' class="fontingrid" />--%>
                                            </div>
                                            <asp:Label ID="lblgrievanceIDGrid" runat="server" Text='<%#Eval("Gre_Id") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblresolvedflag" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                        </itemtemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Take an Action">
                                        <itemtemplate>
                                            <%-- <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server"
                                            Font-Size="Smaller" class="btn btn-info" Width="80px"></asp:LinkButton>--%>
                                            <div align="center" runat="server" style="padding: 8px">
                                                <asp:LinkButton ID="lnkaction" CommandName="takeaction" runat="server" BackColor="#99FFCC" CssClass="btn font2" ForeColor="Black"
                                                    CausesValidation="False" Text="Action">
                                                </asp:LinkButton>
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="lnkresendemail" CommandName="ResendEmail" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue"
                                                    CausesValidation="False" Text="Send a Reminder to Station/Section via E-Mail">
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="lnkresendemailtoComplainant" CommandName="ResendEmailtoComplainant" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue"
                                                    CausesValidation="False" Text="Resend Email to Complainant">
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="lnkview" CommandName="View" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue" Visible="false"
                                                    CausesValidation="False" Text="View/Get Pdf">
                                                </asp:LinkButton>
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

                            <asp:LinkButton Text="" ID="lnkFake" runat="server" />
                            <ajaxtoolkit:modalpopupextender id="mpe" runat="server" popupcontrolid="pnlPopup" targetcontrolid="lnkFake"
                                backgroundcssclass="modalBackground" cancelcontrolid="btnClose">
                            </ajaxtoolkit:modalpopupextender>
                            <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 65%;" Width="80%">

                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <contenttemplate>
                                        <div class="header">
                                            <asp:Label ID="Label51" Visible="true" Text="Resend Email Details" Font-Bold="true" Font-Size="Medium" runat="server" />

                                        </div>
                                        <div id="currentdetail" class="body" runat="server">
                                            <div id="divtitle1" class="body" runat="server" align="left" style="padding-top: 20px; padding-left: 20px">
                                                <asp:Label ID="lblgrivancepanel" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" Text="Grievance Reference-ID: " />
                                                <asp:Label ID="Label55" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                                            </div>
                                            <div class="table-responsive" runat="server" align="center" style="padding: 20px">
                                                <asp:GridView ID="grdresendmails" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                                    PageSize="5" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .."
                                                    ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid" OnPageIndexChanging="grdresend_PageIndexChanging"
                                                    BorderWidth="2px">
                                                    <alternatingrowstyle backcolor="White" />
                                                    <columns>
                                                        <asp:TemplateField HeaderText="S.No.">
                                                            <itemtemplate>
                                                                <asp:Label ID="lblSNo" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                            </itemtemplate>
                                                            <itemstyle horizontalalign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Email Send to/Recipients">
                                                            <itemtemplate>
                                                                <div style="padding-left: 10px">
                                                                    <asp:Label ID="Label211" Font-Bold="true" ForeColor="Brown" runat="server" Text="Primary : " class="fontingrid" />
                                                                    <asp:Label ID="lblemialresendtogrid" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Emailsendto") %>'
                                                                        Font-Bold="True" />
                                                                    <br />
                                                                    <asp:Label ID="Label50" Font-Bold="true" ForeColor="Brown" runat="server" Text="CC : " class="fontingrid" />
                                                                    <asp:Label ID="lblccresendtogrid" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("ccto") %>'
                                                                        Font-Bold="True" />
                                                                </div>
                                                            </itemtemplate>
                                                            <headerstyle horizontalalign="Center" />
                                                            <itemstyle horizontalalign="Left" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Send Email On">
                                                            <itemtemplate>
                                                                <div style="padding-left: 10px">
                                                                    <asp:Label ID="lblemailsendon" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("createdon") %>'
                                                                        Font-Bold="True" />

                                                                </div>
                                                            </itemtemplate>
                                                            <headerstyle horizontalalign="Center" />
                                                            <itemstyle horizontalalign="Left" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Remarks">
                                                            <itemtemplate>
                                                                <div style="padding-left: 10px">
                                                                    <asp:Label ID="lblremresendgrid" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Remarks") %>'
                                                                        Font-Bold="True" />

                                                                </div>
                                                            </itemtemplate>
                                                            <headerstyle horizontalalign="Center" />
                                                            <itemstyle horizontalalign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="File Attached">
                                                            <itemtemplate>
                                                                <div style="padding-left: 10px">

                                                                    <asp:LinkButton ID="lblattachedfile" ForeColor="Blue" class="fontingrid" runat="server" CommandName="gridresenddownload" Text='<%#Eval("attachedfilename") %>' Visible="true"
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
                                            <asp:Button ID="btnClose" runat="server" Text="X Close" CssClass="btn" Font-Bold="true" Font-Size="Large" BackColor="#E67E22" ForeColor="Black" CausesValidation="False" />
                                        </div>
                                    </contenttemplate>
                                </asp:UpdatePanel>

                            </asp:Panel>


                            <asp:LinkButton Text="" ID="lnkfaketrack" runat="server" />
                            <ajaxtoolkit:modalpopupextender id="mpetrack" runat="server" popupcontrolid="pnlPopuptrack" targetcontrolid="lnkfaketrack"
                                backgroundcssclass="modalBackground" cancelcontrolid="btnClosetrack">
                            </ajaxtoolkit:modalpopupextender>
                            <asp:Panel ID="pnlPopuptrack" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 70%;" Width="80%">

                                <asp:UpdatePanel ID="UpdatePaneltrack" runat="server">
                                    <contenttemplate>
                                        <div class="header">
                                            <asp:Label ID="Label57" Visible="true" Text="Track of Grievances" Font-Bold="true" Font-Size="Medium" runat="server" />
                                        </div>
                                        <div id="Div16" class="body" runat="server">
                                            <div id="div17" class="body" runat="server" align="left" style="padding-top: 20px; padding-left: 20px">
                                                <asp:Label ID="Label58" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" Text="Grievance Reference-ID: " />
                                                <asp:Label ID="Label59" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                                            </div>
                                            <div class="table-responsive" runat="server" align="center" style="padding: 20px">
                                                <asp:GridView ID="grdtrack" runat="server" AutoGenerateColumns="False" AllowPaging="True" ToolTip="Track Of Grievances"
                                                    PageSize="5" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .."
                                                    ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid" OnPageIndexChanging="grdtrack_PageIndexChanging"
                                                    BorderWidth="2px" OnRowCommand="grdtrack_RowCommand" OnRowDataBound="grdtrack_RowDataBound">
                                                    <alternatingrowstyle backcolor="White" />
                                                    <columns>
                                                        <asp:TemplateField HeaderText="S.No.">
                                                            <itemtemplate>
                                                                <asp:Label ID="lblSNo" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                            </itemtemplate>
                                                            <itemstyle horizontalalign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Dealing Section">
                                                            <itemtemplate>
                                                                <div style="padding-left: 10px; right: 10px" align="left">
                                                                    <asp:Label ID="Label271" Font-Bold="true" ForeColor="Brown" runat="server" Text="Section: " class="fontingrid" />
                                                                    <asp:Label ID="lbldealingsec" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Dealing_Section") %>'
                                                                        Font-Bold="True" />
                                                                    <br />
                                                                    <asp:Label ID="Label500" Font-Bold="true" ForeColor="Brown" runat="server" Text="Recieved On: " class="fontingrid" />
                                                                    <asp:Label ID="lblreqtrack" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Request_Receivedon") %>'
                                                                        Font-Bold="True" />
                                                                </div>
                                                            </itemtemplate>
                                                            <headerstyle horizontalalign="Center" />
                                                            <itemstyle horizontalalign="Left" />
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Action Taken">
                                                            <itemtemplate>
                                                                <div style="padding-left: 10px; right: 10px; right: 10px" align="left">
                                                                    <asp:Label ID="lblactiontrachk" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("currentstatus") %>'
                                                                        Font-Bold="True" />

                                                                </div>
                                                            </itemtemplate>
                                                            <headerstyle horizontalalign="Center" />
                                                            <itemstyle horizontalalign="Left" />
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="File Attached">
                                                            <itemtemplate>
                                                                <div style="padding-left: 10px; right: 10px" align="left">
                                                                    <asp:LinkButton ID="lnkfiledownloadresend" ForeColor="Blue" class="fontingrid" CommandName="gridtackdownload" runat="server" Text='<%#Eval("attachedFilename") %>'
                                                                        Font-Bold="True" CausesValidation="False" />
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
                            <br />

                        </div>
                    </div>
                    <%--</div>--%>
                </div>

                <%-- <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
            </div>



        </div>
        <div id="divresendmail" runat="server" visible="false" align="center" style="padding: 10px;">
            <div id="div20" runat="server" style="border: medium ridge #000000; padding-top: 20px; padding-bottom: 20px; margin: auto 30px auto 30px">
                <div class="row" style="margin: auto" runat="server" id="div13">
                    <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                =
                     <div align="center" class=" col-lg-12 col-md-12" runat="server" id="div14">

                         <table class="table table table-bordered grad2new def" cellpadding="5" rules="all" style="border-style: ridge; border-width: medium; z-index: 1; position: relative;">
                             <tr class="grad3">
                                 <td align="center" colspan="2" style="padding-top: 8px; padding-bottom: 8px">
                                     <asp:Label ID="Label60" runat="server" Text="Send Reminder/Notification on E-Mail" CssClass="font2" Style="font-weight: bold; color: Black;"></asp:Label>
                                     &nbsp;
                                 </td>
                             </tr>
                             <tr class="trnew">
                                 <td width="40%" align="right" style="padding-right: 30px">
                                     <asp:Label ID="Label27" runat="server" Text="Grievance Reference ID" ForeColor="Black" class="font"
                                         Style="font-weight: bold;"></asp:Label>
                                     &nbsp;
                                 </td>
                                 <td width="60%" align="left" style="padding-left: 15px">
                                     <asp:Label ID="Label28" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>



                                 </td>
                             </tr>
                             <tr class="trnew">
                                 <td width="40%" align="right" style="padding-right: 30px">
                                     <asp:Label ID="Label40" runat="server" Text="Name & Mobile Number of Complainant" ForeColor="Black" class="font"
                                         Style="font-weight: bold;"></asp:Label>
                                     &nbsp;
                                 </td>
                                 <td width="60%" align="left" style="padding-left: 15px">
                                     <asp:Label ID="Label42" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                 </td>
                             </tr>
                             <tr class="trnew">
                                 <td width="40%" align="right" style="padding-right: 30px">
                                     <asp:Label ID="Label44" runat="server" Text="Dept/Section to which the Grievance is related(as selected by the complainant)" ForeColor="Black" class="font"
                                         Style="font-weight: bold;"></asp:Label>
                                     &nbsp;
                                 </td>
                                 <td width="60%" align="left" style="padding-left: 15px">
                                     <asp:Label ID="Label45" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                 </td>
                             </tr>
                             <tr class="trnew">
                                 <td width="40%" align="right" style="padding-right: 30px">
                                     <asp:Label ID="Label46" runat="server" Text="Grievance Regd. On" ForeColor="Black" class="font"
                                         Style="font-weight: bold;"></asp:Label>
                                     &nbsp;
                                 </td>
                                 <td width="60%" align="left" style="padding-left: 15px">
                                     <asp:Label ID="Label47" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                 </td>
                             </tr>
                             <tr class="trnew">
                                 <td width="40%" align="right" style="padding-right: 30px">
                                     <asp:Label ID="Label48" runat="server" Text="Grievance/Complaint" ForeColor="Black" class="font"
                                         Style="font-weight: bold;"></asp:Label>
                                     &nbsp;
                                 </td>
                                 <td width="60%" align="left" style="padding-left: 15px">
                                     <asp:Label ID="Label49" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                 </td>
                             </tr>
                             <tr class="trnew">
                                 <td width="40%" align="right" style="padding-right: 30px">
                                     <asp:Label ID="Label23" runat="server" Text="Email" ForeColor="Black" class="font"
                                         Style="font-weight: bold;"></asp:Label>
                                     &nbsp; </td>
                                 <td width="60%" align="left" style="padding-left: 15px">

                                     <div style="padding: 5px">
                                         <asp:TextBox ID="txtemailresend" runat="server" Placeholder="Primary Email" AutoComplete="off" ValidationGroup="resend" CssClass="select font2 widthofboxes1" Height="30px" Width="90%"></asp:TextBox>
                                         &nbsp;<br />
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Email Required!!"
                                             ControlToValidate="txtemailresend" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium" Font-Bold="true" ValidationGroup="resend"
                                             Display="Dynamic">
                                         </asp:RequiredFieldValidator>
                                         <ajaxtoolkit:autocompleteextender runat="server" id="AutoCompleteExtender1" targetcontrolid="txtemailresend" completionlistitemcssclass="autoCompletePanel"
                                             servicemethod="EmailResend" minimumprefixlength="2" enablecaching="false" completionsetcount="1"
                                             enabled="true">
                                         </ajaxtoolkit:autocompleteextender>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtemailresend" Display="Dynamic" Font-Size="Medium" Font-Bold="true" ValidationGroup="resend"
                                             ErrorMessage="Not a Valid Email!!" ForeColor="Red"
                                             ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                         </asp:RegularExpressionValidator>
                                         <span style="color: black; font-size: small;"><strong>
                                             <br />
                                             *Mention an Email Id of the section,to whom you are forwarding this information.</strong></span><br />
                                         <span style="color: red; font-size: small;"><strong>**Multiple Recipents are not allowed.</strong></span><br />
                                         <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender5" runat="server"
                                             targetcontrolid="txtemailresend" validchars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@.-!#$^?=">
                                         </ajaxtoolkit:filteredtextboxextender>

                                     </div>
                                     <div style="padding: 5px">
                                         <asp:TextBox ID="txt_CC_Resend" runat="server" Placeholder="CC to(If Any)" AutoComplete="off" CssClass="select font2 widthofboxes1" Height="30px" Width="90%"></asp:TextBox>
                                         <br />
                                         <span style="color: black; font-size: small;"><strong>**Multiple Recipients are allowed in CC. Here the recipients must be seperated by </strong></span>
                                         <span style="color: black; font-size: large;"><strong>comma ( , ). </strong></span><span style="color: black; font-size: small;"><strong>No other seperators are allowed. </strong></span>
                                         <br />
                                         <ajaxtoolkit:autocompleteextender runat="server" id="AutoCompleteExtender2" targetcontrolid="txt_CC_Resend" completionlistitemcssclass="autoCompletePanel"
                                             servicemethod="EmailResend" minimumprefixlength="2" enablecaching="false" completionsetcount="1"
                                             enabled="true">
                                         </ajaxtoolkit:autocompleteextender>
                                         <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender6" runat="server"
                                             targetcontrolid="txt_CC_Resend" validchars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@.-!#$^,?=">
                                         </ajaxtoolkit:filteredtextboxextender>
                                     </div>
                                 </td>
                             </tr>
                             <tr class="trnew">
                                 <td width="40%" align="right" style="padding-right: 30px">
                                     <asp:Label ID="Label24" runat="server" Text="Remarks" ForeColor="Black"
                                         class="font" Style="font-weight: bold;"></asp:Label>
                                     &nbsp; </td>
                                 <td width="60%" align="left" style="padding-left: 15px">
                                     <asp:TextBox ID="txtremkresend" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="resend"
                                         TextMode="MultiLine">
                                     </asp:TextBox>
                                     <br />
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Remarks can not exceed by 1000 Letters!!"
                                         Style="color: #FF0000" ControlToValidate="txtremkresend" ValidationExpression="^[\s\S\d]{1,1000}$"
                                         Display="Dynamic" Font-Size="Medium" Font-Bold="true" ValidationGroup="resend">
                                     </asp:RegularExpressionValidator>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Text Required!!"
                                         ControlToValidate="txtremkresend" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium" Font-Bold="true" ValidationGroup="resend"
                                         Display="Dynamic">
                                     </asp:RequiredFieldValidator>
                                     <div runat="server" id="div15" style="padding-top: 10px; padding-bottom: 10px">
                                         <asp:FileUpload ID="FileUpload3" runat="server" class="select widthofboxes1" Height="22px" Font-Size="Medium" Font-Bold="true" />
                                         &nbsp;<span style="color: red; font-weight: bold; font-size: small"><br />
                                             * Upload supporting document upto 3MB, If necessary</span>
                                         <br />
                                         <asp:Label ID="Label25" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" Text="** Only .pdf are allowed to upload"></asp:Label>
                                         <asp:Label ID="Label26" Visible="true" runat="server" Text="" CssClass="fontingrid" Font-Bold="true" ForeColor="Red"></asp:Label>
                                     </div>
                                 </td>
                             </tr>
                             <tr class="trnew">
                                 <td align="right" style="padding-right: 10px">
                                     <asp:Button ID="Button3" runat="server" Text="Resend" Font-Size="Large" class="btn select buttondocumentupload" ValidationGroup="resend"
                                         Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="Button3_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" />
                                 </td>
                                 <td align="left" style="padding-left: 10px">
                                     <asp:Button ID="Button5" runat="server" Text="Close" Font-Size="Large" class="btn select gradbody buttondocumentupload" ValidationGroup="resend"
                                         Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button5_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" />
                                     &nbsp; </td>
                             </tr>
                         </table>
                     </div>
                </div>
                <%-- <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
            </div>
        </div>
        <div id="divresorfor" runat="server" visible="false" align="center" style="padding: 10px;">
            <div class="row" style="margin: auto" runat="server" id="div4">
                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                <div align="center" class=" col-md-12  col-lg-12" runat="server" id="div6">
                    <div id="div22" class="grad2new" runat="server" style="border: medium ridge #000000; padding-top: 20px; padding-bottom: 20px; margin: auto 20px auto 20px">
                        <div runat="server" align="center">
                            <asp:Label runat="server" Text=":: Select an Action to Perform ::" ForeColor="Black" Font-Size="Large" Font-Bold="true" class="font2" Font-Underline="true"></asp:Label>
                        </div>
                        <div runat="server" align="right" style="padding-right: 30px">
                            <asp:Button ID="Button6" runat="server" CausesValidation="False" Font-Bold="true" Font-Size="Medium" ForeColor="Black" Text="x" ValidationGroup="fwd" Width="30px" OnClick="Button6_Click" />
                        </div>
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" CellPadding="2" class="font2 chk" ForeColor="Black"
                                CellSpacing="2" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                                <asp:ListItem Value="1">&nbsp;&nbsp;Close</asp:ListItem>
                                <asp:ListItem Value="3">&nbsp;&nbsp;Forward</asp:ListItem>
                            </asp:CheckBoxList>
                        </asp:Panel>
                    </div>
                    <div id="divresolvedaction" runat="server" visible="false" align="center" style="margin-top: 30px">
                        <div id="div18" runat="server" style="border: medium ridge #000000; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px; margin: auto 20px auto 20px">

                            <table class="table table table-bordered grad2new def" cellpadding="5" rules="all" style="border-style: ridge; border-width: medium; z-index: 1; position: relative;">
                                <tr class="grad3">
                                    <td align="center" colspan="2" style="padding-top: 8px; padding-bottom: 8px">
                                        <asp:Label ID="Label61" runat="server" Text="Close a Grievance/File a Reply " CssClass="font2" Style="font-weight: bold; color: Black;"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label35" runat="server" Text="Grievance Reference ID" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblrefidres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>



                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label37" runat="server" Text="Name & Mobile Number of Complainant" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblnameres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label36" runat="server" Text="Dept/Section to which the Grievance is related(as selected by the complainant)" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lbldeptres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label39" runat="server" Text="Grievance Regd. On" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lbldateres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label41" runat="server" Text="Grievance/Complaint" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblgrievanceres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label52" runat="server" Text="Reply Given By & Given On" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblreplybyres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label53" runat="server" Text="Reply" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblreplyres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label9" runat="server" Text="Email" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <div style="padding: 5px">
                                            <asp:TextBox ID="txtEmailres" runat="server" Placeholder="Primary Email" AutoComplete="off" ReadOnly="true" CssClass="select font2 widthofboxes1" Height="30px" ValidationGroup="sub1" Width="90%"></asp:TextBox>
                                            &nbsp;<span style="color: black; font-size: medium;"><strong>*&nbsp;
                                                <br />
                                            </strong></span>
                                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="True" Font-Bold="true" ForeColor="Blue" Font-Size="Small" OnClick="LinkButton1_Click" CausesValidation="False">Change Email</asp:LinkButton>
                                            &nbsp;&nbsp;
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmailres" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub2" Display="Dynamic" ErrorMessage="RegularExpressionValidator"
                                                ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                Not a Valid Email!!</asp:RegularExpressionValidator>
                                            <span style="color: black; font-size: small;"><strong>
                                                <br />
                                                *Email of the complainant as mentioned by him/her during the filing of grievance.</strong></span>
                                            <br />
                                            <span style="color: red; font-size: small;"><strong>**Multiple Recipents are not allowed.</strong></span><br />
                                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender2" runat="server"
                                                targetcontrolid="txtEmailres" validchars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@.-!#$^?=">
                                            </ajaxtoolkit:filteredtextboxextender>

                                        </div>
                                        <div style="padding: 5px">
                                            <asp:TextBox ID="txtccresto" runat="server" AutoComplete="off" Placeholder="CC to(If Any)" CssClass="select font2 widthofboxes1" Height="30px" Width="90%"></asp:TextBox>
                                            <br />
                                            <span style="color: black; font-size: small;"><strong>**Multiple Recipients are allowed in CC. Here the recipients must be seperated by </strong></span>
                                            <span style="color: black; font-size: large;"><strong>comma ( , ). </strong></span><span style="color: black; font-size: small;"><strong>No other seperators are allowed. </strong></span>
                                            <br />
                                            <ajaxtoolkit:autocompleteextender runat="server" id="AutoCompleteExtender3" targetcontrolid="txtccresto" completionlistitemcssclass="autoCompletePanel"
                                                servicemethod="EmailResend" minimumprefixlength="2" enablecaching="false" completionsetcount="1"
                                                enabled="true">
                                            </ajaxtoolkit:autocompleteextender>
                                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender3" runat="server"
                                                targetcontrolid="txtccresto" validchars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@.-!#$^,?=">
                                            </ajaxtoolkit:filteredtextboxextender>
                                        </div>

                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style2">
                                        <asp:Label ID="Label11" runat="server" Text="Remarks" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style2">
                                        <div style="padding: 15px">
                                            <asp:UpdatePanel runat="server">
                                                <contenttemplate>
                                                    <div id="divchkcopyfile" runat="server" style="padding-top: 10px; bottom: 10px">
                                                        <asp:CheckBox ID="chkcopyafile" lass="font2 chk" ForeColor="Black" runat="server" Text="Tick here to send the same file, as recieved in reply" AutoPostBack="True" CssClass="chk" Font-Bold="True" Font-Size="Medium" OnCheckedChanged="chkcopyafile_CheckedChanged" ToolTip="Tick here to send the same file, as recieved in reply" />
                                                    </div>
                                                    <div style="padding-top: 10px; bottom: 10px">
                                                        <asp:CheckBox ID="chkcopyreply" lass="font2 chk" ForeColor="Black" runat="server" Text="Tick here to copy a reply in remarks box " OnCheckedChanged="chkcopyreply_CheckedChanged" AutoPostBack="True" CssClass="chk" Font-Bold="True" Font-Italic="False" Font-Size="Medium" />
                                                    </div>
                                                    <asp:TextBox ID="txtremarksres" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="sub2"
                                                        TextMode="MultiLine">
                                                    </asp:TextBox>
                                                    <br />
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub2"
                                                        runat="server" ErrorMessage="Remarks can not exceed by 1000 Letters!!"
                                                        Style="color: #FF0000" ControlToValidate="txtremarksres" ValidationExpression="^[\s\S\d]{1,1000}$"
                                                        Display="Dynamic" class="font">
                                                    </asp:RegularExpressionValidator>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Text Required!!"
                                                        ControlToValidate="txtremarksres" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub2"
                                                        Display="Dynamic">
                                                    </asp:RequiredFieldValidator>
                                                    <div runat="server" id="div11" visible="false" style="padding-top: 10px; padding-bottom: 10px">
                                                        <asp:LinkButton ID="lblfileupload1_lnk" CssClass="fontingrid" ForeColor="Blue" Font-Bold="true" runat="server"></asp:LinkButton>
                                                    </div>
                                                    <div runat="server" id="divLOupload" style="padding-top: 10px; padding-bottom: 2px">
                                                        <asp:FileUpload ID="FileUpload1" runat="server" class="select widthofboxes1" Height="22px" Font-Size="Medium" Font-Bold="true" />
                                                        &nbsp;<span style="color: red; font-weight: bold; font-size: small">
                                            * Upload supporting document upto 3MB, If necessary</span>
                                                        <br />
                                                        <asp:Label ID="Label12" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" Text="** Only .pdf are allowed to upload"></asp:Label>
                                                        <asp:Label ID="lblexception" Visible="true" runat="server" Text="" CssClass="fontingrid" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                    </div>
                                                </contenttemplate>
                                                <triggers>
                                                    <asp:PostBackTrigger ControlID="btnsubmit" />
                                                </triggers>
                                            </asp:UpdatePanel>
                                        </div>



                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td align="right" style="padding-right: 10px">
                                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" Font-Size="Large" class="btn select buttondocumentupload" ValidationGroup="sub2"
                                            Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnsubmit_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" />
                                    </td>
                                    <td align="left" style="padding-left: 10px">
                                        <asp:Button ID="Button2" runat="server" Text="Close" Font-Size="Large" class="btn select gradbody buttondocumentupload"
                                            Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button2_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" />
                                        &nbsp; </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div id="divforwardedaction" runat="server" visible="false" align="center" style="margin-top: 30px">
                        <div id="div212" runat="server" style="border: medium ridge #000000; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px; margin: auto 20px auto 20px">

                            <table class="table table table-bordered grad2new def" cellpadding="5" rules="all" style="border-style: ridge; border-width: medium; z-index: 1; position: relative;">
                                <tr class="grad3">
                                    <td align="center" colspan="2" style="padding-top: 8px; padding-bottom: 8px">
                                        <asp:Label ID="Label62" runat="server" Text="Forward a Grievance" CssClass="font2" Style="font-weight: bold; color: Black;"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label31" runat="server" Text="Grievance Reference ID" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblrefIdFwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>



                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label32" runat="server" Text="Name & Mobile Number of Complainant" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblnamefwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                    <tr>
                                        <td width="40%" align="right" style="padding-right: 30px">
                                            <asp:Label ID="Label38" runat="server" Text="Dept/Section to which the Grievance is related(as selected by the complainant)" ForeColor="Black" class="font"
                                                Style="font-weight: bold;"></asp:Label>
                                            &nbsp;
                                        </td>
                                        <td width="60%" align="left" style="padding-left: 15px">
                                            <asp:Label ID="lbldeptfwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                        </td>
                                    </tr>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label33" runat="server" Text="Grievance Regd. On" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lbldatefwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label34" runat="server" Text="Grievance/Complaint" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblgrievancefwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label54" runat="server" Text="Reply Given By & Given On" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblreplybyfwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label56" runat="server" Text="Reply" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:Label ID="lblreplyfwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label8" runat="server" Text="Forward to Department" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddldeptfwd" runat="server" AutoPostBack="True" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true"
                                            ValidationGroup="sub1" Height="30px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddldeptfwd_SelectedIndexChanged" Width="90%">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvdept" runat="server" ControlToValidate="ddldeptfwd" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1"
                                            Display="Dynamic" ErrorMessage="Pls. Select a Department!!" ForeColor="Red" SetFocusOnError="True"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label16" runat="server" Text="Forward to Section" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlsecfwd" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1"
                                            Height="30px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlsecfwd_SelectedIndexChanged" Width="90%" AutoPostBack="True">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvsection" runat="server" ControlToValidate="ddlsecfwd"
                                            Display="Dynamic" ErrorMessage="Pls. Select a section!!" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label20" runat="server" Text="Email" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <div style="padding: 5px">
                                            <div id="divsuggestedemail" runat="server" visible="false">
                                                <asp:Label ID="lblsecttdg" runat="server" Text="" Font-Bold="true" ForeColor="Black" CssClass="font2"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="lblsuggestedemails" runat="server" Text="" Font-Bold="true" ForeColor="Blue" CssClass="font2"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="lblsuggestedContact" runat="server" Text="" Font-Bold="true" ForeColor="Black" CssClass="font2"></asp:Label>
                                                <br />
                                                <br />
                                            </div>
                                            <asp:TextBox ID="txtemailforwarded" runat="server" Placeholder="Primay Email" AutoComplete="off" CssClass="select font2 widthofboxes1" Height="30px" ValidationGroup="sub1" Width="90%"></asp:TextBox>
                                            <ajaxtoolkit:autocompleteextender runat="server" id="AutoCompleteExtender4" targetcontrolid="txtemailforwarded" completionlistitemcssclass="autoCompletePanel"
                                                servicemethod="EmailResend" minimumprefixlength="2" enablecaching="false" completionsetcount="1"
                                                enabled="true">
                                            </ajaxtoolkit:autocompleteextender>
                                            <br />
                                            <asp:RegularExpressionValidator Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1" ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtemailforwarded"
                                                Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="Red"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                Not a Valid Email!!</asp:RegularExpressionValidator>
                                            <br />
                                            <span style="color: black; font-size: small;"><strong>*Mention an Email Id of the section,to whom you are forwarding this information.</strong></span><br />
                                            <span style="color: red; font-size: small;"><strong>**Multiple Recipents are not allowed.</strong></span><br />
                                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                                targetcontrolid="txtemailforwarded" validchars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@.-!#$^?=">
                                            </ajaxtoolkit:filteredtextboxextender>

                                        </div>
                                        <div style="padding: 5px">
                                            <asp:TextBox ID="txtcc" runat="server" Placeholder="CC to(If Any)" AutoComplete="off" CssClass="select font2 widthofboxes1" Height="30px" Width="90%"></asp:TextBox>
                                            <br />
                                            <span style="color: black; font-size: small;"><strong>**Multiple Recipients are allowed in CC. Here the recipients must be seperated by </strong></span>
                                            <span style="color: black; font-size: large;"><strong>comma ( , ). </strong></span><span style="color: black; font-size: small;"><strong>No other seperators are allowed. </strong></span>
                                            <br />
                                            <ajaxtoolkit:autocompleteextender runat="server" id="AutoCompleteExtender5" targetcontrolid="txtcc" completionlistitemcssclass="autoCompletePanel"
                                                servicemethod="EmailResend" minimumprefixlength="2" enablecaching="false" completionsetcount="1"
                                                enabled="true">
                                            </ajaxtoolkit:autocompleteextender>
                                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender4" runat="server"
                                                targetcontrolid="txtcc" validchars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@.-!#$^,?=">
                                            </ajaxtoolkit:filteredtextboxextender>


                                        </div>
                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label17" runat="server" Text="Remarks" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtremarksforward" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="sub1"
                                            TextMode="MultiLine">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Remarks can not exceed by 1000 Letters!!"
                                            Style="color: #FF0000" ControlToValidate="txtremarksforward" ValidationExpression="^[\s\S\d]{1,1000}$"
                                            Display="Dynamic" class="font" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1">
                                        </asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Text Required!!"
                                            ControlToValidate="txtremarksforward" ForeColor="Red" SetFocusOnError="True" class="font"
                                            Display="Dynamic" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1">
                                        </asp:RequiredFieldValidator>
                                        <div runat="server" id="div7" style="padding-top: 10px; padding-bottom: 10px">
                                            <asp:FileUpload ID="FileUpload2" runat="server" class="select widthofboxes1" Height="22px" Font-Size="Medium" Font-Bold="true" />
                                            &nbsp;<span style="color: red; font-weight: bold; font-size: small"><br />
                                                * Upload supporting document upto 3MB, If necessary</span>
                                            <br />
                                            <asp:Label ID="Label18" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" Text="** Only .pdf are allowed to upload"></asp:Label>

                                            <asp:Label ID="Label19" Visible="true" runat="server" Text="" CssClass="fontingrid" Font-Bold="true" ForeColor="Red"></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td align="right" style="padding-right: 10px">
                                        <asp:Button ID="btnfwd" runat="server" Text="Forward" Font-Size="Large" class="btn select buttondocumentupload" ValidationGroup="sub1"
                                            Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnfwd_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" />
                                    </td>
                                    <td align="left" style="padding-left: 10px">
                                        <asp:Button ID="Button4" runat="server" Text="Close" Font-Size="Large" class="btn select gradbody buttondocumentupload"
                                            Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button4_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" />
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <%--  <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
            </div>

        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>

