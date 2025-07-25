<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Apply_PBHS.aspx.cs" Inherits="PrasarNet.PBHS.Apply_PBHS" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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

        .gradpanel {
            background: linear-gradient(to bottom,rgba(93, 109, 126,0), rgba(93, 109, 126,1));
            -webkit-radial-gradient;
        }

        .gradpanelround {
            /* background: linear-gradient(to bottom,rgba(93, 109, 126,0), rgba(93, 109, 126,1));*/
            background: linear-gradient(to bottom,#D7DBDD, #E5E7E9);
            -webkit-radial-gradient;
            border-radius: 20px;
        }

        .gradheaderround {
            background: linear-gradient(to right,#6692F3, #A3E4D7);
            -webkit-radial-gradient;
            border-radius: 9px;
        }

        .gradheaderroundmain {
            background: linear-gradient(to right,#6692F3, #E8DAEF);
            -webkit-radial-gradient;
            border-radius: 9px;
        }

        .gradheader {
            /*background: linear-gradient(to right,#6692F3, #A3E4D7);*/
            background: linear-gradient(to bottom,#E9C9AC, #FFFDCD);
            -webkit-radial-gradient;
        }

        .padtxt {
            padding-left: 3px;
            padding-right: 3px;
        }

        table.table-bordered {
            border: 1px solid blue;
            margin-top: 20px;
        }

            table.table-bordered > thead > tr > th {
                border: 1px solid blue;
            }

            table.table-bordered > tbody > tr > td {
                border: 1px solid blue;
            }

        .tablecus2 {
            background: linear-gradient(to right, #F2F3F4, #E5E8E8);
        }

        .auto-style1 {
            height: 31px;
        }

        .font2 {
            color: #663300;
        }

        .completionList {
            border: solid 1px #444444;
            margin: 0px;
            padding: 2px;
            height: 130px;
            overflow: auto;
            background-color: #FDEBD0;
            font-size: small;
            font-weight: bold;
        }

        .listItem {
            color: #1C1C1C;
        }

        .itemHighlighted {
            background-color: #ffc0c0;
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
        var isItemSelected = false;
        function GetID(source, eventArgs) {
            isItemSelected = true;
            var HdnKey = eventArgs.get_value();
            document.getElementById('<%=hdnValue.ClientID %>').value = HdnKey;
        }
        //Handler for textbox blur event
        function checkItemSelected(txtInput) {
            if (!isItemSelected) {
                txtInput.value = "";
                document.getElementById('<%=lblmsga.ClientID %>').innerHTML = "Only, you are allowed to choose an Forwarding Officer from the list";
                //ContentSection_lblmsga.value = "Only choose items from the list";
                //console.log("Only choose items from the list");
                txtInput.focus();
            }
            else {
                document.getElementById('<%=lblmsga.ClientID %>').innerHTML = "";
            }
        }
        function resetItemSelected() {
            isItemSelected = false;
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
                </div>
            </nav>
        </div>
        <div id="AdminMenu" visible="false" runat="server" class="sticky">
            <nav class="navbar navbar-default  row-no-padding">
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar3">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
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
                                <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
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
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>
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
                                <li id="Li3" runat="server" visible="true"><a href="R_Roster/RR_Reports.aspx"><span style="color: #000000">Reservation Roster</span></a></li>
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
        <div class="row" style="padding: 10px 0px 0px 0px; margin: auto">
            <div id="Div1" class="col-md-12 col-sm-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="lnkback_" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" OnClick="lnkback__Click" Visible="False"> <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-menu-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <asp:LinkButton ID="btnhome" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" OnClick="btnhome_Click"> <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-menu-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
                <div id="divmainpanel" runat="server">
                    <asp:Panel ID="Viewbasicinfo" runat="server">

                        <%--<div align="center" class=" col-md-1 col-lg-1" runat="server"></div>--%>
                        <div class=" col-md-12  col-lg-12" runat="server" id="div2" style="padding: 25px">
                            <div class="panel gradpanelround">
                                <div class="panel-heading gradheaderroundmain" align="center">
                                    <span style="font-size: large; font-weight: bold; color: Black;">:: Apply for a New PBHS Card ::</span>
                                </div>
                                <div id="regform" align="center" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-left: 0px; margin-right: 0px; margin-top: 10px; margin-bottom: 50px; width: 100%; padding: 20px; border: medium groove #FFFFFF;">
                                    <div id="divlblMsg" runat="server">
                                        <span class="auto-style4 pull-left"><strong>Field marked with * are mandatory</strong></span><br />
                                    </div>
                                    <div class="tablecus2" runat="server" style="width: 97%; padding: 6px">
                                        <div class="panel-heading gradheaderround">
                                            <span style="font-size: large; font-weight: bold; color: Black;">:: Basic Information ::</span>
                                        </div>
                                        <table id="per" class="table table-bordered tablecus2">
                                            <tr runat="server" visible="true">
                                                <td align="center" runat="server" width="10%" class="auto-style1">
                                                    <asp:Label ID="Label12" CssClass="font2" runat="server" Text="1." Style="font-weight: 700; color: #000000"></asp:Label>
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
                                                    <asp:Label ID="Label16" CssClass="font2" runat="server" Text="2." Style="font-weight: 700; color: #000000"></asp:Label>
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
                                                    <asp:Label ID="Label3" CssClass="font2" runat="server" Text="3." Style="font-weight: 700; color: #000000"></asp:Label>
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
                                                    <asp:Label ID="Label50" CssClass="font2" runat="server" Text="4." Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="Label89" CssClass="font2" runat="server" Text="Contact No" Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                    <asp:Label ID="lblcontact_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td align="center" runat="server" width="10%">
                                                    <asp:Label ID="Label92" CssClass="font2" runat="server" Text="5." Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="Label93" CssClass="font2" runat="server" Text="E-Mail" Style="font-weight: 700; color: #000000"></asp:Label>
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
                                                    <asp:UpdatePanel runat="server">
                                                        <ContentTemplate>

                                                            <asp:Label ID="lblposting_bas" CssClass="font2" Visible="false" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                            <div id="divrenew" runat="server" visible="true">

                                                                <asp:DropDownList ID="ddlrenew" CssClass="txtbx select" Font-Bold="true" Font-Size="small" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg" AutoPostBack="true" OnSelectedIndexChanged="ddlrenew_SelectedIndexChanged">
                                                                    <asp:ListItem Value="0" Text="No, I am Applying for a New Card"></asp:ListItem>
                                                                    <asp:ListItem Value="1" Text="Yes, I would like to renew my Card"></asp:ListItem>

                                                                    <asp:ListItem Value="2" Text="No, I would like to apply card for new family members"></asp:ListItem>
                                                                </asp:DropDownList>
                                                                <span class="auto-style4"><strong>*</strong></span>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*required" ControlToValidate="ddlrenew" ValidationGroup="reg" SetFocusOnError="True"
                                                                    ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                            </div>
                                                            <div id="divrenew2" runat="server" visible="FALSE">
                                                                <asp:Label ID="Label19" CssClass="font2" Visible="false" Font-Bold="true" ForeColor="Black" runat="server" Text="Old Card No."></asp:Label>

                                                                <br />

                                                                <asp:TextBox ID="txtrenew" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" MaxLength="7" Width="90%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>

                                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                                                    TargetControlID="txtrenew" ValidChars="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIKLMNOPQRSTUVWXYZ-/"></ajaxToolkit:FilteredTextBoxExtender>
                                                                <%-- n--%>
                                                                <span class="auto-style4"><strong>*</strong></span>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtbasicpay" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                                    ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                                <asp:RegularExpressionValidator ValidationGroup="reg" Display="Dynamic" SetFocusOnError="True"
                                                                    Style="font-size: small" Font-Bold="true" ControlToValidate="txtbasicpay" ID="RegularExpressionValidator5" ValidationExpression="^[\s\S]{1,7}$" runat="server" ErrorMessage="Maximum 7 digits are allowed." ForeColor="Red">
                                                                </asp:RegularExpressionValidator>
                                                            </div>
                                                            <div id="div4" runat="server" visible="false">
                                                                <asp:Label ID="Label8" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                            </div>

                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </td>

                                            </tr>
                                            <tr runat="server" visible="false">
                                                <td align="center" runat="server" width="10%">
                                                    <asp:Label ID="Label4" CssClass="font2" runat="server" Text="8." Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="Label5" CssClass="font2" runat="server" Text="Gazetted/Non-Gazetted" Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                    <div id="divgazetted" runat="server" visible="true">

                                                        <asp:DropDownList ID="ddlgazetted" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg">
                                                            <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <span class="auto-style4"><strong>*</strong></span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*required" ControlToValidate="ddlgazetted" ValidationGroup="reg" SetFocusOnError="True"
                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                    </div>
                                                    <div id="divgazettedlbl" runat="server" visible="false">
                                                        <asp:Label ID="lblgazetted" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" runat="server" width="10%">
                                                    <asp:Label ID="Label90" CssClass="font2" runat="server" Text="8." Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="Label91" CssClass="font2" runat="server" Text="Basic Pay" Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                    <div id="divbasic" runat="server" visible="true">
                                                        <asp:TextBox ID="txtbasicpay" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" MaxLength="7" Width="90%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>

                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                                            TargetControlID="txtbasicpay" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                        <%-- n--%>
                                                        <span class="auto-style4"><strong>*</strong></span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtbasicpay" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                        <asp:RegularExpressionValidator ValidationGroup="reg" Display="Dynamic" SetFocusOnError="True"
                                                            Style="font-size: small" Font-Bold="true" ControlToValidate="txtbasicpay" ID="RegularExpressionValidator4" ValidationExpression="^[\s\S]{1,7}$" runat="server" ErrorMessage="Maximum 7 digits are allowed." ForeColor="Red">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                    <div id="divbasiclbl" runat="server" visible="false">
                                                        <asp:Label ID="lblbasiclbl" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" runat="server" width="10%">
                                                    <asp:Label ID="lbl10" CssClass="font2" runat="server" Text="9." Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="lbl10_1" CssClass="font2" runat="server" Text="Level in Pay Matrix" Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                    <div id="divlevel" runat="server" visible="true">
                                                        <%--<asp:TextBox ID="txtpaymatrix" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" MaxLength="10" Width="90%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>
                                                        --%>
                                                        <asp:DropDownList ID="ddlpaymatrix" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg">
                                                        </asp:DropDownList>

                                                        <%--<ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                                            targetcontrolid="txtpaymatrix" validchars="0123456789 abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-()">
                                                        </ajaxtoolkit:filteredtextboxextender>--%>
                                                        <%-- n--%>
                                                        <span class="auto-style4"><strong>*</strong></span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlpaymatrix" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                        <%--<asp:RegularExpressionValidator ValidationGroup="reg" Display="Dynamic" SetFocusOnError="True"
                                                            Style="font-size: small" Font-Bold="true" ControlToValidate="txtpaymatrix" ID="RegularExpressionValidator2" ValidationExpression="^[\s\S]{1,10}$" runat="server" ErrorMessage="Maximum 10 Characters are allowed." ForeColor="Red">
                                                        </asp:RegularExpressionValidator>--%>
                                                    </div>
                                                    <div id="divlevellbl" runat="server" visible="false">
                                                        <asp:Label ID="lbllevelLBL" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center" runat="server" width="10%">
                                                    <asp:Label ID="Label11" CssClass="font2" runat="server" Text="10." Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="Label11_1" runat="server" Text="Official Address(max 300 Characters are allowed)" class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">
                                                    <div id="divofficialAddress" runat="server" visible="true">
                                                        <asp:TextBox ID="txtoffcAddress" runat="server" TextMode="MultiLine" MaxLength="50" Width="90%" BackColor="#D6EAF8" class="txtbx select padtxt" Font-Size="Medium" Font-Bold="true" ValidationGroup="reg" Height="150px"></asp:TextBox>

                                                        <ajaxToolkit:FilteredTextBoxExtender runat="server" TargetControlID="txtoffcAddress" ValidChars=" 1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)(&-_%?/\][ ,"></ajaxToolkit:FilteredTextBoxExtender>
                                                        <span class="auto-style4"><strong>*</strong></span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtoffcAddress" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                        <asp:RegularExpressionValidator Display="Dynamic" SetFocusOnError="True" ValidationGroup="reg" Style="font-size: small"
                                                            Font-Bold="true" ControlToValidate="txtoffcAddress" ID="RegularExpressionValidator1" ValidationExpression="^[\s\S]{1,300}$"
                                                            runat="server" ErrorMessage="Maximum 300 characters are allowed." ForeColor="Red">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                    <div id="divofficialAdd_lbl" runat="server" visible="false">
                                                        <asp:Label ID="lblOfficialAdd" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center" runat="server" width="10%">
                                                    <asp:Label ID="Label9" CssClass="font2" runat="server" Text="11." Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="Label12_1" runat="server" Text="Residential Address(max 300 Characters are allowed)" class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">
                                                    <div id="divresAdd" runat="server" visible="true">
                                                        <asp:TextBox ID="txtresaddress" runat="server" TextMode="MultiLine" MaxLength="50" Width="90%" BackColor="#D6EAF8" class="txtbx select padtxt" Font-Size="Medium" Font-Bold="true" ValidationGroup="reg" Height="150px"></asp:TextBox>

                                                        <ajaxToolkit:FilteredTextBoxExtender runat="server" TargetControlID="txtresaddress" ValidChars=" ,1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)(&-_%?/\][ "></ajaxToolkit:FilteredTextBoxExtender>
                                                        <span class="auto-style4"><strong>*</strong></span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtresaddress" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                        <asp:RegularExpressionValidator Display="Dynamic" SetFocusOnError="True" ValidationGroup="reg" Style="font-size: small"
                                                            Font-Bold="true" ControlToValidate="txtresaddress" ID="RegularExpressionValidator3" ValidationExpression="^[\s\S]{1,300}$"
                                                            runat="server" ErrorMessage="Maximum 300 characters are allowed." ForeColor="Red">
                                                        </asp:RegularExpressionValidator>
                                                    </div>
                                                    <div id="divResAddLBL" runat="server" visible="false">
                                                        <asp:Label ID="lblresAdd_Lbl" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                    </div>
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
                                                    <div id="divdep" runat="server" visible="true">

                                                        <asp:DropDownList ID="ddldeputation" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg" AutoPostBack="True" OnSelectedIndexChanged="ddldeputation_SelectedIndexChanged">
                                                            <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <span class="auto-style4"><strong>*</strong></span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*required" ControlToValidate="ddldeputation" ValidationGroup="reg" SetFocusOnError="True"
                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                    </div>
                                                    <div id="divdeplbl" runat="server" visible="false">
                                                        <asp:Label ID="Label7" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                    </div>
                                                </td>
                                            </tr>
                                            <tr runat="server" visible="false" id="trdepDate">
                                                <td align="center" runat="server" width="10%">
                                                    <asp:Label ID="lbl13_2" CssClass="font2" runat="server" Text="12.2." Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="lbl13_2_1" CssClass="font2" runat="server" Text="If yes, likely completion of Deputation" Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                    <div id="divCompdep" runat="server" visible="true">



                                                        <asp:TextBox ID="txtdateCompletion" runat="server" AutoComplete="Off" BackColor="#D6EAF8" CssClass="txtbx select padtxt" Font-Size="Small" Height="30px" MaxLength="7" ValidationGroup="reg" Width="90%"></asp:TextBox>
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="txtdateCompletion_filteredtextboxextender" runat="server" TargetControlID="txtdateCompletion" ValidChars="- 0123456789" />
                                                        <span class="auto-style4"><strong>*</strong></span>
                                                        <%--<asp:RequiredFieldValidator ID="rqrdd3ee" runat="server" ControlToValidate="txtdateCompletion" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                            Text="*" ValidationGroup="reg" />--%>
                                                        <ajaxToolkit:CalendarExtender ID="txtdateCompletion_CalendarExtender" runat="server" BehaviorID="txtdateCompletion_CalendarExtender"
                                                            Format="dd-MM-yyyy" TargetControlID="txtdateCompletion" />
                                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderyearFo2o" runat="server"
                                                            TargetControlID="txtdateCompletion" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" Enabled="false" ErrorMessage="*required" ControlToValidate="txtdateCompletion" ValidationGroup="reg" SetFocusOnError="True"
                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                    </div>
                                                    <div id="divCompDep_lbl" runat="server" visible="false">
                                                        <asp:Label ID="lbldep_LBL" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                    </div>
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
                                                    <div id="divtransfer" runat="server" visible="true">

                                                        <asp:DropDownList ID="ddltransfer" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg">
                                                            <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <span class="auto-style4"><strong>*</strong></span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*required" ControlToValidate="ddltransfer" ValidationGroup="reg" SetFocusOnError="True"
                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                    </div>
                                                    <div id="divtransferLBL" runat="server" visible="false">
                                                        <asp:Label ID="lbltransfer_lbl" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                    </div>
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
                                                    <asp:Label ID="Label20" CssClass="font2" runat="server" Text="1." Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="right" runat="server" style="padding-right: 30px" width="30%" class="auto-style1">
                                                    <asp:Label ID="Label21" CssClass="font2" runat="server" Text="Application Marked to/ Forwarded To" Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                    <div id="divappFwd" runat="server" visible="true">
                                                        <asp:HiddenField ID="hdnValue" runat="server" />
                                                        <asp:Label ID="lblmsga" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                                        <br />
                                                        <%--<ajaxtoolkit:toolkitscriptmanager id="ToolkitScriptManager" runat="server">
                                                        </ajaxtoolkit:toolkitscriptmanager>--%>
                                                        <asp:Label ID="lblappforwarded" runat="server" Text="" Width="90%" Height="30px" BackColor="#D6EAF8" Style="font-weight: 700; color: #000000"></asp:Label>
                                                        <%--<asp:TextBox ID="txtappforwarded" CssClass="txtbx select padtxt" Font-Size="Small" 
                                                           onfocusout="checkItemSelected(this)" onfocus="resetItemSelected()"
                                                            runat="server" Width="90%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>--%>
                                                        <%--<ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender9" runat="server"
                                                            targetcontrolid="txtappforwarded" validchars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 -()">
                                                        </ajaxtoolkit:filteredtextboxextender>--%>
                                                        <%-- <span class="auto-style4"><strong>*</strong></span>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtappforwarded" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                        <ajaxtoolkit:autocompleteextender id="id1" onclientitemselected="GetID" runat="server" servicemethod="SearchbyName_empcode"
                                                            minimumprefixlength="2" completioninterval="100" enablecaching="false" completionsetcount="1"
                                                            targetcontrolid="txtappforwarded" firstrowselected="false"
                                                            completionlistcssclass="completionList" enabled="true"
                                                            completionlisthighlighteditemcssclass="itemHighlighted"
                                                            completionlistitemcssclass="listItem autoCompletePanel">
                                                        </ajaxtoolkit:autocompleteextender>--%>

                                                        <br />
                                                        <asp:Label ID="Label96" runat="server" Text="* Application would be forwarded to the HOO of the Station/office/Kendra." Style="font-weight: 700; color: #0000FF; font-size: small"></asp:Label>
                                                    </div>
                                                    <div id="divlblAppFwd" runat="server" visible="false">
                                                        <asp:Label ID="lblapplforwared_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                        <div class="panel-heading gradheaderround">
                                            <span style="font-size: large; font-weight: bold; color: Black;">:: Dependent/Family Details::</span>
                                        </div>
                                        <br />
                                        <div runat="server" align="left">
                                            <asp:Label runat="server" ID="lblmsg_family" Style="font-size: small; font-weight: bold; color: red;" Text="* Self Entry is Mandatory, inside a Family Details"></asp:Label>

                                        </div>
                                        <br />
                                        <asp:UpdatePanel runat="server">
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="grdhealth" />

                                            </Triggers>
                                            <ContentTemplate>
                                                <asp:GridView ID="grdhealth" DataKeyNames="id" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                                    CssClass="Gridview" ShowFooter="true" HeaderStyle-Font-Bold="true" OnRowDeleting="grdhealth_RowDeleting1"
                                                    PageSize="20" AllowPaging="true" HeaderStyle-ForeColor="White" Width="99%" ToolTip="Dependent Details" OnRowCommand="grdhealth_RowCommand" OnRowDataBound="grdhealth_RowDataBound">
                                                    <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                                                    <Columns>

                                                        <asp:TemplateField HeaderText="S.No.">
                                                            <EditItemTemplate>
                                                                <asp:Label ID="lblRow" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                                    <asp:Label ID="lblrowid" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                                    <asp:Label ID="lblhealth" runat="server" Text="Enter Detail"></asp:Label>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Name of Family Member">
                                                            <EditItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:TextBox ID="txthcNameEdit" runat="server" Font-Size="small" CssClass="select txtpad" TextMode="SingleLine" Text='<%#Eval("NameofMember") %>' MaxLength="100" Width="180px" Height="35px" ValidationGroup="validaiton" />
                                                                    <asp:RequiredFieldValidator ID="rqrdcat331" runat="server" ControlToValidate="txthcNameEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" ValidationGroup="updt" />
                                                                </div>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <div style="padding: 6px" align="left">
                                                                    <asp:Label ID="Label13" runat="server" Text="Name: " CssClass="fontingrid" ForeColor="Brown" Font-Bold="true" />
                                                                    <asp:Label ID="lblhcName" runat="server" Text='<%#Eval("NameofMember") %>' CssClass="fontingrid" />
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Label17" runat="server" Text="Beneficiary Id: " CssClass="fontingrid" ForeColor="Brown" Font-Bold="true" />
                                                                    <asp:Label ID="Label18" runat="server" Text='<%#Eval("BeneficiaryID") %>' CssClass="fontingrid" />

                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding: 6px" align="left">

                                                                    <asp:TextBox ID="txthcNamefooter" runat="server" Font-Size="small" CssClass="select txtpad" TextMode="SingleLine" MaxLength="100" Width="180px" Height="30px" ValidationGroup="validaiton" />
                                                                    <asp:RequiredFieldValidator ID="rqrdcathc656" runat="server" ControlToValidate="txthcNamefooter" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" ValidationGroup="validaiton" />

                                                                    <br />
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Relationship">
                                                            <EditItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:TextBox ID="txthcrelationEdit" runat="server" Font-Size="small" CssClass="select txtpad" TextMode="SingleLine" Text='<%#Eval("RelationShip") %>' MaxLength="50" Width="180px" Height="35px" ValidationGroup="validaiton" />
                                                                    <asp:RequiredFieldValidator ID="rqrdcat331" runat="server" ControlToValidate="txthcrelationEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" ValidationGroup="updt" />
                                                                </div>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:Label ID="lblrelation" runat="server" Text='<%#Eval("RelationShip") %>' CssClass="fontingrid" />
                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:DropDownList ID="ddlrelation" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="100px" Height="20px" ValidationGroup="reg">
                                                                    </asp:DropDownList>

                                                                    <%-- <asp:TextBox ID="txthcRelationfooter" runat="server" Font-Size="small" CssClass="select txtpad" TextMode="SingleLine" MaxLength="50" Width="180px" Height="30px" ValidationGroup="validaiton" />--%>
                                                                    <asp:RequiredFieldValidator ID="rqrdcathc2656" runat="server" ControlToValidate="ddlrelation" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" ValidationGroup="validaiton" />
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="occupation">
                                                            <EditItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:TextBox ID="txtoccupationEdit" runat="server" Font-Size="small" CssClass="select txtpad" TextMode="SingleLine" Text='<%#Eval("RelationShip") %>' MaxLength="50" Width="180px" Height="35px" ValidationGroup="validaiton" />
                                                                    <asp:RequiredFieldValidator ID="rqrdcat331" runat="server" ControlToValidate="txtoccupationEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" ValidationGroup="updt" />
                                                                </div>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:Label ID="lbloccupation" runat="server" Text='<%#Eval("occupation") %>' CssClass="fontingrid" />
                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                  

                                                    <asp:TextBox ID="txtoccupationFooter" runat="server" CssClass="select txtpad" Font-Size="small" TextMode="SingleLine" MaxLength="15" Width="100px" Height="30px" />
                                                                    <asp:RequiredFieldValidator ID="rqrdhc4cat3p1occupation" runat="server" ControlToValidate="txtoccupationFooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" />
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                                        TargetControlID="txtoccupationFooter" ValidChars=" abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+-."></ajaxToolkit:FilteredTextBoxExtender>
                                                              
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="DOB">
                                                            <EditItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:TextBox ID="txtdob" runat="server" autocomplete="off" PlaceHolder="DD-MM-YYYY" Text='<%#Eval("DOB", "{0:dd-MM-yyyy}") %>' CssClass="select padtxt" Width="70px" Height="20px" ValidationGroup="validaiton" />
                                                                    <asp:RequiredFieldValidator ID="rqrdwwd" runat="server" ControlToValidate="txtdob" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" ValidationGroup="validaiton" />
                                                                    <ajaxToolkit:CalendarExtender ID="txtdob_CalendarExtender" runat="server" BehaviorID="txtdob_CalendarExtender"
                                                                        Format="dd-MM-yyyy" TargetControlID="txtdob" />
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderyearE" runat="server"
                                                                        TargetControlID="txtdob" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>

                                                                </div>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldob" runat="server" Text='<%#Eval("DOB", "{0:dd-MMM-yyyy}") %>' CssClass="fontingrid" />
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:TextBox ID="txtdob_footer" Font-Size="small" autocomplete="off" PlaceHolder="DD-MM-YYYY" runat="server" Width="100px" Height="20px" CssClass="select padtxt" ValidationGroup="validaiton" />
                                                                    <asp:RequiredFieldValidator ID="rqrdd3ee" runat="server" ControlToValidate="txtdob_footer" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" ValidationGroup="validaiton" />
                                                                    <ajaxToolkit:CalendarExtender ID="txtdob_footer_CalendarExtender" runat="server" BehaviorID="txtdob_footer_CalendarExtender"
                                                                        Format="dd-MM-yyyy" TargetControlID="txtdob_footer" />
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderyearFo2o" runat="server"
                                                                        TargetControlID="txtdob_footer" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Blood Group">
                                                            <EditItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:TextBox ID="txthcbloodEdit" runat="server" CssClass="select txtpad" Font-Size="small" TextMode="SingleLine" Text='<%#Eval("BloodGrp") %>' MaxLength="2" Width="100px" Height="35px" ValidationGroup="validaiton" />
                                                                    <asp:RequiredFieldValidator ID="rqrdhc3cat331" runat="server" ControlToValidate="txthcageEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" ValidationGroup="updt" />
                                                                </div>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:Label ID="lblbloodgroup" runat="server" Text='<%#Eval("BloodGrp") %>' CssClass="fontingrid" />
                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:TextBox ID="txthcBloodFooter" runat="server" CssClass="select txtpad" Font-Size="small" TextMode="SingleLine" MaxLength="4" Width="100px" Height="30px" />
                                                                    <asp:RequiredFieldValidator ID="rqrdhc4cat3p1" runat="server" ControlToValidate="txthcBloodFooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" />
                                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd1" runat="server"
                                                                        TargetControlID="txthcBloodFooter" ValidChars=" abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+-"></ajaxToolkit:FilteredTextBoxExtender>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Upload a Adhaar Card/Child Birth certificate">
                                                            <EditItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                </div>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <%--<asp:Label ID="Label61d" runat="server" Text="Residing With Applicant: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                                    <br />
                                                                    <asp:Label ID="lblreswithapp" runat="server" Text='<%#Eval("residingwithApplicant") %>' CssClass="fontingrid" />
                                                                    <br />
                                                                    <br />--%>
                                                                    <asp:ImageButton ID="imgresiding" CausesValidation="False" CommandName="downloadresiding" runat="server" Height="35" Width="35" ToolTip="Download" ImageUrl="~/images/pdficon.png" />


                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding: 6px" align="left">
                                                                    <%--  <asp:DropDownList ID="ddlresiding" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="100px" Height="20px" ValidationGroup="reg">
                                                                        <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="rqrdhc4cat331" runat="server" ControlToValidate="ddlresiding" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" ValidationGroup="validaiton" />

                                                                    <br />
                                                                    <br />
                                                                    <span style="color: brown; font-size: small; font-weight: bold">If yes, then Upload a Adhaar Card</span>
                                                                    <br />--%>
                                                                    <asp:FileUpload ID="fileupload_Residing" runat="server" accept="application/pdf" />
                                                                    <br />
                                                                    <asp:Label ID="Label49e" runat="server" Style="font-weight: 700; font-size: small" Text="* Only .pdf file, upto 350kB are allowed."></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label55" runat="server" Style="font-weight: 700; font-size: small" Text="** It is mandatory to upload a supporting document"></asp:Label>

                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Photo">
                                                            <EditItemTemplate>
                                                                <div style="padding-left: 10px; padding-right: 10px;" align="left">
                                                                    <asp:FileUpload ID="fileUpload1" runat="server" />
                                                                    <br />
                                                                    <asp:Label ID="Label43" runat="server" Style="font-weight: 700; font-size: small" Text="* Only .pdf file, upto 350kB are allowed."></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label46" runat="server" Style="font-weight: 700; font-size: small" Text="** It is mandatory to upload a supporting document"></asp:Label>

                                                                </div>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <div align="center" style="padding-top: 5px; padding-bottom: 5px">
                                                                    <asp:Image ID="imgDownloadPH" runat="server" Height="100" Width="76" ToolTip="Photo" ImageUrl='<%#Eval("photo_Filename") %>' />
                                                                    <br />
                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding-left: 10px; padding-right: 10px;" align="left">
                                                                    <asp:FileUpload ID="fileUpload2" runat="server" accept="image/jpg ,image/jpeg,.jpeg,.jpg" />
                                                                    <br />
                                                                    <asp:Label ID="Label49" runat="server" Style="font-weight: 700; font-size: small" Text="* Only .JPEG/.JPG file, upto 50kB are allowed."></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="Label55p" runat="server" Style="font-weight: 700; font-size: small" Text="** It is mandatory to upload a supporting document"></asp:Label>

                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Action">

                                                            <EditItemTemplate>
                                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                                    <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg" ValidationGroup="validaiton"
                                                                        ToolTip="Update" Height="25px" Width="25px" />
                                                                    &nbsp;&nbsp;
                                                    <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/Images/Cancel.png"
                                                        ToolTip="Cancel" Height="25px" Width="25px" />
                                                                </div>
                                                            </EditItemTemplate>

                                                            <ItemTemplate>
                                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                                    <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" OnClientClick="return confirm('Are you sure to Edit?');" Visible="false"
                                                                        ImageUrl="~/Images/Edit.png" ToolTip="Edit" Height="25px" Width="25px" />
                                                                    &nbsp;&nbsp;
                                                    <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Delete" runat="server"
                                                        ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Height="25px" Width="25px" OnClientClick="return confirm('Are you sure to delete?');" />
                                                                </div>
                                                            </ItemTemplate>

                                                            <FooterTemplate>
                                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 8px; padding-bottom: 8px" align="center">
                                                                    <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Images/AddNewitem.jpg"
                                                                        CommandName="AddNew" Width="28px" Height="28px" ToolTip="Add" ValidationGroup="validaiton" />
                                                                    <br />
                                                                    <asp:Label ID="lbladdvacancy" runat="server" Text="Add" Style="font-size: medium; font-family: Calibri; color: Black; font-weight: bold"></asp:Label>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <FooterStyle BackColor="#FBEDC4" HorizontalAlign="Center" VerticalAlign="Middle"
                                                        Font-Bold="True" Height="35px"></FooterStyle>
                                                    <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" CssClass="centerHeaderText fontingrid"
                                                        Wrap="True"></HeaderStyle>
                                                    <RowStyle BackColor="#EFF3FB" Font-Bold="True" Height="30px" HorizontalAlign="Center"
                                                        VerticalAlign="Middle" />
                                                    <PagerSettings Position="TopAndBottom" />
                                                    <PagerStyle BackColor="#E67E22" CssClass="cssPager pag" ForeColor="White" Font-Size="Small"
                                                        HorizontalAlign="Left" VerticalAlign="Middle" Font-Bold="True" BorderColor="Black"
                                                        BorderWidth="2" />
                                                </asp:GridView>

                                                <div align="left" style="padding: 10px">
                                                    <asp:Label ID="Label59" runat="server" Text="" Font-Size="Small" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label130" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" Text=""></asp:Label>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>

                                        <br />

                                        <table id="tblresidingAppl" class="table table-bordered tablecus2">
                                            <tr runat="server" visible="true">

                                                <td align="right" runat="server" style="padding-right: 30px" width="40%" class="auto-style1">
                                                    <asp:Label ID="Label23" CssClass="font2" runat="server" Text="All the persons whose names are given above are dependent upon me and are residing with me." Style="font-weight: 700; color: #000000"></asp:Label>
                                                </td>
                                                <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                    <div id="div3" runat="server" visible="true">

                                                        <asp:DropDownList ID="ddlresiding" runat="server" BackColor="#D6EAF8" CssClass="txtbx select" Height="30px" ValidationGroup="reg" Width="90%">

                                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>

                                                        </asp:DropDownList>

                                                    </div>
                                                    <div id="div5" runat="server" visible="false">
                                                        <asp:Label ID="lblresidingwithme" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                        <div class="panel-heading gradheaderround">
                                            <span style="font-size: large; font-weight: bold; color: Black;">:: Upload Applicant&#39;s Document(s) ::</span>
                                        </div>
                                        <br />
                                        <div runat="server" align="left">
                                            <asp:Label runat="server" ID="Label25" Style="font-size: small; font-weight: bold; color: red;" Text="* Upload a Office I-Card is mandatory"></asp:Label>

                                        </div>
                                        <br />
                                        <asp:UpdatePanel runat="server">
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="grdupload" />
                                            </Triggers>
                                            <ContentTemplate>
                                                <asp:GridView ID="grdupload" DataKeyNames="id" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                                    CssClass="Gridview" ShowFooter="true" HeaderStyle-Font-Bold="true"
                                                    PageSize="20" AllowPaging="true" HeaderStyle-ForeColor="White" Width="99%" ToolTip="Upload Documents" OnRowCommand="grdupload_RowCommand" OnRowDeleting="grdupload_RowDeleting">
                                                    <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                                                    <Columns>

                                                        <asp:TemplateField HeaderText="S.No.">
                                                            <ItemTemplate>
                                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                                    <asp:Label ID="lblrowid" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                                    <asp:Label ID="lblupload" runat="server" Text="Upload"></asp:Label>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Document Type">

                                                            <ItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:Label ID="lbldoctypei" runat="server" Text='<%#Eval("DocType") %>' CssClass="fontingrid" />
                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:DropDownList ID="ddldoctype" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="100px" Height="20px" ValidationGroup="reg11">
                                                                        <asp:ListItem Value="0" Text="Aadhaar Card"></asp:ListItem>
                                                                        <asp:ListItem Value="1" Text="Office I-Card"></asp:ListItem>
                                                                    </asp:DropDownList>

                                                                    <%-- <asp:TextBox ID="txthcRelationfooter" runat="server" Font-Size="small" CssClass="select txtpad" TextMode="SingleLine" MaxLength="50" Width="180px" Height="30px" ValidationGroup="validaiton" />--%>
                                                                    <asp:RequiredFieldValidator ID="rqrdcathc2656" runat="server" ControlToValidate="ddldoctype" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                        Text="*" ValidationGroup="reg11" />
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Upload">
                                                            <ItemTemplate>
                                                                <div style="padding: 6px" align="center">
                                                                    <asp:ImageButton ID="imgdownload" CausesValidation="False" CommandName="downloaddoc" runat="server" Height="35" Width="35" ToolTip="Download" ImageUrl="~/images/pdficon.png" />


                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <div style="padding: 6px" align="left">
                                                                    <asp:FileUpload ID="fileupload_Doc" runat="server" accept="application/pdf" />
                                                                    <br />
                                                                    <asp:Label ID="lblmsU1" runat="server" Style="font-weight: 700; font-size: small" Text="* Only .pdf file, upto 350kB are allowed."></asp:Label>
                                                                    <br />
                                                                    <asp:Label ID="lblmsu2" runat="server" Style="font-weight: 700; font-size: small" Text="** It is mandatory to upload a supporting document"></asp:Label>

                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>


                                                        <asp:TemplateField HeaderText="Action">

                                                            <EditItemTemplate>
                                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                                    <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg" ValidationGroup="validaiton"
                                                                        ToolTip="Update" Height="25px" Width="25px" />
                                                                    &nbsp;&nbsp;
                                                    <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/Images/Cancel.png"
                                                        ToolTip="Cancel" Height="25px" Width="25px" />
                                                                </div>
                                                            </EditItemTemplate>

                                                            <ItemTemplate>
                                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                                    <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" OnClientClick="return confirm('Are you sure to Edit?');" Visible="false"
                                                                        ImageUrl="~/Images/Edit.png" ToolTip="Edit" Height="25px" Width="25px" />
                                                                    &nbsp;&nbsp;
                                                    <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Delete" runat="server"
                                                        ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Height="25px" Width="25px" OnClientClick="return confirm('Are you sure to delete?');" />
                                                                </div>
                                                            </ItemTemplate>

                                                            <FooterTemplate>
                                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 8px; padding-bottom: 8px" align="center">
                                                                    <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Images/AddNewitem.jpg"
                                                                        CommandName="AddNew" Width="28px" Height="28px" ToolTip="Add" ValidationGroup="reg11" />
                                                                    <br />
                                                                    <asp:Label ID="lbladd" runat="server" Text="Add" Style="font-size: medium; font-family: Calibri; color: Black; font-weight: bold"></asp:Label>
                                                                </div>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                    <FooterStyle BackColor="#FBEDC4" HorizontalAlign="Center" VerticalAlign="Middle"
                                                        Font-Bold="True" Height="35px"></FooterStyle>
                                                    <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" CssClass="centerHeaderText fontingrid"
                                                        Wrap="True"></HeaderStyle>
                                                    <RowStyle BackColor="#EFF3FB" Font-Bold="True" Height="30px" HorizontalAlign="Center"
                                                        VerticalAlign="Middle" />
                                                    <PagerSettings Position="TopAndBottom" />
                                                    <PagerStyle BackColor="#E67E22" CssClass="cssPager pag" ForeColor="White" Font-Size="Small"
                                                        HorizontalAlign="Left" VerticalAlign="Middle" Font-Bold="True" BorderColor="Black"
                                                        BorderWidth="2" />
                                                </asp:GridView>

                                                <div align="left" style="padding: 10px">
                                                    <asp:Label ID="Label22" runat="server" Text="" Font-Size="Small" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label24" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" Text=""></asp:Label>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div>
                                            <table runat="server" style="width: 100%; padding: 10px">
                                                <tr>
                                                    <td runat="server" align="center" style="padding-right: 30px" width="20%">
                                                        <asp:CheckBox ID="CheckBox1" Width="40px" Height="40px" runat="server" Text="Accept" Checked="true" />
                                                        &nbsp;

                                                    </td>
                                                    <td runat="server" align="left" style="padding-left: 30px" width="80%">
                                                        <asp:Label runat="server" ForeColor="Black" Font-Bold="true" Font-Size="Small" Text="I undertake to intimate PBHS immediately if there is any change in dependency criteria of my family members included in this application form. If I fail to intimate and if the PBHS comes to know of the change then the PBHS facility is liable to be withdrawn by the PBHS and the PBHS and/or appropriate authority will be free to initiate any action against me."></asp:Label>
                                                        <br />
                                                        <asp:Label runat="server" ForeColor="Black" Font-Bold="true" Font-Size="Small" Text="I undertake to surrender the PBHS Card(s) on my leaving the Organisation on transfer, retirement, termination, resignation or on ceasing to be eligible for PBHS benefits."></asp:Label>
                                                        <br />
                                                        <asp:Label runat="server" ForeColor="Black" Font-Bold="true" Font-Size="Small" Text=" I certify that the information furnished by me in this application has been verified to be correct and that no information has been concealed or has been misrepresented and I stand by the same."></asp:Label>

                                                    </td>





                                                </tr>

                                            </table>
                                            <br />
                                            <br />
                                        </div>
                                        <div class="tablecus2" runat="server" style="width: 97%; padding: 10px">
                                            <table>
                                                <tr>

                                                    <td runat="server" align="center" style="padding-right: 15px" width="100%">

                                                        <asp:Button ID="btnedit" runat="server" Visible="false" Text="Edit" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="240px" OnClick="btnedit_Click" CausesValidation="False" />

                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                        <asp:Button ID="btnpreview" runat="server" OnClick="Unnamed6_Click" ValidationGroup="reg" Text="Preview" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="240px" />

                                                        <asp:Button ID="btnsubmit" runat="server" ValidationGroup="reg" Text="Submit" Visible="false" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="240px" OnClick="btnsubmit_Click" CausesValidation="False" />


                                                    </td>

                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div align="center" class="col-md-1 col-lg-1" runat="server"></div>--%>
                    </asp:Panel>

                </div>
            </div>

        </div>
    </div>
</asp:Content>
