<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommercialRevenueReports.aspx.cs" Inherits="PrasarNet.CommercialRevenueReports" MasterPageFile="~/Site1.Master" %>



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

        .tableView caption {
            font-size: medium;
            color: black;
            font-weight: bolder;
            text-align: center;
            align-content: center;
            align-items: center;
            background-color: darkkhaki;
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

        <div id="StationSectionMenu" visible="true" runat="server" class="sticky">
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="conheight gradbody">
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
            <div>

                <div id="divoptions" runat="server" align="right">
                    <table>
                        <tr>
                            <td style="padding: 10px; padding-right: 34px">



                                <asp:LinkButton ID="btnback" runat="server" CssClass="btn" CausesValidation="False"
                                    Width="90px" BackColor="#F5B7B1">
                                    <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>



                            </td>

                        </tr>
                    </table>

                </div>
            </div>

            <div runat="server" align="center">
                <div id="div18" runat="server">
                    <table>
                        <tr>
                            <td align="left" width="110%">
                                <div id="div19" runat="server" class="row">
                                    <div class="col-lg-3 col-md-3" style="padding-right: 0px; padding-bottom: 10px">
                                        <%--   <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#28FD41" OnClick="LinkButton4_Click">
                            <span style="font-weight: bold; color: #000000">Esclates the Records</span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton5" runat="server" CssClass="btn" CausesValidation="False" Visible="false"
                                            Width="220px" BackColor="#28FD41" OnClick="LinkButton5_Click">
                            <span style="font-weight: bold; color: #000000">Report in reqd. Format</span>
                                        </asp:LinkButton>--%>
                                    </div>
                                    <div class="col-lg-3 col-md-3" style="padding-right: 0px; padding-bottom: 10px">
                                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#12D0E5" OnClick="LinkButton2_Click">
                                            <span style="font-weight: bold; color: #000000">Customised Reports</span></asp:LinkButton>

                                    </div>
                                    <div class="col-lg-3 col-md-3" style="padding-right: 0px; padding-bottom: 10px">
                                        <asp:LinkButton ID="btngemreports" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#F2611E">
                                            <span style="font-weight: bold; color: #000000">Defaulters</span></asp:LinkButton>

                                    </div>
                                    <div class="col-lg-3 col-md-3" style="padding-right: 0px; padding-bottom: 5px">
                                        <%--<asp:LinkButton ID="btneditddo" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#E4C051" OnClick="btneditddo_Click">
                    <span style="font-weight: bold; font-size:small; color: #000000">Consolidated Reports</span></asp:LinkButton>--%>
                                    </div>
                                </div>

                            </td>


                        </tr>
                    </table>
                </div>
            </div>
            <br />
        </div>
        <div class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div1"></div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div12">
                <div id="divfilter" runat="server" visible="false">
                    <div id="Div8" runat="server" align="center" class="grad3 row" style="padding-top: 4px; padding-bottom: 4px">
                        <asp:Label ID="Label4" runat="server" Text="Select Feilds for Customised Report" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                        &nbsp;
                    </div>
                    <div id="Div5" runat="server" align="center" class="gradbody row" style="padding-top: 4px; padding-bottom: 4px">
                        <asp:UpdatePanel runat="server">
                            <contenttemplate>
                                <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div6">
                                    <asp:Label ID="lblorg" runat="server" Text="Organisation" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                        <br />
                                    <asp:DropDownList ID="ddlorg" runat="server" AppendDataBoundItems="true" class="select widthofboxes" Height="22px" AutoPostBack="True" OnSelectedIndexChanged="ddlorg_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>



                                <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div7">
                                    <asp:Label ID="lblstn" runat="server" Text="Station" ForeColor="Black"
                                        class="font" Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                        <br />
                                    <asp:DropDownList ID="ddlstation" runat="server" AppendDataBoundItems="true" class="select widthofboxes" Height="22px">
                                    </asp:DropDownList>
                                </div>
                                <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div11">
                                    <asp:Label ID="lblmonth" runat="server" Text="Month" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                        <br />
                                    <asp:DropDownList ID="ddlmonth" runat="server" AppendDataBoundItems="true" class="select widthofboxes" Height="22px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvmonthesc" runat="server" ControlToValidate="ddlmonth" Display="Dynamic" ErrorMessage="*" Font-Bold="True" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>
                                <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div13">
                                    <asp:Label ID="lblyear" runat="server" Text="Year" ForeColor="Black" class="font"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                        <br />
                                    <asp:DropDownList ID="ddlyear" runat="server" AppendDataBoundItems="true" class="select widthofboxes" Height="22px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvyearesc" runat="server" ControlToValidate="ddlyear" Display="Dynamic" ErrorMessage="*" Font-Bold="True" Font-Size="Medium" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                </div>


                            </contenttemplate>

                        </asp:UpdatePanel>

                    </div>
                    <div id="Div14" runat="server" align="center" class="grad3 row" style="padding-top: 4px; padding-bottom: 4px">
                        <div align="center" class=" col-md-12 col-sm-12 col-lg-12" runat="server" id="div15">
                            <asp:Button ID="btngetdata" runat="server" Text="Fetch Records" class="btn select button111"
                                Style="background-color: #99FFCC; color: Black; font-weight: bold" Visible="true" />

                        </div>

                    </div>
                </div>






            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div2"></div>
        </div>
        <br />
        <br />
    </div>
</asp:Content>
