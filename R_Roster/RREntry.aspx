<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RREntry.aspx.cs" Inherits="PrasarNet.R_Roster.RREntry" MasterPageFile="~/Site1.Master" %>

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
        fieldset {
            background: linear-gradient(to right, #D5DBDB, #CACFD2);
            -webkit-radial-gradient;
            border-color: black;
        }

            fieldset legend {
                font-size: 18px;
                background: linear-gradient(to right, #E67E22, #E67E22);
                color: white;
                padding: 5px 10px;
                border: 1px solid #000;
                padding-left: calc(50% - 45px - 18px);
            }

        .visible-md-block {
            display: block !important;
        }

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
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
                    </ul>
                </div>
            </nav>
        </div>


    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="content gradbody">
        <%--   <asp:UpdatePanel runat="server">
            <ContentTemplate>--%>
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
            <div id="Div1" class="row" runat="server" style="padding-right: 20px; margin: auto">
                <div id="Div5" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="center">
                    <br />
                    <br />
                    <br />
                </div>
                <div id="Div3" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="center">
                    <br />
                    <asp:Label ID="Label43" Style="font-weight: bold; font-size: xx-large; color: Black; background-color: ActiveCaption"
                        runat="server" Text=":: Reservation Roster ::"></asp:Label>
                    <br />
                    <br />
                </div>
                <div id="Div2" class="col-md-4 col-sm-4 col-lg-4" runat="server" align="right">
                    <br />
                    <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="2px" OnClick="btnback_Click"><span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
                    <br />
                    <br />
                </div>
            </div>
            <div runat="server" id="diventryform" style="border: thin groove #E9E2E8; margin-top: 10px; margin-right: 27px; margin-left: 38px; margin-bottom: 10px; padding: 30px">


                <div id="divdpcentry" runat="server" visible="true" class="table-hover">
                    <div class="row" style="margin: auto;">
                        <div id="div4" visible="true" align="center" class=" col-md-12 col-sm-12 col-lg-12"
                            runat="server">
                            <div runat="server" align="right" style="padding: 8px" visible="false">
                                <asp:Button ID="btncloseDPCEntry" runat="server" Text="X Close" class="btn select gradnewbutton2" Width="110px" Font-Size="Medium"
                                    Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncloseDPCEntry_Click" />
                            </div>
                            <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 10px; padding-bottom: 10px">
                                <asp:Label ID="Label4" runat="server" Text=":: New Entry ::" Style="font-weight: bold; color: Black;" class="font2"></asp:Label>
                                &nbsp;
                            </div>
                            <table class="table table table-bordered grad2">
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 10px" class="auto-style3">
                                        <asp:Label ID="lblwing" runat="server" Text="Wing" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 10px" class="auto-style3">
                                        <asp:DropDownList ID="ddlwing" runat="server" AutoPostBack="True" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="add"
                                            Height="28px" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlwing_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvwing" runat="server" ControlToValidate="ddlwing" ValidationGroup="add"
                                            Display="Dynamic" ErrorMessage="Pls. Select a Wing." ForeColor="Red" SetFocusOnError="True"
                                            class="font" Style="font-size: small; font-weight: 700">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 10px">
                                        <asp:Label ID="lblFrom" runat="server" Text="Designation" ForeColor="Black"
                                            class="font2" Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 10px">
                                        <asp:DropDownList ID="ddldesgn" runat="server" AutoPostBack="true" class="select widthofboxes1" Font-Size="Medium" Font-Bold="true" ValidationGroup="add"
                                            Height="28px" AppendDataBoundItems="true" ClientIDMode="Static">
                                        </asp:DropDownList>
                                        <%--onchange="myfunc(this.value)"--%>
                                   &nbsp;
                                <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddldesgn" ValidationGroup="add"
                                            Display="Dynamic" ErrorMessage="Pls. Select a Designation" ForeColor="Red" SetFocusOnError="True"
                                            class="font" Style="font-weight: 700; font-size: small">
                                        </asp:RequiredFieldValidator>
                                        <br />

                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 10px">
                                        <asp:Label ID="lbltitle" runat="server" Text="Title" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 10px">
                                        <asp:TextBox ID="txttitle" runat="server" class="select font2" Height="100px" Width="90%" Font-Bold="true" ValidationGroup="add"
                                            TextMode="MultiLine">
                                        </asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="rfvtitle" runat="server" ErrorMessage="Title Required!!" ValidationGroup="add"
                                            ControlToValidate="txttitle" ForeColor="Red" SetFocusOnError="True" class="font"
                                            Display="Dynamic" Style="font-weight: 700; font-size: small">
                                        </asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="revtitle" runat="server" ErrorMessage="Status can not exceed by 350 Letters!!"
                                            Style="color: #FF0000; font-weight: 700; font-size: small;" ControlToValidate="txttitle" ValidationExpression="^[\s\S\d]{1,350}$" ValidationGroup="add"
                                            Display="Dynamic" class="font">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="40%" align="right" style="padding-right: 10px">
                                        <asp:Label ID="lblLO" runat="server" Text="Upload" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>
                                        &nbsp;
                                    </td>
                                    <td width="60%" align="left" style="padding-left: 10px">
                                        <asp:FileUpload ID="FileUpload1" runat="server" class="select widthofboxes1" Height="28px" Font-Size="small" Font-Bold="true" ForeColor="Black" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding-right: 10px">
                                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn select buttondocumentupload" Font-Size="Medium" ValidationGroup="add"
                                            Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnsubmit_Click" />
                                    </td>
                                    <td align="left" style="padding-left: 10px">
                                        <asp:Button ID="btncncl" runat="server" Text="Clear" class="btn select gradbody buttondocumentupload" Font-Size="Medium"
                                            Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" />
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div runat="server" id="divView">
                    <div class="row" style="margin: auto;">
                        <div id="divgrd" visible="true" align="center" class=" col-md-12 col-sm-12 col-lg-12"
                            runat="server">
                            <div class="panel panel-primary">
                                <div class="panel-heading grad3">
                                    <span style="font-weight: bold; color: Black;" class="font2">:: Entry Details ::</span>
                                </div>
                                <div class="panel-body grad2 table-responsive">
                                    <div id="divprisearch" style="text-align: center" runat="server" visible="true">

                                        <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                            Width="90px" BackColor="#F5B7B1" OnClick="btnprint1_Click">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                            <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>

                                        <br />
                                        <br />
                                    </div>
                                    <asp:GridView ID="grddoc" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                                        DataKeyNames="rrid" PageSize="25" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                        HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                        EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="98%"
                                        ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnRowCommand="grddoc_RowCommand" OnPageIndexChanging="grddoc_PageIndexChanging" OnRowEditing="grddoc_RowEditing" OnRowUpdated="grddoc_RowUpdated" OnRowUpdating="grddoc_RowUpdating" OnRowDeleting="grddoc_RowDeleting">
                                        <%--  <AlternatingRowStyle BackColor="White" />--%>
                                        <columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <itemtemplate>
                                                    <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Black" CssClass="fontingrid" />
                                                </itemtemplate>
                                                <itemstyle horizontalalign="Center" />
                                                <headerstyle horizontalalign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Wing">
                                                <itemtemplate>
                                                    <div style="padding-left: 10px">

                                                        <asp:Label ID="lblwing" runat="server" Font-Italic="true" Text='<%#Eval("Wing")  %>' CssClass="fontingrid"
                                                            ForeColor="Black" Font-Bold="true" />

                                                    </div>
                                                </itemtemplate>
                                                <itemstyle horizontalalign="Left" />
                                                <headerstyle horizontalalign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Designation">
                                                <itemtemplate>
                                                    <div style="padding-left: 10px">
                                                        <asp:Label ID="lbldesgn" Font-Italic="true" runat="server" Text='<%#Eval("DesignationName") %>'
                                                            ForeColor="Black" class="fontingrid" Font-Bold="true" />
                                                    </div>
                                                </itemtemplate>
                                                <itemstyle horizontalalign="Left" />
                                                <headerstyle horizontalalign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Title">
                                                <itemtemplate>
                                                    <div style="padding-left: 10px">
                                                        <asp:Label ID="lbltitle" Font-Italic="true" runat="server" Text='<%#Eval("title") %>'
                                                            ForeColor="Black" class="fontingrid" Font-Bold="true" />
                                                        <asp:Label ID="lbldocname" Font-Italic="true" runat="server" Text='<%#Eval("doctitle") %>' Visible="false"
                                                            ForeColor="Black" class="fontingrid" Font-Bold="true" />
                                                    </div>
                                                </itemtemplate>
                                                <itemstyle horizontalalign="Left" />
                                                <headerstyle horizontalalign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View">
                                                <itemtemplate>
                                                    <asp:LinkButton ID="lnkviewdownload" CommandName="view" runat="server" Font-Bold="true" CssClass="btn font2" ForeColor="Blue" Font-Underline="true"
                                                        CausesValidation="False" Text="View">
                                                    </asp:LinkButton>
                                                </itemtemplate>
                                                <itemstyle horizontalalign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Download">
                                                <itemtemplate>
                                                    <asp:LinkButton ID="lnkdownload" CommandName="download" runat="server" Font-Bold="true" ForeColor="Blue" Font-Underline="true" CssClass="btn font2"
                                                        CausesValidation="False" Text="Download">
                                                    </asp:LinkButton>
                                                </itemtemplate>
                                                <itemstyle horizontalalign="Center" />
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Edit">
                                                <itemtemplate>
                                                    <asp:ImageButton ID="imgedit" CommandName="Editp" runat="server" ImageUrl="~/Images/Edit.png"
                                                        ToolTip="Edit" AlternateText="Edit" Height="25px" Width="25px" Visible="true" />
                                                    &nbsp;&nbsp;                                                  
                                                   <asp:ImageButton ID="imgdelete" CommandName="Delete" runat="server" ImageUrl="~/Images/delete.jpg" OnClientClick="return confirm('Are you sure to delete?');"
                                                       ToolTip="Delete" AlternateText="Delete" Height="25px" Width="25px" Visible="true" />
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

                        </div>

                    </div>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        <%--   </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
