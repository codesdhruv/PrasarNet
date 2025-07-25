<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransferApp_ActionN.aspx.cs" Inherits="PrasarNet.Transfer_M.TransferApp_ActionN" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
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

        .trnew {
            border-bottom: 2px ridge #F2F3F4;
            border-top: 2px ridge #F2F3F4;
            border-left: 2px ridge Black;
            border-right: 2px ridge #F2F3F4;
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

        .auto-style1 {
            color: #800000;
            font-size: small;
        }

        .auto-style2 {
            color: #800000;
        }

        fieldset > legend {
            height: 33px;
            position: relative;
            margin-top: -10px;
            background: #feb236;
            padding-top: 5px;
            padding-left: 5px;
            color: black;
            width: 98%;
            margin-left: 4px;
            margin-right: 4px;
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
        function MutExChkList(chk) {
            var chkList = chk.parentNode.parentNode.parentNode;
            var chks = chkList.getElementsByTagName("input");
            for (var i = 0; i < chks.length; i++) {
                if (chks[i] != chk && chk.checked) {
                    chks[i].checked = false;
                }
            }
        }
        var isItemSelected = false;
        function GetID(source, eventArgs) {
            isItemSelected = true;
            var str = eventArgs.get_value();
            var myarray = str.split(',');

            //for (var i = 0; i < myarray.length; i++) {
            //    console.log(myarray[i]);
            //}

            var HdnKey = myarray[0];
            document.getElementById('<%=hdnValue.ClientID %>').value = HdnKey;
            document.getElementById('<%=txtemailforwarded.ClientID %>').value = myarray[1];

            //  alert(myarray[1]);

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
        <div class="row" style="margin: auto; padding: 30px">
            <div id="Div1" class="col-md-12 col-sm-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnhome" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" OnClick="btnhome_Click">
                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-menu-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>


        <div id="divnewapp_link" style="text-align: left; padding-left: 25px; padding-bottom: 10px" runat="server" visible="true">
        </div>
        <div class="row" style="margin: auto; padding: 30px">
            <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
            <div id="divgrd" visible="true" align="center" class=" col-md-12 col-sm-12 col-lg-12"
                runat="server">
                <div id="divfilterrec" style="text-align: left; padding: 10px" runat="server" visible="false">

                    <fieldset id="Fieldset1" runat="server" style="border: medium ridge #808080;">
                        <legend>Filter Transfer Record(s):</legend>
                        <div class="row" style="margin: auto; padding-left: 20px; padding-right: 20px; padding-bottom: 10px">
                            <div id="div7" visible="true" style="padding: 4px;" align="center" class=" col-md-4 col-lg-4"
                                runat="server">
                                <div style="border: thin groove #C0C0C0; padding: 4px;">


                                    <asp:Label ID="Label26" runat="server" Text="Applicant's Wing: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="ddlwingfilter" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="70%" Height="30px" ValidationGroup="reg" AutoPostBack="True" OnSelectedIndexChanged="ddlwingfilter_SelectedIndexChanged"></asp:DropDownList>


                                </div>
                            </div>
                            <div id="div17" visible="true" style="padding: 4px;" align="center" class=" col-md-4 col-lg-4"
                                runat="server">
                                <div style="border: thin groove #C0C0C0; padding: 4px;">
                                    <asp:Label ID="Label27" runat="server" Text="Applicant's Designation: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="ddldesignationfilter" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="70%" Height="30px" ValidationGroup="reg"></asp:DropDownList>
                                </div>
                            </div>

                            <div id="div13" visible="true" style="padding: 4px;" align="center" class=" col-md-4 col-lg-4"
                                runat="server">
                                <div style="border: thin groove #C0C0C0; padding: 4px;">
                                    <asp:Label ID="Label75" runat="server" Text="Applicant's Name: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtnamefilter" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" Width="70%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                                        TargetControlID="txtnamefilter" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "></ajaxToolkit:FilteredTextBoxExtender>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin: auto; padding-left: 20px; padding-right: 20px; padding-bottom: 10px">
                            <div id="div15" visible="true" style="padding: 4px;" align="center" class=" col-md-4 col-lg-4"
                                runat="server">
                                <div style="border: thin groove #C0C0C0; padding: 4px;">
                                    <asp:Label ID="Label76" runat="server" Text="Applicant's Employee Code: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtempcodefilter" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" Width="70%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                        TargetControlID="txtempcodefilter" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div id="div20" visible="true" style="padding: 4px;" align="center" class=" col-md-4 col-lg-4"
                                runat="server">
                                <div style="border: thin groove #C0C0C0; padding: 4px;">
                                    <asp:Label ID="Label79" runat="server" Text="Applicant's E-Mail: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtemailfilter" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" Width="70%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>

                                </div>
                            </div>
                            <div id="div21" visible="true" style="padding: 4px;" align="center" class=" col-md-4 col-lg-4"
                                runat="server">
                                <div style="border: thin groove #C0C0C0; padding: 4px;">
                                    <asp:Label ID="Label80" runat="server" Text="Applicant's Mobile No: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtmobfilter" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" Width="70%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server"
                                        TargetControlID="txtmobfilter" ValidChars="0123456789"></ajaxToolkit:FilteredTextBoxExtender>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin: auto; padding-left: 20px; padding-right: 20px; padding-bottom: 10px">
                            <div id="div23" visible="true" style="padding: 4px;" align="center" class=" col-md-4 col-lg-4"
                                runat="server">
                                <div style="border: thin groove #C0C0C0; padding: 4px;">
                                    <asp:Label ID="Label83" runat="server" Text="Date(From) " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtdatefrom" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" Width="70%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="txtdatefrom_CalendarExtender" runat="server" BehaviorID="txtdatefrom_CalendarExtender"
                                        Format="dd-MM-yyyy" TargetControlID="txtdatefrom" />
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server"
                                        TargetControlID="txtdatefrom" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div id="div25" visible="true" style="padding: 4px;" align="center" class=" col-md-4 col-lg-4"
                                runat="server">
                                <div style="border: thin groove #C0C0C0; padding: 4px;">
                                    <asp:Label ID="Label89" runat="server" Text="Date(To) " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtdateto" CssClass="txtbx select padtxt" Font-Size="Small" runat="server" Width="70%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="Calendarextender1" runat="server" BehaviorID="txtdatefrom_CalendarExtender"
                                        Format="dd-MM-yyyy" TargetControlID="txtdateto" />
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server"
                                        TargetControlID="txtdateto" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>
                                </div>
                            </div>
                            <div id="div26" visible="true" style="padding: 4px;" align="center" class=" col-md-4 col-lg-4"
                                runat="server">
                            </div>
                        </div>
                        <div class="row" style="margin: auto; padding-left: 20px; padding-right: 20px; padding-bottom: 10px">
                            <div id="div27" visible="true" style="padding: 4px;" align="center" class=" col-md-12 col-lg-12"
                                runat="server">
                                <asp:Button ID="btnUpdateBasic" runat="server" Style="font-size: Medium; font-weight: bolder; background-color: #b5e7a0; color: black; padding: 0.5vw; border-radius: 5px;" Text=" Filter " Visible="true" Width="200px" OnClick="btnUpdateBasic_Click" />

                            </div>
                        </div>
                    </fieldset>

                </div>
                <%--  <div  runat="server" class="row" style="margin: auto">--%>
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="font-weight: bold; color: Black;" class="font2">:: Transfer Request Application(s) and their Status ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <div id="divprisearch" style="text-align: center" runat="server" visible="true">
                            <table width="100%">
                                <tr>
                                    <td align="center" style="padding: 10px">
                                        <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="200px"
                                            BackColor="#F5B7B1" OnClick="btnprint1_Click">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                            <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="padding: 10px">
                                        <asp:LinkButton ID="lnkFilterrec" runat="server" CssClass="btn" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="200px"
                                            BackColor="#D5F5E3" OnClick="lnkFilterrec_Click">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon glyphicon-filter"></span>
                                            <span style="font-weight: bold; color: #000000">Filter Records</span></asp:LinkButton>
                                    </td>
                                </tr>

                            </table>

                        </div>
                        <asp:GridView ID="grdapplications" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" BackColor="#F8F9F9"
                            DataKeyNames="id" ShowHeaderWhenEmpty="True" ToolTip="TRAM Transfer Request Recieved" AllowPaging="true"
                            Width="98%" OnPageIndexChanging="grdapplications_PageIndexChanging" OnRowDataBound="grdapplications_RowDataBound" OnRowCommand="grdapplications_RowCommand">
                            <HeaderStyle BackColor="#0099FF" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                            <Columns>
                                <asp:TemplateField HeaderText="S.No.">
                                    <ItemTemplate>
                                        <div runat="server" align="center">

                                            <asp:Label ID="lblSNo" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                            <asp:Label ID="lblserialno" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Eval("serialno") %>' Visible="false" />
                                            <asp:Label ID="lblcertify" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Eval("isapproved") %>' Visible="false" />
                                        </div>

                                    </ItemTemplate>

                                    <%-- <ItemStyle Width="7%"></ItemStyle>--%>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Application No">
                                    <ItemTemplate>
                                        <div runat="server" align="left" style="padding-top: 15px; padding-bottom: 15px; padding-left: 15px; padding-right: 15px">

                                            <asp:Label ID="Label52" Font-Bold="true" ForeColor="Brown" runat="server" Font-Size="Small" Text="Application No : " class="fontingrid" />
                                            <asp:Label ID="lblappNo" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Eval("ApplicationNo") %>' />
                                            <br />
                                            <br />
                                            <asp:Label ID="Label49" Font-Bold="true" ForeColor="Brown" runat="server" Font-Size="Small" Text="Submitted On : " class="fontingrid" />
                                            <asp:Label ID="Label50" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("submittedon") %>' Font-Size="Small" class="fontingrid" />

                                        </div>

                                    </ItemTemplate>

                                    <%-- <ItemStyle Width="7%"></ItemStyle>--%>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Applicant Details">
                                    <ItemTemplate>
                                        <div style="padding: 15px" runat="server" align="left">
                                            <asp:Label ID="lblop_1" Font-Bold="true" ForeColor="Brown" runat="server" Text="Name : " class="fontingrid" Font-Size="Small" />
                                            <asp:Label ID="lblop1" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Name_emp") %>' Font-Size="Small" />
                                            <br />
                                            <br />
                                            <asp:Label ID="lblop_2" Font-Bold="true" ForeColor="Brown" runat="server" Text="Designation : " class="fontingrid" Font-Size="Small" />
                                            <asp:Label ID="lblop2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Emp_Designation") %>' Font-Size="Small" />
                                            <br />
                                            <br />
                                            <asp:Label ID="lblop_3" Font-Bold="true" ForeColor="Brown" runat="server" Text="Station/Office : " class="fontingrid" Font-Size="Small" />
                                            <asp:Label ID="lblop3" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("emp_present_place") %>' Font-Size="Small" />
                                            <br />
                                            <br />
                                            <asp:Label ID="Label13" Font-Bold="true" ForeColor="Brown" runat="server" Text="E-Mail : " class="fontingrid" Font-Size="Small" />
                                            <asp:Label ID="Label18" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("emp_Email") %>' Font-Size="Small" />
                                            <br />
                                            <br />
                                            <asp:Label ID="Label19" Font-Bold="true" ForeColor="Brown" runat="server" Text="Contact No : " class="fontingrid" Font-Size="Small" />
                                            <asp:Label ID="Label21" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("emp_contactno") %>' Font-Size="Small" />


                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Action Taken with Remarks">
                                    <ItemTemplate>
                                        <div align="left" runat="server" style="padding-top: 15px; padding-bottom: 15px; padding-left: 15px; padding-right: 15px">
                                            <asp:Label ID="lblac" Font-Bold="true" ForeColor="Brown" runat="server" Text="Action : " class="fontingrid" Font-Size="Small" />
                                            <asp:Label ID="lblaction" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                CausesValidation="False" Text='<%#Eval("Action_taken") %>' Font-Size="Small"></asp:Label>
                                            <asp:Label ID="lblcurrentstatus" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                CausesValidation="False" Visible="false" Text='<%#Eval("currenstatusid") %>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="lblFilefwd" Font-Bold="true" ForeColor="Brown" runat="server" Text="Document Forwarded : " Font-Size="Small" class="fontingrid" />
                                            <asp:LinkButton ID="lblfilefwd2" Font-Bold="true" ToolTip="File Attached" CommandName="fwddownload2" ForeColor="Blue" runat="server" Text="" class="fontingrid"></asp:LinkButton>

                                            <asp:Label ID="lblfilefwdupldoutput" runat="server" CssClass="fontingrid" ForeColor="Black" Font-Size="Small"
                                                CausesValidation="False" Visible="false" Text='<%#Eval("fileupload") %>'></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="Label22" Font-Bold="true" ForeColor="Brown" runat="server" Font-Size="Small" Text="Email sent to : " class="fontingrid" />
                                            <asp:Label ID="Label25" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("primaryemail") %>' Font-Size="Small" class="fontingrid" />
                                            <br />
                                            <br />
                                            <asp:Label ID="Label26" Font-Bold="true" ForeColor="Brown" runat="server" Font-Size="Small" Text="Copy(Email) sent to : " class="fontingrid" />
                                            <asp:Label ID="Label27" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("ccemail") %>' Font-Size="Small" class="fontingrid" />
                                            <%--  <br />
                                                    <br />
                                                <asp:LinkButton ID="lnkresend_details" runat="server" CommandName="ShowPopup" Text=""></asp:LinkButton>--%>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Take an Action">
                                    <ItemTemplate>
                                        <div align="center" runat="server" style="padding: 8px">
                                            <asp:LinkButton ID="lnkaction" CommandName="takeaction" runat="server" BackColor="#99FFCC" CssClass="btn font2" ForeColor="Black"
                                                CausesValidation="False" Text="Action">
                                            </asp:LinkButton>
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="lnkapproved" CommandName="Approve" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue" Font-Bold="true" Font-Size="Small"
                                                CausesValidation="False" Text="Approve/Certify">
                                            </asp:LinkButton>

                                            <br />
                                            <br />
                                            <asp:Label ID="lblcertifymsg" ForeColor="Red" Font-Bold="true" runat="server" Text="" Visible="true"></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Final Status">
                                    <ItemTemplate>
                                        <%-- <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server"
                                            Font-Size="Smaller" class="btn btn-info" Width="80px"></asp:LinkButton>--%>
                                        <div style="padding: 15px" align="center" runat="server">
                                            <asp:Label ID="lnkstatus" runat="server" Enabled="false" CssClass="btn font2" ForeColor="Black" Font-Bold="true"
                                                CausesValidation="False" Text='<%#Eval("FinalStatus") %>' ToolTip="Final Status"></asp:Label>

                                            <asp:Label ID="lblbasicid" runat="server" Text='<%#Eval("basicid") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblfinalsubmitid" runat="server" Text='<%#Eval("finalstatusid") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="lblstatusid" runat="server" Text='<%#Eval("currenstatusid") %>' Visible="false"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="lnktrack" CommandName="Trackinfo" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue" Font-Bold="true" Font-Size="Small"
                                                CausesValidation="False" Text="Track Application">
                                            </asp:LinkButton>
                                            <br />
                                            <br />
                                            <asp:LinkButton ID="lnkviewapplication" CommandName="GetaPdf" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue" Font-Bold="true" Font-Size="Small"
                                                CausesValidation="False" Text="View/Print Application">
                                            </asp:LinkButton>

                                            <%--<br />
                                            <br />
                                            <asp:LinkButton ID="lnkemailagain" CommandName="ResendEmail" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue"
                                                CausesValidation="False" Text="Re-Send an Info. to PBGS, via Email, regarding the Action Taken">
                                            </asp:LinkButton>--%>
                                        </div>
                                    </ItemTemplate>

                                    <%--<ItemStyle Width="13%"></ItemStyle>--%>
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="Send a Reminder">
                                    <ItemTemplate>
                                        <div style="padding: 15px" align="center" runat="server">
                                            <asp:ImageButton ID="imgreminder" CommandName="sendreminder" runat="server" Height="40px" Width="40px" alt="Send a Reminder" class="img-responsive imground"
                                                CausesValidation="False" ToolTip="Send a Reminder" ImageUrl="~/images/Reminder.png"></asp:ImageButton>
                                        </div>
                                        <div style="padding-left: 15px; padding-right: 15px" align="Left" runat="server">
                                            <asp:Label ID="lbllastreminder" Font-Bold="true" ForeColor="Brown" runat="server" Text="Last Reminder sent on: " class="fontingrid" Font-Size="Small" />
                                            <asp:Label ID="lbllastreminder2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("") %>' Font-Size="Small" />
                                            <br />
                                            <asp:Label ID="lbllstremRequest" Font-Bold="true" ForeColor="Brown" runat="server" Text="Last Reminder/Request: " class="fontingrid" Font-Size="Small" />
                                            <asp:Label ID="lbllstremRequest2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("request") %>' Font-Size="Small" />
                                        </div>
                                        <div style="padding: 15px" align="center" runat="server">
                                            <asp:LinkButton ID="lnkhisRem" CommandName="HistoryOfReminder" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue" Font-Bold="true" Font-Size="Small"
                                                CausesValidation="False" Text="History Of Reminder(s)"> </asp:LinkButton>
                                        </div>

                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                            </Columns>
                            <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" CssClass="centerHeaderText fontingrid"
                                Wrap="True" Font-Size="Small" VerticalAlign="Middle" HorizontalAlign="Center"></HeaderStyle>
                            <RowStyle BackColor="White" Font-Bold="True" Height="30px" HorizontalAlign="Center"
                                VerticalAlign="Middle" />
                            <PagerSettings Position="TopAndBottom" />
                            <PagerStyle BackColor="#E67E22" CssClass="cssPager pag" ForeColor="White" Font-Size="Small"
                                HorizontalAlign="Left" VerticalAlign="Middle" Font-Bold="True" BorderColor="Black"
                                BorderWidth="2" />
                        </asp:GridView>

                        <asp:LinkButton Text="" ID="lnkfaketrack" runat="server" />
                        <asp:LinkButton Text="" ID="lnkfake" runat="server" />
                        <asp:LinkButton Text="" ID="lnkfakeapprove" runat="server" />

                        <ajaxToolkit:ModalPopupExtender ID="mpeapprove" runat="server" PopupControlID="Panel3" TargetControlID="lnkfakeapprove"
                            BackgroundCssClass="modalBackground" CancelControlID="btnapprovecncl">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 65%;" Width="80%">

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server"  >
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btncertify" />
                                  
                                     <%--<asp:PostBackTrigger ControlID="grdapplications" EventName="RowCommand"  />--%>
                                    
                                </Triggers>
                                <ContentTemplate>
                                    <div class="header">
                                        <asp:Label ID="Label9" Visible="true" Text="Certificate by Head of Office" Font-Bold="true" Font-Size="Medium" runat="server" />
                                    </div>
                                    <div class="panel-body" align="left" style="padding: 20px">
                                        <br />
                                        <asp:Label ID="Label11" Font-Bold="true" ForeColor="Black" Font-Size="Small" runat="server" Text="i. Certified that all the information given by the official in the application form have been verified from his/her service records and are correct."></asp:Label>
                                        <br />
                                        <asp:Label ID="Label12" Font-Bold="true" ForeColor="Black" Font-Size="Small" runat="server" Text="ii. The request made by the official is genuine and recommended."></asp:Label>
                                        <br />
                                        <br />
                                        <div id="divrmk_approve" runat="server">
                                            <asp:Label ID="Label16" Font-Bold="true" ForeColor="Brown" Font-Size="Small" runat="server" Text="Remarks By HOO/Controlling Officer(If Any)"></asp:Label>
                                            <br />
                                            <asp:TextBox ID="txtremarks_approve" runat="server" Width="90%" TextMode="MultiLine" Height="200px" Font-Size="Small" Font-Bold="true" Style="padding: 5px"></asp:TextBox>
                                        </div>
                                        <br />
                                        <br />
                                        <div id="divapprovebtn" runat="server" align="center" visible="true">
                                            <asp:Button ID="btncertify" OnClick="btncertify_Click" OnClientClick="return confirm('Once certify, you are not able make any changes. Are You Sure to certify?');" runat="server" Text="Certify" CssClass="btn" Font-Bold="true" Font-Size="Large" BackColor="#D5F5E3" ForeColor="Black" CausesValidation="False" />
                                        </div>
                                        <div id="divapprovemsg" runat="server" align="left" visible="true">
                                            <asp:Label ID="lblapprovemsg" Font-Bold="true" ForeColor="Blue" Font-Size="Small" runat="server" Text=""></asp:Label>
                                            <br />
                                            <asp:Label ID="Label17" Font-Bold="true" ForeColor="brown" Font-Size="Small" runat="server" Text="Remarks(If Any): "></asp:Label>
                                            <br />
                                            <asp:Label ID="lblrmkapprove" Font-Bold="true" ForeColor="Blue" Font-Size="Small" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>

                                    <div class="footer" align="center" style="padding-bottom: 20px">
                                        <asp:Button ID="btnapprovecncl" runat="server" Text="X Close" CssClass="btn" Font-Bold="true" Font-Size="Large" BackColor="#E67E22" ForeColor="Black" CausesValidation="False" />
                                    </div>
                             </ContentTemplate>
                            </asp:UpdatePanel>

                        </asp:Panel>
                        <ajaxToolkit:ModalPopupExtender ID="mpe1" runat="server" PopupControlID="pnlPopupview" TargetControlID="lnkfake"
                            BackgroundCssClass="modalBackground" CancelControlID="Button3">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pnlPopupview" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 95%;" Width="80%">
                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="Button9" />
                                    <asp:PostBackTrigger ControlID="grdUpload_pre" />
                                    <asp:PostBackTrigger ControlID="grdhealth_pre" />
                                  <%--  <asp:PostBackTrigger ControlID="grdapplications" />
                                    <asp:PostBackTrigger ControlID="gvtraining_pre" />
                                        <asp:PostBackTrigger ControlID="gvtransfer_pre" />
                                       <asp:PostBackTrigger ControlID="grdUpload_pre" />
                                       <asp:PostBackTrigger ControlID="grdrecord_per" />
                                       <asp:PostBackTrigger ControlID="grdUpload_pre" />   --%>                            
                                    
                                    <%--<asp:PostBackTrigger ControlID="grdexpprev" />
                                <asp:PostBackTrigger ControlID="grdcerprev" />--%>
                                </Triggers>
                                <ContentTemplate>
                                    <div class="row" style="margin: auto; padding: 20px" runat="server" id="div2">
                                        <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                                        <div align="center" class=" col-lg-12 col-md-12" runat="server" id="div14">
                                            <div class="panel-heading gradheaderround">
                                                <span style="font-size: large; font-weight: bold; color: Black;">:: View/Print Application ::</span>
                                            </div>
                                            <div id="Div3" runat="server" class="panel-body table-responsive" style="min-height: 400px; margin-top: 10px; margin-bottom: 100px">
                                                <table>
                                                    <tr>
                                                        <td runat="server" align="right" style="padding-right: 30px" width="30%">
                                                            <asp:Button ID="Button9" OnClick="Button9_Click" runat="server" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Text="Print" Width="160px" />
                                                            &nbsp;

                                                        </td>
                                                        <td runat="server" align="left" style="padding-right: 30px" width="30%">
                                                            <asp:Button ID="Button3" runat="server" Text="X Close" Style="font-size: Medium; font-weight: bolder; background-color: #AAB7B8; color: black; padding: 0.5vw; border-radius: 15px;" Width="160px" />
                                                        </td>
                                                    </tr>

                                                </table>

                                                <div class="table table-bordered tablecus2" runat="server" style="width: 97%; padding: 10px">
                                                    <asp:Panel ID="panelprint" runat="server">
                                                        <div id="divmsg3" runat="server" visible="false" align="center">
                                                            <asp:Label ID="lblmsg3" runat="server" Text="" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                                        </div>
                                                        <br />
                                                        <table id="table_pre_sub" class="table table-bordered tablecus2">
                                                            <tr runat="server" visible="true">
                                                                <td align="center" runat="server" width="10%">
                                                                    <asp:Label ID="Label218" CssClass="font2" runat="server" Text="1." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                    <asp:Label ID="Label219" CssClass="font2" runat="server" Text="Application Number" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td align="left" runat="server" style="padding-left: 15px" width="60%">
                                                                    <asp:Label ID="Label4" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>
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
                                                                    <asp:Label ID="Label7" CssClass="font2" runat="server" Text="Present Place of Posting" Style="font-weight: 700; color: #000000"></asp:Label>
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
                                                                    <asp:Label ID="Label74" CssClass="font2" runat="server" Text="Is Present Place of Posting is Tenure (Difficult) Place" Style="font-weight: 700; color: #000000"></asp:Label>
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
                                                                    <asp:Label ID="Label141" CssClass="font2" runat="server" Text="Application Forwared to Whom" Style="font-weight: 700; color: #000000"></asp:Label>
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
                                                            <tr>
                                                                <td align="center" runat="server" width="10%">
                                                                    <asp:Label ID="Label171" CssClass="font2" runat="server" Text="14.4" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td align="right" runat="server" style="padding-right: 30px" width="30%">
                                                                    <asp:Label ID="Label172" runat="server" Text="Reason If None Selected in Option2/Option3" class="font2" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td style="text-align: left; padding-left: 15px" runat="server" class="auto-style2">
                                                                    <asp:Label ID="lblreason_selc_None_Pre" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text=""></asp:Label>

                                                                </td>
                                                            </tr>

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

                                                            <tr>
                                                                <td align="center" runat="server" width="10%">
                                                                    <asp:Label ID="Label192" CssClass="font2" runat="server" Text="18." Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>
                                                                <td align="left" runat="server" style="padding-right: 10px" width="100%" colspan="2">
                                                                    <asp:Label ID="Label193" CssClass="font2" runat="server" Text="If you are asking for the difficult/most difficult place/posting, then provide 3 different options for transfer, seeking after the completion of tenure" Style="font-weight: 700; color: #000000"></asp:Label>
                                                                </td>

                                                            </tr>


                                                            <tr runat="server" visible="true">
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
                                                            <tr runat="server" visible="true">
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

                                                            <tr runat="server" visible="true">
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
                                                                AllowPaging="false" HeaderStyle-ForeColor="White" Width="97%" ToolTip="Training Acquired" ShowFooter="false" PageSize="50" EmptyDataText="No records Found..">
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
                                                                ShowFooter="false" ShowHeaderWhenEmpty="true" ToolTip="Transfer History" Width="97%" EmptyDataText="No records Found..">
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
                                                                HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" ShowFooter="false" ShowHeaderWhenEmpty="true" ToolTip="Records" Width="97%" EmptyDataText="No records Found..">
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
                                                        <div id="div4" runat="server">
                                                            <div runat="server" align="left" style="padding-left: 10px">
                                                                <asp:Label ID="Label37" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text="Health Category PwD-Self/Dependents"></asp:Label>
                                                                <br />
                                                                <br />
                                                            </div>
                                                            <asp:GridView ID="grdhealth_pre" runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="Gridview" DataKeyNames="id"
                                                                HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" ShowFooter="false" ShowHeaderWhenEmpty="true"
                                                                ToolTip="Health Category Details" Width="97%" EmptyDataText="No records Found.." OnRowCommand="grdhealth_pre_RowCommand">
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
                                                        <div id="div5" runat="server">
                                                            <div runat="server" align="left" style="padding-left: 10px">
                                                                <asp:Label ID="Label40" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text="Supported Document(s)"></asp:Label>
                                                                <br />
                                                                <br />
                                                            </div>
                                                            <asp:GridView ID="grdUpload_pre" runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="Gridview" DataKeyNames="id"
                                                                HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" ShowFooter="false" ShowHeaderWhenEmpty="true" ToolTip="Supported Documents" Width="97%" EmptyDataText="No Records Found.." OnRowCommand="grdUpload_pre_RowCommand">
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
                                                                    <asp:TemplateField HeaderText="Attach/Download Document">
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
                                                        <div class="table-responsive" runat="server" style="padding: 20px; background-color: beige">
                                                            <div runat="server" align="left" style="padding-left: 10px">
                                                                <asp:Label ID="Label98" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text="Application Movement with Remarks"></asp:Label>
                                                                <br />
                                                                <br />
                                                            </div>
                                                            <asp:GridView ID="grdviewtrack_" runat="server" AutoGenerateColumns="False" AllowPaging="false" ToolTip="Track Application"
                                                                PageSize="10" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .." DataKeyNames="trnid"
                                                                ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid" OnRowCommand="grdviewtrack_RowCommand" OnRowDataBound="grdviewtrack__RowDataBound"
                                                                BorderWidth="2px">
                                                                <AlternatingRowStyle BackColor="White" />
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No.">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label99" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Dealing Section/Station/Officer">
                                                                        <ItemTemplate>
                                                                            <div style="padding-left: 10px; right: 10px" align="left">
                                                                                <asp:Label ID="Label100" Font-Bold="true" ForeColor="Brown" runat="server" Text="Section/Station/Officer: " class="fontingrid" />
                                                                                <asp:Label ID="Label101" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("DealingOffc") %>'
                                                                                    Font-Bold="True" />
                                                                                <br />
                                                                                <asp:Label ID="Label102" Font-Bold="true" ForeColor="Brown" runat="server" Text="Recieved On: " class="fontingrid" />
                                                                                <asp:Label ID="Label103" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("AppSubmitOn") %>'
                                                                                    Font-Bold="True" />
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                        <ItemStyle HorizontalAlign="Left" />
                                                                    </asp:TemplateField>

                                                                    <asp:TemplateField HeaderText="Action Taken/Remarks/Supporting File">
                                                                        <ItemTemplate>
                                                                            <div style="padding-left: 10px; right: 10px; right: 10px" align="left">
                                                                                <asp:Label ID="Label104" ForeColor="Brown" class="fontingrid" runat="server" Text="Action: "
                                                                                    Font-Bold="True" />
                                                                                <asp:Label ID="Label105" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Status") %>'
                                                                                    Font-Bold="True" />
                                                                                <br />
                                                                                <asp:Label ID="Label106" ForeColor="Brown" class="fontingrid" runat="server" Text="Remarks: "
                                                                                    Font-Bold="True" />
                                                                                <asp:Label ID="Label107" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_Remarks") %>'
                                                                                    Font-Bold="True" />
                                                                                <br />
                                                                                <asp:Label ID="Label108" ForeColor="Brown" class="fontingrid" runat="server" Text="Supporting File: "
                                                                                    Font-Bold="True" />
                                                                                <asp:Label ID="lblFileattached" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_File") %>'
                                                                                    Font-Bold="True" />

                                                                                <asp:LinkButton ID="lnkFileattached" ForeColor="Brown" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_File") %>'
                                                                                    Font-Bold="True" CommandName="download"></asp:LinkButton>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                        <ItemStyle HorizontalAlign="Left" />
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
                                                    </asp:Panel>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>

                        <ajaxToolkit:ModalPopupExtender ID="mpetrack" runat="server" PopupControlID="pnlPopuptrack" TargetControlID="lnkfaketrack"
                            BackgroundCssClass="modalBackground" CancelControlID="btnClosetrack">
                        </ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="pnlPopuptrack" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 65%;" Width="80%">

                            <asp:UpdatePanel ID="UpdatePaneltrack" runat="server">
                                 <Triggers>
                                    <asp:PostBackTrigger ControlID="grdtrack" />
                                    <asp:PostBackTrigger ControlID="grdtrack_clo" />
                                      <asp:PostBackTrigger ControlID="grdtrack_clo" />
                                  <%--    <asp:PostBackTrigger ControlID="grdapplications" />--%>
                                     
                                    <%--<asp:PostBackTrigger ControlID="grdexpprev" />
                                <asp:PostBackTrigger ControlID="grdcerprev" />--%>
                                </Triggers>
                                <ContentTemplate>
                                    <div class="header">
                                        <asp:Label ID="Label53" Visible="true" Text="Track Your Transfer Application" Font-Bold="true" Font-Size="Medium" runat="server" />
                                    </div>
                                    <div id="Div11" class="body" runat="server">
                                        <div id="div16" class="body" runat="server" align="left" style="padding-top: 20px; padding-left: 20px">
                                            <asp:Label ID="Label54" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" Text="Application Reference-ID: " />
                                            <asp:Label ID="Label55" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                                        </div>
                                        <div class="table-responsive" runat="server" align="center" style="padding: 20px">
                                            <asp:GridView ID="grdtrack" runat="server" AutoGenerateColumns="False" AllowPaging="false" ToolTip="Track Application" DataKeyNames="trnid"
                                                PageSize="10" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .."
                                                ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid" OnRowCommand="grdtrack_RowCommand" OnRowDataBound="grdtrack__RowDataBound"
                                                BorderWidth="2px">
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="S.No.">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label8" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dealing Section/Station/Officer">
                                                        <ItemTemplate>
                                                            <div style="padding-left: 10px; right: 10px" align="left">
                                                                <asp:Label ID="Label271" Font-Bold="true" ForeColor="Brown" runat="server" Text="Section/Station/Officer: " class="fontingrid" />
                                                                <asp:Label ID="lbldealingsec" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("DealingOffc") %>'
                                                                    Font-Bold="True" />
                                                                <br />
                                                                <asp:Label ID="Label500" Font-Bold="true" ForeColor="Brown" runat="server" Text="Recieved On: " class="fontingrid" />
                                                                <asp:Label ID="lblreqtrack" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("AppSubmitOn") %>'
                                                                    Font-Bold="True" />
                                                            </div>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Action Taken/Remarks/Supporting File">
                                                        <ItemTemplate>
                                                            <div style="padding-left: 10px; right: 10px; right: 10px" align="left">
                                                                <asp:Label ID="lblactiontrachk" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Status") %>'
                                                                    Font-Bold="True" />
                                                                <br />
                                                                <asp:Label ID="Label93" ForeColor="Brown" class="fontingrid" runat="server" Text="Remarks: "
                                                                    Font-Bold="True" />
                                                                <asp:Label ID="Label94" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_Remarks") %>'
                                                                    Font-Bold="True" />
                                                                <br />
                                                                <asp:Label ID="Label95" ForeColor="Brown" class="fontingrid" runat="server" Text="Supporting File: "
                                                                    Font-Bold="True" />
                                                                <%--<asp:Label ID="Label97" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_File") %>'
                                                                    Font-Bold="True" />--%>
                                                                <asp:Label ID="lblFileattached" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_File") %>'
                                                                    Font-Bold="True" />

                                                                <asp:LinkButton ID="lnkFileattached" ForeColor="Brown" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_File") %>'
                                                                    Font-Bold="True" CommandName="download"></asp:LinkButton>
                                                            </div>
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Left" />
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
                                    <div class="footer" align="center" style="padding-bottom: 20px">
                                        <asp:Button ID="btnClosetrack" runat="server" Text="X Close" CssClass="btn" Font-Bold="true" Font-Size="Large" BackColor="#E67E22" ForeColor="Black" CausesValidation="False" />
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
        <div id="divresorfor" runat="server" visible="false" align="center" style="padding: 10px;">
            <div class="row" style="margin: auto" runat="server" id="div8">
                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                <div align="center" class=" col-md-12  col-lg-12" runat="server" id="div12">
                    <br />
                    <div id="div19" class="body" runat="server" align="left" style="padding-top: 20px; padding-left: 20px">
                        <asp:Label ID="Label67" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" Text="Application Reference-ID: " />
                        <asp:Label ID="lbltrackApp" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                    </div>
                    <br />
                    <div id="div22" class="grad2new" runat="server" style="border: medium ridge #000000; padding-top: 20px; padding-bottom: 20px; margin: auto 20px auto 20px">
                        <div runat="server" align="center">
                            <asp:Label runat="server" Text=":: Select an Action to Perform ::" ForeColor="Black" Font-Size="Large" Font-Bold="true" class="font2" Font-Underline="true"></asp:Label>
                        </div>
                        <div runat="server" align="right" style="padding-right: 30px">
                            <asp:Button ID="Button6" runat="server" CausesValidation="False" Font-Bold="true" Font-Size="Medium" ForeColor="Black" Text="x" ValidationGroup="fwd" Width="30px" OnClick="Button6_Click" />
                        </div>
                        <asp:Panel ID="Panel1" runat="server">
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" CellPadding="5" class="font2 chk" ForeColor="Black"
                                CellSpacing="2" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">&nbsp;&nbsp;Close this Request</asp:ListItem>
                                <asp:ListItem Value="3">&nbsp;&nbsp;Forward</asp:ListItem>
                            </asp:CheckBoxList>
                        </asp:Panel>

                    </div>
                    <div id="divresolvedaction" runat="server" visible="false" align="center" style="margin-top: 35px">
                        <div id="div24" runat="server" style="border: medium ridge #000000; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px; margin: auto 20px auto 20px">
                            <div class="table-responsive grad3" runat="server" style="border: medium ridge #808080; padding: 20px;">
                                <div runat="server" align="left" style="padding-left: 10px">
                                    <asp:Label ID="Label111" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text="Application Movement with Remarks"></asp:Label>
                                    <br />
                                    <br />
                                </div>
                                <asp:GridView ID="grdtrack_clo" runat="server" AutoGenerateColumns="False" AllowPaging="false" ToolTip="Track Application"
                                    PageSize="10" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .." DataKeyNames="trnid"
                                    ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid"
                                    BorderWidth="2px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="Label112" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dealing Section/Station/Officer">
                                            <ItemTemplate>
                                                <div style="padding-left: 10px; right: 10px" align="left">
                                                    <asp:Label ID="Label113" Font-Bold="true" ForeColor="Brown" runat="server" Text="Section/Station/Officer: " class="fontingrid" />
                                                    <asp:Label ID="Label114" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("DealingOffc") %>'
                                                        Font-Bold="True" />
                                                    <br />
                                                    <asp:Label ID="Label115" Font-Bold="true" ForeColor="Brown" runat="server" Text="Recieved On: " class="fontingrid" />
                                                    <asp:Label ID="Label116" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("AppSubmitOn") %>'
                                                        Font-Bold="True" />
                                                </div>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Action Taken/Remarks/Supporting File">
                                            <ItemTemplate>
                                                <div style="padding-left: 10px; right: 10px; right: 10px" align="left">
                                                    <asp:Label ID="Label117" ForeColor="Brown" class="fontingrid" runat="server" Text="Action: "
                                                        Font-Bold="True" />
                                                    <asp:Label ID="Label118" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Status") %>'
                                                        Font-Bold="True" />
                                                    <br />
                                                    <asp:Label ID="Label119" ForeColor="Brown" class="fontingrid" runat="server" Text="Remarks: "
                                                        Font-Bold="True" />
                                                    <asp:Label ID="Label120" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_Remarks") %>'
                                                        Font-Bold="True" />
                                                    <br />
                                                    <asp:Label ID="Label121" ForeColor="Brown" class="fontingrid" runat="server" Text="Supporting File: "
                                                        Font-Bold="True" />
                                                    <asp:Label ID="Label122" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_File") %>'
                                                        Font-Bold="True" />
                                                </div>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
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

                            <br />
                            <br />
                            <table class="table table table-bordered grad2new def" cellpadding="5" rules="all" style="border-style: ridge; border-width: medium; z-index: 1; position: relative;">
                                <tr class="grad3">
                                    <td align="center" colspan="2" style="padding-top: 8px; padding-bottom: 8px" class="auto-style3">
                                        <asp:Label ID="Label3" runat="server" Text="Close a Transfer Request" CssClass="font2" Style="font-weight: bold; color: Black;"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label5" runat="server" Text="Options Seeking for Transfer" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:Label ID="lbloptions_res" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>



                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label68" runat="server" Text="Tenure Options Seeking for Transfer" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:Label ID="lbltenure_res" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>

                                    </td>
                                </tr>

                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label28" runat="server" Text="Name, Mobile No, E-Mail, of Applicant" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:Label ID="lblname_res" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label110" runat="server" Text="Place of Posting" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:Label ID="lblposting_clo" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label32" runat="server" Text="Email" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <div style="padding: 5px">
                                            <asp:TextBox ID="txtEmailres" runat="server" Placeholder="Primary Email" Style="padding-left: 7px" CssClass="select font2 widthofboxes1" Width="90%" Height="30px" ValidationGroup="sub1"></asp:TextBox>
                                            &nbsp;<span style="color: black; font-size: medium;"><strong>*&nbsp; 
                                        <br />
                                            </strong></span>
                                            <asp:LinkButton ID="LinkButton1" Visible="false" runat="server" Font-Underline="True" Font-Bold="true" ForeColor="Blue" Font-Size="Small" OnClick="LinkButton1_Click" CausesValidation="False">Change Email</asp:LinkButton>
                                            &nbsp;
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtEmailres" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub2" Display="Dynamic" ErrorMessage="RegularExpressionValidator"
                                            ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                            Not a Valid Email!!</asp:RegularExpressionValidator>
                                            <span style="color: black; font-size: small;"><strong>
                                                <br />
                                                *Email of the Applicant as mentioned by him/her during the filing of Transfer Request.</strong></span>
                                            <br />
                                            <span style="color: red; font-size: small;"><strong>**Multiple Recipents are not allowed.</strong></span><br />
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                                TargetControlID="txtEmailres" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@.-!#$^?="></ajaxToolkit:FilteredTextBoxExtender>

                                        </div>
                                        <div style="padding: 5px">
                                            <asp:TextBox ID="txtccresto" runat="server" Placeholder="CC to(If Any)" Width="90%" Style="padding-left: 7px" CssClass="select font2 widthofboxes1" Height="30px"></asp:TextBox>
                                            <br />
                                            <span style="color: black; font-size: small;"><strong>**Multiple Recipients are allowed in CC. Here the recipients must be seperated by </strong></span>
                                            <span style="color: black; font-size: large;"><strong>comma ( , ). </strong></span><span style="color: black; font-size: small;"><strong>No other seperators are allowed. </strong></span>
                                            <br />
                                            <ajaxToolkit:AutoCompleteExtender runat="server" ID="AutoCompleteExtender3" TargetControlID="txtccresto" CompletionListItemCssClass="autoCompletePanel"
                                                ServiceMethod="EmailResend" MinimumPrefixLength="2" EnableCaching="false" CompletionSetCount="1"
                                                Enabled="true">
                                            </ajaxToolkit:AutoCompleteExtender>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                                                TargetControlID="txtccresto" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@.-!#$^,?="></ajaxToolkit:FilteredTextBoxExtender>
                                        </div>

                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label20" runat="server" Text="Whether Transfer Request Accepted?" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <div style="padding: 5px">
                                            <asp:DropDownList ID="ddlrequestaccepted" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px"
                                                ValidationGroup="sub2" AutoPostBack="True" OnSelectedIndexChanged="ddlrequestaccepted_SelectedIndexChanged">
                                                <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*required" ControlToValidate="ddlrequestaccepted" ValidationGroup="sub2" SetFocusOnError="True"
                                                ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                        </div>

                                    </td>
                                </tr>
                                <tr id="trwing_desgn" runat="server" visible="false">

                                    <td align="right" runat="server" style="padding-right: 30px" width="40%" visible="false">
                                        <asp:Label ID="Label131" CssClass="font2" runat="server" Text="Wing and Designation of Applicant on which he/she transferred" Style="font-weight: 700; color: #000000"></asp:Label>
                                    </td>
                                    <td align="left" runat="server" style="padding-left: 15px" class="auto-style2" visible="false">
                                        <div runat="server" visible="true">
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                    <asp:Label ID="Label132" runat="server" Text="Wing: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                    <br />
                                                    <asp:RadioButtonList ID="rblwing" runat="server" Visible="false"></asp:RadioButtonList>
                                                    <asp:DropDownList ID="ddlwing" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px"
                                                        ValidationGroup="sub2" AutoPostBack="True" OnSelectedIndexChanged="ddltenstate3_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="*required" ControlToValidate="ddlwing"
                                                        ValidationGroup="sub2" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                    <br />
                                                    <asp:Label ID="Label133" runat="server" Text="Designation: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                    <br />
                                                    <asp:DropDownList ID="ddldesgn" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="sub2"></asp:DropDownList>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="*required" ControlToValidate="ddldesgn"
                                                        ValidationGroup="sub2" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                    </td>
                                </tr>
                                <tr class="trnew" id="trordernum" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label23" runat="server" Text="Order No" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <div style="padding: 5px">
                                            <asp:TextBox ID="txtordernum" runat="server" Style="padding-left: 7px" CssClass="select font2 widthofboxes1" Width="90%" Height="30px" ValidationGroup="sub2"></asp:TextBox>
                                            &nbsp;
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*required!!"
                                                ControlToValidate="txtordernum" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub2"
                                                Display="Dynamic" Style="font-size: small">
                                            </asp:RequiredFieldValidator>

                                        </div>

                                    </td>
                                </tr>
                                <tr class="trnew" id="trorderdate" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label24" runat="server" Text="Order Date" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <div style="padding: 5px">
                                            <asp:TextBox ID="txtorderdate" runat="server" PlaceHolder="DD-MM-YYYY" Style="padding-left: 7px" CssClass="select font2 widthofboxes1" Width="90%" Height="30px" ValidationGroup="sub2"></asp:TextBox>
                                            &nbsp;
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*required!!"
                                                ControlToValidate="txtorderdate" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub2"
                                                Display="Dynamic" Style="font-size: small">
                                            </asp:RequiredFieldValidator>
                                            <ajaxToolkit:CalendarExtender ID="txtorderdate_CalendarExtender" runat="server" BehaviorID="txtorderdate_CalendarExtender"
                                                Format="dd-MM-yyyy" TargetControlID="txtorderdate" />
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtenderyearFo2o" runat="server"
                                                TargetControlID="txtorderdate" ValidChars="0123456789-"></ajaxToolkit:FilteredTextBoxExtender>

                                        </div>

                                    </td>
                                </tr>
                                <tr id="trtranferstation" runat="server" visible="false">

                                    <td align="right" runat="server" style="padding-right: 30px" width="40%">
                                        <asp:Label ID="Label57" CssClass="font2" runat="server" Text="Trasfer to Station" Style="font-weight: 700; color: #000000"></asp:Label>
                                    </td>
                                    <td align="left" runat="server" style="padding-left: 15px" class="auto-style2">
                                        <div runat="server" visible="true">
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                    <asp:Label ID="Label69" runat="server" Text="Organisation: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                    <br />
                                                    <asp:DropDownList ID="ddlorg" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px"
                                                        ValidationGroup="sub2" AutoPostBack="True" OnSelectedIndexChanged="ddlorg_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                      <asp:RadioButtonList ID="rborg" runat="server" BorderStyle="Solid" ValidationGroup="sub2" Visible="false"  AutoPostBack="True" RepeatDirection="Horizontal " OnSelectedIndexChanged="ddlorg_SelectedIndexChanged">
                                               
                                            </asp:RadioButtonList>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*required" ControlToValidate="ddlorg"
                                                        ValidationGroup="sub2" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                    <br />
                                                    <asp:Label ID="Label72" runat="server" Text="Station: " CssClass="font2" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                                    <br />
                                                    <asp:DropDownList ID="ddlstn" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px" ValidationGroup="sub2"></asp:DropDownList>
                                                    <span class="auto-style4"><strong>*</strong></span>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*required" ControlToValidate="ddlstn"
                                                        ValidationGroup="sub2" SetFocusOnError="True"
                                                        ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label90" runat="server" Text="Whether VIP Reference?" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <div style="padding: 5px">
                                            <asp:DropDownList ID="ddlvipref" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px"
                                                ValidationGroup="sub2" AutoPostBack="True" OnSelectedIndexChanged="ddlvipref_SelectedIndexChanged">
                                                <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" BorderStyle="Solid" RepeatDirection="Horizontal" Visible="false">
                                                 <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                                <asp:ListItem Value="0" Text="No" Selected="True"></asp:ListItem>

                                            </asp:RadioButtonList>


                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*required" ControlToValidate="ddlvipref" ValidationGroup="sub2" SetFocusOnError="True"
                                                ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />

                                        </div>

                                    </td>
                                </tr>
                                <tr class="trnew" id="trvip" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label92" runat="server" Text="VIP Reference(Verbal, If Any)?" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <div style="padding: 5px">
                                            <asp:DropDownList ID="DropDownList1" CssClass="txtbx select" runat="server" BackColor="#D6EAF8" Width="90%" Height="30px"
                                                ValidationGroup="sub2" AutoPostBack="True" OnSelectedIndexChanged="ddlvipref_SelectedIndexChanged">
                                                <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="VIP-Verbal"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="VIP Written"></asp:ListItem>
                                                <asp:ListItem Value="3" Text="Administrative"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" BorderStyle="Solid" RepeatDirection="Horizontal" Visible="false">
                                                    <asp:ListItem Value="1" Text="VIP-Verbal"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="VIP Written"></asp:ListItem>
                                                <asp:ListItem Value="3" Text="Administrative"></asp:ListItem>
                                            </asp:RadioButtonList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*required" ControlToValidate="ddlvipref" ValidationGroup="sub2" SetFocusOnError="True"
                                                ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                             
                                        </div>

                                    </td>
                                </tr>
                                <tr class="trnew" id="trvipName" runat="server" visible="false">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label91" runat="server" Text="VIP Particular" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <div style="padding: 5px">
                                            <asp:TextBox ID="txtVIPName" runat="server" MaxLength="200" Style="padding-left: 7px" CssClass="select font2 widthofboxes1" Width="90%" Height="30px" ValidationGroup="sub2"></asp:TextBox>
                                            &nbsp;
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*required!!"
                                                ControlToValidate="txtVIPName" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub2"
                                                Display="Dynamic" Style="font-size: small">
                                            </asp:RequiredFieldValidator>

                                        </div>

                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label33" runat="server" Text="Remarks" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtremarksres" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="sub2" Style="padding: 7px"
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
                                        <div runat="server" id="divLOupload" style="padding-top: 10px; padding-bottom: 10px">
                                            <asp:FileUpload ID="FileUpload1" runat="server" class="select widthofboxes1" Height="22px" Font-Size="Medium" Font-Bold="true" />
                                            &nbsp;<span style="color: red; font-weight: bold; font-size: small"><br />
                                                * Upload supporting document upto 3MB, If necessary</span>
                                            <br />
                                            <asp:Label ID="Label34" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" Text="** Only .pdf are allowed to upload"></asp:Label>
                                            <asp:Label ID="lblexception" Visible="true" runat="server" Text="" CssClass="fontingrid" Font-Bold="true" ForeColor="Red"></asp:Label>
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
                            <br />

                            <asp:Label ID="lblcloseresult" runat="server" Text="" Style="font-weight: 700; font-size: small"></asp:Label>

                        </div>
                    </div>

                    <div id="divforwardedaction" runat="server" visible="false" align="center" style="margin-top: 35px">
                        <div id="div212" runat="server" style="border: medium ridge #000000; padding-top: 20px; padding-bottom: 20px; padding-left: 20px; padding-right: 20px; margin: auto 20px auto 20px">
                            <div class="table-responsive grad3" runat="server" style="border: medium ridge #808080; padding: 20px;">
                                <div runat="server" align="left" style="padding-left: 10px">
                                    <asp:Label ID="Label123" CssClass="font2" Font-Bold="true" ForeColor="Black" runat="server" Text="Application Movement with Remarks"></asp:Label>
                                    <br />
                                    <br />
                                </div>
                                <asp:GridView ID="grdtrack_fwd" runat="server" AutoGenerateColumns="False" AllowPaging="false" ToolTip="Track Application"
                                    PageSize="10" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .."
                                    ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid"
                                    BorderWidth="2px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="Label124" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dealing Section/Station/Officer">
                                            <ItemTemplate>
                                                <div style="padding-left: 10px; right: 10px" align="left">
                                                    <asp:Label ID="Label125" Font-Bold="true" ForeColor="Brown" runat="server" Text="Section/Station/Officer: " class="fontingrid" />
                                                    <asp:Label ID="Label126" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("DealingOffc") %>'
                                                        Font-Bold="True" />
                                                    <br />
                                                    <asp:Label ID="Label127" Font-Bold="true" ForeColor="Brown" runat="server" Text="Recieved On: " class="fontingrid" />
                                                    <asp:Label ID="Label128" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("AppSubmitOn") %>'
                                                        Font-Bold="True" />
                                                </div>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Action Taken/Remarks/Supporting File">
                                            <ItemTemplate>
                                                <div style="padding-left: 10px; right: 10px; right: 10px" align="left">
                                                    <asp:Label ID="Label129" ForeColor="Brown" class="fontingrid" runat="server" Text="Action: "
                                                        Font-Bold="True" />
                                                    <asp:Label ID="Label130" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Status") %>'
                                                        Font-Bold="True" />
                                                    <br />
                                                    <asp:Label ID="Label134" ForeColor="Brown" class="fontingrid" runat="server" Text="Remarks: "
                                                        Font-Bold="True" />
                                                    <asp:Label ID="Label135" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_Remarks") %>'
                                                        Font-Bold="True" />
                                                    <br />
                                                    <asp:Label ID="Label136" ForeColor="Brown" class="fontingrid" runat="server" Text="Supporting File: "
                                                        Font-Bold="True" />
                                                    <asp:Label ID="Label139" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Fwd_clsd_File") %>'
                                                        Font-Bold="True" />
                                                </div>
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemStyle HorizontalAlign="Left" />
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
                            <br />
                            <br />
                            <table class="table table table-bordered grad2new def" cellpadding="5" rules="all" style="border-style: ridge; border-width: medium; z-index: 1; position: relative;">
                                <tr class="grad3">
                                    <td align="center" colspan="2" style="padding-top: 8px; padding-bottom: 8px" class="auto-style3">
                                        <asp:Label ID="Label61" runat="server" Text="Forward a Transfer Request" CssClass="font2" Style="font-weight: bold; color: Black;"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label29" runat="server" Text="Options Seeking for Transfer" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:Label ID="Label30" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>



                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label31" runat="server" Text="Tenure Options Seeking for Transfer" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:Label ID="Label43" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>

                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label46" runat="server" Text="Name & Mobile No & E-Mail of Applicant" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:Label ID="lblnamefwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label142" runat="server" Text="Place of Posting" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:Label ID="lblposting_fwd" runat="server" CssClass="font2 " Text="" ForeColor="Black" Font-Bold="true"></asp:Label>


                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label56" runat="server" Text="Employee Code of Forwarding Officer" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:HiddenField ID="hdnValue" runat="server" />
                                        <asp:Label ID="lblmsga" runat="server" Text="" ForeColor="Red" Font-Bold="true" Font-Size="Medium"></asp:Label>
                                        <br />
                                        <asp:TextBox ID="txtappforwarded" CssClass="txtbx select padtxt" Font-Size="Small" onfocusout="checkItemSelected(this)" onfocus="resetItemSelected()" runat="server" Width="90%" Height="30px" BackColor="#D6EAF8" AutoComplete="Off" ValidationGroup="reg"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                            TargetControlID="txtappforwarded" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 ()-"></ajaxToolkit:FilteredTextBoxExtender>
                                        <span class="auto-style4"><strong>*</strong></span>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtappforwarded" ErrorMessage="* required" ValidationGroup="reg" SetFocusOnError="True"
                                            ForeColor="Red" Display="Dynamic" Style="font-weight: 700" />
                                        <ajaxToolkit:AutoCompleteExtender OnClientItemSelected="GetID" runat="server" ID="AutoCompleteExtender1" TargetControlID="txtappforwarded"
                                            ServiceMethod="SearchbyName_empcode" MinimumPrefixLength="2" EnableCaching="false" CompletionSetCount="1"
                                            Enabled="true" CompletionListCssClass="completionList"
                                            CompletionListHighlightedItemCssClass="itemHighlighted"
                                            CompletionListItemCssClass="listItem autoCompletePanel">
                                        </ajaxToolkit:AutoCompleteExtender>
                                        <br />
                                        <asp:Label ID="Label96" runat="server" Text="* Enter the Employee Code, to whom the application to be forwarded. You are allowed to search the Officer by Employee Code or Employee's First Name or Last Name" Style="font-weight: 700; color: #0000FF; font-size: small"></asp:Label>

                                    </td>
                                </tr>

                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="Label59" runat="server" Text="Email" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp; </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <div style="padding: 5px">
                                            <span class="auto-style1"><strong>Primary Email-Id</strong></span><br />
                                            <asp:TextBox ID="txtemailforwarded" runat="server" Placeholder="Primay Email" AutoComplete="off" CssClass="select font2 widthofboxes1" Style="padding-left: 7px" Height="30px" Width="90%" ValidationGroup="sub1"></asp:TextBox>
                                            <ajaxToolkit:AutoCompleteExtender runat="server" ID="AutoCompleteExtender4" TargetControlID="txtemailforwarded" CompletionListItemCssClass="autoCompletePanel"
                                                ServiceMethod="EmailResend" MinimumPrefixLength="2" EnableCaching="false" CompletionSetCount="1"
                                                Enabled="true">
                                            </ajaxToolkit:AutoCompleteExtender>
                                            <br />
                                            <asp:RegularExpressionValidator Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1" ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtemailforwarded"
                                                Display="Dynamic" ErrorMessage="RegularExpressionValidator" ForeColor="Red"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                Not a Valid Email!!</asp:RegularExpressionValidator>
                                            <br />
                                            <span style="color: black; font-size: small;"><strong>*Email Id of Officer to whom you are forwarding this information.</strong></span><br />
                                            <span style="color: red; font-size: small;"><strong>**Multiple Recipents are not allowed.</strong></span><br />
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                                                TargetControlID="txtemailforwarded" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@.-!#$^?="></ajaxToolkit:FilteredTextBoxExtender>

                                        </div>
                                        <div style="padding: 5px">
                                            <span class="auto-style1"><strong>CC Email-Id</strong></span><br />
                                            <asp:TextBox ID="txtcc" runat="server" Placeholder="CC to(If Any)" AutoComplete="off" CssClass="select font2 widthofboxes1" Style="padding-left: 7px" Height="30px" Width="90%"></asp:TextBox>
                                            <br />
                                            <span style="color: black; font-size: small;"><strong>**Multiple Recipients are allowed in CC. Here the recipients must be seperated by </strong></span>
                                            <span style="color: black; font-size: large;"><strong>comma ( , ). </strong></span><span style="color: black; font-size: small;"><strong>No other seperators are allowed. </strong></span>
                                            <br />
                                            <ajaxToolkit:AutoCompleteExtender runat="server" ID="AutoCompleteExtender5" TargetControlID="txtcc" CompletionListItemCssClass="autoCompletePanel"
                                                ServiceMethod="EmailResend" MinimumPrefixLength="2" EnableCaching="false" CompletionSetCount="1"
                                                Enabled="true">
                                            </ajaxToolkit:AutoCompleteExtender>
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                                TargetControlID="txtcc" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789@.-!#$^,?="></ajaxToolkit:FilteredTextBoxExtender>


                                        </div>
                                    </td>
                                </tr>
                                <tr class="trnew">
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label64" runat="server" Text="Remarks" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtremarksforward" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="sub1" Style="padding: 7px"
                                            TextMode="MultiLine">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Remarks can not exceed by 1000 Letters!!"
                                            Style="color: #FF0000" ControlToValidate="txtremarksforward" ValidationExpression="^[\s\S\d]{1,1000}$"
                                            Display="Dynamic" class="font" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1">
                                        </asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Text Required!!"
                                            ControlToValidate="txtremarksforward" ForeColor="Red" SetFocusOnError="True" class="font"
                                            Display="Dynamic" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub1">
                                        </asp:RequiredFieldValidator>
                                        <div runat="server" id="div18" style="padding-top: 10px; padding-bottom: 10px">
                                            <asp:FileUpload ID="FileUpload2" runat="server" class="select widthofboxes1" Height="22px" Font-Size="Medium" Font-Bold="true" />
                                            &nbsp;<span style="color: red; font-weight: bold; font-size: small"><br />
                                                * Upload supporting document upto 3MB, If necessary</span>
                                            <br />
                                            <asp:Label ID="Label65" runat="server" ForeColor="Red" Font-Bold="true" Font-Size="Small" Text="** Only .pdf are allowed to upload"></asp:Label>

                                            <asp:Label ID="Label66" Visible="true" runat="server" Text="" CssClass="fontingrid" Font-Bold="true" ForeColor="Red"></asp:Label>
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
                            <br />
                            <br />
                            <asp:Label ID="lblfwdresult" runat="server" Text="" Style="font-weight: 700; font-size: small"></asp:Label>
                        </div>
                    </div>
                </div>
                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
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
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
