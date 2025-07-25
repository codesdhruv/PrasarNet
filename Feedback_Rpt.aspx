<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback_Rpt.aspx.cs" Inherits="PrasarNet.Feedback_Rpt" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to PrasarNet Feedback :: Report</title>
    <link rel="apple-touch-icon" sizes="57x57" href="~/images/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="~/images/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="~/images/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="~/images/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="~/images/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="~/images/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="~/images/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="~/images/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="~/images/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="~/images/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="~/images/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="~/images/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="~/images/favicon-16x16.png">
    <link rel="manifest" href="~/images/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style/responsive.css" type="text/css" media="screen" />
    <style type="text/css">
        .headertextalign {
            text-align: center;
        }

        .GridPager a, .GridPager span {
            display: block;
            height: 30px;
            width: 30px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background-color: #337585;
            color: #000;
            border: 1px solid #3AC0F2;
        }

        .container1 {
            min-height: 430px;
        }

        .grad3 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            background: radial-gradient(yellow, orange);
            -webkit-radial-gradient;
            /* background: linear-gradient(to right, orange, red);*/
        }

        #gradfooter {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            background: radial-gradient(#F5DA81, #D8D8D8);
            -webkit-radial-gradient;
            /* background: linear-gradient(to right, orange, red);*/
        }

        #gradbody {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #F9FBE7, #FFF3E0);
            -webkit-radial-gradient;
        }

        .gradhead {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            /* background: radial-gradient(#CEECF5, #E6E6E6);*/
            background: radial-gradient(#F5DA81, #D8D8D8);
            -webkit-radial-gradient;
        }

        .grad2 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .style1 {
            padding-right: 15px;
            padding-left: 15px;
            text-align: center;
        }

        .containerh1 {
            width: 100%;
            min-height: 100vh;
            background-size: cover;
        }

        .containerrbl {
            width: 100%;
            min-height: 250px;
            overflow: auto;
            vertical-align: middle;
        }

        .style2 {
            background-color: #CCFFFF;
        }

        .modalPopup {
            background-color: #FFFFFF;
            width: 500px;
            border: 3px solid #0DA9D0;
            border-radius: 12px;
            padding: 0;
        }

        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
        }

        .style4 {
            color: #800000;
        }

        .style7 {
            color: #FF0000;
            font-size: xx-small;
        }

        .style8 {
            font-size: small;
            color: #FF0000;
            background-color: #FFFFCC;
        }

        .style9 {
            color: #000000;
            font-size: large;
            text-decoration: underline;
        }

        .style10 {
            font-size: x-small;
            color: #FF0000;
        }

        .style11 {
            color: #0000FF;
            font-weight: 700;
        }

        .style12 {
            color: #FF0000;
            font-weight: bold;
        }

        .style13 {
            color: #0000FF;
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
    <script type="text/javascript">
        function showWait(obj) {
            Page_ClientValidate();
            if (Page_IsValid) {
                var img;
                if (obj == 'Reg')
                    img = document.getElementById("imgWait");
                else {
                    if (obj == 'Act')
                        img = document.getElementById("imgAct");
                }
                img.style.visibility = "visible";
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server" class="gradbody content">
        <div>

            <asp:ScriptManager ID="Scriptmanager1" runat="server">
            </asp:ScriptManager>
            <div style="padding: 0px 0px 0px 0px;" class="container-fluid">
                <nav class="navbar navbar-default navbar-fixed-top">

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

                    <div class="row" style="margin: auto">
                        <div id="AdminMenuIT" runat="server" class="sticky">
                            <nav class="navbar navbar-default row-no-padding">
                                <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
                                <div class="navbar-header grad3">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                                    </button>
                                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                                </div>


                                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar">
                                    <ul class="nav navbar-nav">
                                        <li><a href="DashBoardNew.aspx" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                                        <%-- <li><a href="OrdernCircular.aspx" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Orders/Circulars</a></li>
                         
                         
                                                   
                          <li><a href="Policies.aspx" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>  --%> <%-- <ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Employee HandBook</span></a></li>
                                </ul>--%>
                                        <%--</li>--%>

                                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                                            &nbsp;Documents <span class="caret"></span></a>
                                            <ul class="dropdown-menu grad3">

                                                <li><a href="OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                                <li><a href="Policies.aspx"><span style="color: #000000">Policies</span></a></li>

                                            </ul>
                                        </li>

                                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Trainings <span class="caret"></span></a>
                                            <ul class="dropdown-menu grad3">
                                                <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                                                <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                                            </ul>
                                        </li>
                                        <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                                        <li><a href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                                        <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                                        <%-- <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-globe"></span> &nbsp;Forum</a></li>--%>

                                        <%-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-certificate"></span>&nbsp;Welfares<span class="caret"></span></a>
                                <ul class="dropdown-menu grad3">
                                     <ul class="nav nav-list">
                                        <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                                    </ul>
                                </ul>
                            </li>--%>

                                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>&nbsp;Miscellaneous<span class="caret"></span></a>
                                            <ul class="dropdown-menu grad3">
                                                <ul class="nav nav-list">
                                                    <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                                    <%--      <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>   --%>
                                                </ul>
                                            </ul>
                                        </li>
                                        <li><a href="utilityDownload.aspx" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-download-alt"></span>
                                            &nbsp;Downloads</a></li>
                                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>&nbsp;Upload <span class="caret"></span></a>
                                            <ul class="dropdown-menu grad3">
                                                <ul class="nav nav-list">
                                                    <li><a href="DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                                    <li><a href="PoliciesUpload.aspx"><span style="color: #000000">Policies</span></a></li>
                                                    <li><a href="UtilityUpload.aspx"><span style="color: #000000">Utilities</span></a></li>
                                                    <li><a href="TrainingMaterial.aspx"><span style="color: #000000">Training Material</span></a></li>
                                                    <li><a href="PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>
                                                    <li><a href="AdminCalender.aspx"><span style="color: #000000">Calender</span></a></li>
                                                </ul>
                                            </ul>
                                        </li>
                                        <%--   <li><a href="ChangePassword.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Change Password</a></li>--%>
                                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>&nbsp;My Account <span class="caret"></span></a>
                                            <ul class="dropdown-menu grad3">
                                                <li><a href="myprofile.aspx"><span style="color: #000000">My Profile</span></a></li>
                                                <li><a href="ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                                <li><a href="Logout.aspx" id="A3" runat="server">LogOut</a></li>
                                                <%-- <li><a href="#" runat="server" onserverclick="logoutIT_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                                            </ul>
                                        </li>

                                    </ul>
                                </div>
                            </nav>
                        </div>


                    </div>


                </nav>
                <%-- <script src="Scripts/jquery-3.2.1.js"></script>
        <script src="Scripts/bootstrap.js"></script>--%>
            </div>

            <div class="gradbody content" style="margin-top: 162px">

                <div class="row" style="padding: 10px 0px 0px 0px; margin: auto">
                    <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 35px;">
                        <asp:Label ID="Label16" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                            Font-Bold="true" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Label2" class="font pull-right" ForeColor="Black" Font-Bold="true"
                            runat="server"><span>&nbsp;</span></asp:Label>
                        <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                            runat="server" Text="Welcome"></asp:Label>
                    </div>
                </div>
                <div align="center" class="col-md-12  col-lg-12 gradbody conheight" runat="server" id="div5" style="padding-bottom: 20px; top: 0px; left: 0px;">

                    <asp:Panel ID="Panel2" runat="server" Style="margin: 10px; min-height: 310px" class="grad2">

                        <br />
                        <div id="Div6" class="gradhead" runat="server" style="padding-top: 10px; padding-bottom: 10px">
                            <asp:Label ID="Label6" runat="server" Text="Feedback Reports" Style="font-weight: bold; color: Black;"
                                class="font2"></asp:Label>

                        </div>
                        <br />
                        <div class="table-responsive ">

                            <table id="Table1" runat="server" class="table table-bordered grad2">


                                <tr>
                                    <td align="left" style="width: 10%;">
                                        <asp:Label ID="Label8" runat="server" Text="Feedback Topic: " ForeColor="Black" class="font2"
                                            Style="font-weight: bold; font-size: small;"></asp:Label>&nbsp;
                                    </td>

                                    <td align="left" style="width: 10%;">
                                        <asp:DropDownList ID="ddlfeedback" Width="180" Height="22px" runat="server" Font-Bold="true" Font-Size="Small">
                                            <asp:ListItem Text="All Type" Value="">All Type</asp:ListItem>
                                            <asp:ListItem Text="Content" Value="Content">Content</asp:ListItem>
                                            <asp:ListItem Text="Design" Value="Design">Design</asp:ListItem>
                                            <asp:ListItem Text="Server" Value="Server">Server</asp:ListItem>
                                            <asp:ListItem Text="Other" Value="Other">Other</asp:ListItem>
                                        </asp:DropDownList>



                                    </td>

                                    <td align="left" style="width: 10%;">
                                        <asp:Label ID="lbldatefrom" runat="server" Text="Date From: " ForeColor="Black" class="font2"
                                            Style="font-weight: bold; font-size: small;"></asp:Label>&nbsp;
                                    </td>

                                    <td align="left" style="width: 20%;">

                                        <asp:TextBox ID="Txtdtfrom" class="select widthofboxes1" Width="130px" Height="22px" runat="server" autocomplete="off" MaxLength="50" TextMode="SingleLine"></asp:TextBox>

                                        <ajaxtoolkit:calendarextender id="CalenderTxtdtfrom" targetcontrolid="Txtdtfrom" runat="server" popupposition="TopRight" enabled="True" format="dd/MM/yyyy"></ajaxtoolkit:calendarextender>

                                    </td>


                                    <td align="left" style="width: 10%;">
                                        <asp:Label ID="lbldateto" runat="server" Text="Date To: " ForeColor="Black" class="font2"
                                            Style="font-weight: bold; font-size: small;"></asp:Label>&nbsp;
                                    </td>

                                    <td align="left" style="padding-left: 15px" width="20%">

                                        <asp:TextBox ID="Txtdtto" class="select widthofboxes1" Width="130px" Height="22px" runat="server" autocomplete="off" MaxLength="50" TextMode="SingleLine"></asp:TextBox>

                                        <ajaxtoolkit:calendarextender id="CalendarExtenderTxtdtto" targetcontrolid="Txtdtto" runat="server" popupposition="TopRight" enabled="True" format="dd/MM/yyyy"></ajaxtoolkit:calendarextender>


                                    </td>

                                    <td align="left" style="width: 20%;">

                                        <asp:Button ID="Btnfeedrpt" runat="server" class="btn select button111 gradhead" Style="background-color: #99FFCC; color: Black; font-weight: bold" Text="Show Feedback" OnClick="Btnfeedrpt_Click" />

                                    </td>

                                </tr>


                                <tr>

                                    <td align="left" style="width: 100%;" colspan="7">

                                        <asp:GridView ID="Gridrptfeed" runat="server" AutoGenerateColumns="False" CssClass="table"
                                            OnPageIndexChanging="Gridrptfeed_PageIndexChanging" AllowPaging="true" PageSize="30"
                                            HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                                            HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                                            EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="94%"
                                            ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px">

                                            <Columns>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>S.No</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="LblSlnoup" runat="server" Text='<%#Container.DataItemIndex + 1%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="headertextalign"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>Topic</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lbltopic" runat="server" Text='<%# Eval("topic")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="headertextalign"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>Name</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lblname" runat="server" Text='<%# Server.HtmlEncode((string)Eval("name").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="headertextalign"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="left" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>Email</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lblemail" runat="server" Text='<%# Server.HtmlEncode((string)Eval("email").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="headertextalign"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>Mobile</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lblmobile" runat="server" Text='<%# Server.HtmlEncode((string)Eval("mobile").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="headertextalign"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>Feedback</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lblfeedback" runat="server" Text='<%# Server.HtmlEncode((string)Eval("feedback").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="headertextalign"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField ItemStyle-HorizontalAlign="center" ItemStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="Center">
                                                    <HeaderTemplate>Date</HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Lblinsert_dt" runat="server" Text='<%# Server.HtmlEncode((string)Eval("insert_dt").ToString())%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle HorizontalAlign="Center" CssClass="headertextalign"></HeaderStyle>
                                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="true"></ItemStyle>
                                                </asp:TemplateField>


                                            </Columns>

                                            <HeaderStyle BackColor="#337585" Font-Bold="True" Font-Size="Small" CssClass="headertextalign" ForeColor="white" HorizontalAlign="Center" VerticalAlign="Middle" Height="30px" />
                                            <PagerStyle ForeColor="#003399" HorizontalAlign="Center" CssClass="GridPager" Height="20px" />
                                            <RowStyle BackColor="White" ForeColor="#686868" Height="41px" />
                                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                            <SortedDescendingHeaderStyle BackColor="#002876" />


                                        </asp:GridView>



                                    </td>


                                </tr>


                            </table>
                        </div>

                    </asp:Panel>



                </div>

            </div>


        </div>
        <br />
        <br />
        <br />
        <br />
        <br />

        <br />
    </form>
</body>
</html>
