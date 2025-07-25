<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeMReportInMinistryFormat.aspx.cs" Inherits="PrasarNet.GeMReportInMinistryFormat" MasterPageFile="~/Site1.Master" %>

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

        .auto-style1 {
            height: 89px;
        }

        .auto-style2 {
            font-size: small;
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
        function PrintPanel() {
            var today = new Date();
            //var dd = String(today.getDate()).padStart(2, '0');
            //var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            //var yyyy = today.getFullYear();

            //today = dd + '/' + mm + '/' + yyyy;
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>Source: PrasarNet ');
            //  printWindow.document.write(today);
            printWindow.document.write('</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();

            setTimeout(function () {
                printWindow.print();
            }, 0);


            return false;
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

    </div>
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
        <div class="row" style="margin: auto">
            <div>

                <div id="divoptions" runat="server" align="right">
                    <table>
                        <tr>
                            <td style="padding: 10px; padding-right: 34px">



                                <asp:LinkButton ID="btnback" runat="server" CssClass="btn" CausesValidation="False"
                                    Width="90px" BackColor="#F5B7B1" OnClick="btnback_Click" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                    <span class="glyphicon glyphicon-arrow-left" style="color: black"></span><span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>



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

                <div id="Div8" runat="server" align="center" class="grad3 row" style="padding-top: 13px; padding-bottom: 4px; margin-left: 10px; margin-right: 10px">
                    <div align="center" class=" col-md-12 col-sm-12 col-lg-12" style="height: 28px" runat="server" id="div6">
                        <asp:Label ID="Label4" runat="server" Text="Select Month/Year" Style="font-weight: bold; font-size: large; color: #000066;"></asp:Label>
                        &nbsp;
                    </div>
                </div>
                <div id="Div5" runat="server" align="center" class="gradbody row" style="padding-top: 8px; padding-bottom: 8px">

                    <asp:UpdatePanel runat="server">
                        <contenttemplate>

                            <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div11" style="padding-top: 4px; padding-bottom: 4px">
                                <asp:Label ID="lblmonth" runat="server" Text="Month" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                        <br />
                                <asp:DropDownList ID="ddlmonth" runat="server" AppendDataBoundItems="true" class="select widthofboxes" Height="30px" Font-Bold="True" Font-Size="Medium">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlmonth" ErrorMessage="*" Style="font-weight: 700; color: #FF0000" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div13" style="padding-top: 4px; padding-bottom: 4px">
                                <asp:Label ID="lblyear" runat="server" Text="Year" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                        <br />
                                <asp:DropDownList ID="ddlyear" runat="server" AppendDataBoundItems="true" class="select widthofboxes" Height="30px" Font-Bold="True" Font-Size="Medium">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlyear" ErrorMessage="*" Style="font-weight: 700; color: #FF0000" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div align="center" class="col-md-3 col-sm-3 col-lg-3" runat="server" id="div28" style="padding-top: 4px; padding-bottom: 4px">
                                <asp:Label ID="Label9" runat="server" Text="Status" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                        <br />
                                <asp:DropDownList ID="ddlstatuscon" runat="server" AppendDataBoundItems="true" class="select widthofboxes" Height="30px" Font-Bold="True" Font-Size="Medium">
                                    <asp:ListItem Value="">--All-- </asp:ListItem>
                                    <asp:ListItem Value="1">Forwarded to PB</asp:ListItem>
                                    <asp:ListItem Value="2">Not-Forwarded to PB</asp:ListItem>
                                </asp:DropDownList>

                            </div>
                            <div align="center" class="col-md-3 col-sm-3 col-lg-3" runat="server" id="div23" style="padding-top: 4px; padding-bottom: 4px">
                                <asp:Label ID="Label11" runat="server" Text="Organisation" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            <br />
                                <asp:DropDownList ID="ddlorgconsolidated" runat="server" AppendDataBoundItems="true" class="select widthofboxes" Height="30px" Font-Bold="True" Font-Size="Medium">
                                    <asp:ListItem Value="">--All-- </asp:ListItem>
                                    <asp:ListItem Value="1">AIR</asp:ListItem>
                                    <asp:ListItem Value="2">DD</asp:ListItem>
                                    <asp:ListItem Value="3">PBSectt.</asp:ListItem>
                                </asp:DropDownList>

                            </div>

                        </contenttemplate>

                    </asp:UpdatePanel>

                </div>
                <div id="Div14" runat="server" align="center" class="grad3 row" style="padding-top: 8px; padding-bottom: 8px; margin-left: 10px; margin-right: 10px">
                    <div align="center" class=" col-md-12 col-sm-12 col-lg-12" style="height: 32px" runat="server" id="div15">
                        <asp:Button ID="btngetdata" runat="server" Text="Fetch Records" class="btn select button111"
                            Style="background-color: #99FFCC; color: Black; font-weight: bold" Visible="true" OnClick="btngetdata_Click" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" />

                    </div>

                </div>





            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div2"></div>
        </div>

        <br />
        <br />
        <div class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div3"></div>

            <div id="divgrd" visible="false" align="center" class=" col-md-10 col-sm-10 col-lg-10"
                runat="server">
                <div runat="server" id="divnormal">


                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="font-weight: bold; color: Black;" class="font2">:: Report In Ministry Format ::</span>
                        </div>
                        <div class="panel-body grad2">
                            <div id="divprisearch" style="text-align: center" runat="server" visible="true">
                                <table width="100%">
                                    <tr>
                                        <td align="center" width="100%" style="padding: 12px">

                                            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn" CausesValidation="False" OnClientClick="return PrintPanel();"
                                                Width="90px" BackColor="#F5B7B1" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                                <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>

                                            <%--<asp:Button ID="btnPrint" runat="server" Text="Print" OnClientClick = "return PrintPanel();" Width="110px" BackColor="#F5B7B1" Font-Bold="true" Font-Size="Medium" />--%>
                                        </td>
                                        <%--<td align="left" style="padding-left: 10px" width="50%">
                                            
                                        </td>
                                        <td></td>--%>
                                    </tr>
                                </table>
                            </div>
                            <br />
                            <asp:Panel ID="pnlContents" runat="server">
                                <div id="div4" style="text-align: center; background-color: beige; padding: 35px" runat="server" visible="true">
                                    <asp:Label ID="Label24" runat="server" Text="Data regarding procurements and utilization of GeM-Portal (includes records of all DD offices/Stations, AIR offices/Stations and PB Sectt Offices)" Style="font-weight: 700; font-size: large; text-decoration: underline; color: #0000FF"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label26" runat="server" Text="Status as on:" Style="font-weight: 700; font-size: medium; color: black"></asp:Label>
                                    &nbsp;
                            <asp:Label ID="Label29" runat="server" Text="" Style="font-weight: 700; font-size: medium; color: black"></asp:Label>
                                    <br />
                                    <br />
                                    <div runat="server" class="table-responsive">
                                        <table width="100%" border="6" rules="all" frame="border" style="font-size: medium; color: #000000; background-color: #FFFFFF; caption-side: top;">
                                            <tr style="padding-top: 10px; padding-bottom: 10px; height: 65px">
                                                <td align="center" width="7%"></td>
                                                <td align="left" width="37%" style="padding-left: 10px; padding-right: 10px"></td>
                                                <td align="center" width="14%" style="padding-left: 10px; padding-right: 10px">
                                                    <asp:Label ID="Label3" runat="server" Text="Till Previous Month (Cumulative)" Font-Bold="true" Font-Size="Medium" ForeColor="Black"></asp:Label>


                                                </td>
                                                <td align="center" width="14%" style="padding-left: 10px; padding-right: 10px">
                                                    <asp:Label ID="Label32" runat="server" Text="During Last Month" Font-Bold="true" Font-Size="Medium" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="center" width="14%" style="padding-left: 10px; padding-right: 10px">
                                                    <asp:Label ID="Label5" runat="server" Text="During Current Month" Font-Bold="true" Font-Size="Medium" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="center" width="14%" style="padding-left: 10px; padding-right: 10px">
                                                    <asp:Label ID="Label7" runat="server" Text="% Change (w.r.t Last Month)" Font-Bold="true" Font-Size="Medium" ForeColor="Black"></asp:Label>

                                                </td>
                                            </tr>
                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">1.</td>
                                                <td align="left" width="37%" style="padding-left: 10px" class="auto-style1">
                                                    <asp:Label ID="Label8" runat="server" Text="Total No of orders/contracts placed for goods and services during the FY (Includes GeM & Non-GeM)" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px" class="auto-style1">
                                                    <asp:Label ID="lblprevmnth1" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px" class="auto-style1">
                                                    <asp:Label ID="lbllastmonth1" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px" class="auto-style1">
                                                    <asp:Label ID="lblcurmnth1" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px" class="auto-style1">
                                                    <asp:Label ID="lblperchange1" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">2.</td>
                                                <td align="left" width="37%" style="padding-left: 10px" class="auto-style1">
                                                    <asp:Label ID="Label12" runat="server" Text="Total Contract Values In Lakhs(Includes GeM & Non-GeM)" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px" class="auto-style1">
                                                    <asp:Label ID="lblprevmnth2" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px" class="auto-style1">
                                                    <asp:Label ID="lbllastmonth2" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px" class="auto-style1">
                                                    <asp:Label ID="lblcurmnth2" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px" class="auto-style1">
                                                    <asp:Label ID="lblperchange2" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px" class="auto-style1">
                                                <td align="center" width="7%">3.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label13" runat="server" Text="Out of 1 above No of Orders/Contracts placed through GeM" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth3" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth3" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth3" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange3" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">4.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label19" runat="server" Text="Value of Contract through GeM(In Lakhs)" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth4" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth4" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth4" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange4" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">5.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label21" runat="server" Text="Payment made for total No. of orders/contracts placed for goods and services during FY(In Lakhs), include GeM and Non-GeM" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth5" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth5" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth5" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange5" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">6.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label16" runat="server" Text="Out Of 5 above payments made against the No. of contracts placed through GeM" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth6" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth6" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth6" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange6" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">7(a).</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label27" runat="server" Text="No of GeM orders against which payments are affected with in 10 days of CRAC(and Amount There of in Lakhs)" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth7aNo" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblprevmnth7aAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth7ano" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lbllastmonth7aAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth7ano" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblcurmnth7aAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange7aNo" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblperchange7aAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">7(b).</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label23" runat="server" Text="No of GeM orders against which payments are affected with in 20 days of CRAC(and Amount There of in Lakhs)" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth7bNo" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblprevmnth7bAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth7bno" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lbllastmonth7bAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth7bno" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblcurmnth7bAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange7bNo" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblperchange7bAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">7(c).</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label17" runat="server" Text="No of GeM orders against which payments are affected with in 30 days of CRAC(and Amount There of in Lakhs)" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth7cNo" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblprevmnth7cAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth7cNo" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lbllastmonth7cAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth7cNo" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblcurmnth7cAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <span class="auto-style2">(<strong>Lakhs</strong>)</span></td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange7cNo" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblperchange7cAmt" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">8.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label30" runat="server" Text="No of GeM orders declined by sellers" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth8" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth8" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth8" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="15%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange8" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">9.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label25" runat="server" Text="No of GeM orders accepted by sellers but not delivered within expected delivery" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth9" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth9" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth9" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange9" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">10.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label18" runat="server" Text="No of rejection due to inferior/non-conforming supplies" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth10" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth10" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth10" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange10" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">11.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label33" runat="server" Text="No of incidents raised against sellers" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth11" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth11" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth11" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange11" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">12.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label28" runat="server" Text="No of incidents resolved/ closed out of 11 above" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth12" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth12" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth12" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange12" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">13.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label20" runat="server" Text="No of incidents raised by seller against dept." Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth13" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth13" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth13" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange13" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">14.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label22" runat="server" Text="No of incidents resolved/ closed out of 13 above" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth14" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth14" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth14" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding: 10px">
                                                    <asp:Label ID="lblperchange14" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr style="padding-top: 10px; padding-bottom: 10px">
                                                <td align="center" width="7%" class="auto-style1">15.</td>
                                                <td align="left" width="37%" style="padding-left: 10px">
                                                    <asp:Label ID="Label31" runat="server" Text="Any other matter of relevance" Font-Bold="true" Font-Size="small" ForeColor="Black"></asp:Label>

                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblprevmnth15" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lbllastmonth15" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblcurmnth15" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                                <td align="left" width="14%" style="padding-left: 10px">
                                                    <asp:Label ID="lblperchange15" runat="server" Text="" Font-Size="small" ForeColor="Black"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </asp:Panel>
                            <br />
                            <br />
                        </div>
                    </div>

                </div>
            </div>
            &nbsp;<br />
            |
        </div>
    </div>
</asp:Content>
