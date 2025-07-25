<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GEMProcurement.aspx.cs" Inherits="PrasarNet.GEMProcurement" MasterPageFile="~/Site1.Master" %>

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

        .gradfooter {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            background: radial-gradient(#F5DA81, #D8D8D8);
            -webkit-radial-gradient;
            /* background: linear-gradient(to right, orange, red);*/
        }

        .grad2 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .grad2rev {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #F7B070, #E67E22);
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
    <div class="content gradbody">
        <div class="row" style="padding: 10px 0px 0px 0px; margin: auto">
            <div class="col-lg-6 col-md-6 sm-6" style="padding-left: 25px; padding-left: 35px;" align="left">
                <asp:Label ID="Label3" ForeColor="Black" Font-Bold="true" CssClass="font2"
                    runat="server" Text="DDO Office"></asp:Label>
                <asp:Label ID="Label8" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>:</span></asp:Label>
                <asp:Label ID="Label13" class=" font2 captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <br />
                <br />
            </div>
            <div class="col-lg-6 col-md-6 sm-6" style="padding-left: 25px; padding-right: 35px;">
                <asp:Label ID="Label1" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label2" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome" Font-Size="Medium"></asp:Label>
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
                <asp:Label ID="Label43" Style="font-weight: bold; font-size: x-large; color: Black; background-color: lightyellow"
                    runat="server" Text=":: GeM Procurements ::"></asp:Label>
                <br />
                <br />
            </div>
            <div id="Div2" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" OnClick="btnback_Click"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>

        <%--   <asp:UpdatePanel runat="server">
        <ContentTemplate>--%>
        <div class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div4">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div122">
                <div runat="server">
                    <table>
                        <tr>
                            <td align="center" width="100%">

                                <div id="divoptions" runat="server" class="row" style="margin: auto">
                                    <div class="col-lg-4 col-md-4" runat="server" style="padding-bottom: 10px">
                                        <asp:LinkButton ID="btneditddo" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#A3E4D7" OnClick="btneditddo_Click" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                            <span style="font-weight: bold; color: #000000">Edit Linked DDO</span></asp:LinkButton>

                                    </div>



                                    <div class="col-lg-4 col-md-4" style="padding-left: 15px; padding-bottom: 10px">
                                        <asp:LinkButton ID="lnkdownload" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#4196F8" OnClick="lnkdownload_Click" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                            <span style="font-weight: bold; color: #000000">Download Manual</span></asp:LinkButton>
                                        <%--<asp:LinkButton CssClass="font2" Font-Bold="true" ForeColor="Blue" ID="" runat="server" ></asp:LinkButton>--%>
                                    </div>
                                    <div class="col-lg-4 col-md-4" style="padding-right: -1px; padding-bottom: 10px">
                                        <asp:LinkButton ID="btngemreports" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="220px" BackColor="#F5B7B1" OnClick="btngemreports_Click" Visible="false" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                            <span style="font-weight: bold; color: #000000">GeM Procurement Reports</span></asp:LinkButton>
                                        <asp:LinkButton ID="lnkcheck" runat="server" CssClass="btn gradbody" CausesValidation="false" Enabled="false"
                                            Width="150" Visible="true">
                                            <span style="font-weight: bold; color: white"></span>
                                        </asp:LinkButton>

                                    </div>
                                </div>

                            </td>

                        </tr>
                    </table>
                </div>
                <br />

                <div class="row table table-bordered grad2rev" style="margin: auto; padding: 10px">
                    <div class="col-lg-2 col-md-2 col-sm-2" style="padding-top: 5px; padding-bottom: 5px; top: 0px; left: 0px;">
                        <asp:Label ID="Label44" runat="server" Text="Month" ForeColor="Black" class="font"
                            Style="font-weight: bold;"></asp:Label>
                        &nbsp;
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3" style="padding-top: 5px; padding-bottom: 5px">

                        <asp:DropDownList ID="ddlmonth" runat="server" AppendDataBoundItems="true" AutoPostBack="false" class="select widthofboxes" ClientIDMode="Static" Height="30px" ValidationGroup="next" Font-Bold="True" Font-Size="Medium">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" class="font" ControlToValidate="ddlmonth" Display="Dynamic" ErrorMessage="Pls. Select a Month" ForeColor="Black" SetFocusOnError="True" ValidationGroup="next" Font-Bold="True"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2" style="padding-top: 5px; padding-bottom: 5px; top: 0px; left: 0px;">
                        <asp:Label ID="Label45" runat="server" Text="Financial Year" ForeColor="Black" class="font"
                            Style="font-weight: bold;"></asp:Label>
                        &nbsp;
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3" style="padding-top: 5px; padding-bottom: 5px">
                        <asp:DropDownList ID="ddlyear" runat="server" AppendDataBoundItems="true" AutoPostBack="false" class="select widthofboxes" ClientIDMode="Static" Height="30px" ValidationGroup="next" Font-Bold="True" Font-Size="Medium">
                        </asp:DropDownList>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" class="font" ControlToValidate="ddlyear" Display="Dynamic" ErrorMessage="Pls. Select a Year" ForeColor="Black" SetFocusOnError="True" ValidationGroup="next" Font-Bold="True"></asp:RequiredFieldValidator>

                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-2" style="padding-top: 5px; padding-bottom: 5px">
                        <asp:Button ID="btnsubmit0" runat="server" class="btn select button111" OnClick="btnsubmit0_Click" Style="background-color: #99FFCC; color: Black; font-weight: bold" Text="Next&gt;&gt;" ValidationGroup="next" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" />

                    </div>


                </div>
                <asp:Label ID="Lblmsg" runat="server" Style="font-weight: 700; color: #FF0000; font-size: medium;"></asp:Label>

            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div6">
            </div>

        </div>

        <br />
        <div class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div7">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div12" visible="false" style="padding-top: 25px; padding-bottom: 25px; margin-left: 20px; margin-right: 20px; border: medium groove #000000">
                <asp:Label ID="Label12" runat="server" Style="font-weight: 700; color: White; font-size: medium"
                    Text=""></asp:Label>
                <div id="divgemprocuremententry" runat="server" visible="true" class="table-hover">
                    <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 10px; padding-bottom: 10px">
                        <asp:Label ID="Label4" runat="server" Text="New Entry" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                        &nbsp;
                    </div>

                    <div id="tblgementry2" runat="server">
                        <hr>
                        <div class="row grad2" style="margin: auto; padding-top: 12px; padding-bottom: 2px">
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label17" runat="server" Text="1. Total No. of Orders/Contracts Placed for Goods and Services(Inc GeM & Non-GeM)" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                            <br />
                                <br />
                                <asp:TextBox ID="txttotalnoOrders_Inc_GEM_NonGEM" runat="server" autocomplete="off" style="padding: 5px" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvtotal_Gem_NonGem" runat="server" ControlToValidate="txttotalnoOrders_Inc_GEM_NonGEM"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    Font-Size="Large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="revtotal_Gem_NonGem" ControlToValidate="txttotalnoOrders_Inc_GEM_NonGEM" ValidationExpression="\d{1,4}"
                                    ErrorMessage="Numeric Upto 4 Digits are allowed!!" Font-Bold="True" ForeColor="Black" Font-Size="Small" />

                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label18" runat="server" Text="2. Total Contract Value for Total Orders Placed Inc. GeM & Non-GeM (In Rs)" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txttotalcontractValue" runat="server" autocomplete="off" style="padding: 5px" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvtotalcontactval" runat="server" ControlToValidate="txttotalcontractValue"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    Font-Size="Large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revtotalcontactval" runat="server" ValidationExpression="^[0-9]\d{0,9}?%?$"
                                    ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Integers Allowed)!!"
                                    ControlToValidate="txttotalcontractValue" Font-Bold="True" ForeColor="Black" Font-Size="Small" />
                            </div>

                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="lblwing" runat="server" Text="3. Number of Order Placed Through GeM" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <br />
                                <asp:TextBox ID="txtorderplacedGEM" runat="server" autocomplete="off" class="select widthofboxes" style="padding: 5px" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvwing" runat="server" ControlToValidate="txtorderplacedGEM"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    Font-Size="Large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="rexorderNumber" ControlToValidate="txtorderplacedGEM" ValidationExpression="\d{1,4}"
                                    ErrorMessage="Numeric Upto 4 Digits are allowed!!" Font-Bold="True" ForeColor="Black" Font-Size="Small" />

                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="lblFrom" runat="server" Text="4. Total Amount Of Procurement (On GeM) (in Rs)" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                            <br />
                                <br />

                                <asp:TextBox ID="txtamountprocuremnt_GEM" runat="server" autocomplete="off" class="select widthofboxes" style="padding: 5px" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>


                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtamountprocuremnt_GEM"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    Font-Size="Large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="Regexgemamnt" runat="server" ValidationExpression="^[0-9]\d{0,9}?%?$"
                                    ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Integers Allowed)!!"
                                    ControlToValidate="txtamountprocuremnt_GEM" Font-Bold="True" ForeColor="Black" Font-Size="Small" />
                            </div>
                        </div>
                        <hr>
                        <div class="row grad2" style="margin: auto; padding-top: 5px; padding-bottom: 2px">
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label19" runat="server" Text="5. Payments made for Total No. of Orders/Contracts placed for Goods &amp; Services (inc. GeM &amp; Non_GeM) (in Rs)" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtpaymentmadefortotalorders" runat="server" autocomplete="off" class="select widthofboxes" style="padding: 5px" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvtxtpaymentmadefortotalorders" runat="server" ControlToValidate="txtpaymentmadefortotalorders"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    Font-Size="Large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revtxtpaymentmadefortotalorders" runat="server" ValidationExpression="^[0-9]\d{0,9}?%?$"
                                    ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Integers Allowed)!!"
                                    ControlToValidate="txtpaymentmadefortotalorders" Font-Bold="True" ForeColor="Black" Font-Size="Small" />
                            </div>

                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label20" runat="server" Text="6. Payments made for Total No. of Orders/Contracts placed for Goods &amp; Services (only GeM) (in Rs)" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtpaymentmadeforGeMorders" runat="server" autocomplete="off" class="select widthofboxes" style="padding: 5px" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvtxtpaymentmadeforGeMorders" runat="server" ControlToValidate="txtpaymentmadeforGeMorders"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    font-size="Large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revtxtpaymentmadeforGeMorders" runat="server" ValidationExpression="^[0-9]\d{0,9}?%?$"
                                    ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Integers Allowed)!!"
                                    ControlToValidate="txtpaymentmadeforGeMorders" Font-Bold="True" ForeColor="Black" Font-Size="Small" />
                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label21" runat="server" Text="7 (a).i. Number Of GeM Orders against which payments are affected within 10 Days Of CRAC" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                               <br />
                                <br />
                                <asp:TextBox ID="txtgemorderpaymentsareaffected_10days" runat="server" autocomplete="off" style="padding: 5px" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtgemorderpaymentsareaffected_10days"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    Font-Size="Large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" Font-Bold="True" ForeColor="Black" Font-Size="Small"
                                    ControlToValidate="txtgemorderpaymentsareaffected_10days" ValidationExpression="\d{1,4}" ErrorMessage="Numeric Upto 4 Digits are allowed!!" />

                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label5" runat="server" Text="7 (a).ii. Payments made for Number Of GeM Orders against which payments are affected within 10 Days Of CRAC (in Rs)" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtpaymntsgemorderpaymentsareaffected_10days" runat="server" autocomplete="off" style="padding: 5px" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpaymntsgemorderpaymentsareaffected_10days"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-size: large; font-weight: 700">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^[0-9]\d{0,9}?%?$"
                                    ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Integers Allowed)!!"
                                    ControlToValidate="txtpaymntsgemorderpaymentsareaffected_10days" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />
                            </div>
                        </div>
                        <hr>
                        <div class="row grad2" style="margin: auto; padding-top: 5px; padding-bottom: 2px">
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label7" runat="server" Text="7 (b).i. Number Of GeM Orders against which payments are affected within 20 Days Of CRAC" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtgemorderpaymentsareaffected_20days" runat="server" style="padding: 5px" autocomplete="off" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtgemorderpaymentsareaffected_20days"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-weight: 700; font-size: large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ControlToValidate="txtgemorderpaymentsareaffected_20days"
                                    ValidationExpression="\d{1,4}" ErrorMessage="Numeric Upto 4 Digits are allowed!!" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />

                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label9" runat="server" Text="7 (b).ii. Payments made for Number Of GeM Orders against which payments are affected within 20 Days Of CRAC (in Rs)" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtpaymntsgemorderpaymentsareaffected_20days" style="padding: 5px" runat="server" autocomplete="off" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtpaymntsgemorderpaymentsareaffected_20days"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-size: large; font-weight: 700">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationExpression="^[0-9]\d{0,9}?%?$"
                                    ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Integers Allowed)!!"
                                    ControlToValidate="txtpaymntsgemorderpaymentsareaffected_20days" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />
                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label22" runat="server" Text="7 (c).i. Number Of GeM Orders against which payments are affected within 30 Days Of CRAC" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtgemorderpaymentsareaffected_30days" runat="server" style="padding: 5px" autocomplete="off" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtgemorderpaymentsareaffected_30days"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-size: large; font-weight: 700">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator5" ControlToValidate="txtgemorderpaymentsareaffected_30days"
                                    ValidationExpression="\d{1,4}" ErrorMessage="Numeric Upto 4 Digits are allowed!!" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />

                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label23" runat="server" Text="7 (c).ii. Payments made for Number Of GeM Orders against which payments are affected within 30 Days Of CRAC (in Rs)" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtpaymntsgemorderpaymentsareaffected_30days" runat="server" style="padding: 5px" autocomplete="off" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtpaymntsgemorderpaymentsareaffected_30days"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-size: large; font-weight: 700">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ValidationExpression="^[0-9]\d{0,9}?%?$"
                                    ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Integers Allowed)!!"
                                    ControlToValidate="txtpaymntsgemorderpaymentsareaffected_30days" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />
                            </div>
                        </div>
                        <hr>
                        <div class="row grad2" style="margin: auto; padding-top: 5px; padding-bottom: 2px">
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label24" runat="server" Text="8. Number Of GeM Orders declined by Seller" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <br />
                                <asp:TextBox ID="txtnoofGeMOrdersDelinedByseller" runat="server" autocomplete="off" style="padding: 5px" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtnoofGeMOrdersDelinedByseller"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-size: large; font-weight: 700">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator7" ControlToValidate="txtnoofGeMOrdersDelinedByseller"
                                    ValidationExpression="\d{1,4}" ErrorMessage="Numeric Upto 4 Digits are allowed!!" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />


                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label25" runat="server" Text="9. Number Of GeM Orders accepted by Seller but not Delivered in expected Time" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtnoofGeMOrdersacceptedBysellernotdel" runat="server" style="padding: 5px" autocomplete="off" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtnoofGeMOrdersacceptedBysellernotdel"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-weight: 700; font-size: large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator8" ControlToValidate="txtnoofGeMOrdersacceptedBysellernotdel"
                                    ValidationExpression="\d{1,4}" ErrorMessage="Numeric Upto 4 Digits are allowed!!" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />


                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label27" runat="server" Text="10. Number Of Rejection due to Inferior/NonConfiming Supplies" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtnorejdurtoinferiorsup" runat="server" style="padding: 5px" autocomplete="off" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtnorejdurtoinferiorsup"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-size: large; font-weight: 700">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator9" ControlToValidate="txtnorejdurtoinferiorsup"
                                    ValidationExpression="\d{1,4}" ErrorMessage="Numeric Upto 4 Digits are allowed!!" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />


                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label28" runat="server" Text="11. Number Of incidents raised against Sellers" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtnoofincidentsraisedagasellers" runat="server" style="padding: 5px" autocomplete="off" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtnoofincidentsraisedagasellers"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-size: large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator10" ControlToValidate="txtnoofincidentsraisedagasellers"
                                    ValidationExpression="\d{1,4}" ErrorMessage="Numeric Upto 4 Digits are allowed!!" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />

                            </div>
                        </div>
                        <hr>
                        <div class="row grad2" style="margin: auto; padding-top: 5px; padding-bottom: 2px">
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label29" runat="server" Text="12. Number Of Incidents resolved/closed out(Out of mentioned in previous row entry)" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                            <br />
                                <br />
                                <asp:TextBox ID="txtnoincidentsresolvedraisedagainstsellers" style="padding: 5px" runat="server" autocomplete="off" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtnoincidentsresolvedraisedagainstsellers"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-size: small">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator11" ControlToValidate="txtnoincidentsresolvedraisedagainstsellers"
                                    ValidationExpression="\d{1,4}" ErrorMessage="Numeric Upto 4 Digits are allowed!!" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />

                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label30" runat="server" Text="13. Number Of Incidents raised by sellers against Deptt." ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                                <br />
                                <br />
                                <asp:TextBox ID="txtnoofincidentsraisedbysellersagadeptt" style="padding: 5px" runat="server" autocomplete="off" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtnoofincidentsraisedbysellersagadeptt"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-size: large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator12" ControlToValidate="txtnoofincidentsraisedbysellersagadeptt"
                                    ValidationExpression="\d{1,4}" ErrorMessage="Numeric Upto 4 Digits are allowed!!" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />

                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label31" runat="server" Text="14. Number Of Incidents resolved/closed out(Out of mentioned in previous row entry)" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                            <br />
                                <br />
                                <asp:TextBox ID="txtnoincidentsresolvedraisedBysellers" style="padding: 5px" runat="server" autocomplete="off" class="select widthofboxes" Height="30px" ForeColor="Black" Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtnoincidentsresolvedraisedBysellers"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font" style="font-size: large">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator13" ControlToValidate="txtnoincidentsresolvedraisedBysellers"
                                    ValidationExpression="\d{1,4}" ErrorMessage="Numeric Upto 4 Digits are allowed!!" ForeColor="Black" Font-Size="Small" style="font-weight: 700" />

                            </div>
                            <div class="col-lg-3 col-md-3" align="left">
                                <asp:Label ID="Label49" runat="server" Text="15. Any other matter of relevance" ForeColor="Black" Font-Size="small"
                                    Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                &nbsp;
                            <br />

                                <asp:TextBox ID="txtanyothermatterofrelevance" runat="server" class="select widthofboxes" Height="85px" ForeColor="Black" Font-Bold="true" Font-Size="Small"
                                    TextMode="MultiLine" style="padding: 5px">
                                </asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtanyothermatterofrelevance" ForeColor="Red" SetFocusOnError="True" class="font"
                                    Display="Dynamic" style="font-size: large">
                                </asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ID="RegularExpressionValidator45" runat="server" ErrorMessage="Description can't exceed by 500 Latters!!"
                                    ControlToValidate="txtanyothermatterofrelevance" ValidationExpression="^[\s\S\d]{1,500}$"
                                    Display="Dynamic" ForeColor="Black" Font-Size="Small" style="font-weight: 700">
                                </asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <hr>
                        <div style="margin: auto; padding-top: 5px; background-color: #FAD7A0; padding-bottom: 8px" align="center" class="row grad3">
                            <div class="col-lg-1 col-md-1" runat="server" align="center">
                            </div>
                            <div class="col-lg-10 col-md-10" runat="server" align="center">
                                &nbsp;&nbsp;
                                <asp:Button ID="btnupdate" runat="server" Text="Update" class="btn select button111"
                                    Style="background-color: #99FFCC; margin: 3px; color: Black; font-weight: bold" OnClick="btnupdate_Click" Visible="False" OnClientClick="return confirm('Are you sure to Update?');" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" />
                                <asp:Button ID="btnsubmit" runat="server" class="btn select button111" OnClick="btnsubmit_Click" Style="background-color: #99FFCC; margin: 3px; color: Black; font-weight: bold" Text="Submit" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" />
                                &nbsp;&nbsp;
                               
                                    <asp:Button ID="btncncl" runat="server" Text="Clear" class="btn select button111"
                                        Style="color: Black; margin: 3px; font-weight: bold; background-color: #3F8FEC;" CausesValidation="False" OnClick="btncncl_Click" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" />

                                <asp:Button ID="btncancelforedit" runat="server" CausesValidation="False" class="btn select gradbody button111" OnClick="btncancelforedit_Click" Style="color: Black; margin: 3px; font-weight: bold" Text="Cancel" Visible="False" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px" />



                            </div>
                            <div class="col-lg-1 col-md-1" runat="server" align="center">
                            </div>
                        </div>

                    </div>





                    <%--<tr runat="server" visible="false">
                            <td width="40%" align="right" style="padding-right: 30px">
                                <asp:Label ID="Label5" runat="server" Text="Total Amount Of Procurement (Other Than GeM)" ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>&nbsp;
                            </td>
                            <td width="60%" align="left" style="padding-left: 15px">
                                <asp:TextBox ID="txtamountprocuremnt_otherGEM" runat="server" autocomplete="off" class="select widthofboxes" Height="22px" AutoPostBack="True" OnTextChanged="txtamountprocuremnt_otherGEM_TextChanged"></asp:TextBox>

                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtamountprocuremnt_otherGEM"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$"
                                    ErrorMessage="Numeric Data upto two decimal places are allowed (including integers)"
                                    ControlToValidate="txtamountprocuremnt_otherGEM" Style="font-weight: 700; color: #FF0000" />
                            </td>
                        </tr>--%>
                    <%--<tr  runat="server" visible="false">
                            <td width="40%" align="right" style="padding-right: 30px">
                                <asp:Label ID="Label7" runat="server" Text="Percentage Of Procurement through GeM vis-a-vis Total Procurement" ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>&nbsp;
                            </td>
                            <td width="60%" align="left" style="padding-left: 15px">
                                <asp:LinkButton ID="btncalculate" runat="server" CausesValidation="False" OnClick="btncalculate_Click">
                    
                    <span style="font-weight: bold; color: blue">Click here to calculate Percentage</span></asp:LinkButton>
                                <br />
                                <br />
                                <asp:TextBox ID="txtpercentageofProcurement" runat="server" autocomplete="off" class="select widthofboxes" Height="22px" ReadOnly="True"></asp:TextBox>

                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorll3" runat="server" ControlToValidate="txtpercentageofProcurement"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                    class="font"></asp:RequiredFieldValidator>
                                <%-- <asp:Label ID="lblpercentageofProcurement" runat="server" Text="" ForeColor="Black" class="font"
                                        Style="font-weight: bold; color: #0000FF;"></asp:Label>--%>

                    <%-- </td>
                        </tr>--%>

                    <%--<tr  runat="server" visible="false">
                            <td width="40%" align="right" style="padding-right: 30px">
                                <asp:Label ID="lblconauth" runat="server" Text="Total Number of Transactions pending for payment on GeM" ForeColor="Black"
                                    class="font" Style="font-weight: bold;"></asp:Label>&nbsp;
                            </td>
                            <td width="60%" align="left" style="padding-left: 15px">
                                <asp:TextBox ID="txtnumberofTransPending_GEM" runat="server" class="select widthofboxes" Height="22px"
                                    autocomplete="off"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="rfvconv" runat="server" ControlToValidate="txtnumberofTransPending_GEM"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="rexorderNumberl0" runat="server" ControlToValidate="txtnumberofTransPending_GEM" ErrorMessage="Numeric Upto 3 Digits are allowed!!" Style="color: #FF0000; font-weight: 700" ValidationExpression="\d{1,3}" />
                            </td>
                        </tr>--%>
                    <%--<tr  runat="server" visible="false">
                            <td width="40%" align="right" style="padding-right: 30px" class="auto-style2">
                                <asp:Label ID="lbltotalamountpending_GEM" runat="server" Text="Total Amount of Transactions pending for payment on GeM" ForeColor="Black"
                                    class="font" Style="font-weight: bold;"></asp:Label>&nbsp;
                            </td>
                            <td width="60%" align="left" style="padding-left: 15px" class="auto-style2">
                                <asp:TextBox ID="txttotalamountpending_GEM" runat="server" class="select widthofboxes" Height="22px"
                                    autocomplete="off"></asp:TextBox>

                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txttotalamountpending_GEM" ErrorMessage="Numeric Data upto two decimal places are allowed (including integers)" Style="font-weight: 700; color: #FF0000" ValidationExpression="((\d+)((\.\d{1,2})?))$" />

                                <br />
                                <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="*"
                                    ControlToValidate="txttotalamountpending_GEM" ForeColor="Red" SetFocusOnError="True" class="font"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>--%>

                    <%--<tr  runat="server" visible="false">
                            <td width="40%" align="right" style="padding-right: 30px">
                                <asp:Label ID="lblreasonsforDelay" runat="server" Text="Reasons for Delay in making Payment" ForeColor="Black" class="font"
                                    Style="font-weight: bold;"></asp:Label>&nbsp;
                            </td>
                            <td width="60%" align="left" style="padding-left: 15px">
                                <asp:TextBox ID="txtreasonsforDelay" runat="server" class="select widthofboxes" Height="90px"
                                    TextMode="MultiLine"></asp:TextBox>
                                <br />
                                <%-- <asp:RequiredFieldValidator ID="rfvreasons" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtreasonsforDelay" ForeColor="Red" SetFocusOnError="True" class="font"
                                    Display="Dynamic"></asp:RequiredFieldValidator>--%>

                    <%--  <asp:RegularExpressionValidator ID="revreasons" runat="server" ErrorMessage="Reasons can't exceed by 500 Letters!!"
                                    Style="color: #FF0000" ControlToValidate="txtreasonsforDelay" ValidationExpression="^[\s\S\d]{1,500}$"
                                    Display="Dynamic" class="font"></asp:RegularExpressionValidator>
                                <br />
                                <asp:RequiredFieldValidator ID="rfvww2" runat="server" class="font" ControlToValidate="txtreasonsforDelay" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>--%>
                    <%--<tr  runat="server" visible="false">
                            <td width="40%" align="right" style="padding-right: 30px">
                                <asp:Label ID="Label9" runat="server" Text="Steps Taken to Rectify Delay" ForeColor="Black"
                                    class="font" Style="font-weight: bold;"></asp:Label>&nbsp;
                            </td>
                            <td width="60%" align="left" style="padding-left: 15px">
                                <asp:TextBox ID="txtstepforrectification" runat="server" class="select widthofboxes" Height="90px"
                                    TextMode="MultiLine"></asp:TextBox>
                                <br />
                                <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                ControlToValidate="txtstepforrectification" ForeColor="Red" SetFocusOnError="True" class="font"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>

                    <%--   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Description can't exceed by 500 Letters!!"
                                    Style="color: #FF0000" ControlToValidate="txtstepforrectification" ValidationExpression="^[\s\S\d]{1,500}$"
                                    Display="Dynamic" class="font"></asp:RegularExpressionValidator>
                                <br />
                                <asp:RequiredFieldValidator ID="rfv233" runat="server" class="font" ControlToValidate="txtstepforrectification" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>--%>
                </div>

            </div>


            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div11">
            </div>
        </div>
        <br />
        <br />
        <div class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div13">
            </div>
            <%--style="padding-top: 25px;padding-bottom:25px;margin-left:20px;margin-right:20px;border: medium groove #000000"--%>
            <div id="divgrd" visible="false" align="center" class=" col-md-10 col-sm-10 col-lg-10" style="overflow: auto"
                runat="server">
                <%--  <div  runat="server" class="row" style="margin: auto">--%>
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="font-weight: bold; color: Black;" class="font2">:: Entry Details ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <div id="divprisearch" style="text-align: center" runat="server" visible="true">
                            <table width="100%">
                                <tr>
                                    <td align="center" width="100%" style="padding: 12px">
                                        <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="90px" BackColor="#F5B7B1" OnClick="btnprint1_Click" Visible="false" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                            <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                        <asp:LinkButton ID="lnkbtnsearch" runat="server" CssClass="btn" CausesValidation="False" ForeColor="Blue" Font-Bold="true" Font-Size="Medium"
                                            Width="320px" BackColor="#ABEBC6" OnClick="lnkbtnsearch_Click" OnClientClick="return confirm('After forwarding this record, you will be unable to edit the data. Do you still want to forward?');" BorderColor="#999999" BorderStyle="Groove" BorderWidth="2px">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-search"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                    </td>
                                    <%--<td align="left" style="padding-left: 10px" width="50%">
                                            
                                        </td>
                                        <td></td>--%>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </div>
                        <asp:GridView ID="grdgemprocDetails" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                            DataKeyNames="gem_transid" PageSize="10" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                            HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="94%"
                            ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnPageIndexChanging="grdgemprocDetails_PageIndexChanging" OnRowCommand="grdgemprocDetails_RowCommand" OnRowEditing="grdgemprocDetails_RowEditing">
                            <alternatingrowstyle backcolor="White" />
                            <columns>
                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <asp:LinkButton ID="imgedit" CommandName="Edit" runat="server" CausesValidation="false"
                                            CssClass="btn btn-primary" ToolTip="Edit">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                        <%--<asp:LinkButton ID="Imgdelete" CommandName="Delete" runat="server" CausesValidation="false"
                                                CssClass="btn btn-danger" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete?');">
                    <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-trash"></span>
                    <span style="font-weight: bold; color: #000000"></span></asp:LinkButton>--%>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Black" />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total No Of Orders Placed(Inc GeM & Non-GeM)" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                            <asp:Label ID="Label16" runat="server" Font-Italic="true" Text='<%#Eval("TotalNoofOrders_ContractsPlaced_inc_GEM_NonGEM")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Contract Value(In Rs)" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                            <asp:Label ID="lbltotalcontractval" runat="server" Font-Italic="true" Text='<%#Eval("TotalContractValue_GEM_NonGEM")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No. Of Orders Placed through GeM" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                            <asp:Label ID="lblordersplacedthrGEM" runat="server" Font-Italic="true" Text='<%#Eval("No_Of_OrdersPlaced_byGEM")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Amount of Procurement (ON GeM)" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <%--   <asp:Label ID="Label24" runat="server" Text="Designation(To)" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label25" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                            <asp:Label ID="Label26" Font-Italic="true" runat="server" Text='<%#Eval("TotalAmountofProcurement_GEM") %>'
                                                ForeColor="Black" Font-Bold="true" class="fontingrid" />
                                            <%--<asp:Label ID="lbldpcid" runat="server" Text='<%#Eval("DPCid") %>' Visible="false"
                                                Font-Size="Smaller" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Payments made for total No of Orders(In Rs)" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                            <asp:Label ID="lblpaymntmadefortotalgemnongem" runat="server" Font-Italic="true" Text='<%#Eval("PaymentmadefortotalNoofOrders_Gem_NONGem")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Payments made against the Orders placed through GeM(In Rs)" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                            <asp:Label ID="lblpaymntmadeforgem" runat="server" Font-Italic="true" Text='<%#Eval("PaymentmadeforNoofOrders_Gem")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 10 Days Of CRAC (with Amount)" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding: 8px">
                                            <asp:Label ID="lblnum1" runat="server" Text="Number" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbld1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lblnum11" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_10DaysofCRAC")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <br />

                                            <asp:Label ID="lblamt1" runat="server" Text="Amount" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbld2" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lblamt11" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_10DaysofCRAC")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 20 Days Of CRAC (with Amount)" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <asp:Label ID="lblnum2" runat="server" Text="Number" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbld3" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lblnum22" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_20DaysofCRAC")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <br />

                                            <asp:Label ID="lblamt2" runat="server" Text="Amount" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbld4" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lblamt22" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_20DaysofCRAC")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Number Of GeM Orders against which payments are affected within 30 Days Of CRAC (with Amount)" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <asp:Label ID="lblnum3" runat="server" Text="Number" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbld5" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lblnum33" runat="server" Font-Italic="true" Text='<%#Eval("NoofGEMOrdersagainst_paymntaffect_30DaysofCRAC")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <br />

                                            <asp:Label ID="lblamt3" runat="server" Text="Amount" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbld6" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lblamt33" runat="server" Font-Italic="true" Text='<%#Eval("AmtofGEMOrdersagainst_paymntaffect_30DaysofCRAC")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="No Of GeM Orders Declined By Seller" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 5px; padding-right: 5px">

                                            <asp:Label ID="Label344" Font-Bold="true" runat="server" Text='<%#Eval("NoofGEMOrdersDeclinedBySeller") %>'
                                                ForeColor="Black" class="fontingrid" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No of GeM Orders accepted by seller but not delivered within expected time" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <asp:Label ID="Label121" Font-Bold="true" runat="server" Text='<%#Eval("NoofGEMOrdersAcceptedBySellerbutNotDeliveredin_ExpecDate") %>'
                                            ForeColor="Black" class="fontingrid" />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="No of rejection due to non-confirming supplies" ItemStyle-Width="15%">
                                    <itemtemplate>
                                        <div style="padding-left: 5px; padding-right: 5px">
                                            <asp:Label ID="Label11s" Font-Bold="true" runat="server" Text='<%#Eval("NoOfRejectionduetoinferior_nonConfirmingSupply") %>'
                                                ForeColor="Black" class="fontingrid" />

                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No of Incidents Raised against Seller & Resolved" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 5px; padding-right: 5px">
                                            <asp:Label ID="lblnoofincidentsraS" runat="server" Text="Incidents Raised" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbld7" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lblnum44" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsRaisedAgainstSellers")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <br />

                                            <asp:Label ID="lblres1" runat="server" Text="Incident Resolved" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbld8" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="lblres11" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsresolved_closedOut_asraisedagainstsellers")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="No of Incidents Raised By Seller & Resolved" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 5px; padding-right: 5px">
                                            <asp:Label ID="lblincrased" runat="server" Text="Incidents Raised" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplbllon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="Label1632" runat="server" Font-Italic="true" Text='<%#Eval("NoofIncidentsRaisedBySellersagainstDeptt")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                            <br />

                                            <asp:Label ID="lblnoofincid2entsraSresolved" runat="server" Text="Incident Resolved" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="Label323" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="Label342" runat="server" Font-Italic="true" Text='<%#Eval("Noofincidentsresolved_closedout_asraisedbysellers")  %>'
                                                ForeColor="Black" Font-Bold="true" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Any other Matter of Relevance" ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <div style="padding-left: 5px; padding-right: 5px">
                                            <asp:Label ID="Labeloo3" ForeColor="Black" Font-Bold="true" runat="server" Text='<%#Eval("AnyOthersMattersofRelevance") %>'
                                                class="fontingrid" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>

                            </columns>
                            <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                wrap="True"></headerstyle>
                            <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                verticalalign="Middle" />
                            <pagersettings position="TopAndBottom" />
                            <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                borderwidth="2" />
                        </asp:GridView>
                        <br />
                        <br />
                    </div>
                </div>
                <%--</div>--%>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div14">
            </div>
        </div>
        <div class="container-fluid style1 gradfooter" id="gradfooter1" runat="server" align="center">
            <div class="row" style="padding-top: 10px; padding-bottom: 10px; margin: auto;">


                <%-- This site can be best viewed in IE 9 and above And Chrome. To check your browser version click here <br />--%>
                <div style="padding-bottom: 10px">
                    <span style="color: black; font-weight: bold;" class="font2">For any suggestions and query, You may contact</span>
                </div>

                <span style="color: black; font-weight: bold;" class="font">Technical Support: Priyank Saxena, hris@prasarbharati.gov.in</span>
                <br />
                <span style="color: black; font-weight: bold;" class="font">Operational Support: GA-1 Section Prasar Bharati,23118430/22,associatega1@gmail.com</span>
                <br />



            </div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>

    <%-- </ContentTemplate>

    </asp:UpdatePanel>--%>
</asp:Content>
