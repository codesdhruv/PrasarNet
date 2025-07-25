<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DPCStatusEntry.aspx.cs"
    Inherits="PrasarNet.DPCStatusEntry" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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

        .auto-style2 {
            font-size: medium;
        }

        .blink_me {
            animation: blinker 4s linear infinite;
        }

        @keyframes blinker {
            50% {
                opacity: 0;
            }
        }

        .auto-style3 {
            height: 47px;
        }

        .auto-style4 {
            height: 43px;
        }

        .gradnewbutton2 {
            background: linear-gradient(to right, #F99B62, #E67E22);
            -webkit-radial-gradient;
        }

        .aligncenter {
            align-content: center;
            text-align: center;
        }

        .alignleft {
            align-content: flex-start;
            text-align: left;
        }

        .alignright {
            align-content: flex-end;
            text-align: right;
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
                    <asp:Label ID="Label14" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="PrasarNet"></asp:Label>

                    <br />

                    <asp:Label ID="Label87" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="(प्रसार नेट)"></asp:Label>

                </div>
                <div>
                    <asp:Image ID="Image2" runat="server" class="img-responsive" Height="100%" align="center"
                        ImageUrl="~/images/Azadi.png" Width="100px" />
                </div>
            </div>

            <br />
            <asp:Label ID="Label88" runat="server" class="fontheader1" ForeColor="Blue" Font-Bold="false" Text=" An Intranet for Prasar Bharati Employees"></asp:Label>

        </div>
        <div class="col-xs-3 col-lg-3 text-center" style="padding-right: 25px; padding-top: 12px; padding-bottom: 5px">
            <asp:Image ID="Image1" runat="server" class="img-responsive pull-right" Width="123px" Height="100%"
                ImageAlign="Right" ImageUrl="~/images/pblogo.png" />
        </div>

    </div>
    <div id="Div10" class="row" style="margin: auto" runat="server">

        <div id="AdminMenu" visible="true" runat="server" class="sticky">
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
        <%--    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnsubmit" />
              
            </Triggers>
            <ContentTemplate>--%>
        <div id="diventry" runat="server" visible="true">
            <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto">
                <div id="Div5" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="center">
                    <br />
                    <br />
                    <br />
                </div>
                <div id="Div3" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="center">
                    <br />
                    <asp:Label ID="Label43" Style="font-weight: bold; font-size: xx-large; color: Black; background-color: lightyellow"
                        runat="server" Text=":: DPC Status ::"></asp:Label>
                    <br />
                    <br />
                </div>
                <div id="Div2" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="right">
                    <br />
                    <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False"
                        OnClick="btnback_Click">
                        <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
                    <br />
                    <br />
                </div>
            </div>
            <div id="divgenusers" runat="server" visible="false" style="margin-top: 10px; margin-right: 40px; margin-left: 40px; margin-bottom: 00px">

                <div align="center" class="row">

                    <div runat="server" id="div24" style="padding-top: 5px;" class="col-lg-12 aligncenter">
                        <asp:LinkButton ID="lnkdownload_genuser" runat="server" CssClass="btn gradnewbutton2" CausesValidation="False"
                            Width="220px" OnClick="LinkButton3_Click" Height="35px">
                            <span style="font-weight: bold; color: #000000;">Download Manual</span></asp:LinkButton>
                    </div>
                    <div runat="server" id="div23" style="padding-top: 5px" class="col-lg-6" visible="false">
                        <asp:LinkButton ID="lnkaddnew_genuser" runat="server" CssClass="btn gradnewbutton2" CausesValidation="False"
                            Width="220px" OnClick="lnkaddnew_genuser_Click" Height="35px">
                            <span style="font-weight: bold; color: #000000">Add New DPC</span></asp:LinkButton>
                    </div>

                    <div runat="server" id="div22" class="col-lg-3"></div>

                    <div runat="server" id="div26" class="col-lg-3">
                    </div>

                </div>
            </div>
            <div id="divpbrb" runat="server" visible="false" style="margin-top: 10px; margin-right: 40px; margin-left: 40px">

                <div align="center" style="padding-top: 3px;" class="row">
                    <div runat="server" id="div19" class="col-lg-2"></div>
                    <div runat="server" id="div18" style="padding-top: 10px" class="col-lg-2">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn gradnewbutton2" CausesValidation="False"
                            Width="200px" OnClick="LinkButton1_Click" Height="35px">
                            <span style="font-weight: bold; color: #000000">Add New DPC</span></asp:LinkButton>
                    </div>
                    <div runat="server" id="div17" style="padding-top: 10px" class="col-lg-2">
                        <asp:LinkButton ID="lnkdownloadmanualforPBRB" runat="server" CssClass="btn gradnewbutton2" CausesValidation="False"
                            Width="200px" OnClick="lnkdownloadmanualforPBRB_Click" Height="35px">
                            <span style="font-weight: bold; color: #000000">Download Manual</span></asp:LinkButton>
                    </div>
                    <div runat="server" id="divallentry" style="padding-top: 10px" class="col-lg-2">
                        <asp:Button ID="btnreport" runat="server" Text="All Users Entry Details" class="btn select gradnewbutton2" Width="200px"
                            Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btnreport_Click" Height="35px" />
                        <asp:Button ID="btnsearchallpbrb" runat="server" Text="Search in All Users Entry" class="btn select gradnewbutton2" Width="200px"
                            Style="color: Black; font-weight: bold" CausesValidation="False" Visible="false" OnClick="btnsearchallpbrb_Click" Height="35px" />
                    </div>
                    <div runat="server" id="divclose" style="padding-top: 10px" class="col-lg-2">
                        <asp:Button ID="btnclosepbrb" runat="server" Text="Back" class="btn select gradnewbutton2" Width="200px"
                            Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btnclosepbrb_Click" Height="35px" />
                        <asp:Button ID="btnbackall" runat="server" Text="Back" class="btn select gradnewbutton2" Width="200px"
                            Style="color: Black; font-weight: bold" CausesValidation="False" Visible="false" OnClick="btnbackall_Click" Height="35px" />
                    </div>
                    <div runat="server" id="div20" class="col-lg-2"></div>
                </div>
            </div>

            <div runat="server" id="diventryform" style="border: medium groove #000000; margin-top: 10px; margin-right: 27px; margin-left: 38px; margin-bottom: 10px">
                <div class="row" style="margin: auto">
                    <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
                    <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div12">
                        <asp:Label ID="Label12" runat="server" Style="font-weight: 700; color: White; font-size: medium"
                            Text=""></asp:Label>
                        <div id="divdpcentry" runat="server" visible="false" class="table-hover">
                            <div runat="server" align="right" style="padding: 8px">
                                <asp:Button ID="btncloseDPCEntry" runat="server" Text="X Close" class="btn select gradnewbutton2" Width="110px" Font-Size="Medium"
                                    Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncloseDPCEntry_Click" />
                            </div>
                            <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 4px; padding-bottom: 4px">
                                <asp:Label ID="Label4" runat="server" Text="New Entry" Style="font-weight: bold; font-size: x-large; color: Black;"></asp:Label>
                                &nbsp;
                            </div>
                            <table class="table table table-bordered grad2">
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                        <asp:Label ID="lblwing" runat="server" Text="Wing" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                        <asp:DropDownList ID="ddlwing" runat="server" AutoPostBack="True" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true"
                                            Height="28px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlwing_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvwing" runat="server" ControlToValidate="ddlwing"
                                            Display="Dynamic" ErrorMessage="Pls. Select a Wing." ForeColor="Red" SetFocusOnError="True"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblFrom" runat="server" Text="Designation(From)" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddldesgnfrom" runat="server" AutoPostBack="true" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true"
                                            Height="28px" AppendDataBoundItems="true" ClientIDMode="Static" OnSelectedIndexChanged="ddldesgnfrom_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <%--onchange="myfunc(this.value)"--%>
                                        <%--   &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddldesgnfrom"
                                    Display="Dynamic" ErrorMessage="Pls. Select a Designation" ForeColor="Red" SetFocusOnError="True"
                                    class="font"></asp:RequiredFieldValidator>--%>
                                        <br />
                                        <br />

                                        <asp:ListBox ID="lstsharewith" runat="server" class="select widthofboxes1" Height="138px" Font-Size="medium" Font-Bold="true"
                                            SelectionMode="Multiple"></asp:ListBox>

                                        <br />
                                        <br />
                                        <asp:Button ID="btnClear" runat="server" Text="Clear" Font-Size="medium" Font-Bold="true" Width="150px" CssClass="btn select" CausesValidation="False" OnClick="btnClear_Click" BackColor="#99FF99" />

                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label5" runat="server" Text="Designation(To)" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddldesgnto" runat="server" AutoPostBack="false" class="select widthofboxes1" Font-Size="medium" Font-Bold="true"
                                            Height="28px" AppendDataBoundItems="true" ClientIDMode="Static">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddldesgnto"
                                            Display="Dynamic" ErrorMessage="Pls. Select a Designation" ForeColor="Red" SetFocusOnError="True"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label74" runat="server" Text="Sectt/Directorate/Zonal(for Section)" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlmasterofficeofsection" runat="server" AutoPostBack="True" class="select widthofboxes1" Font-Size="medium" Font-Bold="true"
                                            Height="28px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlmasterofficeofsection_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlmasterofficeofsection"
                                            Display="Dynamic" ErrorMessage="Pls. Select a valid Master O/o Section" ForeColor="Red" SetFocusOnError="True"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label7" runat="server" Text="Name of Section" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlsection" runat="server" AutoPostBack="false" class="select widthofboxes1" Font-Size="medium" Font-Bold="true"
                                            Height="28px" AppendDataBoundItems="true">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlsection"
                                            Display="Dynamic" ErrorMessage="Pls. Select a Section" ForeColor="Red" SetFocusOnError="True"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblconauth" runat="server" Text="Convening Authority" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlconvauth" runat="server" AutoPostBack="false" class="select widthofboxes1" Font-Size="medium" Font-Bold="true"
                                            Height="28px" AppendDataBoundItems="true">
                                        </asp:DropDownList>
                                        <%-- <asp:TextBox ID="txtconauth" runat="server" class="select widthofboxes1" Height="22px"
                                                autocomplete="off"></asp:TextBox>--%>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvconv" runat="server" ControlToValidate="ddlconvauth"
                                            Display="Dynamic" ErrorMessage="Convening Authority Required!!" ForeColor="Red"
                                            SetFocusOnError="True" class="font">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblDPCPendingfrom" runat="server" Text="DPC Year(Pending) From" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtdpcfrom" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true"
                                            autocomplete="off" MaxLength="9">
                                        </asp:TextBox>
                                        <%-- <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy"
                                    TargetControlID="txtdpcfrom" />--%>
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderThours" runat="server"
                                            targetcontrolid="txtdpcfrom" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>

                                        <br />
                                        <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Year Reqd!!"
                                            ControlToValidate="txtdpcfrom" ForeColor="Red" SetFocusOnError="True" class="font"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtdpcfrom"
                                        class="font2" Display="Dynamic" ErrorMessage="Pl. Enter a Valid Year" ForeColor="Red"
                                        ValidationExpression="\d{9}"></asp:RegularExpressionValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label8" runat="server" Text="DPC Year(Pending) To" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtDPCto" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true"
                                            autocomplete="off" MaxLength="9">
                                        </asp:TextBox>
                                        <%--<ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="dd-MM-yyyy"
                                    TargetControlID="txtDPCto" />--%>
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                            targetcontrolid="txtDPCto" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Year Reqd!!"
                                            ControlToValidate="txtDPCto" ForeColor="Red" SetFocusOnError="True" class="font"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                        <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtDPCto"
                                        class="font2" Display="Dynamic" ErrorMessage="Pl. Enter a Valid Year" ForeColor="Red"
                                        ValidationExpression="\d{4}"></asp:RegularExpressionValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblLO" runat="server" Text="Whether Confirmed by LO" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">

                                        <ContentTemplate>--%>
                                        <asp:DropDownList ID="ddlconfirmedbyLO" runat="server" AutoPostBack="true" class="select widthofboxes1" Font-Size="medium" Font-Bold="true"
                                            Height="28px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlconfirmedbyLO_SelectedIndexChanged">
                                            <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                            <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Valid Option Reqd!!"
                                            ControlToValidate="ddlconfirmedbyLO" ForeColor="Red" SetFocusOnError="True" class="font"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                        <%-- </ContentTemplate>
                                    </asp:UpdatePanel>--%>

                                        <div runat="server" id="divLOupload" style="padding-top: 10px; padding-bottom: 10px" visible="false">
                                            <asp:FileUpload ID="FileUpload1" runat="server" class="select widthofboxes1" Height="22px" Font-Size="Medium" Font-Bold="true" />
                                            &nbsp;<span style="color: red; font-weight: bold; font-size: small">(Optional)</span>
                                            <asp:Label ID="lblexception" Visible="true" runat="server" Text="" CssClass="fontingrid" Font-Bold="true" ForeColor="Red"></asp:Label>
                                        </div>


                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label77" runat="server" Text="Target Date of Completion" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtD_O_C" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium" Font-Bold="true"
                                            autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10">
                                        </asp:TextBox>
                                        <%--   <asp:ImageButton ID="imgbtnCalendar" runat="server" Height="100%" Width="32px" ImageUrl="~/images/cal.png"
                                    AlternateText="Calender" CausesValidation="false" />--%>
                                        <ajaxtoolkit:calendarextender id="txtD_O_C_CalendarExtender" runat="server" behaviorid="txtD_O_C_CalendarExtender"
                                            format="dd-MM-yyyy" targetcontrolid="txtD_O_C" />
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender4" runat="server"
                                            targetcontrolid="txtD_O_C" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Date Reqd!!"
                                            ControlToValidate="txtD_O_C" ForeColor="Red" SetFocusOnError="True" class="font"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>



                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblsenlistava" runat="server" Text="Whether Updated Seniority List is Available?" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:RadioButtonList ID="rblsenlist" runat="server" CellPadding="10" CellSpacing="10" RepeatDirection="Horizontal" Width="170px" Font-Bold="True" Font-Size="Medium">
                                            <asp:ListItem Text="No" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1" Selected="false"></asp:ListItem>
                                        </asp:RadioButtonList>



                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label79" runat="server" Text="Whether Vigilance Clearance has been obtained?" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:RadioButtonList ID="rblvig" runat="server" CellPadding="10" CellSpacing="10" RepeatDirection="Horizontal" Width="170px" Font-Bold="True" Font-Size="Medium">
                                            <asp:ListItem Text="No" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1" Selected="false"></asp:ListItem>
                                        </asp:RadioButtonList>



                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label80" runat="server" Text="Whether requisite ACRs/APARs are available?" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:RadioButtonList ID="rblAPAR" runat="server" CellPadding="10" CellSpacing="10" RepeatDirection="Horizontal" Width="170px" Font-Bold="True" Font-Size="Medium">
                                            <asp:ListItem Text="No" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1" Selected="false"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label81" runat="server" Text="Whether the DPC has been constituted as per R/Rs?" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:RadioButtonList ID="rblRR" runat="server" CellPadding="10" CellSpacing="10" RepeatDirection="Horizontal" Width="170px" Font-Bold="True" Font-Size="Medium">
                                            <asp:ListItem Text="No" Value="0" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1" Selected="false"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <%--<tr>
                                        <td width="40%" align="right" style="padding-right: 30px">
                                            <asp:Label ID="Label75" runat="server" Text="Whether Confirmed by LO" ForeColor="Black" class="font"
                                                Style="font-weight: bold;"></asp:Label>&nbsp;
                                        </td>
                                        <td width="60%" align="left" style="padding-left: 15px">
                                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" class="select widthofboxes1"
                                                Height="22px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlconfirmedbyLO_SelectedIndexChanged">
                                                <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                <asp:ListItem Value="0" Text="No"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="Yes"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                                ControlToValidate="ddlconfirmedbyLO" ForeColor="Red" SetFocusOnError="True" class="font"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                            <div runat="server" id="div17" style="padding-top: 10px; padding-bottom: 10px" visible="false">
                                                <asp:FileUpload ID="FileUpload2" runat="server" class="select widthofboxes1" Height="22px" />
                                                <asp:Label ID="Label76" Visible="true" runat="server" Text="" CssClass="fontingrid" Font-Bold="true" ForeColor="Red"></asp:Label>
                                            </div>


                                        </td>
                                    </tr>--%>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblstaofDPC" runat="server" Text="Status Of DPC" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtstatus" runat="server" class="select font2" Height="200px" Width="90%" Font-Bold="true"
                                            TextMode="MultiLine">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvtitle" runat="server" ErrorMessage="Status Required!!"
                                            ControlToValidate="txtstatus" ForeColor="Red" SetFocusOnError="True" class="font"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="revtitle" runat="server" ErrorMessage="Status can not exceed by 500 Letters!!"
                                            Style="color: #FF0000" ControlToValidate="txtstatus" ValidationExpression="^[\s\S\d]{1,500}$"
                                            Display="Dynamic" class="font">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label9" runat="server" Text="Reason For Pending (If any)" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtreason" runat="server" class="select font2" Height="200px" Width="90%"
                                            TextMode="MultiLine">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Reason Required!!"
                                            ControlToValidate="txtreason" ForeColor="Red" SetFocusOnError="True" class="font"
                                            Display="Dynamic">
                                        </asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Reason can not exceed by 500 Letters!!"
                                            Style="color: #FF0000" ControlToValidate="txtreason" ValidationExpression="^[\s\S\d]{1,500}$"
                                            Display="Dynamic" class="font">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label13" runat="server" Text="Remarks (If any)" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtrmk" runat="server" class="select font2" Height="200px" Width="90%"
                                            TextMode="MultiLine">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Remarks can not exceed by 500 Letters!!"
                                            Style="color: #FF0000" ControlToValidate="txtrmk" ValidationExpression="^[\s\S\d]{1,500}$"
                                            Display="Dynamic" class="font">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 10px">
                                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn select buttondocumentupload"
                                            Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnsubmit_Click" />
                                    </td>
                                    <td align="left" style="padding-left: 10px">
                                        <asp:Button ID="btncncl" runat="server" Text="Clear" class="btn select gradbody buttondocumentupload"
                                            Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" />
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="divsearch" runat="server" style="padding-top: 20px" visible="false" class="table-hover">

                            <div id="Div4" runat="server" align="center" class="grad3" style="padding-top: 4px; padding-bottom: 4px">
                                <asp:Label ID="Label35" runat="server" Text="Search" Font-Bold="true" Font-Size="Large" Style="color: Black;"></asp:Label>
                                &nbsp;
                            </div>

                            <table class="table table table-bordered grad2">
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label86" runat="server" Text="Status" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlstatussearch" runat="server" class="select widthofboxes1" Font-Size="medium"
                                            Height="28px" AppendDataBoundItems="true">
                                            <asp:ListItem Text="--All--" Value=""></asp:ListItem>
                                            <asp:ListItem Text="DPC-Closed" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="DPC-Not Closed" Value="1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label36" runat="server" Text="Wing" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlwingseacrh" runat="server" AutoPostBack="True" class="select widthofboxes1" Font-Size="medium"
                                            Height="28px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlwingseacrh_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <%-- <tr>
                            <td width="40%" align="right" style="padding-right: 30px" class="auto-style1">
                                <asp:Label ID="Label37" runat="server" Text="Designation(From)" ForeColor="Black"
                                    class="font" Style="font-weight: bold;"></asp:Label>&nbsp;
                            </td>
                            <td width="60%" align="left" style="padding-left: 15px" class="auto-style1">
                                <asp:DropDownList ID="ddldesgnfromsearch" runat="server" AutoPostBack="True" class="select widthofboxes1"
                                    Height="22px" AppendDataBoundItems="true" ClientIDMode="Static" OnSelectedIndexChanged="ddldesgnfromsearch_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>--%>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label38" runat="server" Text="Designation(To)" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddldesgntosearch" runat="server" AutoPostBack="false" class="select widthofboxes1" Font-Size="medium"
                                            Height="28px" AppendDataBoundItems="true" ClientIDMode="Static">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label78" runat="server" Text="Sectt/Directorate/Zonal(for Section)" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlmasteroOSecSearch" runat="server" AutoPostBack="True" class="select widthofboxes1" Font-Size="medium"
                                            Height="28px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlmasteroOSecSearch_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label39" runat="server" Text="Section" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlsectionsearch" runat="server" AutoPostBack="false" class="select widthofboxes1" Font-Size="medium"
                                            Height="28px" AppendDataBoundItems="true">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label40" runat="server" Text="Convening Authority" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlconauthsearch" runat="server" AutoPostBack="false" class="select widthofboxes1" Font-Size="medium"
                                            Height="28px" AppendDataBoundItems="true">
                                        </asp:DropDownList>

                                        <%--   <asp:TextBox ID="txtconauthsearch" runat="server" class="select widthofboxes1" Height="22px"
                                        autocomplete="off"></asp:TextBox>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px" class="auto-style4">
                                        <asp:Label ID="Label41" runat="server" Text="DPC Year(Pending) From" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px" class="auto-style4">
                                        <asp:TextBox ID="txtdpcfromsearch" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium"
                                            autocomplete="off" MaxLength="9">
                                        </asp:TextBox>
                                        <%-- <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy"
                                    TargetControlID="txtdpcfrom" />--%>
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender2" runat="server"
                                            targetcontrolid="txtdpcfromsearch" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label42" runat="server" Text="DPC Year(Pending) To" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:TextBox ID="txtDPCtosearch" runat="server" class="select widthofboxes1" Height="28px" Font-Size="medium"
                                            autocomplete="off" MaxLength="9">
                                        </asp:TextBox>
                                        <%-- <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MM-yyyy"
                                    TargetControlID="txtdpcfrom" />--%>
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender3" runat="server"
                                            targetcontrolid="txtDPCtosearch" validchars="0123456789-">
                                        </ajaxtoolkit:filteredtextboxextender>
                                        <%-- <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" Format="dd-MM-yyyy"
                                    TargetControlID="txtDPCtosearch" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label82" runat="server" Text="Whether Updated Seniority List Available?" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlsensearch" runat="server" AutoPostBack="false" class="select widthofboxes1" Font-Size="medium"
                                            Height="28px" AppendDataBoundItems="true">
                                            <asp:ListItem Text="--All--" Value=""></asp:ListItem>
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        </asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label83" runat="server" Text="Whether Vigilance Clearance has been obtained?" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlvigsearch" runat="server" AutoPostBack="false" class="select widthofboxes1" Font-Size="medium"
                                            Height="28px" AppendDataBoundItems="true">
                                            <asp:ListItem Text="--All--" Value=""></asp:ListItem>
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        </asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label84" runat="server" Text="Whether requisite ACRs/APARs are available?" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlaparsearch" runat="server" AutoPostBack="false" class="select widthofboxes1" Font-Size="medium"
                                            Height="28px" AppendDataBoundItems="true">
                                            <asp:ListItem Text="--All--" Value=""></asp:ListItem>
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        </asp:DropDownList>


                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 30px">
                                        <asp:Label ID="Label85" runat="server" Text="Whether DPC has constituted as per RRs?" ForeColor="Black"
                                            class="font" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 15px">
                                        <asp:DropDownList ID="ddlRRsSearch" runat="server" AutoPostBack="false" class="select widthofboxes1" Font-Size="medium"
                                            Height="28px" AppendDataBoundItems="true">
                                            <asp:ListItem Text="--All--" Value=""></asp:ListItem>
                                            <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        </asp:DropDownList>


                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 10px">
                                        <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn select buttondocumentupload"
                                            Style="background-color: #99FFCC; color: Black; font-weight: bold; height: 36px;" OnClick="btnsearch_Click" />
                                    </td>
                                    <td align="left" style="padding-left: 10px">
                                        <asp:Button ID="btnsearchclose" runat="server" Text="Close" class="btn select gradbody buttondocumentupload"
                                            Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btnsearchclose_Click" />
                                        <asp:Button ID="btnsearchclear" runat="server" Text="Clear" class="btn select gradbody buttondocumentupload"
                                            Style="color: Black; font-weight: bold" CausesValidation="False" Visible="false"
                                            OnClick="btnsearchclear_Click" />
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
                </div>
            </div>


            <div class="row" style="margin: auto; padding: 18px 30px 30px 30px">
                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                <div id="divgrd" visible="true" align="center" class=" col-md-12 col-sm-12 col-lg-12"
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
                                        <td align="right" style="padding-right: 10px" width="50%">
                                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                                Width="90px" BackColor="#F5B7B1" OnClick="btnprint_Click">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                                <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                        </td>
                                        <td align="left" style="padding-left: 10px" width="50%">
                                            <asp:LinkButton ID="lnkbtnsearch" runat="server" CssClass="btn" CausesValidation="False"
                                                Width="95px" BackColor="#ABEBC6" OnClick="lnkbtnsearch_Click">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-search"></span>
                                                <span style="font-weight: bold; color: #000000">Search</span></asp:LinkButton>
                                            <asp:LinkButton ID="lnknewentry" runat="server" CssClass="btn" CausesValidation="False"
                                                Visible="false" Width="115px" BackColor="#ABEBC6"
                                                OnClick="lnknewentry_Click">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-list-alt"></span>
                                                <span style="font-weight: bold; color: #000000">New Entry</span></asp:LinkButton>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                            </div>
                            <asp:GridView ID="grddoc" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                DataKeyNames="DPCid" PageSize="25" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="98%"
                                ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnPageIndexChanging="grddoc_PageIndexChanging"
                                OnRowCommand="grddoc_RowCommand" OnRowDeleted="grddoc_RowDeleted" OnRowDeleting="grddoc_RowDeleting"
                                OnRowEditing="grddoc_RowEditing" OnRowCancelingEdit="grddoc_RowCancelingEdit" OnRowUpdating="grddoc_RowUpdating"
                                OnRowDataBound="grddoc_RowDataBound">
                                <%--  <AlternatingRowStyle BackColor="White" />--%>
                                <columns>
                                    <asp:TemplateField HeaderText="S.No.">
                                        <itemtemplate>
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Black" CssClass="fontingrid" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation(From)">
                                        <itemtemplate>
                                            <div style="padding-left: 10px">
                                                <%--<asp:Label ID="lbldegnfrom" runat="server" Text="Designation(From)" Font-Size="9pt"
                                                Font-Bold="true" ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                <asp:Label ID="Label16" runat="server" Font-Italic="true" Text='<%#Eval("fromdesignation")  %>' CssClass="fontingrid"
                                                    ForeColor="Black" Font-Bold="true" />
                                                <%--<asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("Createdon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                                <asp:Label ID="lblstatushidden" Font-Italic="true" runat="server" Text='<%#Eval("statusfinal") %>'
                                                    ForeColor="Black" class="fontingrid" Font-Bold="true" Visible="false" />
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Designation(To)">
                                        <itemtemplate>
                                            <div style="padding-left: 10px">
                                                <%--   <asp:Label ID="Label24" runat="server" Text="Designation(To)" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label25" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                <asp:Label ID="Label661" Font-Italic="true" runat="server" Text='<%#Eval("todesgn") %>'
                                                    ForeColor="Black" class="fontingrid" Font-Bold="true" />
                                                <%--<asp:Label ID="lbldpcid" runat="server" Text='<%#Eval("DPCid") %>' Visible="false"
                                                Font-Size="Smaller" />--%>
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Section/Convening Authority">
                                        <itemtemplate>
                                            <div style="padding: 8px">
                                                <%-- <asp:Label ID="Label75" runat="server" Text="Master O/o Section" Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="Label76" runat="server" Text=" : " Font-Size="Smaller" />
                                                <asp:Label ID="Label78" Font-Bold="true" runat="server" Text='<%#Eval("secname") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                                <br />--%>
                                                <asp:Label ID="Label2" runat="server" Text="Section" Font-Size="8pt" Font-Bold="true" ForeColor="Brown" />
                                                <asp:Label ID="Label5" runat="server" Text=" : " Font-Size="Smaller" />
                                                <asp:Label ID="Label344" Font-Bold="true" runat="server" Text='<%#Eval("secname") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                                <br />
                                                <asp:Label ID="Label22" runat="server" Text="Section Head" Font-Size="8pt" Font-Bold="true" ForeColor="Brown" />
                                                <asp:Label ID="Label23" runat="server" Text=" : " Font-Size="Smaller" />
                                                <asp:Label ID="Label24" Font-Bold="true" runat="server" Text='<%#Eval("HOO") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                                <br />
                                                <asp:Label ID="Label25" runat="server" Text="EMail" Font-Size="8pt" Font-Bold="true" ForeColor="Brown" />
                                                <asp:Label ID="Label27" runat="server" Text=" : " Font-Size="Smaller" />
                                                <asp:Label ID="Label28" Font-Bold="true" runat="server" Text='<%#Eval("sec_email") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                                <br />
                                                <asp:Label ID="Label29" runat="server" Text="Mobile No." Font-Size="8pt" Font-Bold="true" ForeColor="Brown" />
                                                <asp:Label ID="Label30" runat="server" Text=" : " Font-Size="Smaller" />
                                                <asp:Label ID="Label31" Font-Bold="true" runat="server" Text='<%#Eval("sec_mobile") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                                <br />
                                                <asp:Label ID="Label32" runat="server" Text="LL No." Font-Size="8pt" Font-Bold="true" ForeColor="Brown" />
                                                <asp:Label ID="Label33" runat="server" Text=" : " Font-Size="Smaller" />
                                                <asp:Label ID="Label34" Font-Bold="true" runat="server" Text='<%#Eval("sec_LL") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                                <br />
                                                <asp:Label ID="Label6" runat="server" Text="Convening Authority" Font-Size="8pt" ForeColor="Brown"
                                                    Font-Bold="true" />
                                                <asp:Label ID="Label7" runat="server" Text=" : " Font-Size="Smaller" />
                                                <asp:Label ID="Label20" Font-Bold="true" runat="server" Text='<%#Eval("conveningAuthority") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DPC(Pending) From">
                                        <itemtemplate>
                                            <%-- <asp:Label ID="Label9" runat="server" Text="DPC(Pending) From" Font-Size="Smaller" />
                                        <asp:Label ID="Label10" runat="server" Text=" : " Font-Size="Smaller" />--%>
                                            <asp:Label ID="Label11" Font-Bold="true" runat="server" Text='<%#Eval("DPCPendingfrom") %>'
                                                ForeColor="Black" class="fontingrid" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DPC(Pending) To">
                                        <itemtemplate>
                                            <asp:Label ID="Label19" Font-Bold="true" runat="server" Text='<%#Eval("DPCPendingTo") %>'
                                                ForeColor="Black" class="fontingrid" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Whether Confirmed by LO/ DOC">
                                        <itemtemplate>
                                            <asp:LinkButton ID="lnkconfirmedbyLO" Font-Bold="true" runat="server" Text='<%#Eval("ConfirmedbyLO") %>' CommandName="downloadLO"
                                                ForeColor="Blue" Font-Underline="true" class="fontingrid" CausesValidation="false" />
                                            <br />
                                            <br />
                                            <asp:Label ID="Label75" runat="server" Text="DOC" Font-Size="8pt" Font-Bold="true" ForeColor="Brown" />
                                            <asp:Label ID="Label76" runat="server" Text=" : " Font-Size="Smaller" />
                                            <asp:Label ID="lblgridDOC" Font-Bold="true" runat="server" Text='<%#Eval("DateofCompletion", "{0:dd-MMM-yyyy}") %>'
                                                ForeColor="Green" class="fontingrid" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status/Reasons for Pending(If Any)">
                                        <itemtemplate>
                                            <div style="padding-left: 5px; padding-right: 5px">
                                                <asp:Label ID="Label9" runat="server" Text="Status" ForeColor="Brown" Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="Label10" runat="server" Text=" : " Font-Size="Smaller" />
                                                <asp:Label ID="Label3" Font-Bold="true" runat="server" Text='<%#Eval("StatusofDPC") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                                <br />
                                                <br />
                                                <asp:Label ID="Label17" runat="server" Text="Reasons" ForeColor="Brown" Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="Label18" runat="server" Text=" : " Font-Size="Smaller" />
                                                <asp:Label ID="Label21" Font-Bold="true" runat="server" Text='<%#Eval("ReasonsforPending") %>'
                                                    ForeColor="Black" class="fontingrid" />
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="No.of Vacancies">
                                        <itemtemplate>
                                            <div align="left" style="padding-left: 5px; padding-right: 5px">
                                                <br />
                                                <asp:Label ID="Label49" runat="server" Text="Gen" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                <asp:Label ID="Label51" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                &nbsp;
                                            <asp:Label ID="Label52" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("gen") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label53" runat="server" Text="SC" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                <asp:Label ID="Label54" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                &nbsp;
                                            <asp:Label ID="Label55" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("sc") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label56" runat="server" Text="ST" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                <asp:Label ID="Label57" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                &nbsp;
                                            <asp:Label ID="Label58" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("st") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label59" runat="server" Text="OBC" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                <asp:Label ID="Label60" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                &nbsp;
                                            <asp:Label ID="Label61" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("obc") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label65" runat="server" Text="PH" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                <asp:Label ID="Label66" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                &nbsp;
                                            <asp:Label ID="Label67" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("ph") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label62" runat="server" Text="Sport" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                <asp:Label ID="Label63" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                &nbsp;
                                            <asp:Label ID="Label64" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("sport") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                <br />
                                                <asp:Label ID="Label68" runat="server" Text="Other" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                <asp:Label ID="Label69" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                &nbsp;
                                            <asp:Label ID="Label70" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("other") %>'
                                                Style="font-weight: bold;"></asp:Label>

                                                <br />
                                                <br />

                                                <asp:Label ID="Label45" runat="server" Text="Total" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                <asp:Label ID="Label46" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                    Style="font-weight: bold;"></asp:Label>
                                                &nbsp;
                                            <asp:Label ID="Label47" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("total") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="Label191" runat="server" Text="Add/View Vacancies" Style="font-weight: bold;" ForeColor="Blue"
                                                    CommandName="AddNoOfVacancy" Font-Underline="true" class="fontingrid" CausesValidation="false">
                                                </asp:LinkButton>
                                                <br />
                                                <br />
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks(If Any)">
                                        <itemtemplate>
                                            <div style="padding-left: 5px; padding-right: 5px">
                                                <asp:Label ID="Label243" ForeColor="Black" Font-Bold="true" runat="server" Text='<%#Eval("Remarks") %>'
                                                    class="fontingrid" />
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Additional Information(s)">
                                        <itemtemplate>
                                            <div style="padding-left: 5px; padding-right: 5px">

                                                <div style="padding-top: 25px; padding-bottom: 10px">
                                                    <asp:Label ID="Label491" runat="server" Text="Seniority List" ForeColor="Brown" Font-Size="Small"
                                                        Style="font-weight: bold;"></asp:Label>
                                                    <asp:Label ID="Label5111" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                        Style="font-weight: bold;"></asp:Label>
                                                    &nbsp;
                                            <asp:Label ID="Label521" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("seniorityListAvailable") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                </div>
                                                <div style="padding-top: 2px; padding-bottom: 10px">
                                                    <asp:Label ID="Label531" runat="server" Text="Vigilance Clearance" ForeColor="Brown" Font-Size="Small"
                                                        Style="font-weight: bold;"></asp:Label>
                                                    <asp:Label ID="Label541" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                        Style="font-weight: bold;"></asp:Label>
                                                    &nbsp;
                                            <asp:Label ID="Label551" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("VigilanceClearance") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                </div>
                                                <div style="padding-top: 2px; padding-bottom: 10px">
                                                    <asp:Label ID="Label561" runat="server" Text="ACR/APAR" ForeColor="Brown" Font-Size="Small"
                                                        Style="font-weight: bold;"></asp:Label>
                                                    <asp:Label ID="Label571" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                        Style="font-weight: bold;"></asp:Label>
                                                    &nbsp;
                                            <asp:Label ID="Label581" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("ACR_APAR_Available") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                </div>
                                                <div style="padding-top: 2px; padding-bottom: 20px">
                                                    <asp:Label ID="Label591" runat="server" Text="DPC as per R/Rs" ForeColor="Brown" Font-Size="Small"
                                                        Style="font-weight: bold;"></asp:Label>
                                                    <asp:Label ID="Label601" runat="server" Text=":" ForeColor="Black" class="fontingrid"
                                                        Style="font-weight: bold;"></asp:Label>
                                                    &nbsp;
                                            <asp:Label ID="Label611" runat="server" ForeColor="Black" class="fontingrid" Text='<%#Eval("DPC_constituted_asRR") %>'
                                                Style="font-weight: bold;"></asp:Label>
                                                </div>
                                                <br />
                                                <br />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Final Status">
                                        <edititemtemplate>
                                            <asp:Label ID="lblstatusfinaledit" Font-Italic="true" runat="server" Text='<%#Eval("statusfinal") %>'
                                                ForeColor="Black" class="fontingrid" Font-Bold="true" Visible="false" />
                                            <asp:DropDownList ID="ddlstatus" runat="server" CssClass="select" Width="100px" Font-Bold="true" Visible="true">
                                                <asp:ListItem Value="" Text="--Select--"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="Not Closed"></asp:ListItem>
                                                <asp:ListItem Value="0" Text="Closed"></asp:ListItem>
                                            </asp:DropDownList>
                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                                        ControlToValidate="ddlstatus" ForeColor="Red" SetFocusOnError="True" class="font2"
                                                        Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                        </edititemtemplate>
                                        <itemtemplate>
                                            <div style="padding-left: 5px; padding-right: 5px">
                                                <asp:Label ID="Label26" Font-Italic="true" runat="server" Text='<%#Eval("finalstatus") %>'
                                                    ForeColor="Black" class="fontingrid" Font-Bold="true" />
                                                <asp:Label ID="lblstatusfinal" Font-Italic="true" runat="server" Text='<%#Eval("statusfinal") %>'
                                                    ForeColor="Black" class="fontingrid" Font-Bold="true" Visible="false" />


                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Edit/Delete">
                                        <itemtemplate>
                                            <asp:LinkButton ID="imgedit" CommandName="Editp" runat="server" CausesValidation="false"
                                                CssClass="btn btn-primary" ToolTip="Edit">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                                <span style="font-weight: bold; color: #000000"></span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="Imgdelete" CommandName="Delete" runat="server" CausesValidation="false"
                                                CssClass="btn btn-danger" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete?');">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-trash"></span>
                                                <span style="font-weight: bold; color: #000000"></span>
                                            </asp:LinkButton>
                                            <asp:Label ID="Label71" Font-Italic="true" runat="server" Text="Final Status:"
                                                ForeColor="Black" class="fontingrid" Font-Bold="true" Visible="false" />
                                            &nbsp;
                                                    <asp:Label ID="lblstatusfinalforusers" Font-Italic="true" runat="server" Text='<%#Eval("finalstatus") %>'
                                                        ForeColor="Red" class="fontingrid" Font-Bold="true" Visible="false" />
                                            <br />
                                            <asp:Label ID="Label72" Font-Italic="true" runat="server" Text="Updated By:"
                                                ForeColor="Black" class="fontingrid" Font-Bold="true" Visible="false" />
                                            &nbsp;
                                                    <asp:Label ID="lblstatusfinalbyforusers" Font-Italic="true" runat="server" Text='<%#Eval("lastupdatedfinalstatusby") %>'
                                                        ForeColor="Red" class="fontingrid" Font-Bold="true" Visible="false" />
                                            <br />
                                            <asp:Label ID="Label73" Font-Italic="true" runat="server" Text="Updated On:"
                                                ForeColor="Black" class="fontingrid" Font-Bold="true" Visible="false" />
                                            &nbsp;
                                                    <asp:Label ID="lblstatusfinalonforusers" Font-Italic="true" runat="server" Text='<%#Eval("lastupdatedfinalstatuson") %>'
                                                        ForeColor="Red" class="fontingrid" Font-Bold="true" Visible="false" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Information Given By" Visible="false">
                                        <itemtemplate>
                                            <div style="padding-left: 10px">
                                                <%--   <asp:Label ID="Label24" runat="server" Text="Designation(To)" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label25" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />--%>
                                                <asp:Label ID="Label261" Font-Italic="true" runat="server" Text='<%#Eval("Informationgivenby") %>'
                                                    ForeColor="Blue" class="fontingrid" Font-Bold="true" />
                                                <%--<asp:Label ID="lbldpcid" runat="server" Text='<%#Eval("DPCid") %>' Visible="false"
                                                Font-Size="Smaller" />--%>
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit Final Status">
                                        <edititemtemplate>
                                            <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg"
                                                ToolTip="Update" Height="25px" Width="25px" Visible="true" />
                                            &nbsp;&nbsp;
                                    <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/Images/Cancel.png" Visible="true"
                                        ToolTip="Cancel" Height="25px" Width="25px" />
                                        </edititemtemplate>
                                        <itemtemplate>
                                            <%-- <asp:LinkButton ID="imgeditfinalstatus" CommandName="Editfinalstatus" runat="server" CausesValidation="false"
                                                        CssClass="btn btn-primary" ToolTip="Edit">
                    <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-pencil"></span>
                    <span style="font-weight: bold; color: #000000"></span></asp:LinkButton>--%>
                                            <asp:ImageButton ID="imgeditfinalstatus" CommandName="Edit" runat="server" ImageUrl="~/Images/Edit.png"
                                                ToolTip="Edit" AlternateText="Edit" Height="25px" Width="25px" Visible="true" />
                                            &nbsp;&nbsp;                                                  
                                                   
                                        </itemtemplate>

                                        <itemstyle horizontalalign="Center" />
                                        <headerstyle horizontalalign="Center" />
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
                        </div>
                    </div>
                    <%--</div>--%>
                </div>

                <%-- <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
            </div>
            <br />
            <br />


            <br />
        </div>
        <div id="divvacancy" runat="server" visible="false">

            <div runat="server" class="row" align="center" style="padding-top: 10px; padding-bottom: 10px">
                <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div13">
                </div>
                <div align="right" class="col-md-10 col-sm-10 col-lg-10" runat="server" style="padding-right: 18px"
                    id="div14">
                    <asp:Button ID="Button7" runat="server" class="btn grad4" Font-Bold="true" Font-Size="Large"
                        Text="Close" CausesValidation="false" OnClick="Button6_Click" />
                </div>
                <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div15">
                </div>
            </div>

            <%-- <div align="center">

                <h4 class="modal-title" style="font-weight: bold; color: Black">Add Vacancy</h4>
            </div>--%>


            <div id="div6" runat="server" class="row" clientidmode="Static">
                <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div11">
                </div>
                <div align="center" class="col-md-10 col-sm-10 col-lg-10" runat="server"
                    id="div71">

                    <div runat="server" align="center">
                        <%-- <div style="text-align: center">
                          
                        <asp:LinkButton ID="btnprint1" Style="background-color: #F1948A" runat="server" 
                                CssClass="btn" CausesValidation="False"> <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>                   
                        </div>--%>
                        <div align="center" runat="server">
                            <div id="Div16" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                                <asp:Label ID="Label44" runat="server" Text="Details for which vacancies to be subscribed" Style="font-weight: bold; color: Black;" class="font"></asp:Label>
                                &nbsp;
                            </div>
                            <table class="table table table-bordered grad2">
                                <tr>
                                    <td style="padding-right: 10px; width: 40%" align="right">
                                        <asp:Label ID="Label37" runat="server" Text="DPC From" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; width: 60%" align="left">
                                        <asp:Label ID="lbldpcfromvaca" runat="server" Text="" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 10px; width: 40%" align="right">
                                        <asp:Label ID="Label48" runat="server" Text="DPC To" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; width: 60%" align="left">
                                        <asp:Label ID="lbldpctovaca" runat="server" Text="" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding-right: 10px; width: 40%" align="right">
                                        <asp:Label ID="Label50" runat="server" Text="DPC Period" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                    </td>
                                    <td style="padding-left: 10px; width: 60%" align="left">
                                        <asp:Label ID="lbldpcperiodvacancy" runat="server" Text="" ForeColor="Black" class="font"
                                            Style="font-weight: bold;"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>



                        <div align="center">
                            <strong>
                                <asp:Label ID="lblresult" runat="server" CssClass="auto-style2" Text="" Visible="true"></asp:Label>
                            </strong>
                            <br />
                        </div>
                        <br />
                        <div id="gvdetails1" runat="server">
                            <div class="panel panel-primary">
                                <div class="panel-heading grad3">
                                    <span style="font-weight: bold; color: Black;" class="font2">:: Add Vacancies ::</span>
                                </div>
                                <div class="panel-body grad2 table-responsive">
                                    <asp:GridView ID="gvDetails" DataKeyNames="id,DPCid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                        CssClass="Gridview" ShowFooter="true" HeaderStyle-Font-Bold="true"
                                        PageSize="15" AllowPaging="true" HeaderStyle-ForeColor="White" Width="94%" ToolTip="Vacancy Details" OnRowCommand="gvDetails_RowCommand1" OnPageIndexChanging="gvDetails_PageIndexChanging" OnRowCancelingEdit="gvDetails_RowCancelingEdit" OnRowDeleting="gvDetails_RowDeleting" OnRowEditing="gvDetails_RowEditing" OnRowUpdating="gvDetails_RowUpdating" OnRowDataBound="gvDetails_RowDataBound">
                                        <alternatingrowstyle horizontalalign="Center" verticalalign="Middle" />
                                        <columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <edititemtemplate>
                                                    <asp:Label ID="lblRow" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <asp:Label ID="lblrowid" runat="server" Font-Size="Medium" Text='<%#Container.DataItemIndex+1 %>' />
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:Label ID="lbvacancies" runat="server" Text="Vacancies"></asp:Label>
                                                    </div>
                                                </footertemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Year">
                                                <edititemtemplate>
                                                    <asp:TextBox ID="txtyearedit" runat="server" Text='<%#Eval("Year") %>' MaxLength="9" Width="80px" Height="20px" />
                                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderTyeargrd" runat="server"
                                                        targetcontrolid="txtyearedit" validchars="0123456789-">
                                                    </ajaxtoolkit:filteredtextboxextender>
                                                    <asp:RequiredFieldValidator ID="rqrdcat13" runat="server" ControlToValidate="txtyearedit"
                                                        Text="*" ValidationGroup="validaiton" />

                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <asp:Label ID="lblCat" runat="server" Text='<%#Eval("Year") %>' CssClass="fontingrid" />
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtyear" runat="server" MaxLength="9" Width="80px" Height="20px" />
                                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderyear1" runat="server"
                                                            targetcontrolid="txtyear" validchars="0123456789-">
                                                        </ajaxtoolkit:filteredtextboxextender>
                                                        <asp:RequiredFieldValidator ID="rqrdcat33" ForeColor="Red" runat="server" ControlToValidate="txtyear"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </footertemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Gen">
                                                <edititemtemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtgenedit" runat="server" Text='<%#Eval("Gen") %>' Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="rqrdcat1" runat="server" ControlToValidate="txtgenedit"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <asp:Label ID="lblgen" runat="server" Text='<%#Eval("Gen") %>' CssClass="fontingrid" />
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtgen" runat="server" Text="0" Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="rqrdcat" ForeColor="Red" runat="server" ControlToValidate="txtgen"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </footertemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="SC">
                                                <edititemtemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtscedit" runat="server" Text='<%#Eval("SC") %>' Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="rqrdcat11" runat="server" ControlToValidate="txtscedit"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <asp:Label ID="lblSC" runat="server" Text='<%#Eval("SC") %>' CssClass="fontingrid" />
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtSC" runat="server" Text="0" Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="rqrdcatkd" ForeColor="Red" runat="server" ControlToValidate="txtSC"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </footertemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="ST">
                                                <edititemtemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtstedit" runat="server" Text='<%#Eval("ST") %>' Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="rqrdcatddd11" runat="server" ControlToValidate="txtstedit"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <asp:Label ID="lblST" runat="server" Text='<%#Eval("ST") %>' CssClass="fontingrid" />
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtST" runat="server" Text="0" Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="rqrdd" ForeColor="Red" runat="server" ControlToValidate="txtST"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </footertemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="OBC">
                                                <edititemtemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtobcedit" runat="server" Text='<%#Eval("OBC") %>' Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="rqrdOBC" runat="server" ControlToValidate="txtobcedit"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <asp:Label ID="lblOBC" runat="server" Text='<%#Eval("OBC") %>' CssClass="fontingrid" />
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtOBC" runat="server" Text="0" Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="reqdOBC" ForeColor="Red" runat="server" ControlToValidate="txtOBC"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>

                                                </footertemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="PH">
                                                <edititemtemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtPHedit" runat="server" Text='<%#Eval("PH") %>' Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="rqrdPHedit" runat="server" ControlToValidate="txtPHedit"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <asp:Label ID="lblPH" runat="server" Text='<%#Eval("PH") %>' CssClass="fontingrid" />
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtPH" runat="server" Text="0" Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="reqdtxtPH" ForeColor="Red" runat="server" ControlToValidate="txtPH"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </footertemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Sport">
                                                <edititemtemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtSportedit" runat="server" Text='<%#Eval("Sport") %>' Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="rqrdSportedit" runat="server" ControlToValidate="txtSportedit"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <asp:Label ID="lblSport" runat="server" Text='<%#Eval("Sport") %>' CssClass="fontingrid" />
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtSport" runat="server" Text="0" Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="reqdtxtSport" ForeColor="Red" runat="server" ControlToValidate="txtSport"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </footertemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Other">
                                                <edititemtemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtotheredit" runat="server" Text='<%#Eval("other") %>' Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="rqrdotheredit" runat="server" ControlToValidate="txtotheredit"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <asp:Label ID="lblother" runat="server" Text='<%#Eval("other") %>' CssClass="fontingrid" />
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:TextBox ID="txtother" runat="server" Text="0" Width="80px" Height="20px" />
                                                        <asp:RequiredFieldValidator ID="reqdtxtother" ForeColor="Red" runat="server" ControlToValidate="txtother"
                                                            Text="*" ValidationGroup="validaiton" />
                                                    </div>
                                                </footertemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Total">
                                                <edititemtemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:Label ID="lbltotaledit" runat="server" Text='<%#Eval("TotalVacancies") %>' CssClass="fontingrid" />
                                                    </div>
                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <asp:Label ID="lbltotal" runat="server" Text='<%#Eval("TotalVacancies") %>' CssClass="fontingrid" />
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px;" align="center">
                                                        <asp:Label ID="lbltotaloverall" runat="server" Text="" CssClass="fontingrid" />
                                                    </div>
                                                </footertemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Action">
                                                <edititemtemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                        <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg"
                                                            ToolTip="Update" Height="25px" Width="25px" />
                                                        &nbsp;&nbsp;
                                    <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/Images/Cancel.png"
                                        ToolTip="Cancel" Height="25px" Width="25px" />
                                                    </div>
                                                </edititemtemplate>
                                                <itemtemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px; padding-top: 10px; padding-bottom: 10px" align="center">
                                                        <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" OnClientClick="return confirm('Are you sure to Edit?');"
                                                            ImageUrl="~/Images/Edit.png" ToolTip="Edit" Height="25px" Width="25px" />
                                                        &nbsp;&nbsp;
                                    <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server"
                                        ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Height="25px" Width="25px" OnClientClick="return confirm('Are you sure to delete?');" />
                                                    </div>
                                                </itemtemplate>
                                                <footertemplate>
                                                    <div style="padding-left: 6px; padding-right: 6px; padding-top: 8px; padding-bottom: 8px" align="center">
                                                        <asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Images/AddNewitem.jpg"
                                                            CommandName="AddNew" Width="28px" Height="28px" ToolTip="Add" ValidationGroup="validaiton" />
                                                        &nbsp;
                                    <asp:Label ID="lbladdvacancy" runat="server" Text="Add Vacancy" Style="font-size: medium; font-family: Calibri; color: Black; font-weight: bold"></asp:Label>
                                                    </div>
                                                </footertemplate>
                                            </asp:TemplateField>
                                        </columns>

                                        <editrowstyle horizontalalign="Center" verticalalign="Middle" />
                                        <footerstyle backcolor="#FBEDC4" horizontalalign="Center" verticalalign="Middle"
                                            font-bold="True" height="35px"></footerstyle>
                                        <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
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

                        <div id="gvdetails21" runat="server">
                            <div class="panel-body grad2 table-responsive">
                                <div class="panel panel-primary">
                                    <div class="panel-heading grad3">
                                        <span style="font-weight: bold; color: Black;" class="font2">:: Vacancy Details ::</span>
                                    </div>
                                    <br />
                                    <br />
                                    <asp:GridView ID="gvdetails2" DataKeyNames="id,DPCid" runat="server" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true"
                                        CssClass="Gridview" HeaderStyle-Font-Bold="true"
                                        PageSize="15" AllowPaging="true" HeaderStyle-ForeColor="White" Width="94%" ToolTip="Vacancy Details"
                                        OnPageIndexChanging="gvDetails2_PageIndexChanging" EmptyDataText="No Records Found....">
                                        <alternatingrowstyle horizontalalign="Center" verticalalign="Middle" />
                                        <columns>
                                            <asp:TemplateField HeaderText="S.No.">

                                                <itemtemplate>
                                                    <asp:Label ID="lblrowid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                </itemtemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Year">

                                                <itemtemplate>
                                                    <div style="padding-top: 8px; padding-bottom: 8px;" align="center">
                                                        <asp:Label ID="lblCat" runat="server" Text='<%#Eval("Year") %>' CssClass="fontingrid" />
                                                    </div>
                                                </itemtemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Gen">

                                                <itemtemplate>
                                                    <asp:Label ID="lblgen" runat="server" Text='<%#Eval("Gen") %>' CssClass="fontingrid" />
                                                </itemtemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="SC">

                                                <itemtemplate>
                                                    <asp:Label ID="lblSC" runat="server" Text='<%#Eval("SC") %>' CssClass="fontingrid" />
                                                </itemtemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="ST">

                                                <itemtemplate>
                                                    <asp:Label ID="lblST" runat="server" Text='<%#Eval("ST") %>' CssClass="fontingrid" />
                                                </itemtemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="OBC">

                                                <itemtemplate>
                                                    <asp:Label ID="lblOBC" runat="server" Text='<%#Eval("OBC") %>' CssClass="fontingrid" />
                                                </itemtemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="PH">

                                                <itemtemplate>
                                                    <asp:Label ID="lblPH" runat="server" Text='<%#Eval("PH") %>' CssClass="fontingrid" />
                                                </itemtemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Sport">

                                                <itemtemplate>
                                                    <asp:Label ID="lblSport" runat="server" Text='<%#Eval("Sport") %>' CssClass="fontingrid" />
                                                </itemtemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Other">

                                                <itemtemplate>
                                                    <asp:Label ID="lblother" runat="server" Text='<%#Eval("other") %>' CssClass="fontingrid" />
                                                </itemtemplate>

                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Total">

                                                <itemtemplate>
                                                    <asp:Label ID="lbltotal" runat="server" Text='<%#Eval("TotalVacancies") %>' CssClass="fontingrid" />
                                                </itemtemplate>

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
                        </div>
                    </div>
                </div>
                <div align="center" class="col-md-1 col-sm-1 col-lg-1" runat="server" id="div7">
                </div>
            </div>





        </div>


        <%-- </ContentTemplate>
            
        </asp:UpdatePanel>--%>
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

</asp:Content>
