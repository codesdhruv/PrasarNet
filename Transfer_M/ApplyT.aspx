<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyT.aspx.cs" Inherits="PrasarNet.Transfer_M.ApplyT" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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

        .font2 {
            color: #FF0000;
        }

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
            }

        .MenuSelectedCls {
            color: #c0e0ff;
            background-color: #c0e0ff;
        }

        .auto-style1 {
            height: 133px;
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

    <div class="row gradhead" style="margin: auto">
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
        <div id="Div1" class="col-md-12 col-sm-12 col-lg-12" runat="server" align="right">
            <br />
            <asp:LinkButton ID="btnhome" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" OnClick="btnhome_Click"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-menu-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
            <br />
            <br />
            <asp:Menu runat="server" Orientation="Horizontal" ID="Menu_sub"
                BackColor="steelblue" ForeColor="White" BorderColor="Gray" BorderWidth="3px" BorderStyle="Ridge"
                Font-Size="Medium" MaximumDynamicDisplayLevels="3" OnMenuItemClick="Menu_sub_MenuItemClick">
                <DynamicHoverStyle BackColor="#D5F5E3" />
                <DynamicSelectedStyle BackColor="#c0e0ff" ForeColor="Black" />
                <Items>
                    <asp:MenuItem Text="Basic Information" Value="0" Selected="true" />
                    <asp:MenuItem Text="Training Acquired" Value="1" />
                    <asp:MenuItem Text="Transfer History" Value="2" />
                    <asp:MenuItem Text="Other Records" Value="3" />
                    <asp:MenuItem Text="PwD Details" Value="4" />
                    <%--<asp:MenuItem Text="Miscellaneous" Value="4" />--%>
                    <asp:MenuItem Text="Uploads" Value="5" />
                    <asp:MenuItem Text="Preview & Submit" Value="6" />
                </Items>
                <StaticHoverStyle BackColor="#D5F5E3" ForeColor="Black" />
                <StaticMenuItemStyle VerticalPadding="10px" HorizontalPadding="10px" BackColor="#c0e0ff" ForeColor="Black" Font-Bold="true" BorderStyle="Groove" BorderWidth="1px" BorderColor="#F2F4F4" />
                <StaticMenuStyle BackColor="steelblue" VerticalPadding="5px" HorizontalPadding="5px" />
                <StaticSelectedStyle BackColor="#FAE5D3" ForeColor="Black" />
            </asp:Menu>
            <br />
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="Viewbasicinfo" runat="server">

                    <%--<div align="center" class=" col-md-1 col-lg-1" runat="server"></div>--%>
                    <div class=" col-md-12  col-lg-12" runat="server" id="div2" style="padding: 25px">
                        <div class="panel gradpanelround">
                            <div class="panel-heading gradheaderround">
                                <span style="font-size: large; font-weight: bold; color: Black;">:: Basic Information ::</span>
                            </div>
                            <div id="regform" align="center" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-left: 0px; margin-right: 0px; margin-top: 10px; margin-bottom: 50px; width: 100%; padding: 20px; border: medium groove #FFFFFF;">
                                <div id="divlblMsg" runat="server">
                                    <span class="auto-style4 pull-left"><strong>Field marked with * are mandatory</strong></span><br />
                                </div>
                                <div class="tablecus2" runat="server" style="width: 97%; padding: 6px">

                                    <table id="per" class="table table-bordered tablecus2">
                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label12" CssClass="font2" runat="server" Text="1." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="lbln" CssClass="font2" runat="server" Text="Name/Employee Code/Category" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblname_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label16" CssClass="font2" runat="server" Text="2." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="lbld2" CssClass="font2" runat="server" Text="Date Of Birth" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lbldob_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
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
                                                <asp:Label ID="Label97" CssClass="font2" runat="server" Text="6." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label98" CssClass="font2" runat="server" Text="Present Place of Posting" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblposting_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label99" CssClass="font2" runat="server" Text="7." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label100" CssClass="font2" runat="server" Text="Date of Joining at Present Station" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblDOJ_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label125" CssClass="font2" runat="server" Text="8." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label127" CssClass="font2" runat="server" Text="No of Years served at Present Place of Posting" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblyears_served_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label128" CssClass="font2" runat="server" Text="9." Style="font-weight: 700; color: #000000"></asp:Label>
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
                                                <asp:Label ID="Label101" CssClass="font2" runat="server" Text="10." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label102" CssClass="font2" runat="server" Text="Is Present Place of Posting is Difficult/Most Difficult" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lbltenure_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label104" CssClass="font2" runat="server" Text="10.1." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label105" CssClass="font2" runat="server" Text="Tenure Completion Period" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lbltenureyears_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label103" CssClass="font2" runat="server" Text="10.2." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label106" CssClass="font2" runat="server" Text="Days Remaining to Complete Tenure" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lbldayscom_tenure_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label107" CssClass="font2" runat="server" Text="10.3." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label108" CssClass="font2" runat="server" Text="Days Exceeded after the Completion of Tenure" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lbldaysexceed_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>

                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label90" CssClass="font2" runat="server" Text="11." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label91" CssClass="font2" runat="server" Text="Language Known" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <div id="divlanguage" runat="server" visible="true">
                                                    <asp:TextBox ID="txtlanguage" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" Width="90%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                                        TargetControlID="txtlanguage" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ,()-[]/ "></ajaxToolkit:FilteredTextBoxExtender>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtlanguage" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                    <asp:RegularExpressionValidator ValidationGroup="reg" Display="Dynamic" SetFocusOnError="True"
                                                        Style="font-size: small" Font-Bold="true" ControlToValidate="txtlanguage" ID="RegularExpressionValidator4" ValidationExpression="^[\s\S]{0,150}$" runat="server" ErrorMessage="Maximum 150 characters are allowed." ForeColor="Red">
                                                    </asp:RegularExpressionValidator>
                                                </div>
                                                <div id="divlbllanguage" runat="server" visible="false">
                                                    <asp:Label ID="lbllanguage_bas" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label94" CssClass="font2" runat="server" Text="12." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label95" CssClass="font2" runat="server" Text="Application Forwarded to Whom" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <%--      <div id="divappFwd" runat="server" visible="true">
                                                    <asp:HiddenField ID="hdnValue" runat="server" />
                                                    <asp:Label ID="lblmsga" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                                    <br />
                                                    <asp:TextBox ID="txtappforwarded" CssClass="txtbx select padtxt" Font-Size="Small" onfocusout="checkItemSelected(this)" onfocus="resetItemSelected()" runat="server" Width="90%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>
                                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender9" runat="server"
                                                        targetcontrolid="txtappforwarded" validchars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 -()">
                                                    </ajaxtoolkit:filteredtextboxextender>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtappforwarded" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                    <ajaxtoolkit:autocompleteextender onclientitemselected="GetID" runat="server" id="AutoCompleteExtender4" targetcontrolid="txtappforwarded"
                                                        servicemethod="SearchbyName_empcode" minimumprefixlength="2" enablecaching="false" completionsetcount="1"
                                                        enabled="true" completionlistcssclass="completionList"
                                                        completionlisthighlighteditemcssclass="itemHighlighted"
                                                        completionlistitemcssclass="listItem autoCompletePanel">
                                                    </ajaxtoolkit:autocompleteextender>
                                                    <br />
                                                    <asp:Label ID="Label96" runat="server" Text="* Enter the Employee Code, to whom the application to be forwarded. You are allowed to search the Officer by Employee Code or Employee's First Name or Last Name" Style="font-weight: 700; color: #0000FF; font-size: small"></asp:Label>
                                                </div>--%>
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



                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label109" CssClass="font2" runat="server" Text="13." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-right: 10px" width="100%" colspan="2">
                                                <asp:Label ID="Label110" CssClass="font2" runat="server" Text="Three Different Options Seeking for Transfer" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <table id="cityoption" class="table table-bordered tablecus2">


                                                            <tr runat="server" visible="true">
                                                                <td align="center" runat="server" width="10%">
                                                                    <asp:Label ID="Label68" CssClass="font2" runat="server" Text="13.1." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                    <asp:Label ID="Label69" CssClass="font2" runat="server" Text="Option 1" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                                    <div id="divop1" runat="server" visible="true">

                                                                        <asp:Label ID="lbloption1state" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="ddloption1State" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg" AutoPostBack="True" OnSelectedIndexChanged="ddloption1State_SelectedIndexChanged"></asp:DropDownList>
                                                                        <span class="auto-style4"><strong>*</strong></span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="*required" ControlToValidate="ddloption1State" ValidationGroup="reg" SetFocusOnError="True"
                                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                                        <br />
                                                                        <asp:Label ID="Label111" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="ddloption1city" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg" OnSelectedIndexChanged="ddloption1city_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                                                        <span class="auto-style4"><strong>*</strong></span>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="*required" ControlToValidate="ddloption1city" ValidationGroup="reg" SetFocusOnError="True"
                                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />


                                                                    </div>
                                                                    <div id="divlblop1" runat="server" visible="false">
                                                                        <asp:Label ID="Label112" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:Label ID="lblop1state" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                        <br />
                                                                        <asp:Label ID="Label113" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:Label ID="lblop1city" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr runat="server" visible="true">
                                                                <td align="center" runat="server" width="10%" class="auto-style1">
                                                                    <asp:Label ID="Label114" CssClass="font2" runat="server" Text="13.2." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td align="right" runat="server" style="padding-right: 30px" width="30%" class="auto-style1">
                                                                    <asp:Label ID="Label115" CssClass="font2" runat="server" Text="Option 2" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td align="left" runat="server" style="padding-left: 15px" class="auto-style1">
                                                                    <div id="divoption2" runat="server" visible="true">

                                                                        <asp:Label ID="Label116" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="ddloption2_State" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg" AutoPostBack="True" OnSelectedIndexChanged="ddloption2_State_SelectedIndexChanged"></asp:DropDownList>
                                                                        <%--<span class="auto-style4"><strong>*</strong></span>--%>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*required" ControlToValidate="ddloption2_State" ValidationGroup="reg" SetFocusOnError="True"
                                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                                        <br />
                                                                        <asp:Label ID="Label117" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="ddloption2_City" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" AutoPostBack="true" ValidationGroup="reg" OnSelectedIndexChanged="ddloption2_City_SelectedIndexChanged"></asp:DropDownList>
                                                                        <div id="divrfvcity2" runat="server" visible="false">
                                                                            <span class="auto-style4"><strong>*</strong></span>
                                                                            <asp:RequiredFieldValidator ID="rfvcity2" runat="server" ErrorMessage="*required" ControlToValidate="ddloption2_City" ValidationGroup="reg" SetFocusOnError="True" Enabled="true"
                                                                                ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                                        </div>

                                                                    </div>
                                                                    <div id="divlblOption2" runat="server" visible="false">
                                                                        <asp:Label ID="Label118" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:Label ID="lblop2state" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                        <br />
                                                                        <asp:Label ID="Label120" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:Label ID="lblop2city" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                            <tr runat="server" visible="true">
                                                                <td align="center" runat="server" width="10%">
                                                                    <asp:Label ID="Label119" CssClass="font2" runat="server" Text="13.3." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                    <asp:Label ID="Label121" CssClass="font2" runat="server" Text="Option 3" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                                    <div id="divOption3" runat="server" visible="true">

                                                                        <asp:Label ID="Label122" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="ddloption3State" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg" AutoPostBack="True" OnSelectedIndexChanged="ddloption3State_SelectedIndexChanged"></asp:DropDownList>
                                                                        <%--<span class="auto-style4"><strong>*</strong></span>--%>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="*required" ControlToValidate="ddloption3State" ValidationGroup="reg" SetFocusOnError="True"
                                                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                                        <br />
                                                                        <asp:Label ID="Label123" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:DropDownList ID="ddloption3City" AutoPostBack="true" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg" OnSelectedIndexChanged="ddloption3City_SelectedIndexChanged"></asp:DropDownList>
                                                                        <div id="divrfvcity3" runat="server" visible="false">
                                                                            <span class="auto-style4"><strong>*</strong></span>
                                                                            <asp:RequiredFieldValidator ID="rfvcity3" Enabled="true" runat="server" ErrorMessage="*required" ControlToValidate="ddloption3City" ValidationGroup="reg" SetFocusOnError="True"
                                                                                ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                                        </div>
                                                                    </div>
                                                                    <div id="divlblOption3" runat="server" visible="false">
                                                                        <asp:Label ID="Label124" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:Label ID="lblop3state" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                        <br />
                                                                        <asp:Label ID="Label126" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                                        <br />
                                                                        <asp:Label ID="lblop3city" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="ddloption1State" EventName="SelectedIndexChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddloption2_State" EventName="SelectedIndexChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddloption3State" EventName="SelectedIndexChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddloption1City" EventName="SelectedIndexChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddloption1City" EventName="SelectedIndexChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddloption2_City" EventName="SelectedIndexChanged" />
                                                        <asp:AsyncPostBackTrigger ControlID="ddloption3City" EventName="SelectedIndexChanged" />
                                                    </Triggers>


                                                </asp:UpdatePanel>

                                            </td>
                                        </tr>

                                        <tr visible="false" runat="server">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label21" CssClass="font2" runat="server" Text="13.4" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="lblpermanent" runat="server" Text="Reason If None Selected in Option2/Option3 " class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>

                                            <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">
                                                <div id="divreason" runat="server" visible="true">
                                                    <asp:TextBox ID="txtreasonnone" runat="server" MaxLength="500" TextMode="MultiLine" Width="90%" BackColor="#D6EAF8" class="txtbx select padtxt" Font-Size="Medium" Font-Bold="true" ValidationGroup="reg" Height="150px"></asp:TextBox>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="Filtered9" runat="server"
                                                        TargetControlID="txtreasonnone" ValidChars=" 1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)(&-_%?/\][ "></ajaxToolkit:FilteredTextBoxExtender>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtreasonnone" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                    <asp:RegularExpressionValidator Display="Dynamic" SetFocusOnError="True" ValidationGroup="reg" Style="font-size: small" Font-Bold="true" ControlToValidate="txtreasonnone" ID="RegularExpressionValidator3" ValidationExpression="^[\s\S]{0,500}$" runat="server" ErrorMessage="Maximum 500 characters are allowed." ForeColor="Red"></asp:RegularExpressionValidator>
                                                </div>
                                                <div id="divlblreason" runat="server" visible="false">
                                                    <asp:Label ID="lblreasonNone_b" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label4" CssClass="font2" runat="server" Text="14." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label5" CssClass="font2" runat="server" Text="Hometown" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <div id="divhometown" runat="server" visible="true">
                                                    <asp:TextBox ID="txthometown" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" Width="90%" Height="30px" BackColor="#D6EAF8" autocomplete="off" ValidationGroup="reg"></asp:TextBox>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                                        TargetControlID="txthometown" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "></ajaxToolkit:FilteredTextBoxExtender>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txthometown" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                </div>
                                                <div id="divlblhometown" runat="server" visible="false">
                                                    <asp:Label ID="lblhometown" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label7" CssClass="font2" runat="server" Text="15.1." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label8" CssClass="font2" runat="server" Text="Ground on which Transfer Request is being Made" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <div id="divground" runat="server" visible="true">

                                                    <asp:DropDownList ID="ddlground" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg"></asp:DropDownList>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*required" ControlToValidate="ddlground" ValidationGroup="reg" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                </div>
                                                <div id="divlblGround" runat="server" visible="false">
                                                    <asp:Label ID="lblground" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label9" CssClass="font2" runat="server" Text="15.2." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label11" runat="server" Text="Subject(Atmost 200 Characters are allowed)" class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">
                                                <div id="divsubject" runat="server" visible="true">
                                                    <asp:TextBox ID="txtsub" runat="server" TextMode="MultiLine" MaxLength="50" Width="90%" BackColor="#D6EAF8" class="txtbx select padtxt" Font-Size="Medium" Font-Bold="true" ValidationGroup="reg" Height="150px"></asp:TextBox>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                                        TargetControlID="txtsub" ValidChars=" 1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)(&-_%?/\][ "></ajaxToolkit:FilteredTextBoxExtender>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsub" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                    <asp:RegularExpressionValidator Display="Dynamic" SetFocusOnError="True" ValidationGroup="reg" Style="font-size: small" Font-Bold="true" ControlToValidate="txtsub" ID="RegularExpressionValidator1" ValidationExpression="^[\s\S]{1,200}$" runat="server" ErrorMessage="Maximum 200 characters are allowed." ForeColor="Red"></asp:RegularExpressionValidator>
                                                </div>
                                                <div id="divlblsubject" runat="server" visible="false">
                                                    <asp:Label ID="lblsubject" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label13" CssClass="font2" runat="server" Text="15.3." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label17" runat="server" Text="Details(Atmost 3000 Characters are allowed)" class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">
                                                <div id="divdetails" runat="server" visible="true">
                                                    <asp:TextBox ID="txtdetails" runat="server" MaxLength="500" TextMode="MultiLine" Width="90%" BackColor="#D6EAF8" class="txtbx select padtxt" Font-Size="Medium" Font-Bold="true" ValidationGroup="reg" Height="150px"></asp:TextBox>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                                        TargetControlID="txtdetails" ValidChars=" 1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ)(&-_%?/\][ "></ajaxToolkit:FilteredTextBoxExtender>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtdetails" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                    <asp:RegularExpressionValidator Display="Dynamic" SetFocusOnError="True" ValidationGroup="reg" Style="font-size: small" Font-Bold="true" ControlToValidate="txtdetails" ID="RegularExpressionValidator2" ValidationExpression="^[\s\S]{1,3000}$" runat="server" ErrorMessage="Maximum 3000 characters are allowed." ForeColor="Red"></asp:RegularExpressionValidator>
                                                </div>
                                                <div id="divlbldetails" runat="server" visible="false">
                                                    <asp:Label ID="lbldetails" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label29" CssClass="font2" runat="server" Text="15.4" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label31" CssClass="font2" runat="server" Text="In case of medical ground of self or family member, please specify if medical facilities are available at place of posting or not" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <div id="div3" runat="server" visible="true">

                                                    <asp:DropDownList ID="ddlmedicalfa" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg">
                                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                        <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*required" ControlToValidate="ddlmedicalfa" ValidationGroup="reg" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                </div>
                                                <div id="div4" runat="server" visible="false">
                                                    <asp:Label ID="lblmedicalfac" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label18" CssClass="font2" runat="server" Text="16." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label19" CssClass="font2" runat="server" Text="Ready to forgo Transfer Benefits" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <div id="divtransbenefits" runat="server" visible="true">

                                                    <asp:DropDownList ID="ddltrans_bene" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="reg">
                                                        <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*required" ControlToValidate="ddltrans_bene" ValidationGroup="reg" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                                </div>
                                                <div id="divlbltransbenefits" runat="server" visible="false">
                                                    <asp:Label ID="Label20" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr runat="server" visible="false">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label22" CssClass="font2" runat="server" Text="17." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-right: 10px" width="100%" colspan="2">
                                                <asp:Label ID="Label23" CssClass="font2" runat="server" Text="If you are asking for the difficult/most difficult place/posting, then provide 3 different options for transfer, seeking after the completion of tenure" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>

                                        </tr>


                                        <caption>
                                            &lt;
                                            <tr runat="server" visible="false">
                                                <td runat="server" align="center" width="10%">
                                                    <asp:Label ID="Label24" runat="server" CssClass="font2" Style="font-weight: 700; color: #000000" Text="17.1."></asp:Label>
                                                </td>
                                                <td runat="server" align="right" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="Label25" runat="server" CssClass="font2" Style="font-weight: 700; color: #000000" Text="Option 1"></asp:Label>
                                                </td>
                                                <td runat="server" align="left" class="auto-style2" style="padding-left: 15px">
                                                    <div id="divTenure1" runat="server" visible="true">
                                                        <asp:UpdatePanel runat="server">
                                                            <ContentTemplate>
                                                                <asp:Label ID="Label26" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="State: "></asp:Label>
                                                                <br />
                                                                <asp:DropDownList ID="ddltenstate1" runat="server" AutoPostBack="True" BackColor="#D6EAF8" CssClass="txtbx select" Height="30px" OnSelectedIndexChanged="ddltenstate1_SelectedIndexChanged" ValidationGroup="reg" Width="90%">
                                                                </asp:DropDownList>
                                                                <%--<span class="auto-style4"><strong>*</strong></span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*required" ControlToValidate="ddltenstate1" ValidationGroup="reg" SetFocusOnError="True"
                                                    ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />--%>
                                                                <br />
                                                                <asp:Label ID="Label27" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="City: "></asp:Label>
                                                                <br />
                                                                <asp:DropDownList ID="ddltenCity1" runat="server" BackColor="#D6EAF8" CssClass="txtbx select" Height="30px" ValidationGroup="reg" Width="90%">
                                                                </asp:DropDownList>
                                                                <div id="divrfvtencity1" runat="server" visible="false">
                                                                    <span class="auto-style4"><strong>*</strong></span>
                                                                    <asp:RequiredFieldValidator ID="rfvtencity1" runat="server" ControlToValidate="ddltenCity1" Display="Dynamic" Enabled="false" ErrorMessage="*required" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700" ValidationGroup="reg" />
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div id="divlblTenure1" runat="server" visible="false">
                                                        <asp:Label ID="Label28" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="State: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lbltenstate1" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Black" Text=""></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label30" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="City: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lbltenCity1" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Black" Text=""></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr runat="server" visible="false">
                                                <td runat="server" align="center" width="10%">
                                                    <asp:Label ID="Label32" runat="server" CssClass="font2" Style="font-weight: 700; color: #000000" Text="17.2."></asp:Label>
                                                </td>
                                                <td runat="server" align="right" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="Label33" runat="server" CssClass="font2" Style="font-weight: 700; color: #000000" Text="Option 2"></asp:Label>
                                                </td>
                                                <td runat="server" align="left" class="auto-style2" style="padding-left: 15px">
                                                    <div id="divtenure2" runat="server" visible="true">
                                                        <asp:UpdatePanel runat="server">
                                                            <ContentTemplate>
                                                                <asp:Label ID="Label34" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="State: "></asp:Label>
                                                                <br />
                                                                <asp:DropDownList ID="ddltenstate2" runat="server" AutoPostBack="True" BackColor="#D6EAF8" CssClass="txtbx select" Height="30px" OnSelectedIndexChanged="ddltenstate2_SelectedIndexChanged" ValidationGroup="reg" Width="90%">
                                                                </asp:DropDownList>
                                                                <%--<span class="auto-style4"><strong>*</strong></span>--%><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="*required" ControlToValidate="ddloption2_State" ValidationGroup="reg" SetFocusOnError="True"
                                                    ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />--%>
                                                                <br />
                                                                <asp:Label ID="Label52" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="City: "></asp:Label>
                                                                <br />
                                                                <asp:DropDownList ID="ddltenCity2" runat="server" BackColor="#D6EAF8" CssClass="txtbx select" Height="30px" ValidationGroup="reg" Width="90%">
                                                                </asp:DropDownList>
                                                                <div id="divrfvtencity2" runat="server" visible="false">
                                                                    <span class="auto-style4"><strong>*</strong></span>
                                                                    <asp:RequiredFieldValidator ID="rfvtemcity2" runat="server" ControlToValidate="ddltenCity2" Display="Dynamic" Enabled="false" ErrorMessage="*required" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700" ValidationGroup="reg" />
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div id="divlbltenure2" runat="server" visible="false">
                                                        <asp:Label ID="Label64" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="State: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lbltenstate2" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Black" Text=""></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label66" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="City: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lbltencity2" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Black" Text=""></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr runat="server" visible="false">
                                                <td runat="server" align="center" width="10%">
                                                    <asp:Label ID="Label130" runat="server" CssClass="font2" Style="font-weight: 700; color: #000000" Text="17.3."></asp:Label>
                                                </td>
                                                <td runat="server" align="right" style="padding-right: 30px" width="30%">
                                                    <asp:Label ID="Label131" runat="server" CssClass="font2" Style="font-weight: 700; color: #000000" Text="Option 3"></asp:Label>
                                                </td>
                                                <td runat="server" align="left" class="auto-style2" style="padding-left: 15px">
                                                    <div id="divtenure3" runat="server" visible="true">
                                                        <asp:UpdatePanel runat="server">
                                                            <ContentTemplate>
                                                                <asp:Label ID="Label132" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="State: "></asp:Label>
                                                                <br />
                                                                <asp:DropDownList ID="ddltenstate3" runat="server" AutoPostBack="True" BackColor="#D6EAF8" CssClass="txtbx select" Height="30px" OnSelectedIndexChanged="ddltenstate3_SelectedIndexChanged" ValidationGroup="reg" Width="90%">
                                                                </asp:DropDownList>
                                                                <%--<span class="auto-style4"><strong>*</strong></span>--%><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="*required" ControlToValidate="ddloption3State" ValidationGroup="reg" SetFocusOnError="True"
                                                    ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />--%>
                                                                <br />
                                                                <asp:Label ID="Label133" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="City: "></asp:Label>
                                                                <br />
                                                                <asp:DropDownList ID="ddltencity3" runat="server" BackColor="#D6EAF8" CssClass="txtbx select" Height="30px" ValidationGroup="reg" Width="90%">
                                                                </asp:DropDownList>
                                                                <div id="divrfvtencity3" runat="server" visible="false">
                                                                    <span class="auto-style4"><strong>*</strong></span>
                                                                    <asp:RequiredFieldValidator ID="rfvtencity3" runat="server" ControlToValidate="ddltencity3" Display="Dynamic" Enabled="false" ErrorMessage="*required" ForeColor="Red" SetFocusOnError="True" Style="font-weight: 700" ValidationGroup="reg" />
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div id="divlbltenure3" runat="server" visible="false">
                                                        <asp:Label ID="Label134" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="State: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lbltenstate3" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Black" Text=""></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label136" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Brown" Text="City: "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lbltencity3" runat="server" CssClass="font2" Font-Bold="true" ForeColor="Black" Text=""></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td runat="server" align="center" width="10%"></td>
                                                <td runat="server" align="right" style="padding-right: 30px" width="30%">
                                                    <asp:Button ID="btnsavebasic" runat="server" OnClick="btnsavebasic_Click" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; border-radius: 15px; height: 36px;" Text=" Save " ValidationGroup="reg" Width="120px" />
                                                    <asp:Button ID="btneditbasic" runat="server" OnClick="btneditbasic_Click" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Text=" Edit " Visible="false" Width="120px" />
                                                    <asp:Button ID="btnUpdateBasic" runat="server" OnClick="btnUpdateBasic_Click" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Text=" Update " ValidationGroup="reg" Visible="false" Width="120px" />
                                                </td>
                                                <td runat="server" align="left" class="auto-style2" style="padding-right: 15px">
                                                    <asp:Button ID="btnstp3" runat="server" CausesValidation="false" OnClick="btnstp3_Click" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Text="Next&gt;&gt;" Width="120px" />
                                                    <asp:Button ID="btncncl" runat="server" CausesValidation="false" OnClick="btncncl_Click" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Text=" Cancel " Visible="false" Width="120px" />
                                                </td>
                                                <%--<td>
                    <asp:Button ID="Button2" runat="server" Text="Cancel" Style="font-size: x-large; padding: 1vw; border-radius: 25px;" OnClick="Button2_Click" />

                </td>--%>
                                            </tr>
                                        </caption>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<div align="center" class="col-md-1 col-lg-1" runat="server"></div>--%>
                </asp:View>
                <%--<asp:View ID="viewapplyfor" runat="server">
                        <div class=" col-md-12  col-lg-12" runat="server" id="div3" style="padding: 25px">
                            <div class="panel gradpanelround">
                                <div class="panel-heading gradheaderround">
                                    <span style="font-size: large; font-weight: bold; color: Black;">:: Applying for the Post ::</span>
                                </div>
                                <div id="Div4" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-top: 10px; margin-bottom: 100px">

                                    <table id="tableapplyfor" class="table table-bordered tablecus2">

                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label37" CssClass="font2" runat="server" Text="1." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label38" CssClass="font2" runat="server" Text="Applying for" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" width="60%">
                                                <asp:DropDownList ID="ddlapplyingfor" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" ValidationGroup="app"></asp:DropDownList>
                                                <span class="auto-style4"><strong>*</strong></span>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*required" ControlToValidate="ddlapplyingfor" ValidationGroup="app" SetFocusOnError="True"
                                                    ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%"></td>
                                            <td runat="server" align="right" style="padding-right: 30px" width="30%">

                                                <asp:Button ID="btnsavapp" runat="server" Text=" Save " ValidationGroup="app" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="120px" />
                                                <asp:Button ID="btnEditApp" runat="server" Text=" Edit " Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Visible="false" Width="120px" />

                                            </td>
                                            <td runat="server" align="left" style="padding-right: 15px" width="60%">
                                                <asp:Button ID="btnprevApp" runat="server" Text="<< Prev" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" />
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="btnnextapp" runat="server" Text="Next>>" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" />
                                            </td>

                                        </tr>
                                    </table>

                                </div>
                            </div>
                        </div>
                        <%--<div align="center" class="col-md-1 col-lg-1" runat="server"></div>--%>
                <%--    </asp:View>--%>

                <asp:View ID="viewtraining" runat="server">
                    <div class=" col-md-12  col-lg-12" runat="server" id="div5o" style="padding: 25px">
                        <div class="panel gradpanelround">
                            <div class="panel-heading gradheaderround" align="center">
                                <span style="font-size: large; font-weight: bold; color: Black;">:: Details of Training Acquired ::</span>
                            </div>
                            <%-- <asp:UpdatePanel runat="server">
                                    <ContentTemplate>--%>


                            <div id="Div6" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-top: 10px; margin-bottom: 100px" align="center">
                                <asp:Label ID="lblresultTraining" runat="server" Style="font-weight: 700; font-size: large; color: #0000FF;" Text=""></asp:Label>
                                <br />
                                <br />
                                <asp:GridView ID="gvtraining" DataKeyNames="id" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                    CssClass="Gridview" ShowFooter="true" HeaderStyle-Font-Bold="true"
                                    PageSize="15" AllowPaging="true" HeaderStyle-ForeColor="White" Width="97%" ToolTip="TRAM Training Acquired" OnPageIndexChanging="gvtraining_PageIndexChanging" OnRowCancelingEdit="gvtraining_RowCancelingEdit" OnRowCommand="gvtraining_RowCommand" OnRowDeleting="gvtraining_RowDeleting" OnRowEditing="gvtraining_RowEditing" OnRowUpdating="gvtraining_RowUpdating">
                                    <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <EditItemTemplate>
                                                <asp:Label ID="lblRow" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblrowid" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:Label ID="lbledu" runat="server" Text="Training Acquired"></asp:Label>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Name of Institute">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txt_ins_Edit" runat="server" Text='<%#Eval("Host_Institute") %>' CssClass="select padtxt" TextMode="MultiLine" ValidationGroup="updt" MaxLength="200" Width="180px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                        TargetControlID="txt_ins_Edit" ValidChars=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="rqrdcat13ds" runat="server" ControlToValidate="txt_ins_Edit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Inst" runat="server" Text='<%#Eval("Host_Institute") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txt_ins_footer" Font-Size="small" runat="server" MaxLength="200" TextMode="MultiLine" CssClass="select padtxt" Width="180px" Height="100px" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderUni1e" runat="server"
                                                        TargetControlID="txt_ins_footer" ValidChars=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()#[]:/-.,"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="rqrdcat3e370" runat="server" ControlToValidate="txt_ins_footer" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Training Subject">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txt_Sub_Edit" runat="server" Text='<%#Eval("CourseName") %>' CssClass="select padtxt" TextMode="MultiLine" ValidationGroup="updt" MaxLength="200" Width="180px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                        TargetControlID="txt_Sub_Edit" ValidChars=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="rqrdcat13ds" runat="server" ControlToValidate="txt_Sub_Edit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Tran_Sub" runat="server" Text='<%#Eval("CourseName") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txt_Sub_footer" Font-Size="small" runat="server" MaxLength="200" TextMode="MultiLine" CssClass="select padtxt" Width="180px" Height="100px" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderUni1" runat="server"
                                                        TargetControlID="txt_Sub_footer" ValidChars=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-.,\|;#"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="rqrdcat3w3m0" runat="server" ControlToValidate="txt_Sub_footer" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="From(Date)">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txtfromedit" placeholder="DD-MM-YYYY" runat="server" Text='<%#Eval("Fromdate", "{0:dd-MM-yyyy}") %>' CssClass="select padtxt" Width="70px" Height="20px" ValidationGroup="updt" />
                                                    <asp:RequiredFieldValidator ID="rqr1dd" runat="server" ControlToValidate="txtfromedit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                    <ajaxToolkit:CalendarExtender ID="txtfromedit_CalendarExtender" runat="server" BehaviorID="txtfromedit_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txtfromedit" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderyearE" runat="server"
                                                        TargetControlID="txtfromedit" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>

                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblfrom" runat="server" Text='<%#Eval("Fromdate", "{0:dd-MMM-yyyy}") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txtfromFooter" Font-Size="small" autocomplete="off" placeholder="DD-MM-YYYY" runat="server" Width="100px" Height="20px" CssClass="select padtxt" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:CalendarExtender ID="txtfromFooter_CalendarExtender" runat="server" BehaviorID="txtfromFooter_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txtfromFooter" />
                                                    <asp:RequiredFieldValidator ID="rqrd3ed" runat="server" ControlToValidate="txtfromFooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderyearFo1o" runat="server"
                                                        TargetControlID="txtfromFooter" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="To(Date)">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txt_To_edit" runat="server" autocomplete="off" PlaceHolder="DD-MM-YYYY" Text='<%#Eval("ToDate", "{0:dd-MM-yyyy}") %>' CssClass="select padtxt" Width="70px" Height="20px" ValidationGroup="updt" />
                                                    <asp:RequiredFieldValidator ID="rqrdwwd" runat="server" ControlToValidate="txt_To_edit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                    <ajaxToolkit:CalendarExtender ID="txttoedit_CalendarExtender" runat="server" BehaviorID="txttoedit_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txt_To_edit" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderyearE" runat="server"
                                                        TargetControlID="txt_To_edit" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>

                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblto" runat="server" Text='<%#Eval("ToDate", "{0:dd-MMM-yyyy}") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txt_To_footer" Font-Size="small" autocomplete="off" PlaceHolder="DD-MM-YYYY" runat="server" Width="100px" Height="20px" CssClass="select padtxt" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="rqrdd3ee" runat="server" ControlToValidate="txt_To_footer" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:CalendarExtender ID="txt_To_footer_CalendarExtender" runat="server" BehaviorID="txt_To_footer_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txt_To_footer" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderyearFo2o" runat="server"
                                                        TargetControlID="txt_To_footer" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Additional Info,If Any">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txtaddinfoEdit" TextMode="MultiLine" runat="server" CssClass="select padtxt" Text='<%#Eval("AnyRelevantInfo") %>' MaxLength="200" Width="150px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                        TargetControlID="txtaddinfoEdit" ValidChars=" 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>

                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbladdinfo" runat="server" Text='<%#Eval("AnyRelevantInfo") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txtaddinfofooter" Font-Size="small" TextMode="MultiLine" CssClass="select padtxt" runat="server" MaxLength="200" Width="150px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderInfoF" runat="server"
                                                        TargetControlID="txtaddinfofooter" ValidChars=" 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>

                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Action">
                                            <EditItemTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                    <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg" ValidationGroup="updt"
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
                                    <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server"
                                        ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Height="25px" Width="25px" OnClientClick="return confirm('Are you sure to delete?');" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 8px; padding-bottom: 8px" align="center">
                                                    <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Images/AddNewitem.jpg"
                                                        CommandName="AddNew" Width="28px" Height="28px" ToolTip="Add" ValidationGroup="validaiton" />
                                                    <br />
                                                    <asp:Label ID="lbladdtraining" runat="server" Text="Add Training Records" Style="font-size: medium; font-family: Calibri; color: black; font-weight: bold"></asp:Label>
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
                                <br />
                                <br />
                                <div class="tablecus2" runat="server" style="width: 97%; padding: 10px" align="center">
                                    <table>
                                        <tr>

                                            <td runat="server" align="right" style="padding-right: 30px" width="50%">
                                                <asp:Button ID="btnQualPrev" runat="server" Text="<< Prev" Width="120px" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" OnClick="btnQualPrev_Click" />

                                            </td>
                                            <td runat="server" align="left" style="padding-right: 15px" width="50%">

                                                <asp:Button ID="btnQualNext" runat="server" Width="120px" Text="Next>>" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" OnClick="btnQualNext_Click" />
                                            </td>

                                        </tr>
                                    </table>
                                </div>
                                <br />
                                <br />
                            </div>
                            <%--  </ContentTemplate>
                                </asp:UpdatePanel>--%>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="viewtransfer" runat="server">
                    <div class=" col-md-12  col-lg-12" runat="server" id="div7" style="padding: 25px">
                        <div class="panel gradpanelround">
                            <div class="panel-heading gradheaderround" align="center">
                                <span style="font-size: large; font-weight: bold; color: Black;">:: Transfer History ::</span>
                            </div>
                            <div id="Div8" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-top: 10px; margin-bottom: 100px" align="center">
                                <asp:Label ID="lblresultHistory" runat="server" Style="font-weight: 700; font-size: large; color: #0000FF;" Text=""></asp:Label>
                                <br />
                                <br />
                                <asp:GridView ID="gvtransfer" DataKeyNames="id" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                    CssClass="Gridview" ShowFooter="true" HeaderStyle-Font-Bold="true"
                                    PageSize="20" AllowPaging="true" HeaderStyle-ForeColor="White" Width="97%" ToolTip="TRAM Transfer History" OnRowDeleting="gvtransfer_RowDeleting1">
                                    <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />

                                    <Columns>

                                        <asp:TemplateField HeaderText="S.No.">
                                            <EditItemTemplate>
                                                <asp:Label ID="lblRow" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblrowid" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:Label ID="lbltransfer" runat="server" Text="Transfer Detail"></asp:Label>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="ID" Visible="false">

                                            <ItemTemplate>

                                                <asp:Label ID="lblidt" runat="server" Text='<%#Eval("id") %>' CssClass="fontingrid" />
                                                <br />

                                            </ItemTemplate>

                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Wing & Designation">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="left">
                                                    <asp:Label ID="lblqE" runat="server" Text="Wing: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:DropDownList ID="ddlwingedit" runat="server" Width="180px" Height="20px" CssClass="select" ValidationGroup="updt" />
                                                    <asp:RequiredFieldValidator ID="rqrdcatf331" runat="server" ControlToValidate="ddlwingedit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                    <br />
                                                    <asp:Label ID="lblDesignation" runat="server" Text="Designation: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:UpdatePanel ID="upDesgedit" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="ddldesignationedit" runat="server" Width="180px" Height="20px" CssClass="select" ValidationGroup="updt" />
                                                            <asp:RequiredFieldValidator ID="rqrdcats1" runat="server" ControlToValidate="ddldesignationedit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                Text="*" ValidationGroup="updt" />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="ddlwingedit" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="padding: 6px" align="left">
                                                    <asp:Label ID="lbltxtWI" runat="server" Text="Wing: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="lblwing" runat="server" Text='<%#Eval("Wing") %>' CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="lbltxtDesignation" runat="server" Text="Designation: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="lbldesignation" runat="server" Text='<%#Eval("DesignationName") %>' CssClass="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="left">

                                                    <asp:Label ID="lblwingF" runat="server" Text="Wing: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:DropDownList ID="ddlwingfooter" Font-Size="small" AutoPostBack="true" runat="server" Width="180px" Height="20px" ValidationGroup="validaiton" OnSelectedIndexChanged="ddlwingfooter_SelectedIndexChanged1" />
                                                    <asp:RequiredFieldValidator ID="rqrdddlwingfooter" runat="server" ControlToValidate="ddlwingfooter" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <br />
                                                    <asp:Label ID="lbltDesignation" runat="server" Text="Designation: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:UpdatePanel ID="upDesg" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="ddlDesigfooter" Font-Size="small" runat="server" Width="180px" Height="20px" CssClass="select " ValidationGroup="validaiton" />
                                                            <asp:RequiredFieldValidator ID="rqrdddlDesigfooter" runat="server" ControlToValidate="ddlDesigfooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                Text="*" ValidationGroup="validaiton" />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="ddlwingfooter" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Period">
                                            <EditItemTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                    <asp:Label ID="Label56" runat="server" Text="From (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:TextBox ID="txtfromEdit" runat="server" Text='<%#Eval("fromdate", "{0:dd-MMM-yyyy}") %>' CssClass="select" Width="100px" Height="20px" placeholder="DD-MM-YYYY" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="rqrdd" runat="server" ControlToValidate="txtfromdate" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderFromEdit" runat="server"
                                                        TargetControlID="txtfromdate" ValidChars="-0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <ajaxToolkit:CalendarExtender ID="txtfromdate_CalendarExtender" runat="server" BehaviorID="txtfromdate_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txtfromdate" />
                                                    <br />
                                                    <asp:Label ID="Label57" runat="server" Text="To (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:TextBox ID="txttoEdit" runat="server" Text='<%#Eval("Todate", "{0:dd-MMM-yyyy}") %>' CssClass="select" Width="100px" Height="20px" placeholder="DD-MM-YYYY" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txttoEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTOE" runat="server"
                                                        TargetControlID="txttoEdit" ValidChars="-0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <ajaxToolkit:CalendarExtender ID="txttoEdit_CalendarExtender" runat="server" BehaviorID="txttoEdit_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txttoEdit" />
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label563" runat="server" Text="From (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                <br />
                                                <asp:Label ID="lblfromdate" runat="server" Text='<%#Eval("fromdate", "{0:dd-MMM-yyyy}") %>' CssClass="fontingrid" />
                                                <br />
                                                <asp:Label ID="Label57I" runat="server" Text="To (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                <br />
                                                <asp:Label ID="lblTodate" runat="server" Text='<%#Eval("Todate", "{0:dd-MMM-yyyy}") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                    <asp:Label ID="Label56F" runat="server" Text="From (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" ValidationGroup="validaitonF" />
                                                    <br />
                                                    <asp:TextBox ID="txtfromFooter" Font-Size="small" runat="server" placeholder="DD-MM-YYYY" Width="100px" Height="20px" ValidationGroup="validaitonF" CssClass="select padtxt" AutoComplete="Off" />
                                                    <asp:RequiredFieldValidator ID="rqrdd" runat="server" ControlToValidate="txtfromFooter" Font-Bold="true" CssClass="select" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaitonF" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderFromF" runat="server"
                                                        TargetControlID="txtfromFooter" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <ajaxToolkit:CalendarExtender ID="txtfromFooter_CalendarExtender" runat="server" BehaviorID="txtfromFooter_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txtfromFooter" />
                                                    <br />
                                                    <asp:Label ID="Label57F" runat="server" Text="To (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:TextBox ID="txttoFooter" Font-Size="small" runat="server" placeholder="DD-MM-YYYY" Width="100px" Height="20px" AutoComplete="Off" CssClass="select padtxt" />
                                                    <%--ValidationGroup="validaitonF"--%>
                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txttoFooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaitonF" />--%>
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderToF" runat="server"
                                                        TargetControlID="txttoFooter" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <ajaxToolkit:CalendarExtender ID="txttoFooter_CalendarExtender" runat="server" BehaviorID="txttoFooter_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txttoFooter" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label72" runat="server" Text="* For a presently serving station/office, To(Date) may be left blank." ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Transferred by Department/Own Request">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="left">
                                                    <asp:DropDownList ID="ddlD_O_edit" runat="server" Width="180px" Height="20px" CssClass="select" ValidationGroup="updt">
                                                        <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="First Joining"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Own Request"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="Department"></asp:ListItem>
                                                        <asp:ListItem Value="4" Text="On Promotion"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rqrdcat3r31" runat="server" ControlToValidate="ddlD_O_edit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:Label ID="lblD_O_Request" runat="server" Text='<%#Eval("Transfer_byDep_Own") %>' CssClass="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:DropDownList ID="ddlD_O_footer" Font-Size="small" runat="server" Width="180px" Height="20px" ValidationGroup="validaiton">
                                                        <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="First Joining"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Own Request"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="Department"></asp:ListItem>
                                                        <asp:ListItem Value="4" Text="On Promotion"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rqrdcat656" runat="server" ControlToValidate="ddlD_O_footer" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>



                                        <asp:TemplateField HeaderText="Organization, Station & Tenure">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="left">
                                                    <asp:Label ID="lblorgE" runat="server" Text="Organization: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:DropDownList ID="ddlOrganizationedit" runat="server" Width="180px" Height="20px" CssClass="select" ValidationGroup="updt" />
                                                    <asp:RequiredFieldValidator ID="rqrdOrganizationedit" runat="server" ControlToValidate="ddlOrganizationedit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                    <br />
                                                    <asp:Label ID="Label53" runat="server" Text="Station: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:UpdatePanel ID="upStationedit" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:DropDownList ID="ddlStationedit" runat="server" Width="180px" Height="20px" CssClass="select" ValidationGroup="updt" />
                                                            <asp:RequiredFieldValidator ID="rqrdStationedit" runat="server" ControlToValidate="ddlStationedit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                Text="*" ValidationGroup="updt" />
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="ddlOrganizationedit" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="padding: 6px" align="left">
                                                    <asp:Label ID="lblWI" runat="server" Text="Organization: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="lblOrganizationName" runat="server" Text='<%#Eval("OrganizationName") %>' CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="Label53" runat="server" Text="Station: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="lblStationName" runat="server" Text='<%#Eval("StationName") %>' CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="Label65" runat="server" Text="Tenure: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="lbltenur" runat="server" Text='<%#Eval("TenureId") %>' CssClass="fontingrid" />
                                                    &nbsp;Year
                                                </div>

                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="left">
                                                    <asp:Label ID="lblOrganizationF" runat="server" Text="Organization: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:DropDownList ID="ddlOrganizationfooter" Font-Size="small" AutoPostBack="true" runat="server" Width="180px" Height="20px" ValidationGroup="validaiton" OnSelectedIndexChanged="ddlOrganizationfooter_SelectedIndexChanged" />
                                                    <asp:RequiredFieldValidator ID="rqrdOrganizationF" runat="server" ControlToValidate="ddlOrganizationfooter" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <br />
                                                    <asp:UpdatePanel ID="upstn" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:Label ID="Label53" runat="server" Text="Station: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                            <br />
                                                            <asp:DropDownList ID="ddlStationfooter" Font-Size="small" runat="server" Width="180px" Height="20px" CssClass="select " ValidationGroup="validaiton" />
                                                            <asp:RequiredFieldValidator ID="rqrdddlStationfooter" runat="server" ControlToValidate="ddlStationfooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                                Text="*" ValidationGroup="validaiton" />

                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:AsyncPostBackTrigger ControlID="ddlOrganizationfooter" EventName="SelectedIndexChanged" />
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Additional Info,If Any">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txtaddinfoEdit" TextMode="MultiLine" runat="server" CssClass="select txtpad" Text='<%#Eval("AdditionalInfo") %>' MaxLength="500" Width="150px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                        TargetControlID="txtaddinfoEdit" ValidChars=" 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbladdinfo" runat="server" Text='<%#Eval("AddInfo") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txtaddinfofooter" Font-Size="small" TextMode="MultiLine" CssClass="select padtxt" runat="server" MaxLength="500" Width="150px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderInfoF" runat="server"
                                                        TargetControlID="txtaddinfofooter" ValidChars=" 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <%--<asp:TemplateField HeaderText="Upload Supporting Document">
                                            <EditItemTemplate>
                                                <div style="padding-left: 10px; padding-right: 10px;" align="left">
                                                    <asp:FileUpload ID="fileUploadEdit" runat="server" />
                                                    <br />
                                                    <asp:Label ID="lblmsg" runat="server" Style="font-weight: 700; font-size: small" Text="* Only .pdf file, upto 350kB are allowed."></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label75" runat="server" Style="font-weight: 700; font-size: small" Text="** It is mandatory to upload a supporting document"></asp:Label>

                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgDownload" CommandName="download" runat="server" Height="35" Width="35" ToolTip="Download" ImageUrl="~/images/pdficon.png" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding-left: 10px; padding-right: 10px;" align="left">
                                                    <asp:FileUpload ID="fileUploadfooter" runat="server" />
                                                    <br />
                                                    <asp:Label ID="lblmsg" runat="server" Style="font-weight: 700; font-size: small" Text="* Only .pdf file, upto 350kB are allowed."></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label75" runat="server" Style="font-weight: 700; font-size: small" Text="** It is mandatory to upload a supporting document"></asp:Label>

                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>--%>




                                        <asp:TemplateField HeaderText="Action">
                                            <EditItemTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                    <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg" ValidationGroup="updt"
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
                                                    <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server"
                                                        ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Height="25px" Width="25px" OnClientClick="return confirm('Are you sure to delete?');" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 8px; padding-bottom: 8px" align="center">
                                                    <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Images/AddNewitem.jpg"
                                                        CommandName="AddNew" Width="28px" Height="28px" ToolTip="Add" ValidationGroup="validaiton" OnClick="imgbtnAdd_Click" />
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
                                <br />
                                <br />
                                <div align="left" style="padding: 10px">
                                    <asp:Label ID="lblexpmsg" runat="server" Text="" Font-Size="Small" ForeColor="Red" Font-Bold="true"></asp:Label>
                                </div>
                                <div class="tablecus2" runat="server" style="width: 97%; padding: 10px">
                                    <table>
                                        <tr>
                                            <td align="center" runat="server" width="10%"></td>
                                            <td runat="server" align="right" style="padding-right: 30px" width="30%">
                                                <asp:Button ID="Button1" runat="server" Text="<< Prev" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="120px" OnClick="Button1_Click" />

                                            </td>
                                            <td runat="server" align="left" style="padding-right: 15px" width="60%">

                                                <asp:Button ID="Button2" runat="server" Text="Next>>" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="120px" OnClick="Button2_Click" />
                                            </td>

                                        </tr>
                                    </table>
                                </div>
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="viewrecords" runat="server">
                    <div class=" col-md-12  col-lg-12" runat="server" id="div11" style="padding: 25px">
                        <div class="panel gradpanelround">
                            <div class="panel-heading gradheaderround" align="center">
                                <span style="font-size: large; font-weight: bold; color: Black;">:: Records of Leave/Unauthorised Absence/Training/Deputation/Tour at Present Place of Posting ::</span>
                            </div>
                            <div id="Div12" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-top: 10px; margin-bottom: 100px" align="center">
                                <asp:Label ID="lblresultRecords" runat="server" Style="font-weight: 700; font-size: large; color: #0000FF;" Text=""></asp:Label>
                                <br />

                                <asp:GridView ID="grdrecord" DataKeyNames="id" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                    CssClass="Gridview" ShowFooter="true" HeaderStyle-Font-Bold="true"
                                    PageSize="20" AllowPaging="true" HeaderStyle-ForeColor="White" Width="97%" ToolTip="TRAM Records" OnRowDataBound="grdrecord_RowDataBound" OnPageIndexChanging="grdrecord_PageIndexChanging" OnRowCancelingEdit="grdrecord_RowCancelingEdit" OnRowCommand="grdrecord_RowCommand" OnRowDeleting="grdrecord_RowDeleting">
                                    <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <EditItemTemplate>
                                                <asp:Label ID="lblRow" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblrowid" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                    <asp:Label ID="lbldet" runat="server" Text="Enter Detail"></asp:Label>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Record Type">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">

                                                    <asp:DropDownList ID="ddltype" runat="server" Width="180px" Height="20px" CssClass="select" ValidationGroup="updt">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rqrdcat33t1" runat="server" ControlToValidate="ddltype" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />

                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:Label ID="lblRecType" runat="server" Text='<%#Eval("type") %>' CssClass="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:DropDownList ID="ddltype_footer" Font-Size="small" runat="server" Width="180px" Height="20px" ValidationGroup="validaiton">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rqrdcat656" runat="server" ControlToValidate="ddltype_footer" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Period">
                                            <EditItemTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">

                                                    <asp:Label ID="Label56" runat="server" CssClass="fontingrid" Text="From (Date): " ForeColor="Brown" Font-Bold="true" />
                                                    <br />
                                                    <asp:TextBox ID="txtfromEdit" runat="server" CssClass="select" Text='<%#Eval("fromdate", "{0:dd-MMM-yyyy}") %>' Width="100px" Height="20px" placeholder="DD-MM-YYYY" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="rqrdrrd" runat="server" ControlToValidate="txtfromdate" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderFromEdit" runat="server"
                                                        TargetControlID="txtfromEdit" ValidChars="-0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <ajaxToolkit:CalendarExtender ID="txtfromdate_CalendarExtender" runat="server" BehaviorID="txtfromdate_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txtfromdate" />
                                                    <br />
                                                    <asp:Label ID="Label57" runat="server" Text="To (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:TextBox ID="txttoEdit" CssClass="select" runat="server" Text='<%#Eval("Todate", "{0:dd-MMM-yyyy}") %>' Width="100px" Height="20px" placeholder="DD-MM-YYYY" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txttoEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTOE" runat="server"
                                                        TargetControlID="txttoEdit" ValidChars="-0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <ajaxToolkit:CalendarExtender ID="txttoEdit_CalendarExtender" runat="server" BehaviorID="txttoEdit_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txttoEdit" />
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label563" runat="server" Text="From (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                <br />
                                                <asp:Label ID="lblfromdate" runat="server" Text='<%#Eval("fromdate", "{0:dd-MMM-yyyy}") %>' CssClass="fontingrid" />
                                                <br />
                                                <asp:Label ID="Label57I" runat="server" Text="To (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                <br />
                                                <asp:Label ID="lblTodate" runat="server" Text='<%#Eval("Todate", "{0:dd-MMM-yyyy}") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                    <asp:Label ID="Label56F" runat="server" Text="From (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" ValidationGroup="validaitonF" />
                                                    <br />
                                                    <asp:TextBox ID="txtfromFooter" Font-Size="small" CssClass="select padtxt" placeholder="DD-MM-YYYY" Width="100px" Height="20px" runat="server" AutoComplete="Off" ValidationGroup="validaitonF" />
                                                    <asp:RequiredFieldValidator ID="rqrd23d" runat="server" ControlToValidate="txtfromFooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaitonF" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderFromF" runat="server"
                                                        TargetControlID="txtfromFooter" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <ajaxToolkit:CalendarExtender ID="txtfromFooter_CalendarExtender" runat="server" BehaviorID="txtfromFooter_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txtfromFooter" />
                                                    <br />
                                                    <asp:Label ID="Label57F" runat="server" Text="To (Date): " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:TextBox ID="txttoFooter" Font-Size="small" CssClass="select padtxt" placeholder="DD-MM-YYYY" runat="server" Width="100px" Height="20px" ValidationGroup="validaitonF" AutoComplete="Off" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txttoFooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaitonF" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderToF" runat="server"
                                                        TargetControlID="txttoFooter" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <ajaxToolkit:CalendarExtender ID="txttoFooter_CalendarExtender" runat="server" BehaviorID="txttoFooter_CalendarExtender"
                                                        Format="dd-MM-yyyy" TargetControlID="txttoFooter" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Place During Absence">
                                            <EditItemTemplate>
                                                <div style="padding: 10px" align="center">
                                                    <asp:TextBox ID="txtplaceEdit" runat="server" CssClass="select txtpad" TextMode="MultiLine" Text='<%#Eval("PlaceDuringAbsence") %>' MaxLength="150" Width="180px" Height="100px" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrdcer" runat="server"
                                                        TargetControlID="txtplaceEdit" ValidChars=" %!-_)({}[]/\:;,'#.@$&ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="rqrdcat13" runat="server" ControlToValidate="txtcourseEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblplace" runat="server" Text='<%#Eval("PlaceDuringAbsence") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 10px" align="center">
                                                    <asp:TextBox ID="txtplacefooter" CssClass="select padtxt" Font-Size="small" runat="server" MaxLength="150" Width="180px" Height="100px" ValidationGroup="validaitonF" TextMode="MultiLine" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderOrgeewF" runat="server"
                                                        TargetControlID="txtplacefooter" ValidChars=" %!-_)({}[]/\:;#,'.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="rqrdcater33" runat="server" ControlToValidate="txtplacefooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaitonF" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Sanctioning Authority">
                                            <EditItemTemplate>
                                                <div style="padding: 10px" align="center">
                                                    <asp:TextBox ID="txtSancAuthEdit" runat="server" CssClass="select txtpad" TextMode="MultiLine" Text='<%#Eval("SanctioningAuthority") %>' MaxLength="150" Width="180px" Height="100px" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrdcer" runat="server"
                                                        TargetControlID="txtSancAuthEdit" ValidChars=" %!-_)({}[]/\:;,'#.@$&ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="rqrdcat13" runat="server" ControlToValidate="txtSancAuthEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSancAuth" runat="server" Text='<%#Eval("SanctioningAuthority") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 10px" align="center">
                                                    <asp:TextBox ID="txtSancAuthfooter" CssClass="select padtxt" Font-Size="small" runat="server" MaxLength="150" Width="180px" Height="100px" ValidationGroup="validaitonF" TextMode="MultiLine" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderOrg3F" runat="server"
                                                        TargetControlID="txtSancAuthfooter" ValidChars=" %!-_)({}[]/\:;#,'.ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="rqrdcatf33" runat="server" ControlToValidate="txtSancAuthfooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaitonF" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Additional Info,If Any">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txtaddinfoEdit" TextMode="MultiLine" runat="server" CssClass="select txtpad" Text='<%#Eval("AdditionalInfo") %>' MaxLength="500" Width="150px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                        TargetControlID="txtaddinfoEdit" ValidChars=" 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>

                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbladdinfo" runat="server" Text='<%#Eval("AdditionalInfo") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txtaddinfofooter" TextMode="MultiLine" Font-Size="small" CssClass="select padtxt" runat="server" MaxLength="500" Width="150px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderInfoF" runat="server"
                                                        TargetControlID="txtaddinfofooter" ValidChars=" 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>

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
                                                        CommandName="AddNew" Width="28px" Height="28px" ToolTip="Add" ValidationGroup="validaitonF" />
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
                                <br />
                                <br />
                                <div align="left" style="padding: 10px">
                                    <asp:Label ID="Label79" runat="server" Text="" Font-Size="Small" ForeColor="Red" Font-Bold="true"></asp:Label>
                                </div>
                                <div class="tablecus2" runat="server" style="width: 97%; padding: 10px">
                                    <table>
                                        <tr>
                                            <td align="center" runat="server" width="10%"></td>
                                            <td runat="server" align="right" style="padding-right: 30px" width="30%">
                                                <asp:Button ID="btnprev_cer" runat="server" Text="<< Prev" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="120px" OnClick="btnprev_cer_Click" />

                                            </td>
                                            <td runat="server" align="left" style="padding-right: 15px" width="60%">

                                                <asp:Button ID="btnnext_cer" runat="server" Text="Next>>" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="120px" OnClick="btnnext_cer_Click1" />
                                            </td>

                                        </tr>
                                    </table>
                                </div>
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="viewhealthcat" runat="server">
                    <div class=" col-md-12  col-lg-12" runat="server" id="divhealth" style="padding: 25px">
                        <div class="panel gradpanelround">
                            <div class="panel-heading gradheaderround" align="center">
                                <span style="font-size: large; font-weight: bold; color: Black;">:: Health Category(PwD)-Self/Dependents::</span>
                            </div>
                            <div id="Div13" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-top: 10px; margin-bottom: 100px" align="center">
                                <asp:Label ID="lblresulthealth" runat="server" Style="font-weight: 700; font-size: large; color: #0000FF;" Text=""></asp:Label>
                                <br />

                                <asp:GridView ID="grdhealth" DataKeyNames="id" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                    CssClass="Gridview" ShowFooter="true" HeaderStyle-Font-Bold="true" OnRowDeleting="grdhealth_RowDeleting1"
                                    PageSize="20" AllowPaging="true" HeaderStyle-ForeColor="White" Width="97%" ToolTip="TRAM Health Category Details" OnRowCommand="grdhealth_RowCommand" OnRowDataBound="grdhealth_RowDataBound">
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

                                        <asp:TemplateField HeaderText="ID" Visible="false">

                                            <ItemTemplate>

                                                <asp:Label ID="lblhcid" runat="server" Text='<%#Eval("id") %>' CssClass="fontingrid" />
                                                <br />

                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Name & Type of Disability">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txthcNameEdit" runat="server" Font-Size="small" CssClass="select txtpad" TextMode="SingleLine" Text='<%#Eval("Name") %>' MaxLength="100" Width="180px" Height="35px" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="rqrdcat331" runat="server" ControlToValidate="txthcNameEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="padding: 6px" align="left">
                                                    <asp:Label ID="Label61d" runat="server" Text="Name: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="lblhcName" runat="server" Text='<%#Eval("Name") %>' CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="Label67d" runat="server" Text="Type of Disability: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:Label ID="Label67" runat="server" Text='<%#Eval("typeofdisability") %>' CssClass="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="left">
                                                    <asp:Label ID="Label61" runat="server" Text="Name: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:TextBox ID="txthcNamefooter" runat="server" Font-Size="small" CssClass="select txtpad" TextMode="SingleLine" MaxLength="100" Width="180px" Height="30px" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="rqrdcathc656" runat="server" ControlToValidate="txthcNamefooter" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <br />
                                                    <asp:Label ID="lbltype" runat="server" Text="Type of Disability: " ForeColor="Brown" Font-Bold="true" CssClass="fontingrid" />
                                                    <br />
                                                    <asp:DropDownList ID="ddltypefooter" AutoPostBack="false" CssClass="select txtpad" runat="server" Width="180px" Height="30px" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="rqrdcat656" runat="server" ControlToValidate="ddltypefooter" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <br />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Relation">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txthcrelationEdit" runat="server" Font-Size="small" CssClass="select txtpad" TextMode="SingleLine" Text='<%#Eval("relation") %>' MaxLength="50" Width="180px" Height="35px" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="rqrdcat331" runat="server" ControlToValidate="txthcrelationEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:Label ID="lblrelation" runat="server" Text='<%#Eval("relation") %>' CssClass="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txthcRelationfooter" runat="server" Font-Size="small" CssClass="select txtpad" TextMode="SingleLine" MaxLength="50" Width="180px" Height="30px" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="rqrdcathc2656" runat="server" ControlToValidate="txthcRelationfooter" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Age">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txthcageEdit" runat="server" CssClass="select txtpad" Font-Size="small" TextMode="SingleLine" Text='<%#Eval("age") %>' MaxLength="2" Width="100px" Height="35px" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="rqrdhc3cat331" runat="server" ControlToValidate="txthcageEdit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                        TargetControlID="txthcageEdit" ValidChars=" 1234567890"></ajaxToolkit:FilteredTextBoxExtender>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:Label ID="lblage" runat="server" Text='<%#Eval("age") %>' CssClass="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txthcageFooter" runat="server" CssClass="select txtpad" Font-Size="small" TextMode="SingleLine" MaxLength="2" Width="100px" Height="30px" ValidationGroup="validaiton" />
                                                    <asp:RequiredFieldValidator ID="rqrdhc4cat331" runat="server" ControlToValidate="txthcageFooter" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                        TargetControlID="txthcageFooter" ValidChars=" 1234567890"></ajaxToolkit:FilteredTextBoxExtender>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Additional Info,If Any">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txthcaddinfoEdit" TextMode="MultiLine" Font-Size="small" runat="server" CssClass="select txtpad" Text='<%#Eval("Additional_IfAny") %>' MaxLength="500" Width="150px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                        TargetControlID="txthcaddinfoEdit" ValidChars=" 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                    <asp:Label ID="lbladdinfo" runat="server" Text='<%#Eval("Additional_IfAny") %>' CssClass="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txthcaddinfofooter" TextMode="MultiLine" Font-Size="small" CssClass="select txtpad" runat="server" MaxLength="500" Width="150px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderInfoF" runat="server"
                                                        TargetControlID="txthcaddinfofooter" ValidChars=" 1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Upload Supporting Document">
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
                                                <asp:ImageButton ID="imgDownloadPH" CommandName="download" runat="server" Height="35" Width="35" ToolTip="Download" ImageUrl="~/images/pdficon.png" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding-left: 10px; padding-right: 10px;" align="left">
                                                    <asp:FileUpload ID="fileUpload2" runat="server" />
                                                    <br />
                                                    <asp:Label ID="Label49" runat="server" Style="font-weight: 700; font-size: small" Text="* Only .pdf file, upto 2MB are allowed."></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label55" runat="server" Style="font-weight: 700; font-size: small" Text="** It is mandatory to upload a supporting document"></asp:Label>

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
                                                        CommandName="AddNew" Width="28px" Height="28px" ToolTip="Add" ValidationGroup="validaiton" OnClick="imgbtnAddhc_Click" />
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
                                <br />
                                <br />
                                <div align="left" style="padding: 10px">
                                    <asp:Label ID="Label59" runat="server" Text="" Font-Size="Small" ForeColor="Red" Font-Bold="true"></asp:Label>
                                </div>
                                <div class="tablecus2" runat="server" style="width: 97%; padding: 10px">
                                    <table>
                                        <tr>
                                            <td align="center" runat="server" width="10%"></td>
                                            <td runat="server" align="right" style="padding-right: 30px" width="30%">
                                                <asp:Button ID="Button6" runat="server" Text="<< Prev" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="120px" OnClick="Button6_Click" />

                                            </td>
                                            <td runat="server" align="left" style="padding-right: 15px" width="60%">

                                                <asp:Button ID="Button7" runat="server" Text="Next>>" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="120px" OnClick="Button7_Click" />
                                            </td>

                                        </tr>
                                    </table>
                                </div>
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="viewUpload" runat="server">
                    <div class=" col-md-12  col-lg-12" runat="server" id="div5" style="padding: 25px">
                        <div class="panel gradpanelround">
                            <div class="panel-heading gradheaderround" align="center">
                                <span style="font-size: large; font-weight: bold; color: Black;">:: Document Upload ::</span>
                            </div>
                            <%-- <asp:UpdatePanel runat="server">
                                    <ContentTemplate>--%>


                            <div id="Div15" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-top: 10px; margin-bottom: 100px" align="center">
                                <asp:Label ID="lblResultUpload" runat="server" Style="font-weight: 700; font-size: large; color: #0000FF;" Text=""></asp:Label>
                                <br />
                                <br />
                                <asp:GridView ID="grdUpload" DataKeyNames="id" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                    CssClass="Gridview" ShowFooter="true" HeaderStyle-Font-Bold="true"
                                    PageSize="25" AllowPaging="true" HeaderStyle-ForeColor="White" Width="97%" ToolTip="TRAM Document Upload" OnRowDataBound="grdUpload_RowDataBound" OnPageIndexChanging="grdUpload_PageIndexChanging" OnRowCancelingEdit="grdUpload_RowCancelingEdit" OnRowCommand="grdUpload_RowCommand" OnRowDeleting="grdUpload_RowDeleting">
                                    <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <EditItemTemplate>
                                                <asp:Label ID="lblRow" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblrowid" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:Label ID="lbluploaddoc" runat="server" Text="Upload Document"></asp:Label>
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Document Type">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">

                                                    <asp:DropDownList ID="ddltype" runat="server" Width="180px" Height="20px" CssClass="select" ValidationGroup="updt">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rqrdcat33t1" runat="server" ControlToValidate="ddltype" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />

                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:Label ID="lblRecType" runat="server" Text='<%#Eval("doctype") %>' CssClass="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:DropDownList ID="ddltype_footer" runat="server" Width="180px" Height="20px" ValidationGroup="validaiton">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rqrdcat656" runat="server" ControlToValidate="ddltype_footer" CssClass="select" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Subject/Title">
                                            <EditItemTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txt_sub_Edit" runat="server" Text='<%#Eval("Subject") %>' CssClass="select padtxt" TextMode="MultiLine" ValidationGroup="updt" MaxLength="500" Width="180px" Height="100px" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                        TargetControlID="txt_sub_Edit" ValidChars=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="rqrdcaat13dss" runat="server" ControlToValidate="txt_sub_Edit" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="updt" />
                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_Subject" runat="server" Text='<%#Eval("Subject") %>' CssClass="fontingrid" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding: 6px" align="center">
                                                    <asp:TextBox ID="txt_sub_footer" runat="server" MaxLength="200" TextMode="MultiLine" Font-Size="small" CssClass="select padtxt" Width="180px" Height="100px" ValidationGroup="validaiton" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderUniw1" runat="server"
                                                        TargetControlID="txt_sub_footer" ValidChars=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz&()[]:/-"></ajaxToolkit:FilteredTextBoxExtender>
                                                    <asp:RequiredFieldValidator ID="rqrdaacat33m0s" runat="server" ControlToValidate="txt_sub_footer" Font-Bold="true" Font-Size="Large" ForeColor="Red"
                                                        Text="*" ValidationGroup="validaiton" />
                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Attach/Download Document">
                                            <EditItemTemplate>
                                                <div style="padding-left: 10px; padding-right: 10px;" align="left">
                                                    <asp:FileUpload ID="fileUploadEdit" runat="server" />
                                                    <br />
                                                    <asp:Label ID="lblmsg" runat="server" Style="font-weight: 700; font-size: small" Text="* Only .pdf file, upto 350kB are allowed."></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label75" runat="server" Style="font-weight: 700; font-size: small" Text="** It is mandatory to upload a supporting document"></asp:Label>

                                                </div>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="imgDownload" CommandName="download" runat="server" Height="35" Width="35" ToolTip="Download" ImageUrl="~/images/pdficon.png" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding-left: 10px; padding-right: 10px;" align="left">
                                                    <asp:FileUpload ID="fileUploadfooter" runat="server" />
                                                    <br />
                                                    <asp:Label ID="lblmsg" runat="server" Style="font-weight: 700; font-size: small" Text="* Only .pdf file, upto 2MB are allowed."></asp:Label>
                                                    <br />
                                                    <asp:Label ID="Label75" runat="server" Style="font-weight: 700; font-size: small" Text="** It is mandatory to upload a supporting document"></asp:Label>

                                                </div>
                                            </FooterTemplate>
                                        </asp:TemplateField>



                                        <asp:TemplateField HeaderText="Action">
                                            <EditItemTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                    <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg" ValidationGroup="updt"
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
                                    <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server"
                                        ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Height="25px" Width="25px" OnClientClick="return confirm('Are you sure to delete?');" />
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div style="padding-left: 6px; padding-right: 6px; padding-top: 8px; padding-bottom: 8px" align="center">
                                                    <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Images/AddNewitem.jpg"
                                                        CommandName="AddNew" Width="28px" Height="28px" ToolTip="Add" ValidationGroup="validaiton" />
                                                    <br />
                                                    <asp:Label ID="lbladdtraining" runat="server" Text="Add a Document" Style="font-size: medium; font-family: Calibri; color: black; font-weight: bold"></asp:Label>
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
                                <br />
                                <br />
                                <div class="tablecus2" runat="server" style="width: 97%; padding: 10px" align="center">
                                    <table>
                                        <tr>

                                            <td runat="server" align="right" style="padding-right: 30px" width="50%">
                                                <asp:Button ID="Button4" runat="server" Text="<< Prev" Width="120px" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" OnClick="Button4_Click" />

                                            </td>
                                            <td runat="server" align="left" style="padding-right: 15px" width="50%">

                                                <asp:Button ID="Button5" runat="server" Width="120px" Text="Next>>" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" OnClick="Button5_Click" />
                                            </td>

                                        </tr>
                                    </table>
                                </div>
                                <br />
                                <br />
                            </div>
                            <%--  </ContentTemplate>
                                </asp:UpdatePanel>--%>
                        </div>
                    </div>
                </asp:View>


                <asp:View ID="viewpreview" runat="server">
                    <div class="tablecus2" runat="server" style="width: 97%; padding: 10px">
                        <div class="panel gradpanelround">
                            <div class="panel-heading gradheaderround">
                                <span style="font-size: large; font-weight: bold; color: Black;">:: Preview & Submit ::</span>
                            </div>
                            <div align="center" id="Div14" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-top: 10px; margin-bottom: 100px">

                                <div class="tablecus2" runat="server" style="width: 97%; padding: 10px">

                                    <table id="table_pre_sub" class="table table-bordered tablecus2">
                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label218" CssClass="font2" runat="server" Text="1." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label219" CssClass="font2" runat="server" Text="Application Number" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" width="60%">
                                                <asp:Label ID="lblappno" CssClass="font2" Font-Bold="true" ForeColor="Red" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr runat="server" visible="true">

                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label35" CssClass="font2" runat="server" Text="2." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label36" CssClass="font2" runat="server" Text="Name/Employee Code" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblname_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>


                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label38" CssClass="font2" runat="server" Text="3." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label39" CssClass="font2" runat="server" Text="Date Of Birth" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblDOB_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>


                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label41" CssClass="font2" runat="server" Text="4." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label42" CssClass="font2" runat="server" Text="Designation" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblDesgn_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label44" CssClass="font2" runat="server" Text="5." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label45" CssClass="font2" runat="server" Text="Contact No" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblcontact_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label47" CssClass="font2" runat="server" Text="6." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label48" CssClass="font2" runat="server" Text="E-Mail" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblemail_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label51" CssClass="font2" runat="server" Text="7." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label54" CssClass="font2" runat="server" Text="Present Place of Posting" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblpresent_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label58" CssClass="font2" runat="server" Text="8." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label60" CssClass="font2" runat="server" Text="Date of Joining at Present Station" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblDOJ_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label62" CssClass="font2" runat="server" Text="9." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label63" CssClass="font2" runat="server" Text="No of Years served at Present Place of Posting" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblnoofYears_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label70" CssClass="font2" runat="server" Text="10." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label71" CssClass="font2" runat="server" Text="Date of Super-Annuation" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblDOS_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label73" CssClass="font2" runat="server" Text="11." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label74" CssClass="font2" runat="server" Text="Is Present Place of Posting is Difficult/Most Difficult" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblpresent_Place_Ten_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label77" CssClass="font2" runat="server" Text="11.1." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label78" CssClass="font2" runat="server" Text="Tenure Completion Period" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblten_Years_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label81" CssClass="font2" runat="server" Text="11.2." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label82" CssClass="font2" runat="server" Text="Days Remaining to Complete Tenure" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lbldays_remain_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label84" CssClass="font2" runat="server" Text="11.3." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label85" CssClass="font2" runat="server" Text="Days Exceeded after the Completion of Tenure" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lbldaysexceed_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>

                                        </tr>

                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label137" CssClass="font2" runat="server" Text="12." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label138" CssClass="font2" runat="server" Text="Language Known" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                <asp:Label ID="lbllanguage_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label140" CssClass="font2" runat="server" Text="13." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label141" CssClass="font2" runat="server" Text="Application Forwarded to Whom" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblapplicationfwd_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                <asp:Label ID="lblappempid" CssClass="font2" Visible="false" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label145" CssClass="font2" runat="server" Text="14." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-right: 10px" width="100%" colspan="2">
                                                <asp:Label ID="Label146" CssClass="font2" runat="server" Text="Three Different Options Seeking for Transfer" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>

                                        </tr>


                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label147" CssClass="font2" runat="server" Text="14.1." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label148" CssClass="font2" runat="server" Text="Option 1" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="Label151" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblstate1_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                <br />
                                                <asp:Label ID="Label153" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblCity1_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>
                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label155" CssClass="font2" runat="server" Text="14.2." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label156" CssClass="font2" runat="server" Text="Option 2" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="Label159" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblstate2_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                <br />
                                                <asp:Label ID="Label161" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblcity2_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>

                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label163" CssClass="font2" runat="server" Text="14.3." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label164" CssClass="font2" runat="server" Text="Option 3" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                <asp:Label ID="Label167" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblstate3_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                <br />
                                                <asp:Label ID="Label169" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblCity3_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>
                                        <%--<tr visible="false">
                                            <td align="center" runat="server" width="10%" >
                                                <asp:Label ID="Label171" CssClass="font2" runat="server" Text="14.4" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label172" runat="server" Text="Reason If None Selected in Option2/Option3 " class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">
                                                <asp:Label ID="lblreason_selc_None_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>--%>

                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label174" CssClass="font2" runat="server" Text="15." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label175" CssClass="font2" runat="server" Text="Hometown" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                                <asp:Label ID="lblhometown_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>
                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label177" CssClass="font2" runat="server" Text="16.1." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label178" CssClass="font2" runat="server" Text="Ground on which Transfer Request is being Made" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                <asp:Label ID="lblgrnd_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label180" CssClass="font2" runat="server" Text="16.2." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label181" runat="server" Text="Subject(in 50 Characters)" class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">

                                                <asp:Label ID="lblsub_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label183" CssClass="font2" runat="server" Text="16.3." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label184" runat="server" Text="Details(in 700 Characters)" class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">

                                                <asp:Label ID="lbldetails_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>
                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label186" CssClass="font2" runat="server" Text="16.4" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label187" CssClass="font2" runat="server" Text="In case of medical ground of self or family member, please specify if medical facilities are available at place of posting or not" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                <asp:Label ID="lblmedicalgrnd_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>
                                        <tr runat="server" visible="true">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label189" CssClass="font2" runat="server" Text="17." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label190" CssClass="font2" runat="server" Text="Ready to forgo Transfer Benefits" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                <asp:Label ID="lblreadyTrans_ben_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>

                                        <tr runat="server" visible="false">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label192" CssClass="font2" runat="server" Text="18." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-right: 10px" width="100%" colspan="2">
                                                <asp:Label ID="Label193" CssClass="font2" runat="server" Text="If you are asking for the difficult/most difficult place/posting, then provide 3 different options for transfer, seeking after the completion of tenure" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>

                                        </tr>


                                        <tr runat="server" visible="false">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label194" CssClass="font2" runat="server" Text="18.1." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label195" CssClass="font2" runat="server" Text="Option 1" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                <asp:Label ID="Label198" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblstateop1_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                <br />
                                                <asp:Label ID="Label200" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblcityop1_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>
                                        <tr runat="server" visible="false">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label202" CssClass="font2" runat="server" Text="18.2." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label203" CssClass="font2" runat="server" Text="Option 2" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                <asp:Label ID="Label206" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblstateop2_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                <br />
                                                <asp:Label ID="Label208" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblcityop2_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>

                                        <tr runat="server" visible="false">
                                            <td align="center" runat="server" width="10%">
                                                <asp:Label ID="Label210" CssClass="font2" runat="server" Text="18.3." Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                <asp:Label ID="Label211" CssClass="font2" runat="server" Text="Option 3" Style="font-weight: 700; color: #000000"></asp:Label>
                                            </td>
                                            <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">

                                                <asp:Label ID="Label214" runat="server" Text="State: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblstateop3_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
                                                <br />
                                                <asp:Label ID="Label216" runat="server" Text="City: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lblcityop3_pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                            </td>
                                        </tr>


                                    </table>
                                    <br />
                                    <br />
                                    <div id="divtraining_prev" runat="server">
                                        <div runat="server" align="left" style="padding-left: 10px">
                                            <asp:Label ID="Label86" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text="Training Acquired"></asp:Label>
                                            <br />
                                            <br />
                                        </div>
                                        <asp:GridView ID="gvtraining_pre" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" DataKeyNames="id"
                                            CssClass="Gridview" HeaderStyle-Font-Bold="true"
                                            AllowPaging="false" HeaderStyle-ForeColor="White" Width="97%" ToolTip="TRAM Training Acquired" ShowFooter="false" PageSize="50" EmptyDataText="Nil">
                                            <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrowid1" runat="server" Font-Size="Medium" Text="<%#Container.DataItemIndex+1 %>" />
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Name of Institute">


                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_Inst0" runat="server" CssClass="fontingrid" Text='<%#Eval("Host_Institute") %>' />
                                                    </ItemTemplate>


                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Training Subject">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_Tran_Sub0" runat="server" CssClass="fontingrid" Text='<%#Eval("CourseName") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="From(Date)">

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblfrom0" runat="server" CssClass="fontingrid" Text='<%#Eval("Fromdate", "{0:dd-MMM-yyyy}") %>' />
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="To(Date)">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblto0" runat="server" CssClass="fontingrid" Text='<%#Eval("ToDate", "{0:dd-MMM-yyyy}") %>' />
                                                    </ItemTemplate>

                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Additional Info,If Any">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbladdinfo0" runat="server" CssClass="fontingrid" Text='<%#Eval("AnyRelevantInfo") %>' />
                                                    </ItemTemplate>

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

                                        <br />
                                        <br />
                                    </div>
                                    <div id="divtransfer_prev" runat="server">
                                        <div runat="server" align="left" style="padding-left: 10px">
                                            <asp:Label ID="Label87" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text="Trasfer History"></asp:Label>
                                            <br />
                                            <br />
                                        </div>
                                        <asp:GridView ID="gvtransfer_pre" runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="Gridview"
                                            DataKeyNames="id" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
                                            ShowFooter="false" ShowHeaderWhenEmpty="true" ToolTip="TRAM Transfer History" Width="97%" EmptyDataText="Nil">
                                            <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrowid2" runat="server" Font-Size="Medium" Text="<%#Container.DataItemIndex+1 %>" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblidt0" runat="server" CssClass="fontingrid" Text='<%#Eval("id") %>' />
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Wing &amp; Designation">
                                                    <ItemTemplate>
                                                        <div align="left" style="padding: 6px">
                                                            <asp:Label ID="lbltxtWI0" runat="server" CssClass="fontingrid" Font-Bold="true" ForeColor="Brown" Text="Wing: " />
                                                            <br />
                                                            <asp:Label ID="lblwing0" runat="server" CssClass="fontingrid" Text='<%#Eval("Wing") %>' />
                                                            <br />
                                                            <asp:Label ID="lbltxtDesignation0" runat="server" CssClass="fontingrid" Font-Bold="true" ForeColor="Brown" Text="Designation: " />
                                                            <br />
                                                            <asp:Label ID="lbldesignation1" runat="server" CssClass="fontingrid" Text='<%#Eval("DesignationName") %>' />
                                                        </div>
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Period">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label767" runat="server" CssClass="fontingrid" Font-Bold="true" ForeColor="Brown" Text="From (Date): " />
                                                        <br />
                                                        <asp:Label ID="lblfromdate1" runat="server" CssClass="fontingrid" Text='<%#Eval("fromdate", "{0:dd-MMM-yyyy}") %>' />
                                                        <br />
                                                        <asp:Label ID="Label57I1" runat="server" CssClass="fontingrid" Font-Bold="true" ForeColor="Brown" Text="To (Date): " />
                                                        <br />
                                                        <asp:Label ID="lblTodate1" runat="server" CssClass="fontingrid" Text='<%#Eval("Todate", "{0:dd-MMM-yyyy}") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Transferred by Department/Own Request">
                                                    <ItemTemplate>
                                                        <div align="left" style="padding: 6px">
                                                            <asp:Label ID="lblD_O_Request0" runat="server" CssClass="fontingrid" Text='<%#Eval("Transfer_byDep_Own") %>' />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Organization, Station &amp; Tenure">
                                                    <ItemTemplate>
                                                        <div align="left" style="padding: 6px">
                                                            <asp:Label ID="lblWI0" runat="server" CssClass="fontingrid" Font-Bold="true" ForeColor="Brown" Text="Organization: " />
                                                            <br />
                                                            <asp:Label ID="lblOrganizationName0" runat="server" CssClass="fontingrid" Text='<%#Eval("OrganizationName") %>' />
                                                            <br />
                                                            <asp:Label ID="Label769" runat="server" CssClass="fontingrid" Font-Bold="true" ForeColor="Brown" Text="Station: " />
                                                            <br />
                                                            <asp:Label ID="lblStationName0" runat="server" CssClass="fontingrid" Text='<%#Eval("StationName") %>' />
                                                            <br />
                                                            <asp:Label ID="Label770" runat="server" CssClass="fontingrid" Font-Bold="true" ForeColor="Brown" Text="Tenure: " />
                                                            <br />
                                                            <asp:Label ID="lbltenur0" runat="server" CssClass="fontingrid" Text='<%#Eval("TenureId") %>' />
                                                            &nbsp;Year
                                                        </div>
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Additional Info,If Any">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbladdinfo1" runat="server" CssClass="fontingrid" Text='<%#Eval("AddInfo") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <FooterStyle BackColor="#FBEDC4" Font-Bold="True" Height="35px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <HeaderStyle BackColor="#E67E22" CssClass="centerHeaderText fontingrid" Font-Bold="True" ForeColor="Black" Wrap="True" />
                                            <RowStyle BackColor="#EFF3FB" Font-Bold="True" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <PagerSettings Position="TopAndBottom" />
                                            <PagerStyle BackColor="#E67E22" BorderColor="Black" BorderWidth="2" CssClass="cssPager pag" Font-Bold="True" Font-Size="Small" ForeColor="White" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        </asp:GridView>
                                        <br />
                                        <br />
                                    </div>
                                    <div id="divrecord_prev" runat="server">
                                        <div runat="server" align="left" style="padding-left: 10px">
                                            <asp:Label ID="Label88" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text="Records of Leave/Unauthorised Absence/Training/Deputation/Tour at Present Place of Posting"></asp:Label>
                                            <br />
                                            <br />
                                        </div>
                                        <asp:GridView ID="grdrecord_per" runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="Gridview" DataKeyNames="id"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" ShowFooter="false" ShowHeaderWhenEmpty="true" ToolTip="TRAM Records" Width="97%" EmptyDataText="Nil">
                                            <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrowid3" runat="server" Font-Size="Medium" Text="<%#Container.DataItemIndex+1 %>" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Record Type">
                                                    <ItemTemplate>
                                                        <div align="center" style="padding: 6px">
                                                            <asp:Label ID="lblRecType0" runat="server" CssClass="fontingrid" Text='<%#Eval("type") %>' />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Period">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label773" runat="server" CssClass="fontingrid" Font-Bold="true" ForeColor="Brown" Text="From (Date): " />
                                                        <br />
                                                        <asp:Label ID="lblfromdate2" runat="server" CssClass="fontingrid" Text='<%#Eval("fromdate", "{0:dd-MMM-yyyy}") %>' />
                                                        <br />
                                                        <asp:Label ID="Label57I2" runat="server" CssClass="fontingrid" Font-Bold="true" ForeColor="Brown" Text="To (Date): " />
                                                        <br />
                                                        <asp:Label ID="lblTodate2" runat="server" CssClass="fontingrid" Text='<%#Eval("Todate", "{0:dd-MMM-yyyy}") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Place During Absence">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblplace0" runat="server" CssClass="fontingrid" Text='<%#Eval("PlaceDuringAbsence") %>' />
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sanctioning Authority">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSancAuth0" runat="server" CssClass="fontingrid" Text='<%#Eval("SanctioningAuthority") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Additional Info,If Any">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbladdinfo2" runat="server" CssClass="fontingrid" Text='<%#Eval("AdditionalInfo") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <FooterStyle BackColor="#FBEDC4" Font-Bold="True" Height="35px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <HeaderStyle BackColor="#E67E22" CssClass="centerHeaderText fontingrid" Font-Bold="True" ForeColor="Black" Wrap="True" />
                                            <RowStyle BackColor="#EFF3FB" Font-Bold="True" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <PagerSettings Position="TopAndBottom" />
                                            <PagerStyle BackColor="#E67E22" BorderColor="Black" BorderWidth="2" CssClass="cssPager pag" Font-Bold="True" Font-Size="Small" ForeColor="White" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        </asp:GridView>
                                        <br />
                                        <br />
                                    </div>
                                    <div id="div16" runat="server">
                                        <div runat="server" align="left" style="padding-left: 10px">
                                            <asp:Label ID="Label37" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text="Health Category PwD-Self/Dependents"></asp:Label>
                                            <br />
                                            <br />
                                        </div>
                                        <asp:GridView ID="grdhealth_pre" runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="Gridview" DataKeyNames="id"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" ShowFooter="false" ShowHeaderWhenEmpty="true"
                                            ToolTip="TRAM Health Category Details" Width="97%" EmptyDataText="Nil" OnRowCommand="grdhealth_pre_RowCommand">
                                            <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <ItemTemplate>
                                                        <div align="center" style="padding-left: 6px; padding-right: 6px;">
                                                            <asp:Label ID="lblrowid4" runat="server" Font-Size="Medium" Text="<%#Container.DataItemIndex+1 %>" />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ID" Visible="false">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblhcid0" runat="server" CssClass="fontingrid" Text='<%#Eval("id") %>' />
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <div align="center" style="padding: 6px">
                                                            <asp:Label ID="lblhcName0" runat="server" CssClass="fontingrid" Text='<%#Eval("Name") %>' />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Relation">
                                                    <ItemTemplate>
                                                        <div align="center" style="padding: 6px">
                                                            <asp:Label ID="lblrelation0" runat="server" CssClass="fontingrid" Text='<%#Eval("relation") %>' />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Age">
                                                    <ItemTemplate>
                                                        <div align="center" style="padding: 6px">
                                                            <asp:Label ID="lblage0" runat="server" CssClass="fontingrid" Text='<%#Eval("age") %>' />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Additional Info,If Any">
                                                    <ItemTemplate>
                                                        <div align="center" style="padding-left: 6px; padding-right: 6px;">
                                                            <asp:Label ID="lbladdinfo3" runat="server" CssClass="fontingrid" Text='<%#Eval("Additional_IfAny") %>' />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Download Document">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgDownload0" runat="server" CommandName="download" Height="35" ImageUrl="~/images/pdficon.png" ToolTip="Download" Width="35" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <FooterStyle BackColor="#FBEDC4" Font-Bold="True" Height="35px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <HeaderStyle BackColor="#E67E22" CssClass="centerHeaderText fontingrid" Font-Bold="True" ForeColor="Black" Wrap="True" />
                                            <RowStyle BackColor="#EFF3FB" Font-Bold="True" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <PagerSettings Position="TopAndBottom" />
                                            <PagerStyle BackColor="#E67E22" BorderColor="Black" BorderWidth="2" CssClass="cssPager pag" Font-Bold="True" Font-Size="Small" ForeColor="White" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        </asp:GridView>
                                        <br />
                                        <br />
                                    </div>
                                    <div id="div17" runat="server">
                                        <div runat="server" align="left" style="padding-left: 10px">
                                            <asp:Label ID="Label40" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text="Supported Document(s)"></asp:Label>
                                            <br />
                                            <br />
                                        </div>
                                        <asp:GridView ID="grdUpload_pre" runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="Gridview" DataKeyNames="id"
                                            HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" ShowFooter="false" ShowHeaderWhenEmpty="true" ToolTip="TRAM Documents" Width="97%" EmptyDataText="No Records Found.." OnRowCommand="grdUpload_pre_RowCommand">
                                            <AlternatingRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblrowid5" runat="server" Font-Size="Medium" Text="<%#Container.DataItemIndex+1 %>" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Document Type">
                                                    <ItemTemplate>
                                                        <div align="center" style="padding: 6px">
                                                            <asp:Label ID="lblRecType1" runat="server" CssClass="fontingrid" Text='<%#Eval("doctype") %>' />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Subject/Title">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_Subject0" runat="server" CssClass="fontingrid" Text='<%#Eval("Subject") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Download Document">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="imgDownload0" runat="server" CommandName="download" Height="35" ImageUrl="~/images/pdficon.png" ToolTip="Download" Width="35" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                            </Columns>
                                            <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <FooterStyle BackColor="#FBEDC4" Font-Bold="True" Height="35px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <HeaderStyle BackColor="#E67E22" CssClass="centerHeaderText fontingrid" Font-Bold="True" ForeColor="Black" Wrap="True" />
                                            <RowStyle BackColor="#EFF3FB" Font-Bold="True" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                            <PagerSettings Position="TopAndBottom" />
                                            <PagerStyle BackColor="#E67E22" BorderColor="Black" BorderWidth="2" CssClass="cssPager pag" Font-Bold="True" Font-Size="Small" ForeColor="White" HorizontalAlign="Left" VerticalAlign="Middle" />
                                        </asp:GridView>
                                        <br />
                                        <br />
                                    </div>
                                    <div>
                                        <table runat="server" style="width: 100%; padding: 10px">
                                            <tr>
                                                <td runat="server" align="center" style="padding-right: 30px" width="20%">
                                                    <asp:CheckBox ID="CheckBox1" Width="40px" Height="40px" runat="server" Text="Accept" Checked="true" />
                                                    &nbsp;

                                                </td>
                                                <td runat="server" align="left" style="padding-left: 30px" width="80%">
                                                    <asp:Label runat="server" ForeColor="Black" Font-Bold="true" Font-Size="Small" Text="I solemnly affirm and declare  that the information provided in the form is correct and no fact is concealed or suppressed. If information is found incorrect, my application shall be rejected & Prasar Bharati is liable to initiate a disciplinary action."></asp:Label>
                                                </td>


                                            </tr>

                                        </table>
                                        <br />
                                        <br />
                                    </div>
                                    <table>
                                        <tr>
                                            <td runat="server" align="right" style="padding-right: 30px" width="30%">
                                                <asp:Button ID="btnprev" runat="server" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Text="&lt;&lt; Prev" Width="160px" OnClick="btnprev_Click" />
                                                &nbsp;

                                            </td>
                                            <td runat="server" align="left" style="padding-right: 30px" width="30%">
                                                <asp:Button ID="btnsubmit" OnClientClick="return confirm('After the final submission, you will not be allowed to edit your application.Are You Sure for Final Submission?');" runat="server" Text="Final Submit" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="160px" OnClick="btnsubmit_Click" />

                                            </td>


                                        </tr>

                                    </table>
                                    <asp:Label ID="lblfinalmsg" Font-Bold="true" Font-Size="Medium" ForeColor="Red" runat="server" Text=""></asp:Label>
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--<div align="center" class="col-md-1 col-lg-1" runat="server"></div>--%>
                </asp:View>
            </asp:MultiView>
        </div>
    </div>
</asp:Content>
