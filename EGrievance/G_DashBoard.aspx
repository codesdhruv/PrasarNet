<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="G_DashBoard.aspx.cs" Inherits="PrasarNet.EGrievance.G_DashBoard" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
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

        .grad2new {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #F2F4F4, #E67E22);
            -webkit-radial-gradient;
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
        <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto">
            <div id="Div2" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="btnback_Click"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-arrow-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div id="div4" style="text-align: left; padding-left: 25px; padding-bottom: 10px" runat="server" visible="true">
            <asp:LinkButton ID="lnkdepttwisegrievance" ForeColor="Blue" Font-Underline="true" Font-Bold="true" Font-Size="Large" runat="server" OnClick="lnkdepttwisegrievance_Click">Department Wise Reports</asp:LinkButton>
        </div>
        <div id="div5" style="text-align: left; padding-left: 25px; padding-bottom: 10px" runat="server" visible="false">
            <asp:LinkButton ID="lnkofficewise" ForeColor="Blue" Font-Underline="true" Font-Bold="true" Font-Size="Large" runat="server">Station/Section Wise Reports</asp:LinkButton>
        </div>
        <div id="div3" style="text-align: left; padding-left: 25px; padding-bottom: 10px" runat="server" visible="true">
            <asp:LinkButton ID="lnksubjectwise" ForeColor="Blue" Font-Underline="true" Font-Bold="true" Font-Size="Large" runat="server" OnClick="lnksubjectwise_Click">Subject Wise Reports</asp:LinkButton>
        </div>
        <div runat="server" align="center" style="border: medium ridge #000000; margin: 0 20px 10px 20px;">
            <div runat="server" align="center" style="padding: 7px">
                <asp:Label runat="server" ID="lblmsg" CssClass="font2" ForeColor="Black" Font-Underline="true" Font-Bold="true" Text=":: General ::"></asp:Label>
            </div>
            <div class="row" runat="server" align="center" width="95%" style="margin: auto; padding-top: 7px; padding-bottom: 7px; padding-right: 0px; padding-left: 0px; align-items: center">
                <%-- <div align="center" class=" col-md-2 col-sm-2 col-lg-2" style="padding: 7px; margin: 3px">
                </div>--%>
                <div align="center" runat="server" class=" col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                    <asp:Button ID="btntotalGrievance" runat="server" class="gradtotal font2 wrap" Font-Bold="true"
                        Style="padding-top: 63px; padding-bottom: 62px; width: 90%; height: 150px;" BorderColor="White" OnClick="btntotalGrievance_Click" />

                </div>
                <div align="center" runat="server" class=" col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                    <asp:Button ID="btn_initialAction" runat="server" class="gradtotal font2 wrap" Font-Bold="true"
                        Style="padding-top: 63px; padding-bottom: 62px; width: 90%; height: 150px;" BorderColor="White" OnClick="btn_initialAction_Click" />


                </div>
                <div align="center" runat="server" class=" col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                    <asp:Button ID="btn_pending_PBGS" runat="server" class="gradtotal font2 wrap" Font-Bold="true"
                        Style="padding-top: 63px; padding-bottom: 62px; width: 90%; height: 150px;" BorderColor="White" OnClick="btn_pending_PBGS_Click" />

                </div>
            </div>

        </div>
        <div runat="server" align="center" style="border: medium ridge #000000; margin: 0 20px 10px 20px;">
            <div runat="server" align="center" style="padding: 7px">
                <asp:Label runat="server" ID="Label3" CssClass="font2" ForeColor="Black" Font-Underline="true" Font-Bold="true" Text=":: Resolved/Closed ::"></asp:Label>
            </div>
            <div class="row" runat="server" width="95%" align="center" style="margin: auto; padding-top: 7px; padding-bottom: 7px; padding-right: 0px; padding-left: 0px; align-items: center">
                <div align="center" runat="server" class=" col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                    <asp:Button ID="btnresolved" runat="server" class="gradcured font2 wrap" Font-Bold="true"
                        Style="padding-top: 63px; padding-bottom: 62px; width: 90%; height: 150px;" BorderColor="White" OnClick="btnresolved_Click" />

                </div>
                <div align="center" runat="server" class="col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                    <asp:Button ID="btn_GR_res_PBGS_IstStep" runat="server" class="gradcured font2 wrap" Font-Bold="true"
                        Style="padding-top: 63px; padding-bottom: 62px; width: 90%; height: 150px;" BorderColor="White" OnClick="btn_GR_res_PBGS_IstStep_Click" />

                </div>
                <div align="center" runat="server" class="col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                    <asp:Button ID="btn_gr_res_afterstn" runat="server" class="gradcured font2 wrap" Font-Bold="true"
                        Style="padding-top: 63px; padding-bottom: 62px; width: 90%; height: 150px;" BorderColor="White" OnClick="btn_gr_res_afterstn_Click" />

                </div>
            </div>
        </div>
        <div runat="server" align="center" style="border: medium ridge #000000; margin: 0 20px 10px 20px;">
            <div runat="server" align="center" style="padding: 7px">
                <asp:Label runat="server" ID="Label4" CssClass="font2" ForeColor="Black" Font-Underline="true" Font-Bold="true" Text=":: Pending (After Initial action taken) ::"></asp:Label>
            </div>
            <div class="row" runat="server" width="95%" align="center" style="margin: auto; padding-top: 7px; padding-bottom: 7px; padding-right: 0px; padding-left: 0px; align-items: center">

                <div align="center" runat="server" class="col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                    <asp:Button ID="btnTotalpending" runat="server" class="graddeceased font2 wrap" Font-Bold="true"
                        Style="padding-top: 63px; padding-bottom: 62px; width: 90%; height: 150px;" BorderColor="White" OnClick="btnTotalpending_Click" />

                </div>
                <div align="center" runat="server" class=" col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                    <asp:Button ID="btn_reply_pending_PBGS" runat="server" class="graddeceased font2 wrap" Font-Bold="true"
                        Style="padding-top: 63px; padding-bottom: 62px; width: 90%; height: 150px;" BorderColor="White" OnClick="btn_reply_pending_PBGS_Click" />

                </div>
                <div align="center" runat="server" class="col-md-4 col-sm-4 col-lg-4 " style="padding-top: 5px; padding-bottom: 5px">
                    <asp:Button ID="btn_Action_Pending_stn" runat="server" class="graddeceased font2 wrap" Font-Bold="true"
                        Style="padding-top: 63px; padding-bottom: 62px; width: 90%; height: 150px;" BorderColor="White" OnClick="btn_Action_Pending_stn_Click" />

                </div>
            </div>
        </div>
        <div id="divinfogrd" class="row" style="margin: auto; padding: 30px" runat="server" visible="false">
            <%--  <div  runat="server" class="row" style="margin: auto">--%>
            <div id="divgrd" visible="true" align="center" class=" col-md-12 col-sm-12 col-lg-12"
                runat="server">
                <%-- <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server"
                                            Font-Size="Smaller" class="btn btn-info" Width="80px"></asp:LinkButton>--%>
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="font-weight: bold; color: Black;" class="font2">:: Grievance Details ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">

                        <div id="divprisearch" style="text-align: center; padding: 10px; margin: auto" runat="server" visible="true" class="row">
                            <div class="col-lg-2 col-md-2"></div>
                            <div class="col-lg-2 col-md-2"></div>
                            <div class="col-lg-2 col-md-2" style="padding: 7px">
                                <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                    Width="160px" BackColor="#F5B7B1" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="btnprint1_Click">
                                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span><span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                            </div>
                            <div class="col-lg-2 col-md-2" style="padding: 7px">
                                <asp:LinkButton ID="btnexporttoexcel" runat="server" CssClass="btn" CausesValidation="False"
                                    Width="160px" BackColor="LightGreen" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="btnexporttoexcel_Click">
                                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-export"></span><span style="font-weight: bold; color: #000000">Export to Excel</span></asp:LinkButton>
                            </div>
                            <div class="col-lg-2 col-md-2"></div>
                            <div class="col-lg-2 col-md-2"></div>
                        </div>

                        <div align="left" style="padding-left: 25px; padding-top: 10px; padding-bottom: 10px" class="auto-style4">
                            <%--<strong>* Action is prohibited for closed or forwared Grievances.
                            </strong>--%>
                            <asp:HiddenField ID="hfCurrentRowIndex" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="hfParentContainer" runat="server"></asp:HiddenField>
                        </div>
                        <asp:Panel ID="panelprint" runat="server">
                            <div id="divmsg" runat="server" visible="false" align="center">
                                <asp:Label ID="Label5" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                            </div>
                            <br />

                            <asp:GridView ID="grdcomdetails" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" BackColor="#F8F9F9"
                                DataKeyNames="Gre_Id" ShowHeaderWhenEmpty="True" ToolTip="Grievances and their Status" Width="95%" OnPageIndexChanging="grdcomdetails_PageIndexChanging"
                                PageSize="20" AllowPaging="true" OnRowCommand="grdcomdetails_RowCommand" OnRowDataBound="grdcomdetails_RowDataBound">
                                <headerstyle backcolor="#0099FF" font-bold="True" forecolor="Black" horizontalalign="Center" />
                                <columns>
                                    <asp:TemplateField HeaderText="S.No.">
                                        <itemtemplate>
                                            <div runat="server" align="center">

                                                <asp:Label ID="lblSNo" ForeColor="Black" CssClass="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />

                                                <asp:Label ID="lbltrnid" Font-Bold="true" ForeColor="Black" runat="server" Visible="false" Text='<%#Eval("trnId") %>' class="fontingrid" />
                                                <asp:Label ID="lblserialno" Font-Bold="true" ForeColor="Black" runat="server" Visible="false" Text='<%#Eval("serialno") %>' class="fontingrid" />

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
                                        </itemtemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Reference ID & Grievance regd On">
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
                                    <asp:TemplateField HeaderText="Grievance/Download Supporting Document (If Any)">
                                        <itemtemplate>
                                            <div style="padding: 15px" runat="server">
                                                <asp:LinkButton ID="lblgrievancegrid" CommandName="download" Font-Underline="false" Font-Bold="true" ForeColor="Blue" runat="server" Text='<%#Eval("Grievance") %>' class="fontingrid" />
                                                <asp:Label ID="lblfileuploadoutput" runat="server" Text='<%#Eval("fileuploadoutput") %>' Visible="false"></asp:Label>
                                            </div>
                                        </itemtemplate>

                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Initial Action Taken By PBGS with Remarks">
                                        <itemtemplate>
                                            <%-- <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server"
                                            Font-Size="Smaller" class="btn btn-info" Width="80px"></asp:LinkButton>--%>
                                            <div align="left" runat="server" style="padding-top: 15px; padding-bottom: 15px; padding-left: 15px; padding-right: 15px">
                                                <asp:Label ID="lblac" Font-Bold="true" ForeColor="Brown" runat="server" Text="Action : " class="fontingrid" />
                                                <asp:Label ID="lblaction" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                    CausesValidation="False" Text='<%#Eval("currentstatus") %>'></asp:Label>
                                                <asp:Label ID="lblcurrentstatus" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                    CausesValidation="False" Visible="false" Text='<%#Eval("currentstatusID") %>'></asp:Label>
                                                <%-- <br />
                                                <br />
                                                <asp:LinkButton ID="lnkdocattac" Font-Bold="true" ForeColor="Brown" runat="server" Text="Remarks : " class="fontingrid" />
                                                <asp:LinkButton ID="lnkreplydocattac" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Remarksby_dealing_officer") %>' class="fontingrid" />--%>
                                                <br />
                                                <br />
                                                <asp:Label ID="lblFilefwd" Font-Bold="true" ForeColor="Brown" runat="server" Text="Document Forwarded : " class="fontingrid" />
                                                <asp:LinkButton ID="lblfilefwd2" Font-Bold="true" ToolTip="File Attached" CommandName="fwddownload2" ForeColor="Blue" runat="server" Text="" class="fontingrid"></asp:LinkButton>

                                                <asp:Label ID="lblfilefwdupldoutput" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                    CausesValidation="False" Visible="false" Text='<%#Eval("forwardedfileuploadoutput") %>'></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="Label3" Font-Bold="true" ForeColor="Brown" runat="server" Text="Email sent to : " class="fontingrid" />
                                                <asp:Label ID="Label4" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Emailsendto") %>' class="fontingrid" />
                                                <br />
                                                <br />
                                                <asp:Label ID="Label21" Font-Bold="true" ForeColor="Brown" runat="server" Text="Copy(Email) sent to : " class="fontingrid" />
                                                <asp:Label ID="Label22" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("ccmailto") %>' class="fontingrid" />
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
                                                <%--<asp:Label ID="lblrem" Font-Bold="true" ForeColor="Brown" runat="server" Text="Resolved By : " class="fontingrid" />--%>
                                                <%--<asp:Label ID="lblremarkbydealingoffr" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("") %>' class="fontingrid" />--%>
                                            </div>
                                            <asp:Label ID="lblgrievanceIDGrid" runat="server" Text='<%#Eval("Gre_Id") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblresolvedflag" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                        </itemtemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Pending Since (in Days)" Visible="false">
                                        <itemtemplate>
                                            <div style="padding: 15px" runat="server">
                                                <asp:Label ID="lblpendingSince" runat="server" Text='<%#Eval("pendingsince") %>' Visible="true" class="font2" Font-Bold="true" ForeColor="Red"></asp:Label>
                                            </div>
                                        </itemtemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Take an Action" Visible="false">
                                        <itemtemplate>
                                            <div align="center" runat="server" style="padding: 8px">
                                                <asp:LinkButton ID="lnkaction" CommandName="takeaction" runat="server" BackColor="#99FFCC" CssClass="btn font2" ForeColor="Black"
                                                    CausesValidation="False" Text="Action">
                                                </asp:LinkButton>
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="lnkview" CommandName="View" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue"
                                                    CausesValidation="False" Text="View/Get Pdf">
                                                </asp:LinkButton>
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="lnkresendemail" CommandName="ResendEmail" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue"
                                                    CausesValidation="False" Text="Send a Reminder to Station/Section">
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="lnkresendemailtoComplainant" CommandName="ResendEmailtoComplainant" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue"
                                                    CausesValidation="False" Text="Resend a E-Mail to Complainant">
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
                        </asp:Panel>
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
                                            <asp:Label ID="Label52" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                                        </div>
                                        <div class="table-responsive" runat="server" align="center" style="padding: 20px">
                                            <asp:GridView ID="grdresendmails" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                                PageSize="5" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .."
                                                ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid"
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
                                        <asp:Label ID="Label53" Visible="true" Text="Track of Grievances" Font-Bold="true" Font-Size="Medium" runat="server" />
                                    </div>
                                    <div id="Div11" class="body" runat="server">
                                        <div id="div16" class="body" runat="server" align="left" style="padding-top: 20px; padding-left: 20px">
                                            <asp:Label ID="Label54" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" Text="Grievance Reference-ID: " />
                                            <asp:Label ID="Label55" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                                        </div>
                                        <div class="table-responsive" runat="server" align="center" style="padding: 20px">
                                            <asp:GridView ID="grdtrack" runat="server" AutoGenerateColumns="False" AllowPaging="True" ToolTip="Track Of Grievances"
                                                PageSize="5" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .."
                                                ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid"
                                                BorderWidth="2px">
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

                        <asp:LinkButton Text="" ID="lnkfakeaction" runat="server" />
                        <ajaxtoolkit:modalpopupextender id="mpeaction" runat="server" popupcontrolid="pnlaction" targetcontrolid="lnkfakeaction"
                            backgroundcssclass="modalBackground" cancelcontrolid="btnClosetrack">
                        </ajaxtoolkit:modalpopupextender>
                        <asp:Panel ID="pnlaction" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 85%;" Width="90%">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                <triggers>
                                    <asp:PostBackTrigger ControlID="btnsubmit" />
                                    <asp:PostBackTrigger ControlID="btnfwd" />
                                    <%--<asp:AsyncPostBackTrigger ControlID="btnsubmit" EventName="Click"/>--%>
                                    <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
                                </triggers>
                                <contenttemplate>
                                    <div class="header">
                                        <asp:Label ID="Label7" Visible="true" Text="Take an Action" Font-Bold="true" Font-Size="Medium" runat="server" />
                                    </div>
                                    <div id="Div6" class="body" runat="server">
                                        <div id="div7" class="body" runat="server" align="left" style="padding-top: 20px; padding-left: 20px">
                                            <asp:Label ID="Label8" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" Text="Grievance Reference-ID: " />
                                            <asp:Label ID="Label9" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                                        </div>
                                        <div id="divresorfor" runat="server" visible="true" align="center" style="padding: 10px;">
                                            <div class="row" style="margin: auto" runat="server" id="div8">
                                                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                                                <div align="center" class=" col-md-12  col-lg-12" runat="server" id="div12">
                                                    <div id="div22" class="grad2new" runat="server" style="border: medium ridge #000000; padding-top: 20px; padding-bottom: 20px; margin: auto 20px auto 20px">
                                                        <div runat="server" align="center">
                                                            <asp:Label runat="server" Text=":: Select an Action to Perform ::" ForeColor="Black" Font-Size="Large" Font-Bold="true" class="font2" Font-Underline="true"></asp:Label>
                                                        </div>
                                                        <div runat="server" align="right" style="padding-right: 30px">
                                                            <asp:Button ID="Button6" runat="server" CausesValidation="False" Font-Bold="true" Font-Size="Medium" ForeColor="Black" Text="x" ValidationGroup="fwd" Width="30px" OnClick="Button6_Click" />
                                                        </div>
                                                        <%-- <asp:Panel ID="Panel2" runat="server">
                                                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" CellPadding="2" class="font2 chk" ForeColor="Black"
                                                                CellSpacing="2" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                                                                <asp:ListItem Value="1">&nbsp;&nbsp;Close</asp:ListItem>
                                                                <asp:ListItem Value="3">&nbsp;&nbsp;Forward</asp:ListItem>
                                                            </asp:CheckBoxList>
                                                        </asp:Panel>--%>
                                                        <asp:Panel ID="Panel2" runat="server">
                                                            <asp:RadioButtonList ID="CheckBoxList1" runat="server" AutoPostBack="True" CellPadding="2" class="font2 chk" ForeColor="Black"
                                                                CellSpacing="2" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                                                                <asp:ListItem Value="1">&nbsp;&nbsp;Close/Resolve a Grievance</asp:ListItem>
                                                                <asp:ListItem Value="3">&nbsp;&nbsp;Forward a Grievance</asp:ListItem>
                                                            </asp:RadioButtonList>
                                                        </asp:Panel>
                                                    </div>
                                                    <div id="divresolvedaction" runat="server" visible="false" align="center" style="margin-top: 35px">
                                                        <div id="div24" runat="server" style="border: medium ridge #000000; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px; margin: auto 20px auto 20px">
                                                            <%--<div class="row row-no-padding" style="margin: auto">
                                <div class="col-lg-12 col-md-12">
                                    <div id="Div23" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                                        <asp:Label ID="Label59" runat="server" Text="Close a Grievance" CssClass="font2" Style="font-weight: bold; color: Black;"></asp:Label>&nbsp;
                                    </div>
                                </div>
                            </div>--%>
                                                            <table class="table table table-bordered grad2new def" cellpadding="5" rules="all" style="border-style: ridge; border-width: medium; z-index: 1; position: relative;">
                                                                <tr class="grad3">
                                                                    <td align="center" colspan="2" style="padding-top: 8px; padding-bottom: 8px" class="auto-style3">
                                                                        <asp:Label ID="Label60" runat="server" Text="Close a Grievance/File a Reply " CssClass="font2" Style="font-weight: bold; color: Black;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label35" runat="server" Text="Grievance Reference ID" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:Label ID="lblrefidres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>



                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label37" runat="server" Text="Name & Mobile Number of Complainant" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:Label ID="lblnameres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label36" runat="server" Text="Dept/Section to which the Grievance is related(as selected by the complainant)" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:Label ID="lbldeptres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label39" runat="server" Text="Grievance Regd. On" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:Label ID="lbldateres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label41" runat="server" Text="Grievance/Complaint" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:Label ID="lblgrievanceres" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px">
                                                                        <asp:Label ID="Label11" runat="server" Text="Email" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp; </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px">
                                                                        <div style="padding: 5px">
                                                                            <asp:TextBox ID="txtEmailres" Style="padding-left: 7px" runat="server" Placeholder="Primary Email" ReadOnly="true" CssClass="select font2 widthofboxes1" Width="90%" Height="30px" ValidationGroup="sub1"></asp:TextBox>
                                                                            &nbsp;<span style="color: black; font-size: medium;"><strong>*&nbsp; 
                                        <br />
                                                                            </strong></span>
                                                                            <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="True" Font-Bold="true" ForeColor="Blue" Font-Size="Small" OnClick="LinkButton1_Click" CausesValidation="False">Change Email</asp:LinkButton>
                                                                            &nbsp;
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
                                                                            <asp:TextBox ID="txtccresto" runat="server" Placeholder="CC to(If Any)" Width="90%" CssClass="select font2 widthofboxes1" Height="30px" Style="padding-left: 7px"></asp:TextBox>
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
                                                                    <td width="40%" align="right" style="padding-right: 30px">
                                                                        <asp:Label ID="Label12" runat="server" Text="Remarks" ForeColor="Black"
                                                                            class="font" Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp; </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px">
                                                                        <asp:TextBox ID="txtremarksres" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="sub2"
                                                                            Style="padding: 7px" TextMode="MultiLine">
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
                                                                        <div runat="server" id="divLOupload" style="padding-top: 10px; padding-bottom: 10px">
                                                                            <asp:FileUpload ID="FileUpload1" runat="server" class="select widthofboxes1" Height="22px" Font-Size="Medium" Font-Bold="true" />
                                                                            &nbsp;<span style="color: red; font-weight: bold; font-size: small"><br />
                                                                                * Upload supporting document upto 3MB, If necessary</span>
                                                                            <br />
                                                                            <asp:Label ID="Label13" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" Text="** Only .pdf are allowed to upload"></asp:Label>
                                                                            <asp:Label ID="lblexception" Visible="true" runat="server" Text="" CssClass="fontingrid" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td align="right" style="padding-right: 10px">
                                                                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" Font-Size="Large" class="btn select buttondocumentupload" ValidationGroup="sub2"
                                                                            BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnsubmit_Click" />
                                                                    </td>
                                                                    <td align="left" style="padding-left: 10px">
                                                                        <asp:Button ID="Button2" runat="server" Text="Close" Font-Size="Large" class="btn select gradbody buttondocumentupload"
                                                                            BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button2_Click" />
                                                                        &nbsp; </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    <div id="divforwardedaction" runat="server" visible="false" align="center" style="margin-top: 35px">
                                                        <div id="div212" runat="server" style="border: medium ridge #000000; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px; margin: auto 20px auto 20px">

                                                            <table class="table table table-bordered grad2new def" cellpadding="5" rules="all" style="border-style: ridge; border-width: medium; z-index: 1; position: relative;">
                                                                <tr class="grad3">
                                                                    <td align="center" colspan="2" style="padding-top: 8px; padding-bottom: 8px" class="auto-style3">
                                                                        <asp:Label ID="Label61" runat="server" Text="Forward a Grievance" CssClass="font2" Style="font-weight: bold; color: Black;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label31" runat="server" Text="Grievance Reference ID" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:Label ID="lblrefIdFwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>



                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label32" runat="server" Text="Name & Mobile Number of Complainant" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:Label ID="lblnamefwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                                                    </td>
                                                                    <tr>
                                                                        <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                            <asp:Label ID="Label38" runat="server" Text="Dept/Section to which the Grievance is related(as selected by the complainant)" ForeColor="Black" class="font"
                                                                                Style="font-weight: bold;"></asp:Label>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                            <asp:Label ID="lbldeptfwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                                                        </td>
                                                                    </tr>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label33" runat="server" Text="Grievance Regd. On" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:Label ID="lbldatefwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label34" runat="server" Text="Grievance/Complaint" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:Label ID="lblgrievancefwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label16" runat="server" Text="Forward to Department" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:DropDownList ID="ddldeptfwd" runat="server" AutoPostBack="True" style="padding-left: 7px" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" Width="90%"
                                                                            ValidationGroup="sub1" Height="30px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddldeptfwd_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                        <br />
                                                                        <asp:RequiredFieldValidator ID="rfvdept" runat="server" ControlToValidate="ddldeptfwd" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1"
                                                                            Display="Dynamic" ErrorMessage="Pls. Select a Department!!" ForeColor="Red" SetFocusOnError="True"
                                                                            class="font">
                                                                        </asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label17" runat="server" Text="Forward to Section" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                                                        <asp:DropDownList ID="ddlsecfwd" runat="server" class="select widthofboxes1" style="padding-left: 7px" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1" Width="90%"
                                                                            Height="30px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlsecfwd_SelectedIndexChanged" AutoPostBack="True">
                                                                        </asp:DropDownList>
                                                                        <br />
                                                                        <asp:RequiredFieldValidator ID="rfvsection" runat="server" ControlToValidate="ddlsecfwd"
                                                                            Display="Dynamic" ErrorMessage="Pls. Select a section!!" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1"
                                                                            class="font">
                                                                        </asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                                                        <asp:Label ID="Label20" runat="server" Text="Email" ForeColor="Black" class="font"
                                                                            Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp; </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
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
                                                                            <asp:TextBox ID="txtemailforwarded" style="padding-left: 7px" runat="server" Placeholder="Primay Email" AutoComplete="off" CssClass="select font2 widthofboxes1" Height="30px" Width="90%" ValidationGroup="sub1"></asp:TextBox>
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
                                                                            <asp:TextBox ID="txtcc" runat="server" style="padding-left: 7px" Placeholder="CC to(If Any)" AutoComplete="off" CssClass="select font2 widthofboxes1" Height="30px" Width="90%"></asp:TextBox>
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
                                                                        <asp:Label ID="Label18" runat="server" Text="Remarks" ForeColor="Black"
                                                                            class="font" Style="font-weight: bold;"></asp:Label>
                                                                        &nbsp;
                                                                    </td>
                                                                    <td width="60%" align="left" style="padding-left: 15px">
                                                                        <asp:TextBox ID="txtremarksforward" style="padding: 7px" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="sub1"
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
                                                                        <div runat="server" id="div13" style="padding-top: 10px; padding-bottom: 10px">
                                                                            <asp:FileUpload ID="FileUpload2" runat="server" class="select widthofboxes1" Height="22px" Font-Size="Medium" Font-Bold="true" />
                                                                            &nbsp;<span style="color: red; font-weight: bold; font-size: small"><br />
                                                                                * Upload supporting document upto 3MB, If necessary</span>
                                                                            <br />
                                                                            <asp:Label ID="Label19" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" Text="** Only .pdf are allowed to upload"></asp:Label>

                                                                            <asp:Label ID="Label23" Visible="true" runat="server" Text="" CssClass="fontingrid" Font-Bold="true" ForeColor="Red"></asp:Label>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr class="trnew">
                                                                    <td align="right" style="padding-right: 10px">
                                                                        <asp:Button ID="btnfwd" runat="server" Text="Forward" Font-Size="Large" class="btn select buttondocumentupload" ValidationGroup="sub1"
                                                                            BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnfwd_Click" />
                                                                    </td>
                                                                    <td align="left" style="padding-left: 10px">
                                                                        <asp:Button ID="Button4" runat="server" Text="Close" Font-Size="Large" class="btn select gradbody buttondocumentupload"
                                                                            BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button4_Click" />
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="footer" align="center" style="padding-bottom: 20px">
                                        <%--<asp:Button ID="Button1" runat="server" Text="X Close" CssClass="btn" Font-Bold="true" Font-Size="Large" BackColor="#E67E22" ForeColor="Black" CausesValidation="False" />--%>
                                    </div>
                                </contenttemplate>
                            </asp:UpdatePanel>

                        </asp:Panel>
                        <br />

                    </div>
                </div>
                <%-- <br />
                                                <br />
                                                <asp:LinkButton ID="lnkdocattac" Font-Bold="true" ForeColor="Brown" runat="server" Text="Remarks : " class="fontingrid" />
                                                <asp:LinkButton ID="lnkreplydocattac" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Remarksby_dealing_officer") %>' class="fontingrid" />--%>
            </div>

            <%-- <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server"
                                            Font-Size="Smaller" class="btn btn-info" Width="80px"></asp:LinkButton>--%>
        </div>

        <br />
        <br />
        <br />
    </div>

</asp:Content>
