<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PB_VaccinationStatus_Details.aspx.cs" Inherits="PrasarNet.PB_VaccinationStatus_Details" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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

        hr.new5 {
            /*border: 6px solid green;
            border-radius: 5px;*/
            border: 2px solid #5C5C5C;
        }

        #Panel1 legend {
            color: black;
            font-size: 25px;
            text-align: left;
        }

        legend {
            color: black;
            font-size: 25px;
            text-align: left;
        }

        .padtdd {
            padding: 3px
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
        <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto">
            <div id="Div2" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="btnback_Click"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-arrow-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div id="divfillvacc_details" runat="server" align="center">
            <asp:Panel class="grad2" Width="80%" Style="padding-top: 30px; padding-bottom: 30px" runat="server">
                <div class="row row-no-padding" style="margin: auto">
                    <div class="col-lg-12 col-md-12">
                        <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                            <asp:Label ID="lblvaccdetails" runat="server" Text="Search/Filter Vaccination Details" CssClass="font2" Style="font-weight: bold; color: Black;"></asp:Label>
                            &nbsp;
                        </div>
                    </div>
                </div>

                <br />
                <div class="row row-no-padding" style="margin: auto">
                    <div class="col-lg-1 col-md-1">
                    </div>
                    <div class="col-lg-5 col-md-5" align="left">
                        <div style="padding: 5px">
                            <asp:Label ID="Label3" runat="server" Text="1. Employee-Type: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:DropDownList ID="ddlTypeofEmp" runat="server" AppendDataBoundItems="true" AutoPostBack="True" class="select widthofboxes1 font2 padtdd" Height="32px" ValidationGroup="add" Width="80%">
                                <asp:ListItem Text="Regular" Value="1"></asp:ListItem>
                                <%--<asp:ListItem Text="Contractual" Value="2"> </asp:ListItem>--%>
                            </asp:DropDownList>
                            <asp:Label ID="Label16" runat="server" Font-Size="Small" Style="font-weight: bold; color: red;" Text="* Required"></asp:Label>

                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div style="padding: 5px" align="left">
                            <asp:Label ID="Label4" runat="server" Text="2. Zone: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">

                            <asp:DropDownList ID="ddlzone" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" AutoPostBack="True" OnSelectedIndexChanged="ddlzone_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-1 col-md-1">
                    </div>
                </div>
                <hr class="new5" />
                <div class="row row-no-padding" style="margin: auto">
                    <div class="col-lg-1 col-md-1">
                    </div>
                    <div class="col-lg-5 col-md-5" align="left">
                        <div style="padding: 5px">
                            <asp:Label ID="Label21" runat="server" Text="3. State: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:DropDownList ID="ddlstate" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged" AutoPostBack="True" EnableTheming="True">
                            </asp:DropDownList>
                            <br />
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5" align="left">
                        <div style="padding: 5px">
                            <asp:Label ID="Label5" runat="server" Text="4. Station: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:DropDownList ID="ddlstations" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" ValidationGroup="add" Width="80%">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-1 col-md-1">
                    </div>
                </div>

                <hr class="new5" />
                <div class="row row-no-padding" style="margin: auto">
                    <div class="col-lg-1 col-md-1">
                    </div>

                    <div class="col-lg-5 col-md-5">
                        <div style="padding: 5px" align="left">
                            <asp:Label ID="Label7" runat="server" Text="5. Age-Group: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:DropDownList ID="ddlagegroup" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" ValidationGroup="add" Width="80%">
                                <asp:ListItem Text="--All--" Value=""></asp:ListItem>
                                <asp:ListItem Text=">=45 years" Value="1"></asp:ListItem>
                                <asp:ListItem Text="18-44 years" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5" align="left">
                        <div style="padding: 5px" align="left">
                            <asp:Label ID="Label8" runat="server" Text="6. Status Of Vaccination: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:DropDownList ID="ddlstatus" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" ValidationGroup="add" Width="80%">
                                <asp:ListItem Text="--All--" Value=""></asp:ListItem>
                                <asp:ListItem Text="Vaccination Done/Ist Vaccination Done" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Ist & IInd Both Vaccination Done(including Sputnik)" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Updated Info but Vaccination Not Done" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Not Updated Information" Value="3"></asp:ListItem>

                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-lg-1 col-md-1">
                    </div>
                </div>
                <hr class="new5" />
                <div id="divsubmit" class="row" runat="server" visible="true" style="padding-right: 20px; margin: auto">
                    <div id="Div38" class="col-md-2  col-lg-2" runat="server" align="left">
                    </div>
                    <div id="Div39" class="col-md-1  col-lg-2" runat="server" align="left">
                    </div>
                    <div id="Div40" class="col-md-3  col-lg-2" runat="server" align="left" style="padding-top: 2px; padding-bottom: 2px">
                        <asp:Button ID="btnsubmit" runat="server" Text="Search" Font-Size="medium" class="btn select buttondocumentupload" ValidationGroup="add" Width="150px"
                            Style="background-color: #99FFCC; color: Black; font-weight: bold" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="2" OnClick="btnsubmit_Click" />
                    </div>
                    <div id="Div41" class="col-md-3  col-lg-2" runat="server" align="left" style="padding-top: 2px; padding-bottom: 2px">
                        <asp:Button ID="btncncl" runat="server" Text=" Refresh " Font-Size="medium" class="btn select gradbody buttondocumentupload" Width="150px"
                            Style="color: Black; font-weight: bold" CausesValidation="False" BorderWidth="2" BorderStyle="Ridge" BorderColor="#CCCCCC" OnClick="btncncl_Click" />

                    </div>
                    <div id="Div42" class="col-md-1  col-lg-2" runat="server" align="left">
                    </div>
                    <div id="Div43" class="col-md-2  col-lg-2" runat="server" align="left">
                    </div>
                </div>
            </asp:Panel>
        </div>
        <div id="divgrid" runat="server" visible="true">

            <div class="row" style="margin: auto; padding: 30px">
                <%--         <div align="center" class=" col-md-1 col-lg-1"></div>--%>
                <div align="center" class=" col-md-12 col-lg-12" align="center">
                    <%--  <div  runat="server" class="row" style="margin: auto">--%>
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="font-weight: bold; color: Black;" class="font2">:: Employee Vaccination Details ::</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <div id="divprisearch" style="text-align: center; padding: 10px; margin: auto" runat="server" visible="true" class="row">
                                <div class="col-lg-2 col-md-2"></div>
                                <div class="col-lg-2 col-md-2"></div>
                                <div class="col-lg-2 col-md-2" style="padding: 7px">
                                    <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                        Width="160px" BackColor="#F5B7B1" OnClick="btnprint1_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px">
                                        <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                        <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                </div>
                                <div class="col-lg-2 col-md-2" style="padding: 7px">
                                    <asp:LinkButton ID="btnexporttoexcel" runat="server" CssClass="btn" CausesValidation="False"
                                        Width="160px" BackColor="LightGreen" OnClick="btnexporttoexcel_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px">
                                        <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-export"></span>
                                        <span style="font-weight: bold; color: #000000">Export to Excel</span></asp:LinkButton>
                                </div>
                                <div class="col-lg-2 col-md-2"></div>
                                <div class="col-lg-2 col-md-2"></div>
                            </div>

                            <asp:Panel ID="panelprint" runat="server">
                                <div id="div3" runat="server" visible="true" align="center">
                                    <asp:Label ID="Label9" runat="server" Font-Bold="true" Font-Size="Medium" text="Total Record(s) Found: "></asp:Label>
                                    <asp:Label ID="lblrecords" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                    <br />
                                    <br />
                                </div>
                                <div id="divmsg" runat="server" visible="false" align="center">
                                    <asp:Label ID="lblmsg" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                </div>
                                <asp:GridView ID="grdvaccinationdet" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" BackColor="#F8F9F9"
                                    PageSize="20" ShowHeaderWhenEmpty="True" ToolTip="Vaccination Details as per Filter Selection"
                                    Width="95%" AllowPaging="True" OnPageIndexChanging="grdvaccinationdet_PageIndexChanging">
                                    <headerstyle backcolor="#0099FF" font-bold="True" forecolor="Black" horizontalalign="Center" />
                                    <columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <itemtemplate>
                                                <div runat="server" align="center">

                                                    <asp:Label ID="lblSNo" ForeColor="Black" CssClass="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                    <%--     <asp:Label ID="lblid" Visible="false" ForeColor="Black" CssClass="fontingrid" runat="server" Text='<%#Eval("id") %>' />--%>
                                                </div>

                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Emp-Type" Visible="true">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="center">
                                                    <asp:Label ID="lblemptypg" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Emptype") %>' class="fontingrid" />
                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Details of Employees">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="Label23" Font-Bold="true" ForeColor="Brown" runat="server" Text="Employee Code : " class="fontingrid" />
                                                    <asp:Label ID="Label32" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("employeecode") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lbln" Font-Bold="true" ForeColor="Brown" runat="server" Text="Name : " class="fontingrid" />
                                                    <asp:Label ID="lbln2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Employeename") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label17" Font-Bold="true" ForeColor="Brown" runat="server" Text="Age : " class="fontingrid" />
                                                    <asp:Label ID="Label20" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("age") %>' class="fontingrid" />
                                                    &nbsp;
                                                    <asp:Label ID="Label26" Font-Bold="true" ForeColor="Black" runat="server" Text="Years" class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label24" Font-Bold="true" ForeColor="Brown" runat="server" Text="Designation : " class="fontingrid" />
                                                    <asp:Label ID="Label25" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("DesignationName") %>' class="fontingrid" />

                                                </div>
                                            </itemtemplate>
                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact Details">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">

                                                    <asp:Label ID="Label30" Font-Bold="true" ForeColor="Brown" runat="server" Text="Mobile No : " class="fontingrid" />
                                                    <asp:Label ID="Label31" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("IT_EOfficeMobile") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label28" Font-Bold="true" ForeColor="Brown" runat="server" Text="E-Mail-ID : " class="fontingrid" />
                                                    <asp:Label ID="Label29" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("IT_NICEmail") %>' class="fontingrid" />

                                                </div>
                                            </itemtemplate>
                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="State/Station/Office" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="Label342" Font-Bold="true" ForeColor="Brown" runat="server" Text="State : " class="fontingrid" />
                                                    <asp:Label ID="Label315" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("StateName") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label265" Font-Bold="true" ForeColor="Brown" runat="server" Text="Station/Section : " class="fontingrid" />
                                                    <asp:Label ID="Label275" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("stnname") %>' class="fontingrid" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Vaccination Details" ItemStyle-Width="25%">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="Label339" Font-Bold="true" ForeColor="Brown" runat="server" Text="Is Vaccination Taken : " class="fontingrid" />
                                                    <asp:Label ID="Label303" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Isvaccinationtaken") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label192" Font-Bold="true" ForeColor="Brown" runat="server" Text="Name of the Vaccine : " class="fontingrid" />
                                                    <asp:Label ID="Label204" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("NameofVaccination") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label264" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date of Ist Vaccination : " class="fontingrid" />
                                                    <asp:Label ID="Label274" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("dateofVaccination1", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label94" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date of IInd Vaccination : " class="fontingrid" />
                                                    <asp:Label ID="Label174" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("dateofVaccination2", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />
                                                </div>
                                            </itemtemplate>
                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Corona Details" ItemStyle-Width="25%" Visible="false">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="Label334" Font-Bold="true" ForeColor="Brown" runat="server" Text="Have Ever Been tested Corona Positive : " class="fontingrid" />
                                                    <asp:Label ID="Label353" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Coronavictim") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label193" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date of Corona Positive (Case-1) : " class="fontingrid" />
                                                    <asp:Label ID="Label203" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Dateof_IstCoronafrom", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label93" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date of Corona Negative (Case-1) : " class="fontingrid" />
                                                    <asp:Label ID="Label173" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("DateofCoronaNegative", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label263" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date of Corona Positive (Case-2) : " class="fontingrid" />
                                                    <asp:Label ID="Label273" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Dateof_IIndCoronaFrom", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label172" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date of Corona Negative (Case-2) : " class="fontingrid" />
                                                    <asp:Label ID="Label20e" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("dateofcoronaneg_case2", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />


                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Information Given By">
                                            <itemtemplate>
                                                <div style="padding: 15px" runat="server" align="center">
                                                    <asp:Label ID="Label35" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("EntryMadeBy") %>' class="fontingrid" />

                                                </div>
                                            </itemtemplate>

                                            <itemstyle width=""></itemstyle>
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
                        </div>

                    </div>
                </div>
                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
            </div>


        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
