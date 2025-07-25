<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="PrasarNet.signup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Welcome to PrasarNet</title>
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
            font-weight: 700;
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

        .auto-style1 {
            color: #000000;
        }

        .auto-style2 {
            color: #000000;
            font-size: xx-small;
        }

        .auto-style3 {
            color: #000000;
            font-size: xx-small;
            font-weight: 700;
        }

        .padtext {
            padding-left: 6px;
            padding-right: 6px;
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

        function checkEID() {
            var eid = document.getElementById("<%#txtEmpid.ClientID %>");
            //alert(eid.value);
            if (eid.value == "") {
                alert("Please fill in HRIS Employee ID");
                eid.style.backgroundColor = "cyan";
                eid.focus();
                return false;
            }
            else
                return true;
        }
        function myFunction() {
            var x = document.getElementById("txtPwd");
            if (x.type == "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
        function myFunction1() {
            var y = document.getElementById("txtPwd1");
            if (y.type == "password") {
                y.type = "text";
            } else {
                y.type = "password";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
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
                                <asp:Image ID="Image1" runat="server" class="img-responsive" Height="100%" align="center"
                                    ImageUrl="~/images/Azadi.png" Width="100px" />
                            </div>
                        </div>

                        <br />
                        <asp:Label ID="Label14" runat="server" class="fontheader1" ForeColor="Blue" Font-Bold="false" Text=" An Intranet for Prasar Bharati Employees"></asp:Label>

                    </div>
                    <div class="col-xs-3 col-lg-3 text-center" style="padding-right: 25px; padding-top: 12px; padding-bottom: 5px">
                        <asp:Image ID="Image4" runat="server" class="img-responsive pull-right" Width="123px" Height="100%"
                            ImageAlign="Right" ImageUrl="~/images/pblogo.png" />
                    </div>



                </div>

                <div class="row" style="margin: auto">
                    <div id="grd3" runat="server" class="sticky container-fluid grad3">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                            </button>

                        </div>
                        <%--    oiwqepiepqiep--%>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav">
                                <li><a href="AboutUs.aspx" style="color: Black; font-size: 12px; font-weight: bold">About Us</a></li>
                                <%-- <li class="dropdown"><a class="dropdown-toggle"  style="color:Black; font-size:12px;font-weight:bold" data-toggle="dropdown" href="#">Our
                                Apps <span class="caret"></span></a>
                                <ul class="dropdown-menu grad3">
                                    <li><a href="#" style="color:Black">AIR </a></li>
                                    <li><a href="#" style="color:Black">DD </a></li>
                                </ul>
                            </li>--%><%--<li><a href="#" style="color:Black; font-size:12px;font-weight:bold">Poll/Feedback</a></li>--%>
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 12px; font-weight: bold">Other
                                Links <span class="caret"></span></a>
                                    <ul class="dropdown-menu grad3">
                                        <li><a href="https://www.mib.gov.in/" target="_blank" style="color: Black">MIB </a></li>
                                        <li><a href="http://www.prasarbharati.gov.in/" target="_blank" style="color: Black">Prasar Bharati
                                        </a></li>
                                        <li><a href="http://allindiaradio.gov.in/Default.aspx" target="_blank" style="color: Black">AIR </a></li>
                                        <li><a href="http://doordarshan.gov.in/#" target="_blank" style="color: Black">DD </a></li>

                                    </ul>
                                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 12px; font-weight: bold">Mobile Apps <span class="caret"></span></a>
                                        <ul class="dropdown-menu grad3">
                                            <li><a href="https://play.google.com/store/apps/details?id=com.parsarbharti.airnews" target="_blank" style="color: Black">News on AIR(Android) </a></li>
                                            <li><a href="https://apps.apple.com/in/app/newsonair/id1450030867" target="_blank" style="color: Black">News on AIR(iOS) </a></li>

                                        </ul>
                                    </li>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li><a href="signup.aspx" style="color: Black; font-size: 12px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>&nbsp;Sign Up</a></li>
                                <li><a href="Login.aspx" style="color: Black; font-size: 12px; font-weight: bold"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Login</a></li>
                            </ul>
                        </div>

                        <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
                    </div>


                </div>


            </nav>
            <%-- <script src="Scripts/jquery-3.2.1.js"></script>
        <script src="Scripts/bootstrap.js"></script>--%>
    &nbsp;
        </div>
        <div class="container-fluid containerh1" id="gradbody" runat="server" style="padding-top: 180px;">

            <div class="row">
                <div class="col-md-9 col-lg-9">
                    <asp:LinkButton ID="lnkgetempcode" runat="server" class="font2" Font-Underline="False"
                        ForeColor="Blue" Visible="true" Font-Bold="True" CausesValidation="False"
                        OnClick="lnkgetempcode_Click">
                        Get employee Code</asp:LinkButton>
                    <asp:LinkButton ID="lnksignup" runat="server" class="font2" Font-Bold="True" Font-Underline="False"
                        ForeColor="Blue" Visible="false" CausesValidation="False"
                        OnClick="lnksignup_Click">
                        Register Yourself</asp:LinkButton>
                </div>


                <div class="col-md-3 col-lg-3">
                    <div id="Div7" align="right" runat="server" style="padding-top: 2px; padding-right: 25px">
                        <asp:ImageButton ID="imghome" runat="server" ImageUrl="~/images/home.png" CausesValidation="false" CssClass="imground img-responsive" Height="100%" Width="50px" OnClick="imghome_Click" ToolTip="Navigate to Home" AlternateText="Navigate to Home" />
                    </div>
                </div>
            </div>

            <strong><span class="style8">*Please Note, only the employees working under Prasar Bharati
                    or whose records exists under HRIS can register here.</span></strong>
            <div id="divgetempcode" class="row" style="margin: auto" runat="server" visible="false">
                <br />

                <div align="center" class=" col-md-2 col-sm-2 col-lg-2" runat="server" id="divyear">
                </div>
                <div align="center" class="col-md-8 col-sm-8 col-lg-8" runat="server" id="div3">
                    <div class="table-responsive">
                        <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 4px; padding-bottom: 4px">
                            <asp:Label ID="Label4" runat="server" Text="Get Employee Code" Style="font-weight: bold; color: Black;"
                                class="font2"></asp:Label>
                            &nbsp;
                        </div>
                        <table id="tblstn" runat="server" class="table table-bordered grad2">
                            <tr>
                                <td align="right" style="padding-right: 30px">
                                    <asp:Label ID="lblstation" runat="server" Text="Station Name" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px">
                                    <asp:TextBox ID="txtstation" class="select widthofboxes padtext" Height="28px" Width="90%" Font-Size="Medium" runat="server"
                                        autocomplete="off" TextMode="SingleLine">
                                    </asp:TextBox>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender1" runat="server"
                                        targetcontrolid="txtstation" validchars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ&()-_ ">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <asp:RequiredFieldValidator ID="rfvstation" runat="server" ErrorMessage="Station Required!!"
                                        class="font" ControlToValidate="txtstation" ForeColor="Red" SetFocusOnError="True"
                                        Display="Dynamic" Style="font-weight: 700; color: #000000">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 10px" colspan="2" align="center">
                                    <asp:Button ID="btnstn" runat="server" Text="Get Station Details" class="btn select button111 gradhead"
                                        Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnstn_Click" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div id="divlistofstn" runat="server" style="padding-top: 20px; padding-bottom: 20px; margin-bottom: 20px; padding-left: 8px; padding-right: 8px"
                            visible="false" class="grad2 containerrbl"
                            align="center">
                            <table border="2">
                                <tr>
                                    <td style="padding-left: 8px; padding-right: 8px">
                                        <br />
                                        <div id="divname" runat="server" align="center" style="padding-bottom: 10px;">
                                            <asp:Label ID="Label1" class="font2" ForeColor="Black" Font-Bold="true" runat="server"
                                                Text="Select Station" Style="text-decoration: underline"></asp:Label>
                                        </div>
                                        <asp:RadioButtonList ID="rblstn" Style="margin-right: 15px" runat="server" AutoPostBack="True"
                                            CellPadding="10" CellSpacing="10" RepeatDirection="vertical" EnableTheming="False"
                                            Font-Bold="True" Font-Overline="True" class="font" Font-Names="nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;"
                                            OnSelectedIndexChanged="rblstn_SelectedIndexChanged">
                                        </asp:RadioButtonList>
                                    </td>
                                    <td id="tbldob1" runat="server" visible="false" valign="top" style="padding-top: 20px; padding-left: 10px; padding-right: 10px">
                                        <div id="div1" runat="server" align="center" style="padding-bottom: 10px; padding-right: 20px"
                                            visible="false">
                                            <asp:Label ID="Label3" ForeColor="Blue" Font-Bold="True" class="font" runat="server"
                                                Text="Selected Station" Style="background-color: #CCFFFF"></asp:Label>
                                            <span class="style2">: </span>&nbsp;
                                        <asp:Label ID="Label5" ForeColor="Blue" Font-Bold="True" class="font2" runat="server"
                                            Style="background-color: #CCFFFF"></asp:Label>
                                        </div>
                                        <table class="table table-bordered grad2">
                                            <tr>
                                                <td align="right" style="padding-right: 30px">
                                                    <asp:Label ID="Label2" runat="server" Text="Date of Birth" ForeColor="Black" Style="font-weight: bold;"
                                                        class="font2"></asp:Label>
                                                    &nbsp;
                                                </td>
                                                <td align="left" style="padding-left: 15px">
                                                    <asp:TextBox ID="txtdob" runat="server" class="select widthofboxes padtext" Height="28px" Width="90%" Font-Size="Medium"
                                                        autocomplete="off" MaxLength="10" placeholder="DD-MM-YYYY">
                                                    </asp:TextBox>
                                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderThours" runat="server"
                                                        targetcontrolid="txtdob" validchars="0123456789-">
                                                    </ajaxtoolkit:filteredtextboxextender>
                                                    <ajaxtoolkit:calendarextender id="CalendarExtender2" runat="server" behaviorid="txtdob_CalendarExtender"
                                                        format="dd-MM-yyyy" targetcontrolid="txtdob" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                                        ControlToValidate="txtdob" Style="font-weight: 700">
                                                    </asp:RequiredFieldValidator>
                                                    <%--  <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" />--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="padding-right: 10px">
                                                    <asp:Button ID="btnget" runat="server" Text="Get Employee Code" class="btn select button111"
                                                        Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnget_Click" />
                                                </td>
                                                <td align="left" style="padding-left: 10px">
                                                    <asp:Button ID="btncancel" runat="server" Text="Cancel" class="btn select gradbody button111"
                                                        Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <div id="divgrd" runat="server" visible="false" class="panel panel-primary">
                                            <div runat="server" class="panel-heading grad3" align="center">
                                                <span style="font-weight: bold; color: Black;" class="font">:: Details ::</span>
                                            </div>
                                            <div class="panel-body grad2 table-responsive">
                                                <br />
                                                <asp:GridView ID="grdemp" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                                                    PageSize="10" EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True"
                                                    Width="95%" ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px">
                                                    <AlternatingRowStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="S.No." ItemStyle-Width="8%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblSNo" Font-Bold="true" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Designation" ItemStyle-Width="8%">
                                                            <ItemTemplate>
                                                                <div style="padding-left: 7px; padding-right: 5px" align="left">
                                                                    <asp:Label ID="lbldsg" Font-Italic="true" runat="server" Text='<%#Eval("DesignationName") %>'
                                                                        class="fontingrid" Font-Bold="true" />
                                                                </div>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Name" ItemStyle-Width="59%">
                                                            <ItemTemplate>
                                                                <div style="padding-left: 10px">
                                                                    <asp:Label ID="lnktitle" runat="server" Text='<%#Eval("name") %>' class="font" Font-Bold="True"
                                                                        CausesValidation="False" ForeColor="Blue" />
                                                                </div>
                                                            </ItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Employee Code" ItemStyle-Width="15%">
                                                            <ItemTemplate>
                                                                <div style="padding-left: 5px; padding-right: 5px">
                                                                    <asp:Label ID="Label3" Font-Bold="true" runat="server" Text='<%#Eval("EmployeeCode") %>'
                                                                        class="fontingrid" />
                                                                </div>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Left" />
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <EditRowStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" />
                                                    <HeaderStyle BackColor="#E67E22" Font-Bold="True" ForeColor="Black" HorizontalAlign="Center"
                                                        CssClass="centerHeaderText fontingrid" Wrap="True"></HeaderStyle>
                                                    <PagerSettings Position="TopAndBottom" />
                                                    <PagerStyle BackColor="#E67E22" CssClass="cssPager pag" ForeColor="White" Font-Size="Small"
                                                        HorizontalAlign="Left" VerticalAlign="Middle" Font-Bold="True" BorderColor="Black"
                                                        BorderWidth="2" />
                                                    <RowStyle BackColor="#EFF3FB" />
                                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <div align="center" class="col-md-2 col-sm-2 col-lg-2" runat="server" id="div4">
                </div>
            </div>
            <div id="empreg" runat="server" visible="true" class="row" style="margin: auto">
                <br />

                <div align="center" class="col-md-8 col-sm-8 col-lg-8" runat="server" id="div5" style="padding-bottom: 20px">
                    <asp:Panel ID="Panel2" runat="server" Style="margin: 10px; min-height: 310px" class="grad2">
                        <br />
                        <div class="gradhead" runat="server" style="padding-top: 10px; padding-bottom: 10px">
                            <asp:Label ID="Label6" runat="server" Text="Employee Registration" Style="font-weight: bold; color: Black;"
                                class="font2"></asp:Label>
                            <asp:Label ID="Label20" runat="server" Text="Get New OTP" Style="font-weight: bold; color: Black;"
                                class="font2" Visible="false"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <table id="Table1" runat="server" class="table table-bordered grad2">
                            <tr>
                                <td align="right" style="padding-right: 30px" width="50%">
                                    <asp:Label ID="Label8" runat="server" Text="Employee Code" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:TextBox ID="txtEmpid" class="select widthofboxes1 padtext" Height="28px" runat="server" MaxLength="7" Width="90%" placeholder="Employee Code"
                                        autocomplete="off" TextMode="SingleLine" Font-Size="Medium" AutoPostBack="True" OnTextChanged="txtEmpid_TextChanged">
                                    </asp:TextBox>

                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender2" runat="server"
                                        targetcontrolid="txtEmpid" validchars="1234567890">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Employee Code Required!!"
                                    class="font" ControlToValidate="txtEmpid" ForeColor="Red" SetFocusOnError="True" Font-Bold="true"
                                    Display="Dynamic" ValidationGroup="reg" Style="color: #000000">
                                </asp:RequiredFieldValidator>

                                    <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Black" Visible="False"></asp:Label>

                                </td>
                            </tr>
                            <tr id="tr1" runat="server" visible="true">
                                <td align="right" style="padding-right: 30px" width="50%">
                                    <asp:Label ID="Label9" runat="server" Text="Mobile No." ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:TextBox ID="txtmobile" class="select widthofboxes1 padtext" Height="28px" runat="server" Width="90%" ReadOnly="true"
                                        autocomplete="off" MaxLength="10" TextMode="SingleLine" Font-Size="Medium">
                                    </asp:TextBox>

                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender5" runat="server"
                                        targetcontrolid="txtmobile" validchars="1234567890">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mobile No. Required!!"
                                        class="font" ControlToValidate="txtmobile" ForeColor="Red" SetFocusOnError="True" ValidationGroup="reg" Font-Bold="true"
                                        Display="Dynamic" Style="color: #000000">
                                    </asp:RequiredFieldValidator>
                                    &nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmobile" class="font" Display="Dynamic"
                                    ErrorMessage="10 digit mobile no. only" ForeColor="Red" SetFocusOnError="True" Font-Bold="true"
                                    ValidationExpression="\d{10,10}" ValidationGroup="reg" Style="color: #000000">
                                </asp:RegularExpressionValidator>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender3" runat="server"
                                        targetcontrolid="txtmobile" validchars="0123456789">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <div id="divmobmsg" runat="server" visible="false">
                                        <asp:Label ID="Label23" runat="server" Text="* This Mobile number is linked with your EMail/Eoffice. If you wish to change your mobile number then you may contact us on ddgitpb@prasarbharati.gov.in & email@prasarbharati.gov.in " Font-Bold="True" Font-Size="Small" ForeColor="Black" Visible="False"></asp:Label>
                                    </div>
                                </td>
                            </tr>
                            <tr id="tr2" runat="server" visible="true">
                                <td align="right" style="padding-right: 30px" width="50%">
                                    <asp:Label ID="Label11" runat="server" Text="E-mail-Id" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:TextBox ID="txtEmailid" class="select widthofboxes1 padtext" Height="28px" Width="90%" runat="server" Font-Size="Medium" ReadOnly="true"
                                        autocomplete="off" TextMode="SingleLine">
                                    </asp:TextBox>
                                    &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Enabled="false"
                                    runat="server" ControlToValidate="txtEmailid"
                                    ErrorMessage="*" ForeColor="Black" SetFocusOnError="True" Font-Size="Large" Font-Bold="true"
                                    ValidationGroup="reg">
                                </asp:RequiredFieldValidator>

                                    <%--<asp:DropDownList ID="ddlemailext" runat="server" class="select widthofboxes1" Height="28px"  Font-Size="Medium">
                                        <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                                        <asp:ListItem Text="@prasarbharati.gov.in" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="@gov.in" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="@nic.in" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlemailext"
                                        ErrorMessage="*" ForeColor="Black" SetFocusOnError="True" Font-Size="Large" Font-Bold="true"
                                        ValidationGroup="reg"></asp:RequiredFieldValidator>--%>
                                    <%--<asp:Label ID="Label21" Font-Bold="true" ForeColor="Black" Font-Size="Small" runat="server" Text="@prasarbharati.gov.in"></asp:Label>--%> &nbsp;
                                    <%--<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                        TargetControlID="txtEmailid" ValidChars="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789.-"></ajaxToolkit:FilteredTextBoxExtender>

                                    <br />
                                    <strong><span class="style10">*Only Prasar Bharati Email-ID are allowed, with a 
                                domain name @prasarbharti.gov.in/@gov.in/@nic.in.</span></strong><br />
                                    <span class="style12">** e.g. If email is </span>
                                    <span class="style11">xyz@prasarbharti.gov.in</span><span
                                        class="style12"> then you have to write only </span><span class="style13">xyz</span><span class="style12"> in textbox.</span>--%>
                                    <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="small" Text="Not Mandatory" ForeColor="Red" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 10px" colspan="2" align="center">
                                    <asp:Image ID="imgWait" runat="server" ImageUrl="~/images/wait.gif" Style="visibility: hidden"
                                        ClientIDMode="Static" />
                                    <asp:LinkButton ID="lnkchangeemailmob" runat="server" Font-Bold="True"
                                        ForeColor="Blue" Visible="false" CssClass="font2"
                                        OnClick="lnkchangeemailmob_Click">
                                        Change Mobile No.</asp:LinkButton>
                                    &nbsp;&nbsp;
                                <asp:LinkButton ID="lnksendotpagain" runat="server" Font-Bold="True"
                                    ForeColor="Blue" OnClick="lnksendotpagain_Click" CssClass="font2"
                                    Visible="False">
                                    Send OTP Again/Get New OTP</asp:LinkButton>
                                    <asp:Button ID="Button1" runat="server" class="btn select button111 gradhead"
                                        OnClick="Button1_Click" OnClientClick="showWait('Reg')" Style="background-color: #99FFCC; color: Black; font-weight: bold"
                                        Text="Register &amp; Get OTP" ValidationGroup="reg" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button3" runat="server" CausesValidation="False"
                                    class="btn select button111 gradhead" OnClick="Button3_Click"
                                    OnClientClick="showWait('Reg')" Style="color: Black; font-weight: bold"
                                    Text="&lt;&lt; Back" Visible="false" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <ajaxtoolkit:roundedcornersextender id="Panel4_RoundedCornersExtender" runat="server"
                        behaviorid="Panel4_RoundedCornersExtender" radius="15" targetcontrolid="Panel4">
                    </ajaxtoolkit:roundedcornersextender>
                    <%--<br />
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Login.aspx" CausesValidation="False"><h3>Back</h3></asp:LinkButton>--%>
                    <asp:Label ID="lblresult" runat="server" class="font" Style="color: Red; font-weight: 700;"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblresult0" runat="server" class="font" Style="color: Red; font-weight: 700;"></asp:Label>
                    <br />
                    <br />
                    <asp:Panel ID="Panel1" runat="server" Style="min-height: 310px; margin-bottom: 20px"
                        class="grad2" Visible="False" Width="80%">
                        <br />
                        <div id="Div2" class="grad2" runat="server" style="padding-top: 10px; padding-bottom: 10px">
                            <asp:Label ID="Label7" runat="server" Text="Verification & Activation" Style="font-weight: bold; color: Black;"
                                class="font2"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <table id="Table2" runat="server" class="table table-bordered grad2">
                            <tr>
                                <td align="right" style="padding-right: 30px" width="50%">
                                    <asp:Label ID="Label13" runat="server" Text="Employee Code" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:TextBox ID="txtEmpidOtp" runat="server" class="select widthofboxes1 padtext" Height="28px" Width="90%" Font-Size="Medium" Font-Bold="true"
                                        autocomplete="off">
                                    </asp:TextBox>
                                    <span class="auto-style2"><strong>* </strong></span>
                                    <span class="auto-style1"><strong><%--<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtEmpidOtp"
                                        Display="Dynamic" ErrorMessage="Fill up HRIS Emp. ID" ForeColor="#FF3300" SetFocusOnError="True"
                                        class="font" ValidationGroup="act"></asp:RequiredFieldValidator>--%></strong></span>
                                </td>
                            </tr>
                            <tr visible="false" runat="server">
                                <td align="right" style="padding-right: 30px" width="50%">
                                    <asp:Label ID="Label15" runat="server" Text="OTP(Mobile)" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:TextBox ID="txtOtpMobile" runat="server" MaxLength="6" ValidationGroup="act"
                                        autocomplete="off" class="select widthofboxes1  padtext" Height="28px" Width="90%" Font-Size="Medium">
                                    </asp:TextBox>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender9" runat="server"
                                        targetcontrolid="txtOtpMobile" validchars="1234567890">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <span class="auto-style3">* </span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtOtpMobile"
                                        Display="Dynamic" ErrorMessage="OTP Mobile" ForeColor="#FF3300" SetFocusOnError="True"
                                        class="font" ValidationGroup="act" Font-Bold="True" Style="color: #000000">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 30px" width="50%">
                                    <asp:Label ID="Label16" runat="server" Text="OTP" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:TextBox ID="txtOtpEmail" runat="server" MaxLength="6"
                                        autocomplete="off" class="select widthofboxes1 padtext" Height="28px" Width="90%" Font-Size="Medium">
                                    </asp:TextBox>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender8" runat="server"
                                        targetcontrolid="txtOtpEmail" validchars="1234567890">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <span class="auto-style3">*</span><span class="style7"> </span>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtOtpEmail"
                                        Display="Dynamic" ErrorMessage="OTP Email" ForeColor="#FF3300" SetFocusOnError="True"
                                        class="font" ValidationGroup="act" Font-Bold="True" Style="color: #000000">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="Button2" runat="server" OnClientClick="showWait('Act')" Text="Activate"
                                        ValidationGroup="act" class="btn select button111 gradhead" OnClick="Button2_Click" />
                                    <asp:Image ID="imgAct" runat="server" ClientIDMode="Static" ImageUrl="~/images/wait.gif"
                                        Style="visibility: hidden" />
                                </td>
                            </tr>
                            <tr id="trresend" runat="server">
                                <td align="center" colspan="2">
                                    <asp:LinkButton ID="lbtnMob" runat="server" class="font2" ForeColor="Blue" CausesValidation="False"
                                        Visible="False" OnClick="lbtnMob_Click" Font-Bold="True">
                                        Resend OTP</asp:LinkButton>
                                    &nbsp;&nbsp;
                                <div runat="server" visible="false">
                                    <asp:LinkButton ID="lbtnEmail" runat="server" ForeColor="Blue" CausesValidation="False"
                                        Visible="false" class="font2" OnClick="lbtnEmail_Click" Font-Bold="True">
                                        Resend Email OTP</asp:LinkButton>


                                </div>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <ajaxtoolkit:roundedcornersextender id="Panel1_RoundedCornersExtender" runat="server"
                        behaviorid="Panel1_RoundedCornersExtender" radius="15" targetcontrolid="Panel1" />
                    <asp:Label ID="lblact" ForeColor="Red" runat="server" Text="" class="font" Style="font-weight: bold"></asp:Label>
                    <br />
                    <br />
                    <asp:Panel ID="panelPwd" runat="server" class="grad2" Width="80%" Visible="false"
                        Style="margin-bottom: 20px">
                        <br />
                        <div style="padding: 10px">
                            <span class="style3"><span class="font2" style="font-weight: bold">** Password must contain Minimum 8 and Maximum 10 characters/digits with atleast 1 Alphabet and 1 Number</span><br class="style4" />
                            </span>
                        </div>
                        <br />
                        <table class="table table-bordered grad2" cellpadding="5">
                            <tr>
                                <td align="right" style="padding-right: 30px" width="50%">
                                    <asp:Label ID="Label19" runat="server" Text="Employee Code" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:TextBox ID="txtempcodpwd" runat="server" class="select widthofboxes1 padtext" Height="28px" Width="90%" Font-Size="Medium" Font-Bold="true"
                                        autocomplete="off">
                                    </asp:TextBox>
                                    <span class="style7">* </span>
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtEmpidOtp"
                                        Display="Dynamic" ErrorMessage="Fill up HRIS Emp. ID" ForeColor="#FF3300" SetFocusOnError="True"
                                        class="font" ValidationGroup="act"></asp:RequiredFieldValidator>--%>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 30px" width="50%">
                                    <asp:Label ID="Label18" runat="server" Text="Password" ForeColor="Black" class="font2"
                                        Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" class="select widthofboxes1 padtext"
                                        autocomplete="off" Height="28px" Width="90%" Font-Size="Medium">
                                    </asp:TextBox>
                                    <span style="padding-left: 7px">
                                        <br />
                                        <input onclick="myFunction()" type="checkbox" />
                                        &nbsp;<span class="style1"><strong>Show Password</strong></span>
                                    </span>

                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderTxtconfirmpassword" runat="server"
                                        targetcontrolid="txtPwd" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&*!./\()!:;=^~?_-">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <%--   <ajaxToolkit:PasswordStrength ID="txtPwd_PasswordStrength" runat="server" BehaviorID="txtPwd_PasswordStrength"
                                    HelpStatusLabelID="lblPwd" MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1"
                                    PreferredPasswordLength="8" RequiresUpperAndLowerCaseCharacters="True" TargetControlID="txtPwd"
                                    TextStrengthDescriptions="Weak;Average;Good;Strong;Very Strong" />--%>
                                &nbsp;
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtPwd"
                                        Display="Dynamic" ErrorMessage="Password Reqd!!" ForeColor="Red" SetFocusOnError="True"
                                        ValidationGroup="pwd" Font-Bold="True" Style="color: #000000">
                                    </asp:RequiredFieldValidator>

                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtPwd"
                                        Display="Dynamic" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@#]{8,10}$"
                                        ErrorMessage="Password must contain Minimum 8 and Maximum 10 characters/digits with atleast 1 Alphabet and 1 Number."
                                        ForeColor="Red" Font-Bold="True" Style="color: #000000" />
                                    <asp:Label ID="lblPwd" runat="server" ForeColor="Red" Font-Bold="True" Style="color: #000000"></asp:Label>

                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 30px" width="50%">
                                    <asp:Label ID="Label17" runat="server" Text="Re-Type Password" ForeColor="Black"
                                        class="font2" Style="font-weight: bold;"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px" width="50%">
                                    <asp:TextBox ID="txtPwd1" runat="server" TextMode="Password" class="select widthofboxes1 padtext"
                                        autocomplete="off" Height="28px" Width="90%" Font-Size="Medium">
                                    </asp:TextBox>
                                    <span style="padding-left: 7px">
                                        <br />
                                        <input onclick="myFunction1()" type="checkbox" />
                                        &nbsp;<span class="style1"><strong>Show Password<br />
                                        </strong></span>
                                    </span>

                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPwd"
                                        ControlToValidate="txtPwd1" Display="Dynamic" ErrorMessage="Password did not match!!"
                                        ForeColor="Red" SetFocusOnError="True" ValidationGroup="pwd"
                                        Font-Bold="True" Style="color: #000000">
                                    </asp:CompareValidator>
                                    <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender6" runat="server"
                                        targetcontrolid="txtPwd1" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&*!./\()!:;=^~?_-">
                                    </ajaxtoolkit:filteredtextboxextender>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPwd1"
                                        Display="Dynamic" ErrorMessage="Please Re-type Password!!" ForeColor="Red" SetFocusOnError="True"
                                        ValidationGroup="pwd" Font-Bold="True" Style="color: #000000">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr style="padding: 10px">
                                <td align="center" colspan="2">
                                    <asp:Button ID="btnpwd" runat="server" OnClientClick="showWait('pwd')" Text="Set Password"
                                        ValidationGroup="pwd" class="btn select button111 gradhead" OnClick="btnpwd_Click" />
                                    <asp:Image ID="Image2" runat="server" ClientIDMode="Static" ImageUrl="~/images/wait.gif"
                                        Style="visibility: hidden" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Label ID="lblpwdtext" runat="server" Text="" ForeColor="Red" Font-Bold="true"
                        class="font"></asp:Label>
                    <br />
                    <br />
                    <asp:Panel ID="Panel4" runat="server" Visible="false" Width="80%" class="grad2" Style="margin-bottom: 20px">
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnLogin" runat="server" PostBackUrl="~/Login.aspx" Visible="true"
                            class="font2" CausesValidation="False" Font-Bold="True" ForeColor="Blue">
                            Login here..</asp:LinkButton>
                        <br />
                        <br />
                        <%--<asp:Button ID="btnClose" runat="server" CausesValidation="False" Text="Close" />--%>
                        <%--<br />
                        <br />--%>
                        <br />
                    </asp:Panel>
                    <ajaxtoolkit:roundedcornersextender id="RoundedCornersExtender2" runat="server" behaviorid="panelPwd_RoundedCornersExtender2"
                        radius="15" targetcontrolid="panelPwd" />
                    <asp:HiddenField ID="hfMobileOTP" runat="server" />
                    <asp:HiddenField ID="hfEmailOTP" runat="server" />
                    <asp:HiddenField ID="hfName" runat="server" />
                    <asp:LinkButton ID="LinkButton1" runat="server" Style="visibility: hidden">LinkButton</asp:LinkButton>
                </div>
                <div align="center" class=" col-md-4 col-sm-4 col-lg-4" runat="server" id="div6">
                    <asp:Panel ID="Panel3" runat="server" Style="margin: 10px; min-height: 310px" class="grad2 table-responsive">
                        <span class="style9"><strong>
                            <br />
                            Instructions</strong></span><br />
                        <div align="left" style="padding: 10px">
                            <span class="font2" style="font-weight: bold; color: Black;">1. If you don&#39;t have the Employee Code, </span>
                            <br />
                            <asp:LinkButton ID="lbtnValidate" runat="server" CausesValidation="False" class="font2"
                                ForeColor="Blue" Font-Bold="True" OnClick="lbtnValidate_Click1"
                                Font-Underline="False">
                                <b>Click here to get a Employee Code</b></asp:LinkButton>
                            <br />
                            <br />
                            <span class="font2" style="font-weight: bold; color: Black;">2. After getting the EmpCode -&gt; Write an employee code inside the Employee Code&#39;s TextBox -&gt; Press Enter on KeyBoard-&gt; then your Mobile number and E-Mail ID get populated automatically -&gt; If You are a valid or unregistered employee, then you are allowed to click on &quot;Register &amp; Get OTP&quot; Button.<br />
                            </span>
                            <br />
                            <span class="font2" style="font-weight: bold; color: Black;">3. If you find any discrepancy in the populated mobile number and E-Mail, then you may write us on <a href="mailto:ddgitpb@prasarbharati.gov.in,email@prasarbharati.gov.in">ddgitpb@prasarbharati.gov.in, email@prasarbharati.gov.in</a>, hris@prasarbharati.gov.in and cc to hris@prasarbharati.gov.in.</span><br />
                            <%-- <span class="font2" style="color: Black; font-weight: bold">4. If you are already registered and need new OTP/ did not recieve an OTP/ did not verify yourself for any reason(s) then</span>&nbsp;
                        <br />
                            <asp:LinkButton ID="LinkButton2" runat="server" class="font2" ForeColor="Blue" Font-Bold="True"
                                CausesValidation="false" Text="Click here to Get a New OTP"
                                OnClick="LinkButton2_Click" Font-Underline="False"></asp:LinkButton>
                            <br />--%>
                            <%-- <span class="font2" style="color: Black; font-weight: bold">4. If you are already registered and need new OTP/ did not recieve an OTP/ did not verify yourself for any reason(s) then</span>&nbsp;
                        <br />
                            <asp:LinkButton ID="LinkButton2" runat="server" class="font2" ForeColor="Blue" Font-Bold="True"
                                CausesValidation="false" Text="Click here to Get a New OTP"
                                OnClick="LinkButton2_Click" Font-Underline="False"></asp:LinkButton>
                            <br />--%>
                            <br />
                            <span class="font2" style="color: Black; font-weight: bold">4. After the verification of Mobile Number and E-Mail ID via OTP (same OTP will be recived by you on Email and Mobile No), you can create your login password.<br />
                                <br />
                            </span><span class="font2" style="color: Black; font-weight: bold">5. Only after the successful completion of the above steps, you are allowed to login (Empcode as UserName and Password created by you in step 5).<br />
                            </span>
                        </div>
                    </asp:Panel>
                    <ajaxtoolkit:roundedcornersextender id="RoundedCornersExtender1" runat="server" radius="15"
                        targetcontrolid="Panel3" behaviorid="Panel3_RoundedCornersExtender" />
                </div>
            </div>
            <br />
            <div class="container-fluid style1" id="gradfooter" runat="server">
                <div class="row">
                    <h5>
                        <strong>
                            <%-- This site can be best viewed in IE 9 and above And Chrome. To check your browser version click here <br />--%>
                    This Website is Developed &amp; Maintained by : IT Division, Prasar Bharati, New
                    Delhi
                    <br />
                            यह वेबसाइट सूचना प्रौधोगिकी प्रभाग, प्रसार भारती, नई दिल्ली द्वारा संचालित है।
                                     Please send your Feedback / Suggestions to : hris@prasarbharati.gov.in<br />
                        </strong>
                    </h5>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
