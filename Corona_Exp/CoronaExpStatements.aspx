<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoronaExpStatements.aspx.cs" Inherits="PrasarNet.Corona_Exp.CoronaExpStatements" EnableEventValidation="false" MasterPageFile="~/Site1.Master" %>

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

        .grdtext {
            text-decoration-color: black;
            font-weight: bold;
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
        function onLoadHandler() {
            alert('loaded');
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
        <div id="diventry" runat="server" visible="true">
            <div class="row" style="margin: auto" runat="server" id="diventryform">

                <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
                <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div12">
                    <div runat="server" align="right" style="padding-right: 4px; padding-bottom: 10px; padding-top: 8px">
                        <asp:Button ID="Button1" runat="server" Text=" Home " class="btn select buttondocumentupload font2 grad4"
                            Style="color: Black; font-weight: bold" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="Button1_Click1" />
                    </div>
                    <div id="divnote" runat="server" align="left" style="padding-top: 2px; padding-left: 10px; padding-right: 50px;">
                    </div>
                    <div id="divexpentry" runat="server" visible="true" class="table-hover">
                        <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                            <asp:Label ID="Label4" runat="server" Text="Entry for the Expenditure Incurred on COVID-l9" CssClass="fontheader1" Style="font-weight: bold; color: Black;"></asp:Label>
                            &nbsp;
                        </div>
                        <table class="table table table-bordered grad2">
                            <tr>
                                <td width="30%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label runat="server" Font-Bold="true" Text="Information Asked By" ForeColor="black" CssClass="font2"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="50%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:Label runat="server" Font-Bold="true" Text="Finance division, AIR, sobudgetair@gmail.com" ForeColor="Black" CssClass="font2"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label runat="server" Font-Bold="true" Text="Info ID/File No" ForeColor="black" CssClass="font2"></asp:Label>

                                    &nbsp;
                                </td>
                                <td width="50%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:Label runat="server" Font-Bold="true" Text="7lll2020-B dated 16/09/2020" ForeColor="Black" CssClass="font2"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td width="30%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label runat="server" Font-Bold="true" Text="Subject" ForeColor="black" CssClass="font2"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="50%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:Label runat="server" Font-Bold="true" Text="Seeking inputs for Rajya Sabha Question No. U1945 regarding Expenditure made on COVID-l9 - reg" ForeColor="Black" CssClass="font2"></asp:Label>

                                </td>
                            </tr>

                            <tr>
                                <td width="30%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label runat="server" Font-Bold="true" Text="Reference" ForeColor="black" CssClass="font2"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="50%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:Label runat="server" Font-Bold="true" Text="Reference is invited to Ministry of Information & Broadcasting letter No. H1101713312020-8. " ForeColor="Black" CssClass="font2"></asp:Label>
                                    <asp:LinkButton runat="server" Font-Bold="true" Text=" (Download)" ForeColor="Blue" CssClass="font2" OnClick="Unnamed9_Click"></asp:LinkButton>

                                </td>
                            </tr>
                            <tr>
                                <td width="30%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label ID="lblDept" runat="server" Text="Financial Year" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="50%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:DropDownList ID="ddlfinyear" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true"
                                        ValidationGroup="sub" Height="30px" AppendDataBoundItems="true">
                                    </asp:DropDownList>

                                    <asp:RequiredFieldValidator ID="rfvdept" runat="server" ControlToValidate="ddlfinyear" ValidationGroup="sub"
                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                        Font-Bold="true" Font-Size="Medium">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label ID="Label3" runat="server" Text="Official figure for the total expenditure of your station so far in fighting COVIDI9" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="50%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:TextBox ID="txtofficial" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub"
                                        Height="30px" AppendDataBoundItems="true">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvsection" runat="server" ControlToValidate="txtofficial"
                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sub"
                                        Font-Bold="true" Font-Size="Medium">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtofficial" Display="Dynamic" ValidationGroup="sub"
                                        ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Numbers Allowed)!!" Font-Size="Small" ForeColor="Black" Style="font-weight: 700"
                                        ValidationExpression="^[0-9]\d{0,9}?%?$" />
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender2" runat="server"
                                        targetcontrolid="txtofficial" validchars="1234567890">
                                    </ajaxtoolkit:filteredtextboxextender>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label ID="Label9" runat="server" Text="Total Capital Expenditure incurred by your station so far is in the selected financial vear" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="50%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:TextBox ID="txttotalexp" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true"
                                        ValidationGroup="sub" Height="30px" AppendDataBoundItems="true">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txttotalexp" ValidationGroup="sub"
                                        Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                        Font-Bold="true" Font-Size="Medium">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txttotalexp" Display="Dynamic" ValidationGroup="sub"
                                        ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Numbers Allowed)!!" Font-Size="Small" ForeColor="Black" Style="font-weight: 700"
                                        ValidationExpression="^[0-9]\d{0,9}?%?$" />
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                        targetcontrolid="txttotalexp" validchars="1234567890">
                                    </ajaxtoolkit:filteredtextboxextender>
                                </td>
                            </tr>
                            <tr>
                                <td width="30%" align="right" style="padding-right: 30px">
                                    <asp:Label ID="Label13" runat="server" Text="Expenditure Occured on the Procurement of Masks and PPE kits for Health Care Workers and Other Front Line Workers" ForeColor="Black"
                                        class="font2" Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="50%" align="left" style="padding-left: 15px">
                                    <asp:TextBox ID="txtexponmasks_PPE" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true"
                                        ValidationGroup="sub" Height="30px" AppendDataBoundItems="true">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                        ControlToValidate="txtexponmasks_PPE" ForeColor="Red" SetFocusOnError="True" Font-Bold="true" Font-Size="Medium"
                                        Display="Dynamic" ValidationGroup="sub">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtexponmasks_PPE" Display="Dynamic" ValidationGroup="sub"
                                        ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Numbers Allowed)!!" Font-Size="Small" ForeColor="Black" Style="font-weight: 700"
                                        ValidationExpression="^[0-9]\d{0,9}?%?$" />
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender3" runat="server"
                                        targetcontrolid="txtexponmasks_PPE" validchars="1234567890">
                                    </ajaxtoolkit:filteredtextboxextender>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 10px">
                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" Font-Size="Large" class="btn select buttondocumentupload" ValidationGroup="sub"
                                        Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnsubmit_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" />
                                </td>
                                <td align="left" style="padding-left: 10px">
                                    <asp:Button ID="btncncl" runat="server" Text="Clear" Font-Size="Large" class="btn select gradbody buttondocumentupload"
                                        Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
                <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
            </div>
        </div>
        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto">
            <div align="center" class="col-md-1 col-sm-1 col-lg-1" runat="server" id="div5">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10 " runat="server"
                id="div6">
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="font-size: medium; font-weight: bold; color: Black">:: Details of Expenditure Incurred on COVID-l9 ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <div style="text-align: center">
                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn gradbody" CausesValidation="False" OnClick="btnprint1_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                            <br />
                            <br />
                        </div>
                        <asp:GridView ID="grdexp" runat="server" AutoGenerateColumns="false" BackColor="#F8F9F9"
                            AllowPaging="true" Width="98%" DataKeyNames="id"
                            EmptyDataText=".. No Records Found .." ShowHeaderWhenEmpty="True" EmptyDataRowStyle-CssClass="font2 grdtext"
                            ToolTip="Issue Tapes List" PageSize="10" OnPageIndexChanging="grdexp_PageIndexChanging" OnRowCommand="grdexp_RowCommand" OnRowEditing="grdexp_RowEditing" OnRowUpdated="grdexp_RowUpdated" OnRowUpdating="grdexp_RowUpdating">

                            <columns>
                                <asp:TemplateField HeaderText="S.No.">
                                    <itemtemplate>
                                        <div align="center">
                                            <asp:Label ID="lblSNo" Font-Bold="True" runat="server" Text='<%#Container.DataItemIndex+1 %>' class="font2" />
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Financial Year">
                                    <itemtemplate>
                                        <div style="padding: 15px" runat="server" align="center">
                                            <asp:Label ID="lblfingrd" runat="server" Font-Bold="True" ForeColor="Black" Text='<%#Eval("Year") %>' class="font2" />
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Official figure for the total expenditure of your station so far in fighting COVIDI9">
                                    <itemtemplate>
                                        <div style="padding: 15px" runat="server" align="center">
                                            <asp:Label ID="lbloffgrd" runat="server" Font-Bold="True" ForeColor="Black" Text='<%#Eval("OfficialTotalExp") %>' class="font2" />
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Capital Expenditure incurred by your station so far is in the selected financial vear">
                                    <itemtemplate>
                                        <div style="padding: 15px" runat="server" align="center">
                                            <asp:Label ID="lbltotalgrd" runat="server" Font-Bold="True" ForeColor="Black" Text='<%#Eval("total_capital_exp_incurred_finyear") %>' class="font2" />
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Expenditure Occured on the Procurement of Masks and PPE kits for Health Care Workers and Other Front Line Workers ">
                                    <itemtemplate>
                                        <div style="padding: 15px" runat="server" align="center">
                                            <asp:Label ID="lblexpgrd" runat="server" Font-Bold="True" ForeColor="Black" Text='<%#Eval("exp_on_procurement_masks_n_PPE") %>' class="font2" />
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <itemtemplate>
                                        <div style="padding: 10px" align="center" runat="server">
                                            <asp:LinkButton ID="imgedit" CommandName="Edit" runat="server" CausesValidation="false"
                                                CssClass="btn btn-primary" ToolTip="Edit">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                                <span style="font-weight: bold; color: #000000"></span>
                                            </asp:LinkButton>
                                        </div>
                                    </itemtemplate>

                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>


                            </columns>
                            <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText font3"
                                wrap="True"></headerstyle>
                            <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                verticalalign="Middle" />
                            <pagersettings position="TopAndBottom" />
                            <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                borderwidth="2" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div align="center" class="col-md-1 col-sm-1 col-lg-1" runat="server" id="div111">
            </div>
        </div>
    </div>
</asp:Content>
