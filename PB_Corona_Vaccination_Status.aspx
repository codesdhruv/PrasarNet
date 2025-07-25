<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PB_Corona_Vaccination_Status.aspx.cs" Inherits="PrasarNet.PB_Corona_Vaccination_Status" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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
                            <asp:Label ID="lblvaccdetails" runat="server" Text="Submit Your's Vaccination Details" CssClass="font2" Style="font-weight: bold; color: Black;"></asp:Label>
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
                            <asp:Label ID="Label3" runat="server" Text="1. Employee Code: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:TextBox ID="txtemployeecode" runat="server" class="select widthofboxes1 padtdd" Width="80%" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="Employee Code" MaxLength="7" OnTextChanged="txtemployeecode_TextChanged" AutoPostBack="True">
                            </asp:TextBox>
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderTxtempcode" runat="server" targetcontrolid="txtemployeecode" validchars="0123456789"></ajaxtoolkit:filteredtextboxextender>

                            <asp:Label ID="Label16" runat="server" Font-Size="Small" Style="font-weight: bold; color: red;" Text="* Required"></asp:Label>
                            &nbsp;
                            <br />
                            <asp:Label ID="lblempname" runat="server" class="fontstyle font2" Font-Bold="true" Style="color: Black" Text=""></asp:Label>
                            &nbsp;<asp:RequiredFieldValidator ID="rfvdoccat" runat="server" ControlToValidate="txtemployeecode" Display="Dynamic" ErrorMessage="Enter a Employee Code" Font-Bold="true" Font-Size="Medium"
                                ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div style="padding: 5px" align="left">
                            <asp:Label ID="Label4" runat="server" Text="2. Is Vaccination Taken: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">

                            <asp:DropDownList ID="ddlvaccinationtaken" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" OnSelectedIndexChanged="ddlvaccinationtaken_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
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
                            <asp:Label ID="Label21" runat="server" Text="3. Name of Vaccination: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:DropDownList ID="ddlnameofVaccination" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" Enabled="false">
                            </asp:DropDownList>

                            <asp:Label ID="Label3354" runat="server" Font-Size="Small" Style="font-weight: bold; color: red;" Text="* Required" Visible="false"></asp:Label>

                            <br />
                            <asp:RequiredFieldValidator ID="rfvnameofvaccination" Enabled="false" runat="server" ControlToValidate="ddlnameofVaccination" Display="Dynamic" ErrorMessage="Pls. select a Vaccine Name!!" Font-Bold="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5" align="left">
                        <div style="padding: 5px">
                            <asp:Label ID="Label5" runat="server" Text="4. Ist Vaccination Date: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">

                            <asp:TextBox ID="txtvac1date" runat="server" class="select widthofboxes1 padtdd" Width="80%" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Enabled="False">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="CalendarExtender1" runat="server" behaviorid="txtvac1date_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtvac1date" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                targetcontrolid="txtvac1date" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>
                            <asp:Label ID="Label18" runat="server" Font-Size="Small" Style="font-weight: bold; color: red;" Text="* Required" Visible="false"></asp:Label>
                            &nbsp;
                            <br />
                            <asp:RequiredFieldValidator ID="rfvvac1Date" Enabled="false" runat="server" ControlToValidate="txtvac1date"
                                Display="Dynamic" ErrorMessage="Date of Ist Vaccination Required!!" Font-Bold="true" Font-Size="Medium"
                                ForeColor="Red" SetFocusOnError="True" ValidationGroup="add">
                            </asp:RequiredFieldValidator>
                            <%--<asp:CompareValidator ID="cmpIstvac" runat="server" ControlToValidate="txtvac1date" Display="Dynamic"  ValidationGroup="add"
                                ErrorMessage="Vaccination Date should be less than & equal to today date!!" Font-Bold="True" Font-Size="Medium" ForeColor="Red"
                                Operator="LessThanEqual" SetFocusOnError="True" Type="Date" ValueToCompare = '<%= DateTime.Today.ToShortString(); %>'></asp:CompareValidator>--%>
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
                            <asp:Label ID="Label7" runat="server" Text="5. IInd Vaccination Date: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:TextBox ID="txtvac2date" runat="server" class="select widthofboxes1 padtdd" Width="80%" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Enabled="False">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="CalendarExtender2" runat="server" behaviorid="txtvac2date_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtvac2date" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender2" runat="server"
                                targetcontrolid="txtvac2date" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>
                            <br />
                            <%--<asp:CompareValidator ID="cmp2ndvac" runat="server" ControlToValidate="txtvac2date" Display="Dynamic" 
                                ErrorMessage="Vaccination Date should be less than &amp; equal to today date!!" Font-Bold="True" Font-Size="Medium"
                                ForeColor="Red" Operator="LessThanEqual" SetFocusOnError="True" Type="Date" ValidationGroup="add"></asp:CompareValidator>--%>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div style="padding: 5px" align="left">
                            <asp:Label ID="Label27" runat="server" Text="6. IIIrd Vaccination Date(Booster-1): " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:TextBox ID="txtvac3date" runat="server" class="select widthofboxes1 padtdd" Width="80%" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Enabled="true" AutoPostBack="True" OnTextChanged="txtvac3date_TextChanged">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="CalendarExtender8" runat="server" behaviorid="txtvac3date_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtvac3date" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender8" runat="server"
                                targetcontrolid="txtvac3date" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>
                            <br />
                            <%--<asp:CompareValidator ID="cmp2ndvac" runat="server" ControlToValidate="txtvac2date" Display="Dynamic" 
                                ErrorMessage="Vaccination Date should be less than &amp; equal to today date!!" Font-Bold="True" Font-Size="Medium"
                                ForeColor="Red" Operator="LessThanEqual" SetFocusOnError="True" Type="Date" ValidationGroup="add"></asp:CompareValidator>--%>
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
                            <asp:Label ID="Label33" runat="server" Text="7. IIIrd Vaccination Dose(Free/Paid): " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:DropDownList ID="ddlvac3dose" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" OnSelectedIndexChanged="ddlcovidpositive_SelectedIndexChanged">
                                <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                <asp:ListItem Text="Free" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Paid" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="ddlvac3dose" Display="Dynamic" Enabled="false" ErrorMessage="*Required!!" Font-Bold="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div style="padding: 5px" align="left">
                            <asp:Label ID="Label34" runat="server" Text="8. IVth Vaccination Date(Booster-2): " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:TextBox ID="txtvac4" runat="server" class="select widthofboxes1 padtdd" Width="80%" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Enabled="true" AutoPostBack="True" OnTextChanged="txtvac4_TextChanged">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="CalendarExtender9" runat="server" behaviorid="txtvac4_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtvac4" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender9" runat="server"
                                targetcontrolid="txtvac4" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>
                            <br />
                            <%--<asp:CompareValidator ID="cmp2ndvac" runat="server" ControlToValidate="txtvac2date" Display="Dynamic" 
                                ErrorMessage="Vaccination Date should be less than &amp; equal to today date!!" Font-Bold="True" Font-Size="Medium"
                                ForeColor="Red" Operator="LessThanEqual" SetFocusOnError="True" Type="Date" ValidationGroup="add"></asp:CompareValidator>--%>
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
                            <asp:Label ID="Label38" runat="server" Text="9. IVth Vaccination Dose(Free/Paid): " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:DropDownList ID="ddlvac4dose" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" OnSelectedIndexChanged="ddlcovidpositive_SelectedIndexChanged">
                                <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                <asp:ListItem Text="Free" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Paid" Value="1"></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="ddlvac4dose" Display="Dynamic" Enabled="false" ErrorMessage="*Required!!" Font-Bold="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5" align="left">
                        <div style="padding: 5px">
                            <asp:Label ID="Label11" runat="server" Text="10. Have you ever been tested Corona Positive: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:DropDownList ID="ddlcovidpositive" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" OnSelectedIndexChanged="ddlcovidpositive_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
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
                            <asp:Label ID="Label12" runat="server" Text="11. Date of Corona Positive (Case-1): " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:TextBox ID="txtcoronapositivefrom" runat="server" class="select widthofboxes1 padtdd" Width="80%" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Enabled="False">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="CalendarExtender3" runat="server" behaviorid="txtcoronapositivefrom_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtcoronapositivefrom" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender3" runat="server"
                                targetcontrolid="txtcoronapositivefrom" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>
                            <asp:Label ID="Label37" runat="server" Font-Size="Small" Style="font-weight: bold; color: red;" Text="* Required" Visible="false"></asp:Label>
                            &nbsp;
                            <br />
                            <asp:RequiredFieldValidator ID="rfvfrom" runat="server" ControlToValidate="txtcoronapositivefrom" Display="Dynamic" Enabled="false" ErrorMessage="Date of Ist Vaccination Required!!" Font-Bold="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"></asp:RequiredFieldValidator>
                            <%--<asp:CompareValidator ID="cmpistfrom" runat="server" ControlToValidate="txtcoronapositivefrom" Display="Dynamic" ErrorMessage="Date should be less than &amp; equal to today date!!" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Operator="LessThanEqual" SetFocusOnError="True" Type="Date" ValidationGroup="add"></asp:CompareValidator>--%>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div style="padding: 5px" align="left">
                            <asp:Label ID="Label8" runat="server" Text="12. Date of Corona Negative (Case-1): " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:TextBox ID="txtdateofcoronaneg" runat="server" class="select widthofboxes1 padtdd" Width="80%" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Enabled="False">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="CalendarExtender5" runat="server" behaviorid="txtdateofcoronaneg_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtdateofcoronaneg" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender5" runat="server"
                                targetcontrolid="txtdateofcoronaneg" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>
                            <br />
                            <%--<asp:CompareValidator ID="cmpistNeg" runat="server" ControlToValidate="txtdateofcoronaneg" Display="Dynamic" 
                                ErrorMessage="Date should be less than &amp; equal to today date!!" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Operator="LessThanEqual" SetFocusOnError="True" Type="Date" ValidationGroup="add"></asp:CompareValidator>--%>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5" align="left" runat="server" visible="false">
                        <div style="padding: 5px" align="left">
                            <asp:Label ID="Label13" runat="server" Text="13. Corona Positive (To): " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:TextBox ID="txtcoronapositiveto" runat="server" class="select widthofboxes1 padtdd" Width="80%" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Enabled="False">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="CalendarExtender4" runat="server" behaviorid="txtcoronapositiveto_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtcoronapositiveto" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender4" runat="server"
                                targetcontrolid="txtcoronapositiveto" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>
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
                            <asp:Label ID="Label9" runat="server" Text="14. Date of Corona Positive (Case-2): " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:TextBox ID="txtdateofcoronacase2" runat="server" class="select widthofboxes1 padtdd" Width="80%" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Enabled="False">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="CalendarExtender6" runat="server" behaviorid="txtdateofcoronacase2_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtdateofcoronacase2" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender6" runat="server"
                                targetcontrolid="txtdateofcoronacase2" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>
                            <br />
                            <%--<asp:CompareValidator ID="cmp2ndfrom" runat="server" ControlToValidate="txtdateofcoronacase2" Display="Dynamic" ErrorMessage="Date should be less than &amp; equal to today date!!" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Operator="LessThanEqual" SetFocusOnError="True" Type="Date" ValidationGroup="add"></asp:CompareValidator>--%>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div style="padding: 5px" align="left">
                            <asp:Label ID="Label19" runat="server" Text="15. Date of Corona Negative (Case-2): " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:TextBox ID="txtdateofcoronaneg_case2" runat="server" class="select widthofboxes1 padtdd" Width="80%" Height="32px" Font-Size="medium" Font-Bold="true" ValidationGroup="add"
                                autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10" Enabled="False">
                            </asp:TextBox>

                            <ajaxtoolkit:calendarextender id="CalendarExtender7" runat="server" behaviorid="txtdateofcoronaneg_case2_CalendarExtender"
                                format="dd-MM-yyyy" targetcontrolid="txtdateofcoronaneg_case2" />
                            <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender7" runat="server"
                                targetcontrolid="txtdateofcoronaneg_case2" validchars="0123456789-">
                            </ajaxtoolkit:filteredtextboxextender>
                            <br />
                            <%--<asp:CompareValidator ID="cmp2ndneg" runat="server" ControlToValidate="txtdateofcoronaneg_case2" Display="Dynamic" ErrorMessage="Date should be less than &amp; equal to today date!!" Font-Bold="True" Font-Size="Medium" ForeColor="Red" Operator="LessThanEqual" SetFocusOnError="True" Type="Date" ValidationGroup="add"></asp:CompareValidator>--%>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5" runat="server" id="divreportsec" visible="false">
                        <div style="padding: 5px" align="left">
                            <asp:Label ID="Label22" runat="server" Text="16. Your Reporting Section: " CssClass="font2" Font-Bold="true" ForeColor="Black"></asp:Label>
                        </div>
                        <div style="padding: 5px" align="left">
                            <asp:DropDownList ID="dlreportingsection" runat="server" AppendDataBoundItems="true" class="select widthofboxes1 font2 padtdd" Height="32px" Width="80%" ValidationGroup="add" Enabled="false">
                            </asp:DropDownList>
                            <asp:Label ID="Label36" runat="server" Font-Size="Small" Style="font-weight: bold; color: red;" Text="* Required" Visible="true"></asp:Label>
                            &nbsp;
                             <br />
                            <asp:RequiredFieldValidator ID="rfvvac1Date0" runat="server" ControlToValidate="dlreportingsection" Display="Dynamic" Enabled="true" ErrorMessage="Date of Ist Vaccination Required!!" Font-Bold="true" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True" ValidationGroup="add"></asp:RequiredFieldValidator>
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
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" Font-Size="medium" class="btn select buttondocumentupload" ValidationGroup="add" Width="150px"
                            Style="background-color: #99FFCC; color: Black; font-weight: bold" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="2" OnClick="btnsubmit_Click" />
                    </div>
                    <div id="Div41" class="col-md-3  col-lg-2" runat="server" align="left" style="padding-top: 2px; padding-bottom: 2px">
                        <asp:Button ID="btncncl" runat="server" Text=" Cancel " Font-Size="medium" class="btn select gradbody buttondocumentupload" Width="150px"
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
                                <div id="divmsg" runat="server" visible="false" align="center">
                                    <asp:Label ID="lblmsg" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                </div>
                                <asp:GridView ID="grdvaccinationdet" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" BackColor="#F8F9F9"
                                    DataKeyNames="id" PageSize="20" ShowHeaderWhenEmpty="True" ToolTip="Grievances"
                                    Width="95%" AllowPaging="True" OnPageIndexChanging="grdvaccinationdet_PageIndexChanging" OnRowCommand="grdvaccinationdet_RowCommand" OnRowEditing="grdvaccinationdet_RowEditing" OnRowUpdated="grdvaccinationdet_RowUpdated" OnRowUpdating="grdvaccinationdet_RowUpdating">
                                    <HeaderStyle BackColor="#0099FF" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <div runat="server" align="center">

                                                    <asp:Label ID="lblSNo" ForeColor="Black" CssClass="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                    <asp:Label ID="lblid" Visible="false" ForeColor="Black" CssClass="fontingrid" runat="server" Text='<%#Eval("id") %>' />
                                                </div>

                                            </ItemTemplate>

                                            <ItemStyle Width=""></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Emp-Type" Visible="false">
                                            <ItemTemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <%-- <asp:Label ID="lblemptypg" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("") %>' class="fontingrid" />--%>
                                                </div>
                                            </ItemTemplate>

                                            <ItemStyle Width=""></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Details of Employees">
                                            <ItemTemplate>
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
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label30" Font-Bold="true" ForeColor="Brown" runat="server" Text="Mobile No : " class="fontingrid" />
                                                    <asp:Label ID="Label31" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("IT_EOfficeMobile") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label28" Font-Bold="true" ForeColor="Brown" runat="server" Text="E-Mail-ID : " class="fontingrid" />
                                                    <asp:Label ID="Label29" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("IT_NICEmail") %>' class="fontingrid" />

                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle Width=""></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="State/Station/Office" ItemStyle-Width="25%">
                                            <ItemTemplate>
                                                <div style="padding: 15px" runat="server" align="left">
                                                    <asp:Label ID="Label342" Font-Bold="true" ForeColor="Brown" runat="server" Text="State : " class="fontingrid" />
                                                    <asp:Label ID="Label315" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("StateName") %>' class="fontingrid" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label265" Font-Bold="true" ForeColor="Brown" runat="server" Text="Station/Section : " class="fontingrid" />
                                                    <asp:Label ID="Label275" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("stnname") %>' class="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle Width=""></ItemStyle>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Vaccination Details" ItemStyle-Width="25%">
                                            <ItemTemplate>
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
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label39" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date of IIIrd Vaccination : " class="fontingrid" />
                                                    <asp:Label ID="Label40" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("dateofVaccination3", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />

                                                    <asp:Label ID="Label44" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("vac3_free_paid") %>' class="fontingrid" />

                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label41" Font-Bold="true" ForeColor="Brown" runat="server" Text="Date of IVth Vaccination : " class="fontingrid" />
                                                    <asp:Label ID="Label42" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("dateofVaccination4", "{0:dd-MMM-yyyy}") %>' class="fontingrid" />

                                                    <asp:Label ID="Label47" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("vac4_free_paid") %>' class="fontingrid" />
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle Width=""></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Corona Details" ItemStyle-Width="25%">
                                            <ItemTemplate>
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
                                            </ItemTemplate>

                                            <ItemStyle Width=""></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Information Given By">
                                            <ItemTemplate>
                                                <div style="padding: 15px" runat="server" align="center">
                                                    <asp:Label ID="Label35" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("EntryMadeBy") %>' class="fontingrid" />

                                                </div>
                                            </ItemTemplate>

                                            <ItemStyle Width=""></ItemStyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Edit">
                                            <ItemTemplate>
                                                <div style="padding: 10px" align="center" runat="server">
                                                    <asp:LinkButton ID="imgedit" CommandName="Edit" runat="server" CausesValidation="false"
                                                        CssClass="btn btn-primary" ToolTip="Edit">
                                                        <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                                        <span style="font-weight: bold; color: #000000"></span>
                                                    </asp:LinkButton>
                                                </div>
                                            </ItemTemplate>

                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>

                                    </Columns>
                                    <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" CssClass="centerHeaderText fontingrid"
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
