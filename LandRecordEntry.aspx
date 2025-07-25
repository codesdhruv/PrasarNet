<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandRecordEntry.aspx.cs" MaintainScrollPositionOnPostback="true"
    Inherits="PrasarNet.LandRecordEntry" MasterPageFile="~/Site1.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <%--link of style sheet--%>
    <link rel="stylesheet" href="style/responsive.css" type="text/css" media="screen" />
    <!-- jQuery library -->
    <script type='text/javascript' src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js"></script>
    <style type="text/css">
        .pointer {
            cursor: pointer;
        }

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

        .grad4 {
            background: radial-gradient(#CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .auto-style1 {
            color: #FF0000;
            font-weight: 700;
        }

        .auto-style2 {
            color: #FF0000;
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

        function clearmodal() {
            $('#loginModal4').on('hide.bs.modal', function () {
                var txtlocationname = document.getElementById("txtlocationname");
                var ddlsiteusedforpanel = document.getElementById("ddlsiteusedforpanel");
                //                var rev = document.getElementById("RegularExpressionValidator1");
                //                var rfv = document.getElementById("RequiredFieldValidator1");
                txtlocationname.value = "";



            })
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
            <asp:Image ID="Image1" runat="server" class="img-responsive pull-left  img-fluid" Width="70px" Height="90%"
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
                    <asp:Image ID="Image4" runat="server" class="img-responsive" Height="100%" align="center"
                        ImageUrl="~/images/Azadi.png" Width="100px" />
                </div>
            </div>

            <br />
            <asp:Label ID="Label14" runat="server" class="fontheader1" ForeColor="Blue" Font-Bold="false" Text=" An Intranet for Prasar Bharati Employees"></asp:Label>

        </div>
        <div class="col-xs-3 col-lg-3 text-center" style="padding-right: 25px; padding-top: 12px; padding-bottom: 5px">
            <asp:Image ID="Image8" runat="server" class="img-responsive pull-right" Width="123px" Height="100%"
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
    <div>
        <%--<asp:Button ID="Button1" runat="server" class="close" data-dismiss="modal" />--%>
        <div class="row" style="padding: 10px 0px 0px 0px; margin: auto">
            <div class="col-lg-12 col-md-12 col-sm-12" style="padding-left: 25px; padding-right: 35px;">
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
                <%--<asp:Label ID="Label43" Style="font-weight: bold; font-size: x-large; color: Black;
                    background-color: ActiveCaption" runat="server" Text=":: Land Records ::"></asp:Label>--%>
                <br />
                <br />
            </div>
            <div id="Div2" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div4">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div122">
                <div id="Div41" runat="server">
                    <table>
                        <tr>
                            <td align="center" width="100%">
                                <div id="divoptions" runat="server" class="row">
                                    <%--<div class="col-lg-4 col-md-4" style="padding-left: 15px; padding-bottom: 10px">
                                        <asp:LinkButton ID="lnkdownload" runat="server" CssClass="btn gradnewbutton2" CausesValidation="False"
                                            Width="200px">
                    <span style="font-weight: bold; color: #000000">Download Mannual</span></asp:LinkButton>
                                    </div>--%>
                                    <div class="col-lg-6 col-md-6" style="padding-right: -1px; padding-bottom: 10px">
                                        <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn gradnewbutton2" CausesValidation="False"
                                            Width="200px" height="32px" OnClick="LinkButton4_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px">
                                            <span style="font-weight: bold; color: #000000">Land's Location</span></asp:LinkButton>

                                    </div>
                                    <div class="col-lg-6 col-md-6" style="padding-right: -1px; padding-bottom: 10px">
                                        <asp:LinkButton ID="btngemreports" runat="server" CssClass="btn gradnewbutton2" CausesValidation="False"
                                            Width="200px" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" OnClick="btngemreports_Click">
                                            <span style="font-weight: bold; color: #000000">Land Record Reports</span></asp:LinkButton>
                                        <asp:LinkButton ID="lnkcheck" runat="server" CssClass="btn gradbody" CausesValidation="false"
                                            Enabled="false" Width="150" Visible="false">
                                            <span style="font-weight: bold; color: white"></span>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div class="table-responsive">
                    <table class="table table-bordered grad2">
                        <tr>
                            <td align="center" colspan="4" style="padding: 10px">
                                <asp:Label ID="Label35" Style="font-weight: bold; font-size: x-large; color: Black; background-color: ActiveCaption"
                                    runat="server" Text=":: Land Records ::"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%" align="right" style="padding-right: 30px">
                                <asp:Label ID="Label44" runat="server" Text="Zone" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td width="25%" align="left" style="padding-left: 15px">
                                <asp:DropDownList ID="ddlzone" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                    ClientIDMode="Static" Height="28px" ValidationGroup="next" AutoPostBack="True" Font-Size="Medium"
                                    OnSelectedIndexChanged="ddlzone_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                    ControlToValidate="ddlzone" Display="Dynamic" ErrorMessage="*"
                                    ForeColor="Black" Font-Bold="true" Font-Size="Large" SetFocusOnError="True" ValidationGroup="next">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td width="25%" align="right" style="padding-right: 30px">
                                <asp:Label ID="Label45" runat="server" Text="State" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td width="25%" align="left" style="padding-left: 15px">
                                <asp:DropDownList ID="ddlstate" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                    ClientIDMode="Static" Height="28px" ValidationGroup="next" AutoPostBack="True" Font-Size="Medium"
                                    OnSelectedIndexChanged="ddlstate_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                                    ControlToValidate="ddlstate" Display="Dynamic" ErrorMessage="*"
                                    ForeColor="Black" Font-Bold="true" Font-Size="Large" SetFocusOnError="True" ValidationGroup="next">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%" align="right" style="padding-right: 30px">
                                <asp:Label ID="Label3" runat="server" Text="District" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td width="25%" align="left" style="padding-left: 15px">
                                <asp:DropDownList ID="ddldistrict" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                    ClientIDMode="Static" Height="28px" ValidationGroup="next" AutoPostBack="True" Font-Size="Medium"
                                    OnSelectedIndexChanged="ddldistrict_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                    ControlToValidate="ddldistrict" Display="Dynamic" ErrorMessage="*"
                                    ForeColor="Black" Font-Bold="true" Font-Size="Large" SetFocusOnError="True" ValidationGroup="next">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td width="25%" align="right" style="padding-right: 30px">
                                <asp:Label ID="Label4" runat="server" Text="Location of Land" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td width="25%" align="left" style="padding-left: 15px">
                                <asp:DropDownList ID="ddlcity" runat="server" AppendDataBoundItems="true" class="select widthofboxes"
                                    ClientIDMode="Static" Height="28px" ValidationGroup="next" Font-Size="Medium"
                                    AutoPostBack="True" OnSelectedIndexChanged="ddlcity_SelectedIndexChanged1">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                    ControlToValidate="ddlcity" Display="Dynamic" ErrorMessage="*"
                                    ForeColor="Black" Font-Bold="true" Font-Size="Large" SetFocusOnError="True" ValidationGroup="next">
                                </asp:RequiredFieldValidator>
                                &nbsp;
                            </td>
                        </tr>

                        <tr>
                            <td align="center" colspan="4" style="padding: 10px">
                                <asp:Button ID="btnsubmit0" runat="server" Width="120px" class="btn select"
                                    Style="background-color: #99FFCC; color: Black; font-weight: bold" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                    Text="Next&gt;&gt;" ValidationGroup="next" OnClick="btnsubmit0_Click1" />
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                    <asp:Label ID="Lblmsg" runat="server" Style="font-weight: 700; color: #FF0000; font-size: medium;"></asp:Label>
                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div7">
            </div>
        </div>
        <div id="diventry" runat="server" class="row" style="margin: auto;" visible="false">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div11">
            </div>
            <div align="center" class=" col-md-10 col-lg-10" runat="server" id="div8">

                <div id="div22" runat="server" class="row">
                    <div id="Div23" class="col-lg-3 col-md-3" runat="server" style="padding-bottom: 10px">
                        <span class="btn select grad3" style="border: ridge; border-width: 1px; border-color: black">
                            <asp:LinkButton ID="LinkButton1" class="font2" runat="server" ForeColor="Blue" Font-Bold="true" Width="200px"
                                OnClick="LinkButton1_Click">
                                Basic Land Details</asp:LinkButton></span>
                        <br />
                        <br />
                        <div id="divRecords_not_submitted" runat="server" visible="false">

                            <asp:Image ID="Image5" runat="server" Height="10px" ImageUrl="~/images/red_dot.png"
                                Width="10px" />
                            &nbsp;
                            <asp:Label ID="Label9" runat="server" Text="Record(s) not exists" Font-Bold="true"></asp:Label>
                        </div>
                        <div id="divRecordssubnotverified" runat="server" visible="false">
                            <asp:Image ID="Image6" runat="server" Height="10px" ImageUrl="~/images/orange_dot.png"
                                Width="10px" />
                            &nbsp;
                                            <asp:Label ID="Label11" runat="server" Text="Record(s) submitted but not verified"
                                                Font-Bold="true"></asp:Label>
                        </div>
                        <div id="divRecordsverified" runat="server" visible="false">
                            <asp:Image ID="Image7" runat="server" Height="10px" ImageUrl="~/images/green_dot.png"
                                Width="10px" />
                            &nbsp;
                                            <asp:Label ID="Label12" runat="server" Text="Record(s) submitted and verified" Font-Bold="true"></asp:Label>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3" style="padding-bottom: 10px">
                        <span class="btn select grad3" style="border: ridge; border-width: 1px; border-color: black">
                            <asp:LinkButton ID="lnkuploaddocuments" class="font2" runat="server" ForeColor="Blue" Width="200px"
                                Enabled="false" Font-Bold="true" OnClick="lnkuploaddocuments_Click">
                                Upload Land Documents</asp:LinkButton></span>
                        <div id="divstatusrecord" runat="server" visible="false">
                            <br />
                            <asp:Image ID="Image2" runat="server" Height="10px" ImageUrl="~/images/red_dot.png"
                                Width="10px" />
                            &nbsp;
                                            <asp:Label ID="Label5" runat="server" Text="Not Activated.. Activate after the verification of land Record Details."
                                                Font-Bold="true"></asp:Label>
                        </div>
                        <br />
                    </div>
                    <div class="col-lg-3 col-md-3" style="padding-bottom: 10px">
                        <span class="btn select grad3" style="border: ridge; border-width: 1px; border-color: black">
                            <asp:LinkButton ID="lnkuploadmaps" class="font2" runat="server" ForeColor="Blue" Width="200px"
                                Enabled="false" Font-Bold="true" OnClick="lnkuploadmaps_Click">
                                Upload Land Maps</asp:LinkButton></span>
                        <div id="divstatusmap" runat="server" visible="false">
                            <br />
                            <asp:Image ID="Image3" runat="server" Height="10px" ImageUrl="~/images/red_dot.png"
                                Width="10px" />
                            &nbsp;
                                            <asp:Label ID="Label7" runat="server" Text="Not Activated.. Activate after the verification of land Record Details."
                                                Font-Bold="true"></asp:Label>
                        </div>
                        <br />
                    </div>
                    <div class="col-lg-3 col-md-3" style="padding-bottom: 10px">
                        <div id="divenchrochmentdetails" runat="server" visible="false">
                            <span class="btn select grad3 " style="border: ridge; border-width: 1px; border-color: black">
                                <asp:LinkButton ID="lnkenchrochmentDetails" class="font2" runat="server" ForeColor="Blue" Width="200px"
                                    Enabled="true" Font-Bold="true" OnClick="lnkenchrochmentDetails_Click">
                                    Enchrochment Details</asp:LinkButton></span>
                        </div>
                    </div>
                </div>


            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div112">
            </div>
        </div>
        <div class="row" style="margin: auto;" id="divlandrecform" runat="server" visible="false">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div13">
            </div>

            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div412" style="padding: 35px; border: medium ridge #CCCCCC;">
                <div id="Div32" runat="server" align="right" style="padding-bottom: 10px">

                    <asp:LinkButton ID="lnkcloselandrec" runat="server" CssClass="btn grad4" CausesValidation="False"
                        OnClick="lnkcloselandrec_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px">
                        <span aria-hidden="true" style="color: Black" class=""></span>&nbsp;
                                     <span style="font-weight: bold; color: #000000">X Close</span></asp:LinkButton>

                </div>
                <div class="table-hover table">
                    <div id="Div24" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                        <asp:Label ID="Label8" runat="server" Text="Basic Land Details Entry" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                        &nbsp;
                    </div>
                    <%-- OnClientClick="return confirm('Are you sure to verify the Details?');" --%>
                    <table class="table table table-bordered grad2" width="90%" align="center">
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="lbladd" runat="server" Text="Address" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <asp:Label ID="lbllandetid" runat="server" Text="" Visible="false"></asp:Label>
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lbladdress" runat="server" Text="" class="font2" Font-Bold="true" Visible="false"
                                    Style="color: #000000"></asp:Label>
                                <asp:TextBox ID="txtaddress" runat="server" class="select widthofboxes1" Height="75px" Font-Size="Medium"
                                    ValidationGroup="landdetails" TextMode="MultiLine">
                                </asp:TextBox>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender3" runat="server"
                                    targetcontrolid="txtaddress" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\ ,-[]()&.">
                                </ajaxtoolkit:filteredtextboxextender>
                                <asp:RegularExpressionValidator ID="revtitle" runat="server" ErrorMessage="Address can not exceed the 200 Characters!!"
                                    ValidationGroup="landdetails" Style="color: #000000; font-weight: 700; font-size: small;" ControlToValidate="txtaddress"
                                    ValidationExpression="^[\s\S\d]{1,200}$" Display="Dynamic" class="font">
                                </asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="rfvaddress" runat="server" ControlToValidate="txtaddress"
                                    ValidationGroup="landdetails" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font" Style="font-weight: 700; color: #000000; font-size: large">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="lblo" runat="server" Text="Organisation" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lblorg" runat="server" Text="" class="font2" Font-Bold="true" Visible="false"
                                    ForeColor="Black"></asp:Label>
                                <asp:DropDownList ID="ddlorg" runat="server" AutoPostBack="false" class="select widthofboxes1"
                                    ValidationGroup="landdetails" Height="28px" Font-Size="Medium" AppendDataBoundItems="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvdoctype" runat="server" ControlToValidate="ddlorg"
                                    ValidationGroup="landdetails" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font" Style="font-weight: 700; font-size: large; color: #000000">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="lblsite" runat="server" Text="Site Used for" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lblsitefor" runat="server" Text="" class="font2" Font-Bold="true" Visible="false"
                                    Style="color: #000000"></asp:Label>
                                <asp:DropDownList ID="ddlsitefor" runat="server" AutoPostBack="false" class="select widthofboxes1"
                                    ValidationGroup="landdetails" Height="28px" Font-Size="Medium" AppendDataBoundItems="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlsitefor"
                                    ValidationGroup="landdetails" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font" Style="font-weight: 700; font-size: large; color: #000000">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="lblta" runat="server" Text="Total Area (in sq.m.)" ForeColor="Black"
                                    class="font2" Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lbltotalarea" runat="server" Text="" class="font2" Font-Bold="true"
                                    Visible="false" Style="color: #000000"></asp:Label>
                                <asp:TextBox ID="txttotalarea" runat="server" class="select widthofboxes1" Height="28px" Font-Size="Medium"
                                    ValidationGroup="landdetails">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txttotalarea"
                                    ValidationGroup="landdetails" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font" Style="font-size: large; font-weight: 700; color: #000000">
                                </asp:RequiredFieldValidator>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender72" runat="server"
                                    targetcontrolid="txttotalarea" validchars="1234567890.">
                                </ajaxtoolkit:filteredtextboxextender>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="Label16" runat="server" Text="Covered Area (in sq.m.)" ForeColor="Black"
                                    class="font2" Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lblcoveredarea" runat="server" Text="" class="font2" Font-Bold="true"
                                    Visible="false" Style="color: #000000"></asp:Label>
                                <asp:TextBox ID="txtcoveredarea" runat="server" class="select widthofboxes1" Height="28px" Font-Size="Medium"
                                    ValidationGroup="landdetails">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtcoveredarea"
                                    ValidationGroup="landdetails" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font" Style="font-weight: 700; font-size: large; color: #000000">
                                </asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" ForeColor="Red" runat="server" ControlToValidate="txtcoveredarea"
                                    ControlToCompare="txttotalarea" Display="Dynamic" Operator="LessThanEqual" Type="Double"
                                    ErrorMessage="Covered Area should be less than and equal to Total area!!" SetFocusOnError="True"
                                    class="font" Style="font-weight: 700; font-size: small; color: #000000;">
                                </asp:CompareValidator>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                    targetcontrolid="txttotalarea" validchars="1234567890.">
                                </ajaxtoolkit:filteredtextboxextender>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="Label17" runat="server" Text="Status Of Land" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lblhold" runat="server" class="font2" Font-Bold="true" Text="" Visible="false"
                                    Style="color: #000000"></asp:Label>
                                <asp:DropDownList ID="ddlhold" runat="server" AutoPostBack="True" class="select widthofboxes1"
                                    ValidationGroup="landdetails" Height="28px" Font-Size="Medium" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlhold_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddlhold"
                                    ValidationGroup="landdetails" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font" Style="font-weight: 700; font-size: large; color: #000000">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr id="trvalidityofLease" runat="server" visible="false">
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="lblval" runat="server" Text="Validity of Lease" ForeColor="Black"
                                    class="font2" Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lblvaloflease" runat="server" class="font2" Font-Bold="true" Text=""
                                    Visible="false" Style="color: #000000"></asp:Label>
                                <asp:TextBox ID="txtvaloflease" runat="server" class="select widthofboxes1" Height="28px" Font-Size="Medium"
                                    ValidationGroup="landdetails" autocomplete="off" placeholder="DD-MM-YYYY" MaxLength="10">
                                </asp:TextBox>
                                <%--  </ContentTemplate>
                        <Triggers>
                            <asp:PostBackTrigger ControlID="btnVerifydetails" />
                            <asp:PostBackTrigger ControlID="btneditlanddetails" />
                            <asp:PostBackTrigger ControlID="btnupdatelanddetails" />
                            <asp:PostBackTrigger ControlID="btncncl" />
                        </Triggers>
                    </asp:UpdatePanel>--%>
                                <ajaxtoolkit:calendarextender id="txtvaloflease_CalendarExtender" runat="server"
                                    behaviorid="txtvaloflease_CalendarExtender" format="dd-MM-yyyy" targetcontrolid="txtvaloflease" />
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderThours" runat="server"
                                    targetcontrolid="txtvaloflease" validchars="0123456789-">
                                </ajaxtoolkit:filteredtextboxextender>
                                <asp:RequiredFieldValidator ID="rfvdateofdoc" runat="server" ErrorMessage="*" ControlToValidate="txtvaloflease"
                                    ValidationGroup="landdetails" ForeColor="Red" SetFocusOnError="True" class="font"
                                    Display="Dynamic" Style="font-size: large; font-weight: 700; color: #000000">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="Label19" runat="server" Text="Whether Comments by retired Revenue Officer?"
                                    ForeColor="Black" class="font2" Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lblwhethercommentbyrevoffcr" runat="server" class="font2" Font-Bold="true"
                                    Text="" Visible="false" Style="color: #000000"></asp:Label>
                                <asp:DropDownList ID="ddlcommentbyretrevoffcr" runat="server" AutoPostBack="True"
                                    ValidationGroup="landdetails" class="select widthofboxes1" Height="28px" Font-Size="Medium" AppendDataBoundItems="true"
                                    OnSelectedIndexChanged="ddlcommentbyretrevoffcr_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlcommentbyretrevoffcr"
                                    ValidationGroup="landdetails" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font" Style="font-size: large; font-weight: 700; color: #000000">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr id="trremarksbyretiredrevenueofficer" runat="server" visible="false">
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="Label18" runat="server" Text="Remarks by Retired Revenue Officers?"
                                    ForeColor="Black" class="font2" Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lblremarkbyrevoffcr" runat="server" class="font2" Font-Bold="true"
                                    Text="" Visible="false" Style="color: #000000"></asp:Label>
                                <asp:TextBox ID="txtremarksbyretiredrevofficer" runat="server" class="select widthofboxes1"
                                    ValidationGroup="landdetails" Height="75px" Font-Size="Medium" TextMode="MultiLine">
                                </asp:TextBox>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender4" runat="server"
                                    targetcontrolid="txtremarksbyretiredrevofficer" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\ ,-[]()&.=%">
                                </ajaxtoolkit:filteredtextboxextender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Remarks can not exceed the 500 Characters!!"
                                    Style="color: #000000; font-weight: 700; font-size: small;" ControlToValidate="txtremarksbyretiredrevofficer"
                                    ValidationExpression="^[\s\S\d]{1,500}$" Display="Dynamic" class="font" ValidationGroup="landdetails">
                                </asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtremarksbyretiredrevofficer"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" class="font"
                                    ValidationGroup="landdetails" Style="font-size: large; font-weight: 700; color: #000000">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="Label20" runat="server" Text="Status of service charges/property tax/leived by municipality/local administration etc."
                                    ForeColor="Black" class="font2" Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lblstatusoftax" runat="server" class="font2" Font-Bold="true" Text=""
                                    Visible="false" Style="color: #000000"></asp:Label>
                                <asp:DropDownList ID="ddltax" runat="server" AutoPostBack="false" class="select widthofboxes1"
                                    ValidationGroup="landdetails" Height="28px" Font-Size="Medium" AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="landdetails"
                                    ControlToValidate="ddlcommentbyretrevoffcr" Display="Dynamic" ErrorMessage="*"
                                    ForeColor="Red" SetFocusOnError="True" class="font" Style="font-weight: 700; color: #000000; font-size: large">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="Label21" runat="server" Text="Status of Boundry Wall" ForeColor="Black"
                                    class="font2" Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lblstatusofboundarywall" runat="server" class="font2" Font-Bold="true"
                                    Text="" Visible="false" Style="color: #000000"></asp:Label>
                                <asp:DropDownList ID="ddlstatusofboundarywall" runat="server" AutoPostBack="True"
                                    ValidationGroup="landdetails" class="select widthofboxes1" Height="28px" Font-Size="Medium" AppendDataBoundItems="true"
                                    OnSelectedIndexChanged="ddlstatusofboundarywall_SelectedIndexChanged">
                                    <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlstatusofboundarywall"
                                    ValidationGroup="landdetails" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font" Style="font-weight: 700; font-size: large; color: #000000">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr id="trtypofboundarywall" runat="server" visible="false">
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="lbltypofbwall" runat="server" Text="Type Of Boundary Wall" ForeColor="Black"
                                    class="font2" Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lbltypofboundarywall" runat="server" class="font2" Font-Bold="true"
                                    Text="" Visible="false" Style="color: #000000"></asp:Label>
                                <asp:DropDownList ID="ddltypofbndrywall" runat="server" AutoPostBack="false" class="select widthofboxes1"
                                    ValidationGroup="landdetails" Height="28px" Font-Size="Medium" AppendDataBoundItems="true">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ddltypofbndrywall"
                                    ValidationGroup="landdetails" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font" Style="font-size: large; font-weight: 700; color: #000000">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Label ID="lblenc" runat="server" Text="Enchrochment" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Label ID="lblenchrochment" runat="server" class="font2" Font-Bold="true" Text=""
                                    Visible="false" Style="color: #000000"></asp:Label>
                                <asp:DropDownList ID="ddlenchrochment" runat="server" AutoPostBack="false" class="select widthofboxes1"
                                    ValidationGroup="landdetails" Height="28px" Font-Size="Medium" AppendDataBoundItems="true">
                                    <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                    <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlenchrochment"
                                    ValidationGroup="landdetails" Display="Dynamic" ErrorMessage="*" ForeColor="Red"
                                    SetFocusOnError="True" class="font" Style="font-weight: 700; font-size: large; color: #000000">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 15px" width="35%">
                                <asp:Button ID="btneditlanddetails" runat="server" Text="Records Verified" class="btn select buttondocumentupload" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                    Enabled="false" Visible="false" Style="background-color: #99FFCC; color: Black; font-weight: bold" />
                                <asp:Button ID="btnupdatelanddetails" runat="server" Text="Update" class="btn select buttondocumentupload" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                    ValidationGroup="landdetails" Visible="false" Style="background-color: #99FFCC; color: Black; font-weight: bold"
                                    OnClientClick="return confirm('Are you sure to Update the Details?');" />
                                <asp:Button ID="btnVerifydetails" runat="server" Text="Submit &amp; Verify" class="btn select buttondocumentupload" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                    CausesValidation="true" ValidationGroup="landdetails" Style="background-color: #99FFCC; color: Black; font-weight: bold"
                                    OnClick="btnVerifydetails_Click" />
                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtcourtcaseno" ValidationGroup="enc"
                                            Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" class="font"></asp:RequiredFieldValidator>--%>
                                <br />
                                <span class="auto-style1 font">*Once verified You can not edit the records. So, confirm
                                    it again.</span>
                            </td>
                            <td align="left" style="padding-left: 15px" width="65%">
                                <asp:Button ID="btncncl" runat="server" Text="Close" class="btn select gradbody buttondocumentupload" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                    Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" />
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtcourtcaseno" ValidationGroup="enc"
                                            Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" class="font"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div14">
            </div>
        </div>
        <div class="row" style="margin: auto" id="divenchrochment" runat="server" visible="false">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div26">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div27" style="padding: 35px; border: medium ridge #CCCCCC;">
                <div id="Div31" runat="server" align="right" style="padding-bottom: 10px">
                    <asp:LinkButton ID="lnkcloseenc" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                        OnClick="lnkcloseenc_Click">
                        <span aria-hidden="true" style="color: Black" class=""></span>&nbsp;
                                     <span style="font-weight: bold; color: #000000">X Close</span></asp:LinkButton>
                </div>
                <div id="divencentry" runat="server">
                    <div class="table-hover table">
                        <div id="Div25" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                            <asp:Label ID="Label25" runat="server" Text="Enchrochment Details Entry" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                            &nbsp;
                        </div>
                        <div style="padding-left: 20px" align="left">
                            <span class="auto-style2 font"><strong>*If their are more than one cases related to
                                a specific land, then there will be a seperate entry for each and every case.</strong></span>
                        </div>
                        <table class="table table table-bordered grad2" width="90%" align="center">
                            <tr>
                                <td align="right" style="padding-right: 15px" width="50%">
                                    <asp:Label ID="Label13" runat="server" Text="Court Case Number" ForeColor="Black"
                                        class="font2" Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:Label ID="lblcourtcasenum" runat="server" Text="" class="font2" Font-Bold="true"
                                        Visible="false" Style="color: #000000"></asp:Label>
                                    <asp:TextBox ID="txtcourtcaseno" runat="server" class="select widthofboxes1" Height="28px" Font-Size="Medium"
                                        ValidationGroup="enc" TextMode="SingleLine">
                                    </asp:TextBox>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender2" runat="server"
                                        targetcontrolid="txtcourtcaseno" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\()[]- ,">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtcourtcaseno"
                                        ValidationGroup="enc" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                        class="font" Style="font-weight: 700; font-size: large; color: #000000">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 15px" width="50%">
                                    <asp:Label ID="Label22" runat="server" Text="Controlling Office" ForeColor="Black"
                                        class="font2" Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:Label ID="lblcontrollingoffice" runat="server" Text="" class="font2" Font-Bold="true"
                                        Visible="false" Style="color: #000000"></asp:Label>
                                    <asp:TextBox ID="txtcontrollingOffice" runat="server" class="select widthofboxes1" Font-Size="Medium"
                                        Height="28px" ValidationGroup="enc" TextMode="SingleLine">
                                    </asp:TextBox>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender5" runat="server"
                                        targetcontrolid="txtcontrollingOffice" validchars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\()[]- ,">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtcontrollingOffice"
                                        ValidationGroup="enc" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                        class="font" Style="font-weight: 700; font-size: large; color: #000000">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 15px" width="50%">
                                    <asp:Label ID="Label23" runat="server" Text="Remarks(If Any)" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:Label ID="Label24" runat="server" Text="" class="font" Font-Bold="true" Visible="false" CssClass="font2"
                                        Style="color: #000000"></asp:Label>
                                    <asp:TextBox ID="txtremarks" runat="server" class="select widthofboxes1" Height="75px" Font-Size="Medium"
                                        ValidationGroup="enc" TextMode="MultiLine">
                                    </asp:TextBox>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender6" runat="server"
                                        targetcontrolid="txtremarks" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\()[]- ,&%!{}''">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtcourtcaseno" ValidationGroup="enc"
                                            Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" class="font"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 15px" width="50%">
                                    <asp:Button ID="btnsubenc" runat="server" Text="Submit" class="btn select buttondocumentupload" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                        CausesValidation="true" ValidationGroup="enc" Style="background-color: #99FFCC; color: Black; font-weight: bold"
                                        OnClick="btnsubenc_Click" />
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:Button ID="btncloseenc" runat="server" Text="Clear" class="btn select gradbody buttondocumentupload" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                        Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncloseenc_Click" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br />
                <br />
                <div id="divgrdenc" runat="server">
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="color: Black; font-weight: 700" class="font2">:: Enchrochment Details ::</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <div style="text-align: center">
                                <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn gradbody" CausesValidation="False" OnClick="btnprint1_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px">
                                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp;
                    <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                <br />
                                <br />
                            </div>
                            <asp:GridView ID="grdenc" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
                                AllowPaging="true" PageSize="10" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="85%"
                                ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnPageIndexChanging="grdenc_PageIndexChanging"
                                OnRowCancelingEdit="grdenc_RowCancelingEdit" OnRowCommand="grdenc_RowCommand"
                                OnRowDeleted="grdenc_RowDeleted" OnRowDeleting="grdenc_RowDeleting" OnRowEditing="grdenc_RowEditing">
                                <alternatingrowstyle backcolor="White" />
                                <columns>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                        <itemtemplate>
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Place Details" ItemStyle-Width="50%">
                                        <itemtemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblzone" runat="server" Text="Zone" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lblzone1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lblzone2" Font-Italic="true" runat="server" Text='<%#Eval("ZoneName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lblstate" runat="server" Text="State" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lblstate1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lblstate2" Font-Italic="true" runat="server" Text='<%#Eval("StateName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lbldis" runat="server" Text="District" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lbldis1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lbldis2" Font-Italic="true" runat="server" Text='<%#Eval("DistrictName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lblcty" runat="server" Text="Location" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lblcty1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lblcty2" Font-Italic="true" runat="server" Text='<%#Eval("LocationName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lbladdresgrd" runat="server" Text="Address" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lbladdresgrd1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lbladdresgrd2" Font-Italic="true" runat="server" Text='<%#Eval("Address")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lblencid" runat="server" Text='<%#Eval("id") %>' Visible="false" Font-Size="Smaller" />
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Court Case No." ItemStyle-Width="10%">
                                        <itemtemplate>
                                            <div style="padding-left: 5px; padding-right: 5px">
                                                <asp:Label ID="Label3" Font-Bold="true" runat="server" Text='<%#Eval("CourtCaseNumber") %>'
                                                    class="fontingrid" />
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Controlling Office" ItemStyle-Width="10%">
                                        <itemtemplate>
                                            <asp:Label ID="Label11" Font-Bold="true" runat="server" Text='<%#Eval("ControllingOffice") %>'
                                                class="fontingrid" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="15%">
                                        <itemtemplate>
                                            <asp:Label ID="Lab1" Font-Bold="true" runat="server" Text='<%#Eval("Remarks") %>'
                                                class="fontingrid" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="10%">
                                        <itemtemplate>
                                            <asp:LinkButton ID="imgedit" CommandName="Edit" runat="server" CausesValidation="false"
                                                CssClass="btn btn-primary" ToolTip="Edit">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                                <span style="font-weight: bold; color: #000000"></span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="Imgdelete" CommandName="Delete" runat="server" CausesValidation="false"
                                                Visible="false" CssClass="btn btn-danger" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete?');">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-trash"></span>
                                                <span style="font-weight: bold; color: #000000"></span>
                                            </asp:LinkButton>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
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
                        </div>
                    </div>
                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div28">
            </div>
        </div>
        <div class="row" style="margin: auto" id="divuploaddoc" runat="server" visible="false">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div16">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div17" style="padding: 35px; border: medium ridge #CCCCCC;">
                <div id="Div33" runat="server" align="right" style="padding-bottom: 10px">

                    <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                        OnClick="LinkButton2_Click">
                        <span aria-hidden="true" style="color: Black" class=""></span>&nbsp;
                                     <span style="font-weight: bold; color: #000000">X Close</span></asp:LinkButton>

                </div>
                <div id="divlandpaperentry" runat="server">
                    <div class="table-hover table">
                        <div id="Div29" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                            <asp:Label ID="Label26" runat="server" Text="Upload Land Paper(s)" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                            &nbsp;
                        </div>
                        <div style="padding-left: 20px" align="left">
                            <span class="auto-style2 font"><strong>*If their are more than one type of paper(s)
                                related to a specific land, then there will be a seperate entry for each.</strong></span>
                        </div>
                        <table class="table table table-bordered grad2" width="90%" align="center">
                            <tr>
                                <td align="right" style="padding-right: 15px" width="35%">
                                    <asp:Label ID="Label33" runat="server" Text="Type Of Paper" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="65%">
                                    <asp:DropDownList ID="ddltypeofpaper" runat="server" AutoPostBack="True" ValidationGroup="updoc"
                                        class="select widthofboxes1" Height="28px" Font-Size="Medium" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="ddltypeofpaper"
                                        ValidationGroup="updoc" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                        class="font" Style="font-weight: 700; font-size: large; color: #000000">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 15px" width="35%">
                                    <asp:Label ID="Label27" runat="server" Text="Document/Paper Number" ForeColor="Black"
                                        class="font2" Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="65%">
                                    <asp:TextBox ID="txtpaperno" runat="server" class="select widthofboxes1" Height="28px" Font-Size="Medium"
                                        ValidationGroup="updoc" TextMode="SingleLine">
                                    </asp:TextBox>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender7" runat="server"
                                        targetcontrolid="txtpaperno" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\()[]- ,&{}!#%_''">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtpaperno"
                                        ValidationGroup="updoc" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                        class="font" Style="font-weight: 700; font-size: large; color: #000000">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 15px" width="35%">
                                    <asp:Label ID="lblupldoc" runat="server" Text="Upload Document" class="font2" ForeColor="Black"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="65%">
                                    <asp:FileUpload ID="fileuploadpaper" runat="server" class="select widthofboxes1"
                                        Height="28px" Font-Size="Medium" />
                                    <%--<asp:Label ID="Label28" runat="server" Text="* Only .pdf files upto 2GB are allowed."
                                        Font-Size="Small" Font-Italic="True" ForeColor="Black" Font-Bold="True"></asp:Label>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 15px" width="35%">
                                    <asp:Label ID="Label30" runat="server" Text="Remarks(If Any)" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="65%">
                                    <asp:TextBox ID="txtremarkslandrecordspaper" runat="server" class="select widthofboxes1" Font-Size="Medium"
                                        Height="75px" ValidationGroup="updoc" TextMode="MultiLine">
                                    </asp:TextBox>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender8" runat="server"
                                        targetcontrolid="txtremarkslandrecordspaper" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\()[]- ,&%!{}''">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <%-- </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnsubmit0" />
            </Triggers>
        </asp:UpdatePanel>--%>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" class="font"
                                        ControlToValidate="txtremarkslandrecordspaper" Display="Dynamic" ErrorMessage="Remarks can not exceed the 200 Characters!!"
                                        Style="color: #000000; font-weight: 700; font-size: small;" ValidationExpression="^[\s\S\d]{1,200}$"
                                        ValidationGroup="updoc">
                                    </asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 15px" width="50%">
                                    <asp:Button ID="Button1" runat="server" Text="Submit" class="btn select buttondocumentupload" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                        CausesValidation="true" ValidationGroup="updoc" Style="background-color: #99FFCC; color: Black; font-weight: bold"
                                        OnClick="Button1_Click" />
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:Button ID="Button2" runat="server" Text="Clear" class="btn select gradbody buttondocumentupload" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                        Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button2_Click" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br />
                <br />
                <div id="divlandpapergrd" runat="server">
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="color: Black; font-weight: 700" class="font2">:: Uploaded Land Record(s)
                                Paper Details ::</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <div style="text-align: center">
                                <asp:LinkButton ID="btnprntlanrecordpaper" runat="server" CssClass="btn gradbody" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                    CausesValidation="False">
                                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp;
                    <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                <br />
                                <br />
                            </div>
                            <asp:GridView ID="grdlandrecordpapers" runat="server" AutoGenerateColumns="false"
                                DataKeyNames="Id" AllowPaging="true" PageSize="10" HeaderStyle-BackColor="#61A6F8"
                                HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center"
                                HeaderStyle-VerticalAlign="Middle" EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True"
                                Width="85%" ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnPageIndexChanging="grdlandrecordpapers_PageIndexChanging"
                                OnRowCommand="grdlandrecordpapers_RowCommand" OnRowDeleted="grdlandrecordpapers_RowDeleted"
                                OnRowDeleting="grdlandrecordpapers_RowDeleting" OnRowEditing="grdlandrecordpapers_RowEditing">
                                <alternatingrowstyle backcolor="White" />
                                <columns>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                        <itemtemplate>
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Place Details" ItemStyle-Width="40%">
                                        <itemtemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblzone" runat="server" Text="Zone" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lblzone1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lblzone2" Font-Italic="true" runat="server" Text='<%#Eval("ZoneName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lblstate" runat="server" Text="State" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lblstate1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lblstate2" Font-Italic="true" runat="server" Text='<%#Eval("StateName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lbldis" runat="server" Text="District" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lbldis1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lbldis2" Font-Italic="true" runat="server" Text='<%#Eval("DistrictName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lblcty" runat="server" Text="Location" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lblcty1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lblcty2" Font-Italic="true" runat="server" Text='<%#Eval("LocationName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lbladdresgrd" runat="server" Text="Address" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lbladdresgrd1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lbladdresgrd2" Font-Italic="true" runat="server" Text='<%#Eval("Address")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lbllrpid" runat="server" Text='<%#Eval("Id") %>' Visible="false" Font-Size="Smaller" />
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type Of Paper/Document" ItemStyle-Width="10%">
                                        <itemtemplate>
                                            <div style="padding-left: 5px; padding-right: 5px">
                                                <asp:Label ID="Label3" Font-Bold="true" runat="server" Text='<%#Eval("typeofpaper") %>'
                                                    class="fontingrid" />
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Document/Paper Number/Download" ItemStyle-Width="15%">
                                        <itemtemplate>
                                            <asp:LinkButton ID="Label11" Font-Bold="true" runat="server" Text='<%#Eval("TypeofPaperNumber") %>'
                                                class="fontingrid" CommandName="downloadpaper" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="17%">
                                        <itemtemplate>
                                            <asp:Label ID="Lab1" Font-Bold="true" runat="server" Text='<%#Eval("Remarks") %>'
                                                class="fontingrid" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit" ItemStyle-Width="13%">
                                        <itemtemplate>
                                            <asp:LinkButton ID="imgedit" CommandName="Edit" runat="server" CausesValidation="false"
                                                CssClass="btn btn-primary" ToolTip="Edit">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                                <span style="font-weight: bold; color: #000000"></span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="Imgdelete" CommandName="Delete" runat="server" CausesValidation="false"
                                                Visible="false" CssClass="btn btn-danger" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete?');">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-trash"></span>
                                                <span style="font-weight: bold; color: #000000"></span>
                                            </asp:LinkButton>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
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
                        </div>
                    </div>
                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div18">
            </div>
        </div>
        <div class="row" style="margin: auto" id="divuploadmaps" runat="server" visible="false">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div19">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div20" style="padding: 35px; border: medium ridge #CCCCCC;">
                <div id="Div34" runat="server" align="right" style="padding-bottom: 10px">

                    <asp:LinkButton ID="LinkButton3" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                        OnClick="LinkButton3_Click">
                        <span aria-hidden="true" style="color: Black" class=""></span>&nbsp;
                                     <span style="font-weight: bold; color: #000000">X Close</span></asp:LinkButton>

                </div>
                <div id="divmapentry" runat="server">
                    <div class="table-hover table">
                        <div id="Div30" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                            <asp:Label ID="Label29" runat="server" Text="Upload Land Map(s)" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                            &nbsp;
                        </div>
                        <div style="padding-left: 20px" align="left">
                            <span class="auto-style2 font"><strong>*If their are more than one Map(s) related to
                                a specific land, then there will be a seperate entry for each.</strong></span>
                        </div>
                        <table class="table table table-bordered grad2" width="90%" align="center">
                            <tr>
                                <td align="right" style="padding-right: 30px">
                                    <asp:Label ID="Label32" runat="server" Text="Upload Map" class="font2" ForeColor="Black"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 10px">
                                    <asp:FileUpload ID="fileupload1" runat="server" class="select widthofboxes1" Height="28px" Font-Size="Medium" />
                                    <%--<asp:Label ID="Label34" runat="server" Text="* Only .pdf files upto 2GB are allowed."
                                        class="font" Font-Italic="True" ForeColor="Red" Font-Bold="True" Style="font-size: small; color: #000000"></asp:Label>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 15px" width="50%">
                                    <asp:Label ID="Label31" runat="server" Text="Remarks(If Any)" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:TextBox ID="txtremarksuploadmap" runat="server" class="select widthofboxes1"
                                        Height="75px" Font-Size="Medium" ValidationGroup="enc" TextMode="MultiLine">
                                    </asp:TextBox>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender9" runat="server"
                                        targetcontrolid="txtremarksuploadmap" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/\()[]- ,&%!{}''">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <%-- </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnsubmit0" />
            </Triggers>
        </asp:UpdatePanel>--%>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" class="font"
                                        ControlToValidate="txtremarksuploadmap" Display="Dynamic" ErrorMessage="Remarks can not exceed the 200 Characters!!"
                                        Style="color: #000000; font-weight: 700; font-size: small;" ValidationExpression="^[\s\S\d]{1,200}$"
                                        ValidationGroup="upmap">
                                    </asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 15px" width="50%">
                                    <asp:Button ID="btnmapupload" runat="server" Text="Submit" class="btn select buttondocumentupload" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                        CausesValidation="true" ValidationGroup="upmap" Style="background-color: #99FFCC; color: Black; font-weight: bold"
                                        OnClick="btnmapupload_Click" />
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:Button ID="btnclosemap" runat="server" Text="Clear" class="btn select gradbody buttondocumentupload" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                                        Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btnclosemap_Click" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br />
                <br />
                <div id="divgrdmaps" runat="server">
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="color: Black; font-weight: 700" class="font2">:: Uploaded Land Map(s) ::</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <div style="text-align: center">
                                <asp:LinkButton ID="btnprintmap" runat="server" CssClass="btn gradbody" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px">
                                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp;
                    <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                <br />
                                <br />
                            </div>
                            <asp:GridView ID="grdlandmap" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
                                AllowPaging="true" PageSize="10" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="85%"
                                ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnPageIndexChanging="grdlandmap_PageIndexChanging"
                                OnRowCommand="grdlandmap_RowCommand" OnRowDeleted="grdlandmap_RowDeleted" OnRowDeleting="grdlandmap_RowDeleting">
                                <alternatingrowstyle backcolor="White" />
                                <columns>
                                    <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                        <itemtemplate>
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Place Details" ItemStyle-Width="45%">
                                        <itemtemplate>
                                            <div style="padding: 10px">
                                                <asp:Label ID="lblzone" runat="server" Text="Zone" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lblzone1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lblzone2" Font-Italic="true" runat="server" Text='<%#Eval("ZoneName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lblstate" runat="server" Text="State" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lblstate1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lblstate2" Font-Italic="true" runat="server" Text='<%#Eval("StateName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lbldis" runat="server" Text="District" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lbldis1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lbldis2" Font-Italic="true" runat="server" Text='<%#Eval("DistrictName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lblcty" runat="server" Text="Location" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lblcty1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lblcty2" Font-Italic="true" runat="server" Text='<%#Eval("LocationName")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                                <br />
                                                <asp:Label ID="lbladdresgrd" runat="server" Text="Address" Font-Size="9pt" Font-Bold="true"
                                                    ForeColor="Maroon" />
                                                <asp:Label ID="lbladdresgrd1" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                                <asp:Label ID="lbladdresgrd2" Font-Italic="true" runat="server" Text='<%#Eval("Address")%>'
                                                    Font-Size="8pt" Font-Bold="true" />
                                            </div>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Left" />
                                        <headerstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Download Map" ItemStyle-Width="15%">
                                        <itemtemplate>
                                            <asp:LinkButton ID="Label11" Font-Bold="true" runat="server" Text="Download" class="fontingrid"
                                                CommandName="downloadmap" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="20%">
                                        <itemtemplate>
                                            <asp:Label ID="Lab1" Font-Bold="true" runat="server" Text='<%#Eval("Remarks") %>'
                                                class="fontingrid" />
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete" ItemStyle-Width="15%">
                                        <itemtemplate>
                                            <asp:LinkButton ID="imgedit" CommandName="Edit" runat="server" CausesValidation="false"
                                                Visible="false" CssClass="btn btn-primary" ToolTip="Edit">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                                <span style="font-weight: bold; color: #000000"></span>
                                            </asp:LinkButton>
                                            <asp:LinkButton ID="Imgdelete" CommandName="Delete" runat="server" CausesValidation="false"
                                                Visible="true" CssClass="btn btn-danger" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete?');">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-trash"></span>
                                                <span style="font-weight: bold; color: #000000"></span>
                                            </asp:LinkButton>
                                        </itemtemplate>
                                        <itemstyle horizontalalign="Center" />
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
                        </div>
                    </div>
                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div21">
            </div>
        </div>
        <br />
        <br />
        <br />
        <%-- </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnsubmit0" />
            </Triggers>
        </asp:UpdatePanel>--%>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
