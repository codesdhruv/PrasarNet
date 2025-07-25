<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grievances.aspx.cs" Inherits="PrasarNet.Grievances" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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
        .btncomplete {
            background-color: greenyellow;
        }

        .btnpending {
            background-color: #EC7063;
        }

        .underline {
            text-decoration: underline;
        }

        .nounderline {
            text-decoration: none;
        }

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

        .gradnewbutton2 {
            background: linear-gradient(to right, #F99B62, #E67E22);
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

        .gradtotal {
            background-image: linear-gradient(-45deg, #CEECF5, #58ACFA);
        }

        .gradfile {
            background-image: linear-gradient(-45deg, #F6CECE, #FA5858);
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
        function DisableButtons() {
            var inputs = document.getElementsByTagName("INPUT");
            for (var i in inputs) {
                if (inputs[i].type == "button" || inputs[i].type == "submit") {
                    inputs[i].disabled = true;
                }
            }
        }
        window.onbeforeunload = DisableButtons;
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
                                <%--  <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>--%>
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
    </div>

    </span>
    
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

        <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto">
            <div id="Div5" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="center">
                <br />
                <br />
                <br />
            </div>
            <div id="Div3" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="center">
                <br />
                <asp:Label ID="Label43" Style="font-weight: bold; font-size: xx-large; color: Black; background-color: lightyellow"
                    runat="server" Text=":: Grievances ::"></asp:Label>
                <br />
                <br />
            </div>
            <div id="Div2" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" runat="server" CssClass="btn grad4" CausesValidation="False" OnClick="btnback_Click">
                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; font-size: medium; color: #000000">Home</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div id="divOPTIONS" runat="server" visible="true" align="center" style="margin: 25px 65px 25px 65px; border: medium groove #000000; padding: 10px 20px 10px 20px;">
            <%--<div align="left" runat="server">
                <asp:Label ID="lbloption" runat="server" Text="Options:" CssClass="fontheader" Font-Bold="true" ForeColor="Black" ></asp:Label>
            </div>--%>

            <div class="row" style="margin: auto">
                <div runat="server" id="divtrack" align="center" style="padding: 25px" class="col-lg-6 col-md-6">
                    <asp:Button ID="btntrackgrievances" runat="server" Text="Track Your Grievances" class="btn select buttondocumentupload fontforlargebtn gradtotal" BorderColor="White"
                        Style="color: Black; font-weight: bold; padding-top: 63px; padding-bottom: 62px; height: 180px;" CausesValidation="False" Width="80%" OnClick="btntrackgrievances_Click" BorderStyle="Ridge" BorderWidth="2px" />

                </div>

                <div runat="server" id="divfileaGrievance" align="center" style="padding: 25px" class="col-lg-6 col-md-6">
                    <asp:Button ID="btnfileGrievance" runat="server" Text="File your Grievances" class="btn select buttondocumentupload fontforlargebtn gradfile" BorderColor="White"
                        Style="color: Black; font-weight: bold; padding-top: 63px; padding-bottom: 62px; height: 180px;" CausesValidation="False" Width="80%" OnClick="btnfileGrievance_Click" BorderStyle="Ridge" BorderWidth="2px" />

                </div>
            </div>
        </div>
        <div id="diventry" runat="server" visible="false">


            <div class="row" style="margin: auto" runat="server" id="diventryform">
                <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
                <div align="center" class=" col-md-10 col-sm-10 col-lg-10" runat="server" id="div12">
                    <div runat="server" align="right" style="padding-right: 7px; padding-bottom: 10px">
                        <asp:Button ID="Button1" runat="server" Text=" Back " class="btn select buttondocumentupload font2 grad4"
                            Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button1_Click" />
                    </div>
                    <div id="divnote" runat="server" align="left" style="padding-top: 2px; padding-left: 10px; padding-right: 50px; padding-bottom: 8px">
                        <asp:Label runat="server" Font-Bold="true" Text="* Submitted Grievance is not allowed for editing and deleting." ForeColor="Black" CssClass="fontingrid"></asp:Label>
                    </div>
                    <div id="divdpcentry" runat="server" visible="true" class="table-hover">
                        <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                            <asp:Label ID="Label4" runat="server" Text="New Grievance" CssClass="fontheader1" Style="font-weight: bold; color: Black;"></asp:Label>
                            &nbsp;
                        </div>
                        <table class="table table table-bordered grad2">
                            <tr>
                                <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label ID="lblDept" runat="server" Text="Department(To which the Grievance is related)" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:DropDownList ID="ddldept" runat="server" AutoPostBack="True" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" Width="90%"
                                        ValidationGroup="sub" Height="30px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddldept_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvdept" runat="server" ControlToValidate="ddldept" ValidationGroup="sub"
                                        Display="Dynamic" ErrorMessage="Pls. Select a Department!!" ForeColor="Red" SetFocusOnError="True"
                                        Font-Bold="true" Font-Size="Medium">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label ID="Label3" runat="server" Text="Section/Station(To which the Grievance is related)" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:DropDownList ID="ddlsection" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="sub" Width="90%"
                                        Height="30px" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvsection" runat="server" ControlToValidate="ddlsection"
                                        Display="Dynamic" ErrorMessage="Pls. Select a section!!" ForeColor="Red" SetFocusOnError="True" ValidationGroup="sub"
                                        Font-Bold="true" Font-Size="Medium">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="40%" align="right" style="padding-right: 30px" class="auto-style3">
                                    <asp:Label ID="Label9" runat="server" Text="Subject of Grievance" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="60%" align="left" style="padding-left: 15px" class="auto-style3">
                                    <asp:DropDownList ID="ddlsubject" runat="server" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" Width="90%"
                                        ValidationGroup="sub" Height="30px" AppendDataBoundItems="true">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlsubject" ValidationGroup="sub"
                                        Display="Dynamic" ErrorMessage="Pls. Select a valid Subject!!" ForeColor="Red" SetFocusOnError="True"
                                        Font-Bold="true" Font-Size="Medium">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="40%" align="right" style="padding-right: 30px">
                                    <asp:Label ID="Label13" runat="server" Text="Grievance" ForeColor="Black"
                                        class="font2" Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                    &nbsp;
                                </td>
                                <td width="60%" align="left" style="padding-left: 15px">
                                    <asp:TextBox ID="txtgrievance" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="sub" style="padding: 7px"
                                        TextMode="MultiLine">
                                    </asp:TextBox>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Grievance not allowed to exceed by 1000 Characters!!"
                                        Style="color: #FF0000" ControlToValidate="txtgrievance" ValidationExpression="^[\s\S\d]{1,1000}$"
                                        Display="Dynamic" Font-Bold="true" Font-Size="Medium" ValidationGroup="sub">
                                    </asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Text Required!!"
                                        ControlToValidate="txtgrievance" ForeColor="Red" SetFocusOnError="True" Font-Bold="true" Font-Size="Medium"
                                        Display="Dynamic" ValidationGroup="sub">
                                    </asp:RequiredFieldValidator>
                                    <div runat="server" id="divLOupload" style="padding-top: 10px; padding-bottom: 10px">
                                        <asp:FileUpload ID="FileUpload1" runat="server" class="select widthofboxes1" Height="22px" Font-Size="Small" Font-Bold="true" />
                                        &nbsp;<span style="color: blue; font-weight: bold; font-size: small"><br />
                                            * Upload supporting document upto 3MB, If necessary</span>
                                        <br />
                                        <asp:Label ID="Label7" runat="server" ForeColor="blue" Font-Bold="true" Font-Size="Small" Text="** Only .pdf are allowed to upload"></asp:Label>

                                        <asp:Label ID="lblexception" Visible="true" runat="server" Text="" CssClass="fontingrid" Font-Bold="true" ForeColor="Blue"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 10px">
                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" Font-Size="Large" class="btn select buttondocumentupload" ValidationGroup="sub"
                                        Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnsubmit_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" />
                                </td>
                                <td align="left" style="padding-left: 10px">
                                    <asp:Button ID="btncncl" runat="server" Text="Clear" Font-Size="Large" class="btn select gradbody buttondocumentupload"
                                        Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px" />
                                    &nbsp;
                                </td>
                            </tr>
                        </table>

                    </div>
                </div>
                <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>
            </div>




        </div>
        <div id="divtrackgridprimary" runat="server" visible="false">
            <div runat="server" align="right" style="padding-right: 60px; padding-bottom: 10px">
                <asp:Button ID="Button2" runat="server" Text=" Back " class="btn select buttondocumentupload font2 grad4"
                    Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="Button2_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" />
            </div>
            <div class="row" style="margin: auto; padding: 30px">
                <%--<div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
                <div id="divgrd" visible="true" align="center" class=" col-md-12 col-sm-12 col-lg-12"
                    runat="server">
                    <%--  <div  runat="server" class="row" style="margin: auto">--%>
                    <div class="panel panel-primary">
                        <div class="panel-heading grad3">
                            <span style="font-weight: bold; color: Black;" class="font2">:: Grievance Details ::</span>
                        </div>
                        <div class="panel-body grad2 table-responsive">
                            <div id="divprisearch" style="text-align: center" runat="server" visible="true">
                                <table width="100%">
                                    <tr>
                                        <td align="center" style="padding: 10px">
                                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" Width="130px"
                                                BackColor="#F5B7B1" OnClick="btnprint1_Click">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                                <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="padding: 10px">
                                            <asp:Label ID="lblseacrh" runat="server" Text="Search your Grievance" Style="font-weight: 700" class="font2"></asp:Label>
                                            &nbsp;&nbsp;
                                            <asp:TextBox ID="txtsearch" runat="server" Placeholder=" By GrievanceID" CssClass="select font2" AutoPostBack="True" OnTextChanged="txtsearch_TextChanged" Height="28px"></asp:TextBox>
                                        </td>

                                    </tr>
                                </table>
                                <div id="div14" style="text-align: left; padding: 20px" runat="server" visible="true">
                                    <asp:Label ID="Label18" ForeColor="Black" Font-Bold="true" Font-Size="Small" runat="server" Text="* To send a Reminder (to Prasar Bharati Grievance Section/PBGS), in respect of unanswered/unresolved Grievances, Click on the Bell icon, given inside a table." Style="font-weight: 700" class="font2"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label19" ForeColor="Black" Font-Bold="true" Font-Size="Small" runat="server" Text="** You are allowed to send a reminder, only after the 30 Days of filing a fresh Grievance OR after the 30 Days of last reminder sent." Style="font-weight: 700" class="font2"></asp:Label>
                                </div>

                            </div>
                            <asp:GridView ID="grdcomdetails" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" BackColor="#F8F9F9"
                                DataKeyNames="Gre_Id" PageSize="10" ShowHeaderWhenEmpty="True" ToolTip="Grievances" AllowPaging="true"
                                Width="98%" OnPageIndexChanging="grdcomdetails_PageIndexChanging" OnRowCommand="grdcomdetails_RowCommand" OnRowDataBound="grdcomdetails_RowDataBound">
                                <headerstyle backcolor="#0099FF" font-bold="True" forecolor="Black" horizontalalign="Center" />
                                <columns>
                                    <asp:TemplateField HeaderText="S.No.">
                                        <itemtemplate>
                                            <div runat="server" align="center">

                                                <asp:Label ID="lblSNo" ForeColor="Black" Font-Size="Small" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                            </div>

                                        </itemtemplate>

                                        <%-- <ItemStyle Width="7%"></ItemStyle>--%>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Department/Section (To which the Grievance is related)">
                                        <itemtemplate>
                                            <div style="padding: 15px" runat="server" align="left">
                                                <asp:Label ID="lblDept" Font-Bold="true" ForeColor="Brown" runat="server" Text="Department : " class="fontingrid" Font-Size="Small" />
                                                <asp:Label ID="lbldept2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("department") %>' Font-Size="Small" />
                                                <br />
                                                <br />
                                                <asp:Label ID="lblsection" Font-Bold="true" ForeColor="Brown" runat="server" Text="Section : " class="fontingrid" Font-Size="Small" />
                                                <asp:Label ID="lblsection2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("Section") %>' Font-Size="Small" />

                                            </div>
                                        </itemtemplate>

                                        <%-- <ItemStyle Width="25%"></ItemStyle>--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Reference ID">
                                        <itemtemplate>
                                            <div style="padding: 15px" runat="server">
                                                <asp:Label ID="lblrefid" Font-Underline="false" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("referenceid") %>' Font-Size="Small" />

                                            </div>
                                        </itemtemplate>

                                        <%--<ItemStyle Width="10%"></ItemStyle>--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Subject">
                                        <itemtemplate>
                                            <div style="padding: 15px" runat="server">
                                                <asp:Label ID="lblsubject" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("subject") %>' Font-Size="Small" />
                                            </div>
                                        </itemtemplate>

                                        <%-- <ItemStyle Width="35%"></ItemStyle>--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Grievance">
                                        <itemtemplate>
                                            <div style="padding: 15px" runat="server">
                                                <asp:LinkButton ID="lblgrievancegrid" CommandName="download" Font-Bold="true" ForeColor="Blue" runat="server" Text='<%#Eval("Grievance") %>' Font-Size="Small" />

                                                <asp:Label ID="lblfileuploadoutput" runat="server" Text='<%#Eval("fileuploadoutput") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblgriefilename" runat="server" Text='<%#Eval("filename") %>' Visible="false"></asp:Label>
                                            </div>
                                        </itemtemplate>

                                        <%-- <ItemStyle Width="35%"></ItemStyle>--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Grievance registered On">
                                        <itemtemplate>
                                            <div style="padding: 15px" align="center" runat="server">
                                                <asp:Label ID="lblgrievanceregon" runat="server" ForeColor="Black" Text='<%#Eval("Grievance_regdOn") %>' Font-Size="Small" />
                                            </div>
                                        </itemtemplate>

                                        <%-- <ItemStyle Width="10%"></ItemStyle>--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Reply/Answer">
                                        <itemtemplate>
                                            <div style="padding: 15px" align="center" runat="server">
                                                <div align="left" runat="server" style="padding-top: 15px; padding-bottom: 15px; padding-left: 15px; padding-right: 15px">
                                                    <asp:Label ID="lblreceivedon" Font-Bold="true" ForeColor="Brown" runat="server" Text="Received on : " class="fontingrid" Font-Size="Small" />
                                                    <asp:Label ID="lblreceivedon2" runat="server" Font-Size="Small" ForeColor="Black"
                                                        CausesValidation="False" Text='<%#Eval("reply_given_on") %>'></asp:Label>

                                                    <br />
                                                    <br />
                                                    <asp:Label ID="lblfilercvd" Font-Bold="true" ForeColor="Brown" runat="server" Text="File Received : " Font-Size="Small" />
                                                    <asp:LinkButton ID="lblfilercvd2" Font-Bold="true" ToolTip="Attached Reply File" CommandName="downloadreplyfile" ForeColor="Blue" runat="server" Text="" Font-Size="Small"></asp:LinkButton>

                                                    <asp:Label ID="lblreplyattached" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                        CausesValidation="False" Visible="false" Text='<%#Eval("Replyattached") %>'></asp:Label>
                                                    <asp:Label ID="lblfilercvdoutput" runat="server" CssClass="fontingrid" ForeColor="Black"
                                                        CausesValidation="False" Visible="false" Text='<%#Eval("replyuploadoutput") %>'></asp:Label>
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label21" Font-Bold="true" ForeColor="Brown" runat="server" Text="Reply : " class="fontingrid" Font-Size="Small" />
                                                    <asp:Label ID="Label22" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("reply") %>' Font-Size="Small" />



                                                </div>
                                            </div>
                                        </itemtemplate>

                                        <%--<ItemStyle Width="10%"></ItemStyle>--%>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Status">
                                        <itemtemplate>
                                            <%-- <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server"
                                            Font-Size="Smaller" class="btn btn-info" Width="80px"></asp:LinkButton>--%>
                                            <div style="padding: 15px" align="center" runat="server">
                                                <asp:LinkButton ID="lnkstatus" CommandName="statusdetails" runat="server" Enabled="false" CssClass="btn font2" ForeColor="Blue" Font-Bold="true"
                                                    CausesValidation="False" Text='<%#Eval("GreStatus") %>' ToolTip="Final Status">
                                                </asp:LinkButton>

                                                <asp:Label ID="lblgrievanceIDGrid" runat="server" Text='<%#Eval("Gre_Id") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="lblresolvedflag" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:LinkButton ID="lnktrack" CommandName="Trackinfo" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue" Font-Bold="true" Font-Size="Small"
                                                    CausesValidation="False" Text="Track Grievance">
                                                </asp:LinkButton>

                                                <br />
                                                <br />
                                                <asp:LinkButton ID="lnkgetpdf" CommandName="GetaPdf" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue" Font-Bold="true" Font-Size="Small"
                                                    CausesValidation="False" Text="View/Get PDF">
                                                </asp:LinkButton>
                                            </div>
                                        </itemtemplate>

                                        <%--<ItemStyle Width="13%"></ItemStyle>--%>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Send a Reminder">
                                        <itemtemplate>
                                            <div style="padding: 15px" align="center" runat="server">
                                                <asp:ImageButton ID="imgreminder" CommandName="sendreminder" runat="server" Height="40px" Width="40px" alt="Send a Reminder" class="img-responsive imground"
                                                    CausesValidation="False" ToolTip="Send a Reminder" ImageUrl="~/images/Reminder.png">
                                                </asp:ImageButton>
                                            </div>
                                            <div style="padding-left: 15px; padding-right: 15px" align="Left" runat="server">
                                                <asp:Label ID="lbllastreminder" Font-Bold="true" ForeColor="Brown" runat="server" Text="Last Reminder sent on: " class="fontingrid" Font-Size="Small" />
                                                <asp:Label ID="lbllastreminder2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("lastreqsendon") %>' Font-Size="Small" />
                                                <br />
                                                <asp:Label ID="lbllstremRequest" Font-Bold="true" ForeColor="Brown" runat="server" Text="Last Reminder/Request: " class="fontingrid" Font-Size="Small" />
                                                <asp:Label ID="lbllstremRequest2" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("request") %>' Font-Size="Small" />
                                            </div>
                                            <div style="padding: 15px" align="center" runat="server">
                                                <asp:LinkButton ID="lnkhisRem" CommandName="HistoryOfReminder" Font-Underline="true" runat="server" CssClass="fontingrid" ForeColor="Blue" Font-Bold="true" Font-Size="Small"
                                                    CausesValidation="False" Text="History Of Reminder(s)">
                                                </asp:LinkButton>
                                            </div>

                                        </itemtemplate>

                                        <%--<ItemStyle Width="13%"></ItemStyle>--%>
                                    </asp:TemplateField>
                                </columns>
                                <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                    wrap="True" font-size="Small" verticalalign="Middle" horizontalalign="Center"></headerstyle>
                                <rowstyle backcolor="White" font-bold="True" height="30px" horizontalalign="Center"
                                    verticalalign="Middle" />
                                <pagersettings position="TopAndBottom" />
                                <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                    horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                    borderwidth="2" />
                            </asp:GridView>
                        </div>
                        <asp:LinkButton Text="" ID="lnkfaketrack" runat="server" />
                        <asp:LinkButton Text="" ID="lnkfakereminder" runat="server" />
                        \<asp:LinkButton Text="" ID="lnkfakeHOR" runat="server" />
                        <ajaxtoolkit:modalpopupextender id="mpetrack" runat="server" popupcontrolid="pnlPopuptrack" targetcontrolid="lnkfaketrack"
                            backgroundcssclass="modalBackground" cancelcontrolid="btnClosetrack">
                        </ajaxtoolkit:modalpopupextender>
                        <asp:Panel ID="pnlPopuptrack" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 65%;" Width="80%">

                            <asp:UpdatePanel ID="UpdatePaneltrack" runat="server">
                                <contenttemplate>
                                    <div class="header">
                                        <asp:Label ID="Label53" Visible="true" Text="Track of Grievances" Font-Bold="true" Font-Size="Medium" runat="server" />
                                    </div>
                                    <div id="Div11" class="body" runat="server">
                                        <div id="div16" class="body" runat="server" align="left" style="padding-top: 20px; padding-left: 20px">
                                            <asp:Label ID="Label54" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" Text="Grievance Reference-ID: " />
                                            <asp:Label ID="Label55" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                                        </div>
                                        <div class="table-responsive" runat="server" align="center" style="padding: 20px">
                                            <asp:GridView ID="grdtrack" runat="server" AutoGenerateColumns="False" AllowPaging="True" ToolTip="Track Of Grievances"
                                                PageSize="5" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .."
                                                ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid" OnPageIndexChanging="grdtrack_PageIndexChanging"
                                                BorderWidth="2px">
                                                <alternatingrowstyle backcolor="White" />
                                                <columns>
                                                    <asp:TemplateField HeaderText="S.No.">
                                                        <itemtemplate>
                                                            <asp:Label ID="lblSNo" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                        </itemtemplate>
                                                        <itemstyle horizontalalign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Dealing Section/Station">
                                                        <itemtemplate>
                                                            <div style="padding-left: 10px; right: 10px" align="left">
                                                                <asp:Label ID="Label271" Font-Bold="true" ForeColor="Brown" runat="server" Text="Section/Station: " class="fontingrid" />
                                                                <asp:Label ID="lbldealingsec" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Dealing_Section") %>'
                                                                    Font-Bold="True" />
                                                                <br />
                                                                <asp:Label ID="Label500" Font-Bold="true" ForeColor="Brown" runat="server" Text="Recieved On: " class="fontingrid" />
                                                                <asp:Label ID="lblreqtrack" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("Request_Receivedon") %>'
                                                                    Font-Bold="True" />
                                                            </div>
                                                        </itemtemplate>
                                                        <headerstyle horizontalalign="Center" />
                                                        <itemstyle horizontalalign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Action Taken">
                                                        <itemtemplate>
                                                            <div style="padding-left: 10px; right: 10px; right: 10px" align="left">
                                                                <asp:Label ID="lblactiontrachk" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("currentstatus") %>'
                                                                    Font-Bold="True" />

                                                            </div>
                                                        </itemtemplate>
                                                        <headerstyle horizontalalign="Center" />
                                                        <itemstyle horizontalalign="Left" />
                                                    </asp:TemplateField>
                                                </columns>
                                                <footerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" />
                                                <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" horizontalalign="Center"
                                                    cssclass="centerHeaderText fontingrid" wrap="True"></headerstyle>
                                                <pagersettings position="TopAndBottom" />
                                                <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                                    horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                                    borderwidth="2" />
                                                <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                                    verticalalign="Middle" />
                                                <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
                                                <sortedascendingcellstyle backcolor="#F5F7FB" />
                                                <sortedascendingheaderstyle backcolor="#6D95E1" />
                                                <sorteddescendingcellstyle backcolor="#E9EBEF" />
                                                <sorteddescendingheaderstyle backcolor="#4870BE" />
                                            </asp:GridView>
                                        </div>

                                    </div>
                                    <div class="footer" align="center" style="padding-bottom: 20px">
                                        <asp:Button ID="btnClosetrack" runat="server" Text="X Close" CssClass="btn" Font-Bold="true" Font-Size="Large" BackColor="#E67E22" ForeColor="Black" CausesValidation="False" />
                                    </div>
                                </contenttemplate>
                            </asp:UpdatePanel>

                        </asp:Panel>

                        <ajaxtoolkit:modalpopupextender id="mpereminder" runat="server" popupcontrolid="pnlPopupreminder" targetcontrolid="lnkfakereminder"
                            backgroundcssclass="modalBackground" cancelcontrolid="btnClosereminder">
                        </ajaxtoolkit:modalpopupextender>
                        <asp:Panel ID="pnlPopupreminder" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 65%;" Width="80%">

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <triggers>
                                    <asp:PostBackTrigger ControlID="btnreminder" />
                                </triggers>
                                <contenttemplate>
                                    <div class="header">
                                        <asp:Label ID="Label11" Visible="true" Text="Send a Reminder" Font-Bold="true" Font-Size="Medium" runat="server" />
                                    </div>
                                    <div id="Div6" class="body" runat="server">
                                        <div id="div7" class="body" runat="server" align="left" style="padding: 20px">
                                            <asp:Label ID="Label12" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" Text="Grievance Reference-ID: " />
                                            <asp:Label ID="Label16" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                                        </div>
                                        <div id="div13" runat="server" visible="true" class="table-hover" width="85%" style="padding-left: 90px; padding-right: 90px">

                                            <table class="table table table-bordered grad2">
                                                <tr class="grad3">
                                                    <td colspan="2" align="center">
                                                        <asp:Label ID="Label17" runat="server" Text="Write a Request(Max 300 Characters allowed)" ForeColor="Black"
                                                            Font-Size="Medium" Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="40%" align="right" style="padding-right: 30px">
                                                        <asp:Label ID="Label23" runat="server" Text="Request" ForeColor="Black"
                                                            class="font2" Style="font-weight: bold;" Font-Bold="True"></asp:Label>
                                                        &nbsp;
                                                    </td>
                                                    <td width="60%" align="left" style="padding-left: 15px">
                                                        <asp:TextBox ID="txtrequest_remind" runat="server" class="select font2" Height="200px" Width="90%" ValidationGroup="reminder"
                                                            TextMode="MultiLine" style="padding: 7px">
                                                        </asp:TextBox>
                                                        <br />
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Request write up not allowed to exceed by 500 Characters!!"
                                                            Style="color: #FF0000" ControlToValidate="txtgrievance" ValidationExpression="^[\s\S\d]{1,300}$"
                                                            Display="Dynamic" Font-Bold="true" Font-Size="Medium" ValidationGroup="reminder">
                                                        </asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Text Required!!"
                                                            ControlToValidate="txtgrievance" ForeColor="Red" SetFocusOnError="True" Font-Bold="true" Font-Size="Medium"
                                                            Display="Dynamic" ValidationGroup="reminder">
                                                        </asp:RequiredFieldValidator>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="padding-right: 10px">
                                                        <asp:Button ID="btnreminder" runat="server" CausesValidation="true" Text="Send a Reminder" class="btn select buttondocumentupload font2" ValidationGroup="reminder"
                                                            Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnreminder_Click" />
                                                    </td>
                                                    <td align="left" style="padding-left: 10px">
                                                        <asp:Button ID="btnClosereminder" runat="server" Text="X Close" CssClass="btn font2" Font-Bold="true" BackColor="#E67E22" ForeColor="Black" CausesValidation="False" />
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>

                                        </div>

                                    </div>
                                    <div class="footer" align="center" style="padding-bottom: 20px">
                                    </div>
                                </contenttemplate>
                            </asp:UpdatePanel>

                        </asp:Panel>

                        <ajaxtoolkit:modalpopupextender id="mpehor" runat="server" popupcontrolid="pnlrem" targetcontrolid="lnkfakeHOR"
                            backgroundcssclass="modalBackground" cancelcontrolid="btnCrem">
                        </ajaxtoolkit:modalpopupextender>
                        <asp:Panel ID="pnlrem" runat="server" CssClass="modalPopup scrol" Style="display: none; height: 65%;" Width="80%">

                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <contenttemplate>
                                    <div class="header">
                                        <asp:Label ID="Label20" Visible="true" Text="History of Reminder" Font-Bold="true" Font-Size="Medium" runat="server" />
                                    </div>
                                    <div id="Div15" class="body" runat="server">
                                        <div id="div17" class="body" runat="server" align="left" style="padding: 20px">
                                            <asp:Label ID="Label24" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" Text="Grievance Reference-ID: " />
                                            <asp:Label ID="lblhorGRErefid" Visible="true" runat="server" Font-Bold="true" Font-Size="Large" />
                                        </div>
                                        <div class="table-responsive" runat="server" align="center" style="padding: 20px">
                                            <asp:GridView ID="grdHOR" runat="server" AutoGenerateColumns="False" AllowPaging="True" ToolTip="History of Reminders"
                                                PageSize="5" HeaderStyle-Font-Bold="true" EmptyDataText=".. Records Not Found .."
                                                ShowHeaderWhenEmpty="True" Width="85%" ForeColor="#333333" BorderStyle="Solid"
                                                BorderWidth="2px" OnPageIndexChanging="grdHOR_PageIndexChanging">
                                                <alternatingrowstyle backcolor="White" />
                                                <columns>
                                                    <asp:TemplateField HeaderText="S.No.">
                                                        <itemtemplate>
                                                            <asp:Label ID="lblSNo" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                        </itemtemplate>
                                                        <itemstyle horizontalalign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Request">
                                                        <itemtemplate>
                                                            <div style="padding-left: 10px; right: 10px" align="left">
                                                                <asp:Label ID="lblhorrequest" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("remarks") %>'
                                                                    Font-Bold="True" />
                                                            </div>
                                                        </itemtemplate>
                                                        <headerstyle horizontalalign="Center" />
                                                        <itemstyle horizontalalign="Left" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Sent On">
                                                        <itemtemplate>
                                                            <div style="padding-left: 10px; padding-right: 10px;" align="center">
                                                                <asp:Label ID="lblsenton" ForeColor="Black" class="fontingrid" runat="server" Text='<%#Eval("createdon") %>'
                                                                    Font-Bold="True" />

                                                            </div>
                                                        </itemtemplate>
                                                        <headerstyle horizontalalign="Center" />
                                                        <itemstyle horizontalalign="Left" />
                                                    </asp:TemplateField>
                                                </columns>
                                                <footerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" />
                                                <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" horizontalalign="Center"
                                                    cssclass="centerHeaderText fontingrid" wrap="True"></headerstyle>
                                                <pagersettings position="TopAndBottom" />
                                                <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                                    horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                                    borderwidth="2" />
                                                <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                                    verticalalign="Middle" />
                                                <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
                                                <sortedascendingcellstyle backcolor="#F5F7FB" />
                                                <sortedascendingheaderstyle backcolor="#6D95E1" />
                                                <sorteddescendingcellstyle backcolor="#E9EBEF" />
                                                <sorteddescendingheaderstyle backcolor="#4870BE" />
                                            </asp:GridView>
                                        </div>

                                    </div>
                                    <div class="footer" align="center" style="padding-bottom: 20px">
                                        <asp:Button ID="btnCrem" runat="server" Text="X Close" CssClass="btn" Font-Bold="true" Font-Size="Large" BackColor="#E67E22" ForeColor="Black" CausesValidation="False" />
                                    </div>
                                </contenttemplate>
                            </asp:UpdatePanel>

                        </asp:Panel>
                    </div>
                    <%--</div>--%>
                </div>

                <%-- <div align="center" class=" col-md-1 col-sm-1 col-lg-1"></div>--%>
            </div>
        </div>
        <div id="divtrackgridsecondary" runat="server" visible="false">

            <br />

            <asp:Button ID="closedivs" runat="server" Text="<< Back" class="btn pull-right btnstyle" Style="background-color: #D35400; color: White; font-weight: bolder"
                Width="90px" CausesValidation="False" OnClick="closedivs_Click" />
            <br />
            <br />
            <br />
            <div id="div4" runat="server" class="panel panel-primary">
                <div class="panel-heading gradheader">
                    <span style="font-weight: 700; color: black" class="heading1">:: Track of Complaint with Status ::</span>
                </div>

                <div class="panel-body gradpanel">


                    <div class="row row-no-padding" style="margin: auto; padding-top: 5px" runat="server" align="center">
                        <div class=" col-md-6 col-sm-6 col-xs-6 col-lg-6" align="right" style="padding-right: 3px" runat="server">
                            <asp:Label ID="Label5" ForeColor="Black" Font-Bold="true" Font-Size="Medium" runat="server" Text="Grievance Ref-ID"></asp:Label>
                            : &nbsp;
                        </div>
                        <div class=" col-md-6 col-sm-6 col-xs-6 col-lg-6" align="left" style="padding-right: 2px" runat="server">
                            <asp:Label ID="lblgrerefID" ForeColor="Black" Font-Bold="true" Font-Size="Medium" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                    <div class="row row-no-padding" style="margin: auto; padding-top: 5px" runat="server" align="center">
                        <div class=" col-md-6 col-sm-6 col-xs-6 col-lg-6" align="right" style="padding-right: 3px" runat="server">
                            <asp:Label ID="Label8" ForeColor="Black" Font-Bold="true" Font-Size="Medium" runat="server" Text="Grievance related to Department/Section"></asp:Label>
                            : 
                        </div>
                        <div class=" col-md-6 col-sm-6 col-xs-6 col-lg-6" align="left" style="padding-right: 2px" runat="server">
                            <asp:Label ID="lblgredeptt_sec" ForeColor="Black" Font-Bold="true" Font-Size="Medium" runat="server" Text=""></asp:Label>
                        </div>
                    </div>

                    <br />
                    <div style='overflow-x: auto; overflow-y: auto; width: 100%; height: 100%'>
                        <asp:GridView ID="grd2" runat="server" AutoGenerateColumns="False" EmptyDataText="..No Records Found.." HorizontalAlign="Center" PageSize="10"
                            ShowHeaderWhenEmpty="True" ToolTip="Status"
                            BackColor="#F8F9F9" Width="80%" CellPadding="1" CellSpacing="1">
                            <headerstyle backcolor="#0099FF" font-bold="True" forecolor="White" cssclass="centerHeaderText gvhspadding" wrap="True"></headerstyle>

                            <columns>
                                <asp:TemplateField HeaderText="S.No.">
                                    <itemtemplate>
                                        <div runat="server" align="center">
                                            <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Dealing Section">
                                    <itemtemplate>
                                        <div runat="server" align="center">
                                            <asp:Label ID="lbldealingsec" runat="server" Text='<%#Eval("") %>' Font-Size="Smaller" />
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Forwarded to">
                                    <itemtemplate>
                                        <div runat="server" align="center">
                                            <asp:Label ID="lblcompforto" runat="server" Text='<%#Eval("") %>' Font-Size="Smaller" />
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status flag ">
                                    <itemtemplate>
                                        <div runat="server" align="center">
                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("") %>' Visible="true" Font-Bold="true" ForeColor="Red"></asp:Label>
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remarks ">
                                    <itemtemplate>
                                        <div runat="server" align="center">
                                            <asp:Label ID="lblremarks" runat="server" Text='<%#Eval("") %>' Font-Size="Smaller" />
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Forwared On">
                                    <itemtemplate>
                                        <div runat="server" align="center">
                                            <asp:Label ID="lblfwdon" runat="server" Text='<%#Eval("") %>' Font-Size="Smaller" />
                                        </div>
                                    </itemtemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Resolved On">
                                    <itemtemplate>
                                        <div runat="server" align="center">
                                            <asp:Label ID="lblreson" runat="server" Text='<%#Eval("") %>' Font-Size="Smaller" />
                                        </div>
                                    </itemtemplate>
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
                        <br />



                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

