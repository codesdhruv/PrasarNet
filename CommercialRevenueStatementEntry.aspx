<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommercialRevenueStatementEntry.aspx.cs" Inherits="PrasarNet.CommercialRevenueStatementEntry" MasterPageFile="~/Site1.Master" %>

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
        function MouseEvents(objRef, evt) {
            if (evt.type == "mouseover") {
                objRef.style.cursor = 'default';
                objRef.style.backgroundColor = "#EEEED1";
            }
            else {
                if (evt.type == "mouseout") objRef.style.backgroundColor = "#F7F7F7";
            }
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
                <%--<asp:LinkButton CssClass="font2" Font-Bold="true" ForeColor="Blue" ID="" runat="server" ></asp:LinkButton>--%>
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
        <div id="Div2" class="row" runat="server" style="padding-right: 20px; margin: auto">
            <div id="Div6" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="center">
                <br />
                <br />
                <br />
            </div>
            <div id="Div13" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="center">
                <br />
                <asp:Label ID="Label43" Style="font-weight: bold; font-size: x-large; color: Black; background-color: ActiveCaption"
                    runat="server" Text=":: Commercial Revenue ::"></asp:Label>
                <br />
                <br />
            </div>
            <div id="Div14" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" OnClick="btnback_Click"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div4">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div122">
                <div runat="server" visible="true">
                    <table>
                        <tr>
                            <td align="center" width="100%">


                                <div id="divoptions" runat="server" class="row">
                                    <div class="col-lg-6 col-md-6" runat="server" style="padding-bottom: 10px">
                                        <asp:LinkButton ID="btngemreports" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="200px" BackColor="#F5B7B1" OnClick="btngemreports_Click">
                                            <span style="font-weight: bold; color: #000000">Reports</span></asp:LinkButton>

                                    </div>



                                    <div class="col-lg-6 col-md-6" style="padding-left: 15px; padding-bottom: 10px">
                                        <asp:LinkButton ID="lnkdownload" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="200px" BackColor="#4196F8">
                                            <span style="font-weight: bold; color: #000000">Download Mannual</span></asp:LinkButton>
                                        <%--&nbsp;&nbsp;&nbsp;--%>
                                    </div>
                                    <%--  <div class="col-lg-4 col-md-4" style="padding-right: -1px; padding-bottom: 10px">
                                        <asp:LinkButton ID="btneditddo" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="200px" BackColor="#A3E4D7">
                    <span style="font-weight: bold; color: #000000">Edit Linked DDO</span></asp:LinkButton>

                                    </div>--%>
                                </div>

                                <%-- <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 10px; padding-bottom: 10px">
                                <asp:Label ID="Label4" runat="server" Text="Commercial Revenue Entry" Style="font-weight: bold; font-size: large; color: Black;"></asp:Label>&nbsp;
                            </div>--%>
                                




                            </td>


                        </tr>
                    </table>

                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div1">
            </div>
        </div>

        <div class="row" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div7">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div12" visible="true">
                <asp:UpdatePanel runat="server">
                    <contenttemplate>
                        <asp:Label ID="Label12" runat="server" Style="font-weight: 700; color: White; font-size: medium"
                            Text=""></asp:Label>
                        <div id="divcommercialrevMasterDataentry" runat="server" visible="true" class="table-hover">
                            <%-- <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 10px; padding-bottom: 10px">
                                <asp:Label ID="Label4" runat="server" Text="Commercial Revenue Entry" Style="font-weight: bold; font-size: large; color: Black;"></asp:Label>&nbsp;
                            </div>--%>

                            <div id="tblcomentry2" runat="server" class="gradheader">
                                <hr>
                                <div class="row" style="margin: auto; padding-top: 0px; padding-bottom: 0px">
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="Label17" runat="server" Text="1. Month" ForeColor="Black" class="fontingrid"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                            <br />
                                        <br />
                                        <asp:DropDownList ID="ddlmonth" runat="server" AppendDataBoundItems="true" AutoPostBack="True" class="select widthofboxes" Height="22px" ValidationGroup="next" OnSelectedIndexChanged="ddlmonth_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" class="font" ControlToValidate="ddlmonth" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="next"></asp:RequiredFieldValidator>


                                        <br />


                                    </div>
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="Label18" runat="server" Text="2. Year" ForeColor="Black" class="fontingrid"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                <br />
                                        <br />
                                        <asp:DropDownList ID="ddlyear" runat="server" AppendDataBoundItems="true" AutoPostBack="True" class="select widthofboxes" Height="22px" ValidationGroup="next" OnSelectedIndexChanged="ddlyear_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" class="font" ControlToValidate="ddlyear" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="next"></asp:RequiredFieldValidator>

                                        <br />

                                    </div>
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="lblwing" runat="server" Text="3. Agency" ForeColor="Black" class="fontingrid"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                <br />
                                        <br />
                                        <asp:DropDownList ID="ddlagency" runat="server" AppendDataBoundItems="true" AutoPostBack="True" class="select widthofboxes" Height="22px" ValidationGroup="next" OnSelectedIndexChanged="ddlagency_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" class="font" ControlToValidate="ddlagency" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="next"></asp:RequiredFieldValidator>

                                        <br />

                                    </div>
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="lblFrom" runat="server" Text="4. Type of Billing" ForeColor="Black"
                                            class="fontingrid" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                <br />
                                        <br />
                                        <asp:DropDownList ID="ddltypofbilling" runat="server" AppendDataBoundItems="true" AutoPostBack="True" class="select widthofboxes" Height="22px" ValidationGroup="next" OnSelectedIndexChanged="ddltypofbilling_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" class="font" ControlToValidate="ddltypofbilling" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="next"></asp:RequiredFieldValidator>

                                        <br />

                                    </div>
                                </div>
                                <hr>
                                <div class="row " style="margin: auto; padding-top: 0px; padding-bottom: 0px">
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="Label19" runat="server" Text="5. Name Of Commercial Wing" ForeColor="Black"
                                            class="fontingrid" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                        <br />
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="ddlnameofcomwing" runat="server" AppendDataBoundItems="true" AutoPostBack="false" class="select widthofboxes" Height="22px" ValidationGroup="next">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" class="font" ControlToValidate="ddlnameofcomwing" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="next"></asp:RequiredFieldValidator>



                                    </div>
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="Label3" runat="server" Text="6. Name Of Billing Unit" ForeColor="Black"
                                            class="fontingrid" Style="font-weight: bold;"></asp:Label>
                                        <br />
                                        &nbsp;
                            <br />
                                        <br />
                                        <asp:DropDownList ID="ddlnameofbillingunit" runat="server" AppendDataBoundItems="true" class="select widthofboxes" Height="22px" AutoPostBack="True"
                                            ValidationGroup="next" OnSelectedIndexChanged="ddlnameofbillingunit_SelectedIndexChanged">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" class="font" ControlToValidate="ddlnameofbillingunit" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="next"></asp:RequiredFieldValidator>


                                    </div>
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="Label20" runat="server" Text="7. Channel" ForeColor="Black"
                                            class="fontingrid" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                        <br />
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="ddlchannel" runat="server" AppendDataBoundItems="true" AutoPostBack="false" class="select widthofboxes" Height="22px" ValidationGroup="next">
                                        </asp:DropDownList>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" class="font" ControlToValidate="ddlchannel" Display="Dynamic" ErrorMessage="*"
                                            ForeColor="Red" SetFocusOnError="True" ValidationGroup="next">
                                        </asp:RequiredFieldValidator>


                                    </div>
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="Label21" runat="server" Text="8. Total gross billing amount during the month (in Rs)" ForeColor="Black" class="fontingrid"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                               <br />
                                        <br />
                                        <asp:TextBox ID="txttotalgrossbillingamyt" runat="server" autocomplete="off" class="select widthofboxes" placeholder="Gross Billing Amount" Height="22px" ValidationGroup="next"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txttotalgrossbillingamyt"
                                            Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="next"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator4" ValidationGroup="next" Display="Dynamic" ControlToValidate="txttotalgrossbillingamyt" ValidationExpression="^\d{0,10}(\.\d{1,2})?$" ErrorMessage="Numerical Data Upto 12 digits are allowed, which includes maximum 10 digits before decimal point and maximum two digit after that point!!" Style="color: #FF0000; font-weight: 700" />


                                    </div>


                                </div>
                                <hr>
                                <div class="row " style="margin: auto; padding-top: 0px; padding-bottom: 0px">

                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="Label5" runat="server" Text="9. Total Discount amount during the month (in Rs)" ForeColor="Black"
                                            class="fontingrid" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                        <br />
                                        <br />
                                        <asp:TextBox ID="txtdiscountamount" runat="server" autocomplete="off" placeholder="Total Discount Amount" class="select widthofboxes" Height="22px" ValidationGroup="next"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdiscountamount" ValidationGroup="next"
                                            Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^\d{0,10}(\.\d{1,2})?$" Display="Dynamic" ValidationGroup="next"
                                            ErrorMessage="Numerical Data Upto 12 digits are allowed, which includes maximum 10 digits before decimal point and maximum two digit after that point!!"
                                            ControlToValidate="txtdiscountamount" Style="color: #FF0000; font-weight: 700" />
                                        <br />
                                    </div>
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="Label7" runat="server" Text="10. Total GST amount during the month (in Rs)" ForeColor="Black" class="fontingrid"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                <br />
                                        <br />
                                        <asp:TextBox ID="txtGSTamt" runat="server" autocomplete="off" ValidationGroup="next" placeholder="Total GST Amount" class="select widthofboxes" Height="22px" AutoPostBack="True" OnTextChanged="txtGSTamt_TextChanged"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtGSTamt"
                                            Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="next"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator2" ControlToValidate="txtGSTamt" ValidationExpression="^\d{0,10}(\.\d{1,2})?$" Display="Dynamic"
                                            ValidationGroup="next" ErrorMessage="Numerical Data Upto 12 digits are allowed, which includes maximum 10 digits before decimal point and maximum two digit after that point!!"
                                            Style="color: #FF0000; font-weight: 700" />
                                        <br />
                                    </div>
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="Label9" runat="server" Text="11. Total/Net billing amount during the month (in Rs)" ForeColor="Black"
                                            class="fontingrid" Style="font-weight: bold;"></asp:Label>
                                        <br />
                                        &nbsp;
                                <br />
                                        <asp:TextBox ID="txtnetbilling" runat="server" placeholder="Net Billing Amount" autocomplete="off" ReadOnly="true" class="select widthofboxes" Height="22px" ValidationGroup="next"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtnetbilling"
                                            Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="next"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ValidationExpression="^[0-9]\d{0,9}?%?$"
                                    ErrorMessage="Numeric Data upto 10 digits are allowed (Positive Integers Allowed)!!"
                                    ControlToValidate="txtpaymntsgemorderpaymentsareaffected_20days" Style="color: #FF0000; font-weight: 700" />--%>
                                        <br />
                                    </div>
                                    <div class="col-lg-3 col-md-3" align="left">
                                        <asp:Label ID="Label22" runat="server" Text="12. Total amount realised during the month" ForeColor="Black" class="fontingrid"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                <br />
                                        <br />
                                        <br />
                                        <asp:TextBox ID="txttotalamtrealised" runat="server" placeholder="Total Amount Realised" autocomplete="off" class="select widthofboxes" Height="22px" ValidationGroup="next"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txttotalamtrealised"
                                            Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="next"
                                            class="font">
                                        </asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ControlToValidate="txttotalamtrealised" ValidationExpression="^\d{0,10}(\.\d{1,2})?$"
                                            ValidationGroup="next" ErrorMessage="Numerical Data Upto 12 digits are allowed, which includes maximum 10 digits before decimal point and maximum two digit after that point!!"
                                            Style="color: #FF0000; font-weight: 700" Display="Dynamic" />
                                        <br />
                                    </div>
                                </div>

                                <hr>
                                <div id="divsubupdate1" runat="server" style="margin: auto; padding-top: 5px; padding-bottom: 8px" align="center" class="row grad3">
                                    <div class="col-lg-1 col-md-1" runat="server" align="center">
                                    </div>
                                    <div class="col-lg-10 col-md-10" runat="server" align="center">


                                        <asp:Button ID="btnupdate" runat="server" Text="Update and Next" class="btn select button111" ValidationGroup="next"
                                            Style="background-color: #99FFCC; color: Black; font-weight: bold" Visible="False" OnClientClick="return confirm('Are you sure to Update?');" OnClick="btnupdate_Click" />
                                        <asp:Button ID="btnsubmit" runat="server" ValidationGroup="next" class="btn select button111"
                                            Style="background-color: #99FFCC; color: Black; font-weight: bold" Text="Save &amp; Next" OnClick="btnsubmit_Click" />
                                        &nbsp; &nbsp;&nbsp;&nbsp;
                               
                                    <asp:Button ID="btncncl" runat="server" Text="Clear" class="btn select button111"
                                        Style="color: Black; font-weight: bold; background-color: #F1948A;" CausesValidation="False" OnClick="btncncl_Click" />
                                        &nbsp;
                                    <asp:Button ID="btncancelforedit" runat="server" CausesValidation="False" class="btn select button111" Style="color: Black; font-weight: bold; background-color: #F1948A;" Text="Cancel" Visible="False" OnClick="btncancelforedit_Click" />



                                    </div>
                                    <div class="col-lg-1 col-md-1" runat="server" align="center">
                                    </div>
                                </div>

                                <br />
                                <br />
                            </div>
                        </div>
                        <div id="divtransentry" runat="server" visible="false" class="table-hover">
                            <%--  <div id="Div3" runat="server" align="center" class="grad3" style="padding-top: 10px; padding-bottom: 10px">
                                <asp:Label ID="Label8" runat="server" Text="Bifurcation Of Total Amount Realised" Style="font-weight: bold; font-size: large; color: Black;"></asp:Label>&nbsp;
                            </div>--%>

                            <div id="Div5" runat="server" class="gradheader">
                                <div class="panel panel-primary">
                                    <div class="panel-heading grad3">
                                        <asp:Label ID="Label42" runat="server" style="font-weight: bold; color: Black;" class="font2" Text=":: Enter Details of Amount Realised ::"></asp:Label>
                                    </div>
                                    <div class="panel-body gradheader table-responsive">
                                        <%--         <div id="divtrnentry" style="text-align: center" runat="server" visible="true">--%>

                                        <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="false" Width="70%"
                                            HeaderStyle-BackColor="#61A6F8" ShowFooter="true" HeaderStyle-Font-Bold="true" ShowHeaderWhenEmpty="true" ShowHeader="true"
                                            PageSize="15" AllowPaging="true" HeaderStyle-ForeColor="White" ToolTip="Bifurcation Of Total Amount Realised" OnRowDataBound="gvDetails_RowDataBound" OnRowCommand="gvDetails_RowCommand" OnRowEditing="gvDetails_RowEditing" OnRowUpdating="gvDetails_RowUpdating" OnPageIndexChanging="gvDetails_PageIndexChanging" OnRowCancelingEdit="gvDetails_RowCancelingEdit" OnRowDeleting="gvDetails_RowDeleting">
                                            <alternatingrowstyle horizontalalign="Center" verticalalign="Middle" />
                                            <columns>
                                                <asp:TemplateField HeaderText="S.No.">
                                                    <edititemtemplate>
                                                        <asp:Label ID="lblRow" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                    </edititemtemplate>
                                                    <itemtemplate>
                                                        <asp:Label ID="lblrowid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                    </itemtemplate>
                                                    <footertemplate>
                                                        <%--  <asp:Label ID="lbl" runat="server" Text="Plan Name"></asp:Label><br />
                                                            <asp:Label ID="PlanNote" runat="server" Text="Plan Note"></asp:Label>--%>
                                                    </footertemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Financial Year">
                                                    <edititemtemplate>
                                                        <asp:DropDownList ID="ddlfinyearEditgrd" runat="server" AppendDataBoundItems="true" AutoPostBack="false" class="select widthofboxes" Height="22px" ValidationGroup="nextgridedit">
                                                        </asp:DropDownList>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator156" runat="server" class="font" ControlToValidate="ddlfinyearEditgrd" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="nextgridedit"></asp:RequiredFieldValidator>
                                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("Id") %>' class="fontingrid" Visible="false" />

                                                    </edititemtemplate>
                                                    <itemtemplate>
                                                        <asp:Label ID="lblfinyeareditemgrd" runat="server" Text='<%#Eval("Year") %>' class="fontingrid" />
                                                        <asp:Label ID="lblid2" runat="server" Text='<%#Eval("Id") %>' class="fontingrid" Visible="false" />
                                                    </itemtemplate>
                                                    <footertemplate>
                                                        <asp:DropDownList ID="ddlfinyearfootergrd" runat="server" AppendDataBoundItems="true" AutoPostBack="false" class="select widthofboxes" Height="22px" ValidationGroup="nextgrid">
                                                        </asp:DropDownList>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator157" runat="server" class="font" ControlToValidate="ddlfinyearfootergrd" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="nextgrid"></asp:RequiredFieldValidator>

                                                    </footertemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Month">
                                                    <edititemtemplate>
                                                        <asp:DropDownList ID="ddlmonthEditgrd" runat="server" AppendDataBoundItems="true" AutoPostBack="false" class="select widthofboxes" Height="22px" ValidationGroup="nextgridedit">
                                                        </asp:DropDownList>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator158" runat="server" class="font" ControlToValidate="ddlmonthEditgrd" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="nextgridedit"></asp:RequiredFieldValidator>


                                                    </edititemtemplate>
                                                    <itemtemplate>
                                                        <asp:Label ID="lblmontheditemgrd" runat="server" Text='<%#Eval("month") %>' class="fontingrid" />
                                                    </itemtemplate>
                                                    <footertemplate>
                                                        <asp:DropDownList ID="ddlmonthfootergrd" runat="server" AppendDataBoundItems="true" AutoPostBack="false" class="select widthofboxes" Height="22px" ValidationGroup="nextgrid">
                                                        </asp:DropDownList>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator159" runat="server" class="font" ControlToValidate="ddlmonthfootergrd" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="nextgrid"></asp:RequiredFieldValidator>

                                                    </footertemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Amount Realised during selected month">
                                                    <edititemtemplate>
                                                        <asp:TextBox ID="txtamtrealisededitgrd" runat="server" autocomplete="off" Text='<%#Eval("AmountRecieved") %>' class="select widthofboxes" Height="22px" ValidationGroup="nextgridedit"></asp:TextBox>
                                                        <asp:Label ID="lblamtrealisededitemgrd2" runat="server" Text='<%#Eval("AmountRecieved") %>' Visible="false" class="fontingrid" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator160" runat="server" class="font" ControlToValidate="txtamtrealisededitgrd" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="nextgridedit"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ControlToValidate="txtamtrealisededitgrd" ValidationExpression="^\d{0,10}(\.\d{1,2})?$"
                                                            ErrorMessage="Numerical Data Upto 12 digits are allowed, which includes maximum 10 digits before decimal point and maximum two digit after that point!!"
                                                            Style="color: #FF0000; font-weight: 700" Display="Dynamic" ValidationGroup="nextgridedit" />
                                                    </edititemtemplate>
                                                    <itemtemplate>
                                                        <asp:Label ID="lblamtrealisededitemgrd" runat="server" Text='<%#Eval("AmountRecieved") %>' class="fontingrid" />
                                                    </itemtemplate>
                                                    <footertemplate>
                                                        <asp:TextBox ID="txtamtrealisedfootergrd" runat="server" autocomplete="off" class="select widthofboxes" Height="22px" ValidationGroup="nextgrid"></asp:TextBox>

                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator161" runat="server" class="font" ControlToValidate="txtamtrealisedfootergrd" Display="Dynamic" ErrorMessage="*" ForeColor="Red" SetFocusOnError="True" ValidationGroup="nextgrid"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator3" ControlToValidate="txtamtrealisedfootergrd" ValidationExpression="^\d{0,10}(\.\d{1,2})?$"
                                                            ErrorMessage="Numerical Data Upto 12 digits are allowed, which includes maximum 10 digits before decimal point and maximum two digit after that point!!"
                                                            Style="color: #FF0000; font-weight: 700" Display="Dynamic" ValidationGroup="nextgrid" />

                                                        <br />
                                                        <asp:Label ID="lblt" runat="server" Text="Total" ForeColor="Black" Font-Bold="true" CssClass="fontingrid"></asp:Label>
                                                        :&nbsp
                                                        <asp:Label ID="lbltotal" runat="server" Text="" ForeColor="Black" Font-Bold="true" CssClass="fontingrid"></asp:Label>

                                                    </footertemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Action">
                                                    <edititemtemplate>
                                                        <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg"
                                                            ToolTip="Update" Height="25px" Width="25px" ValidationGroup="nextgridedit" />
                                                        &nbsp;&nbsp;
                                    <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/Images/Cancel.png"
                                        ToolTip="Cancel" Height="25px" Width="25px" />
                                                    </edititemtemplate>
                                                    <itemtemplate>
                                                        <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" CommandArgument='<%#Eval("Id") %>'
                                                            ImageUrl="~/Images/Edit.png" ToolTip="Edit" Height="25px" Width="25px" />
                                                        &nbsp;&nbsp;
                                    <asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server"
                                        ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Height="25px" Width="25px" OnClientClick="return confirm('Are you sure to delete?');" />
                                                    </itemtemplate>
                                                    <footertemplate>
                                                        <asp:Button ID="btnAdd" runat="server" Text="Add New" ForeColor="Blue" Font-Bold="true"
                                                            CommandName="AddNew" Width="80px" Height="30px" ValidationGroup="nextgrid" />

                                                    </footertemplate>
                                                </asp:TemplateField>
                                            </columns>
                                            <editrowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                                verticalalign="Middle" />
                                            <footerstyle horizontalalign="Center" verticalalign="Middle" cssclass="gradheader"
                                                font-bold="True" height="42px"></footerstyle>



                                            <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                                wrap="True"></headerstyle>
                                            <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                                verticalalign="Middle" />
                                            <pagersettings position="TopAndBottom" />
                                            <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                                horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                                borderwidth="2" />
                                        </asp:GridView>

                                        <%-- </div>--%>
                                        <br />
                                        <div id="divmovenext" runat="server" align="center" class="row grad3" style="margin: auto; padding-top: 5px; padding-bottom: 8px">
                                            <div runat="server" align="center" class="col-lg-1 col-md-1">
                                            </div>
                                            <div runat="server" align="center" class="col-lg-10 col-md-10">
                                                <asp:Button ID="btnpreviewandsubmit" runat="server" class="btn select button111" Style="background-color: LightBlue; color: Black; font-weight: bold" Text="Preview and Submit" ValidationGroup="next" OnClick="btnpreviewandsubmit_Click" Enabled="False" />
                                                &nbsp; &nbsp;
                                            </div>
                                            <div runat="server" align="center" class="col-lg-1 col-md-1">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div id="divprev" runat="server" visible="false" class="table-hover">
                            <div class="col-lg-1 col-md-1" runat="server" align="center">
                            </div>
                            <div class="col-lg-10 col-md-10" runat="server" align="center">

                                <div id="div233" runat="server" style="width: 60%" class="table table-bordered table-responsive">

                                    <div id="Div89" runat="server" class="gradheader">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading grad3">
                                                <asp:Label ID="lblpanelheadingprev" runat="server" Text=":: Preview and Submit ::" Style="font-weight: bold; color: Black;" class="font2"></asp:Label>
                                                <%--<span style="font-weight: bold; color: Black;" class="font2">:: Preview and Submit ::</span>--%>
                                            </div>
                                            <div class="panel-body gradheader table-responsive">
                                                <br />
                                                <asp:Button ID="btncancelprev" runat="server" CausesValidation="False" class="btn select button111" Style="color: Black; font-weight: bold; background-color: #F1948A;" Text="Back to Entry Form" Visible="False" OnClick="btncancelprev_Click" />

                                                <br />

                                                <br />
                                                <%--         <div id="divtrnentry" style="text-align: center" runat="server" visible="true">--%>
                                                <table width="80%" runat="server" border="5" cellpadding="5" rules="rows" cellspacing="10" align="center">
                                                    <tr>
                                                        <td align="right" style="padding-right: 70px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label8" runat="server" Text="1. Month" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lblmnthprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 80px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label11" runat="server" Text="2. Year" CssClass="font" Font-Bold="true"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lblyearprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 60px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label13" runat="server" Text="3. Agency" CssClass="font" Font-Bold="true"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lblagencyprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 17px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label16" runat="server" Text="4. Type of Billing" CssClass="font" Font-Bold="true"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lbltypofbillingprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 13px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label23" runat="server" Text="5. Name Of Com-" Font-Bold="true" CssClass="font"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label4" runat="server" Text="-mercial Wing" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lblnameofcommbillingprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 20px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label24" runat="server" Text="6. Name Of Bill-" Font-Bold="true" CssClass="font"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label31" runat="server" Text="-ing Unit" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lblnamofbillingunitprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 54px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label25" runat="server" Text="7. Channel" CssClass="font" Font-Bold="true"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lblchannelprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 8px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label26" runat="server" Text="8. Total gross bill-" Font-Bold="true" CssClass="font"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label32" runat="server" Text="-ing amount during" Font-Bold="true" CssClass="font"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label33" runat="server" Text="the month (in Rs) " Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lblgrossbillprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 15px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label27" runat="server" Text="9. Total Discount" CssClass="font" Font-Bold="true"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label34" runat="server" Text="amount during " CssClass="font" Font-Bold="true"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label35" runat="server" Text="the month (in Rs)" CssClass="font" Font-Bold="true"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lbldicountprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 9px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label28" runat="server" Text="10. Total GST amo-" CssClass="font" Font-Bold="true"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label36" runat="server" Text="-unt during the" CssClass="font" Font-Bold="true"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label37" runat="server" Text=" month (in Rs)" CssClass="font" Font-Bold="true"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lblgstprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 8px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label29" runat="server" Text="11. Total/Net billing" CssClass="font" Font-Bold="true"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label38" runat="server" Text="amount during the" CssClass="font" Font-Bold="true"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label39" runat="server" Text="month (in Rs) " CssClass="font" Font-Bold="true"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lblnetbillprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="padding-right: 19px; padding-top: 30px; width: 40%">
                                                            <asp:Label ID="Label30" runat="server" Text="12. Total amount " CssClass="font" Font-Bold="true"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label40" runat="server" Text="realised during the" CssClass="font" Font-Bold="true"></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label41" runat="server" Text="month (in Rs) " CssClass="font" Font-Bold="true"></asp:Label>
                                                        </td>
                                                        <td align="left" style="padding-left: 20px; padding-top: 30px; width: 50%">
                                                            <asp:Label ID="lblamountrealisedprev" runat="server" Font-Bold="true" CssClass="font"></asp:Label>
                                                            <asp:Label ID="lbltotalgrdprev" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <br />
                                                <asp:GridView ID="grdprev" runat="server" AutoGenerateColumns="false" Width="70%"
                                                    HeaderStyle-BackColor="#61A6F8" ShowFooter="true" HeaderStyle-Font-Bold="true" ShowHeaderWhenEmpty="true" ShowHeader="true"
                                                    PageSize="15" AllowPaging="true" HeaderStyle-ForeColor="White" ToolTip="Preview the Bifurcation Of Total Amount Realised" OnRowDataBound="grdprev_RowDataBound">
                                                    <alternatingrowstyle horizontalalign="Center" verticalalign="Middle" />
                                                    <columns>
                                                        <asp:TemplateField HeaderText="S.No.">

                                                            <itemtemplate>
                                                                <asp:Label ID="lblrowidprev" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                            </itemtemplate>

                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Financial Year">

                                                            <itemtemplate>
                                                                <asp:Label ID="lblfinyeareditemgrdprev" runat="server" Text='<%#Eval("Year") %>' class="fontingrid" />
                                                            </itemtemplate>

                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Month">

                                                            <itemtemplate>
                                                                <asp:Label ID="lblmontheditemgrdprev" runat="server" Text='<%#Eval("month") %>' class="fontingrid" />
                                                            </itemtemplate>

                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Amount Realised during selected month">

                                                            <itemtemplate>
                                                                <div style="padding: 6px">
                                                                    <asp:Label ID="lblamtrealisededitemgrdprev" runat="server" Text='<%#Eval("AmountRecieved") %>' class="fontingrid" />
                                                                </div>
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

                                                <%-- </div>--%>
                                                <br />
                                                <div id="div3" runat="server" align="center" class="row grad3" style="margin: auto; padding-top: 5px; padding-bottom: 8px">
                                                    <div runat="server" align="center" class="col-lg-1 col-md-1">
                                                    </div>
                                                    <div runat="server" align="center" class="col-lg-10 col-md-10">
                                                        <div class="row" style="margin: auto">
                                                            <div runat="server" align="center" class="col-lg-4 col-md-4" style="padding-top: 10px; padding-bottom: 10px">
                                                                <asp:Button ID="Button1" runat="server" class="btn select button111" OnClientClick="return confirm('After submitting this record, you will be unable to edit the same. Do you still want to submit?');" Style="background-color: #82E0AA; color: Black; font-weight: bold" Text="Submit" OnClick="Button1_Click" />
                                                                &nbsp;
                                                            </div>
                                                            <div runat="server" align="center" class="col-lg-4 col-md-4" style="padding-top: 10px; padding-bottom: 10px">
                                                                <asp:Button ID="btneditpart1" runat="server" class="btn select button111" Style="background-color: #B2BABB; color: Black; font-weight: bold" Text="Edit Part1" OnClick="btneditpart1_Click" />
                                                                &nbsp; 
                                                            </div>
                                                            <div runat="server" align="center" class="col-lg-4 col-md-4" style="padding-top: 10px; padding-bottom: 10px">
                                                                <asp:Button ID="btnEditPart2" runat="server" class="btn select button111" Style="background-color: #EC7063; color: Black; font-weight: bold" Text="Edit Part2" OnClick="btnEditPart2_Click" />
                                                                &nbsp;
                                                            </div>

                                                        </div>



                                                    </div>
                                                    <div runat="server" align="center" class="col-lg-1 col-md-1">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <br />

                            </div>
                            <div class="col-lg-1 col-md-1" runat="server" align="center">
                            </div>

                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                    </contenttemplate>
                </asp:UpdatePanel>


            </div>


            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div11">
            </div>
        </div>
</asp:Content>
