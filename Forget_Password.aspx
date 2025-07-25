<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forget_Password.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="PrasarNet.Forget_Password" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

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
    <%--link of style sheet--%>
    <link rel="stylesheet" href="style/responsive.css" type="text/css" media="screen" />
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js"></script>
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
            color: #FF0000;
        }

        .auto-style2 {
            font-size: small;
            color: #0000FF;
            background-color: #FFFFCC;
        }

        .auto-style3 {
            color: #000000;
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

        function myFunction() {
            var x = document.getElementById("Txtnewpassword");
            if (x.type == "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
        function myFunction1() {
            var y = document.getElementById("Txtconfirmpassword");
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
            </div>
            <div class="container-fluid containerh1" id="gradbody" runat="server" style="padding-top: 180px;">



                <div id="div1" align="center" class="row" style="margin: auto" runat="server">
                    <br />
                    <div class="col-md-6 col-sm-6 col-lg-6" runat="server" align="left"></div>
                    <div class="col-md-6 col-sm-6 col-lg-6" runat="server" align="right">
                    </div>
                </div>
                <div align="right" runat="server" style="padding-top: 10px; padding-right: 25px">
                    <asp:ImageButton ID="imghome" runat="server" ImageUrl="~/images/home.png" CssClass="imground img-responsive"
                        CausesValidation="false" Height="100%" Width="50px" OnClick="imghome_Click" ToolTip="Navigate to Home"
                        AlternateText="Navigate to Home" />
                </div>
                <div id="divgetempcode" align="center" class="row" style="margin: auto" runat="server">
                    <br />
                    <div class="col-md-1 col-lg-1"></div>
                    <div class="col-md-10 col-lg-10" align="center" runat="server" id="div3">
                        <span class="auto-style2"><u><strong>*  Forgot password is functional only for employee.</strong></u></span>
                        <br />
                        <asp:Label ID="lblresult" runat="server" class="font" Style="color: Red; font-weight: 700;"></asp:Label>

                        <br />
                        <br />
                        <div class="" style="width: 80%">

                            <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 9px; padding-bottom: 9px">
                                <asp:Label ID="Label4" runat="server" Text="Create a New Password" Style="font-weight: bold; color: Black;"
                                    class="font2"></asp:Label>&nbsp;
                            </div>


                            <table class="table table-bordered grad2">
                                <tr id="trradiobutton" runat="server">
                                    <td align="right" runat="server" style="padding-right: 30px">
                                        <asp:Label ID="Label1" runat="server" Text="Select Type" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>&nbsp;
                                    </td>

                                    <td style="padding-left: 15px">


                                        <div align="left" runat="server" id="rbllogintype">
                                            <asp:RadioButtonList ID="rblusertype" runat="server" class="radiobuttonlistcls fontingrid" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                                TabIndex="1">
                                            </asp:RadioButtonList>
                                        </div>



                                    </td>

                                </tr>


                                <tr id="tr_empcode" runat="server">

                                    <td align="right" style="padding-right: 30px">
                                        <asp:Label ID="lblempcode" runat="server" Text="Employee Code" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>&nbsp;
                                    </td>

                                    <td align="left" style="padding-left: 15px">

                                        <asp:TextBox ID="Txtempcode" runat="server" class="select widthofboxes1 padtext" Font-Size="Medium" Height="28px" Width="90%" autocomplete="off" AutoPostBack="True" MaxLength="7" OnTextChanged="Txtempcode_TextChanged"></asp:TextBox>
                                        <br />

                                        <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Black" Visible="False"></asp:Label>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtempcode" runat="server" ControlToValidate="Txtempcode" ErrorMessage="Employee Code Required!!" Display="None" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                        <ajaxtoolkit:validatorcalloutextender id="ValidatorCalloutExtenderTxtempcode" runat="server" targetcontrolid="RequiredFieldValidatorTxtempcode"></ajaxtoolkit:validatorcalloutextender>
                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderTxtempcode" runat="server" targetcontrolid="Txtempcode" validchars="0123456789"></ajaxtoolkit:filteredtextboxextender>

                                        <asp:HiddenField ID="hfMobileOTP" runat="server" />
                                        <asp:HiddenField ID="hfEmailOTP" runat="server" />
                                        <asp:HiddenField ID="hfName" runat="server" />

                                        <asp:Label ID="lblusernofromdb" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lbluseremail" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="lblusername" runat="server" Visible="false"></asp:Label>
                                    </td>

                                </tr>


                                <tr id="tr_buttongetotp" runat="server">
                                    <%--         <td></td>--%>
                                    <td align="center" runat="server" colspan="2">

                                        <asp:Button ID="Btngetotp" runat="server" Text="Get OTP" OnClick="Btngetotp_Click" Font-Size="Medium"
                                            class="btn select button112" Style="background-color: #99FFCC; color: Black; font-weight: bold; height: 48px;" BorderWidth="2" BorderStyle="Ridge" BorderColor="#CCCCCC" />

                                        &nbsp;</td>



                                </tr>


                                <tr id="tr_otprow" runat="server" style="width: 80%">

                                    <td style="padding-right: 30px" colspan="2">

                                        <div id="divotp" runat="server">


                                            <table id="tblotp" runat="server" class="table table-bordered grad2">

                                                <tr>

                                                    <td align="right" style="padding-right: 30px">
                                                        <asp:Label ID="Label2" runat="server" Text="Enter OTP" ForeColor="Black" class="font2"
                                                            Style="font-weight: bold;"></asp:Label>&nbsp;
                                                    </td>

                                                    <td align="left" style="padding-left: 15px">

                                                        <asp:TextBox ID="Txtotp" runat="server" class="select widthofboxes1 padtext" Width="90%" Height="28px" autocomplete="off" Font-Size="Medium"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtotp" runat="server" ControlToValidate="Txtotp" ErrorMessage="Enter OTP" Display="None" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                        <ajaxtoolkit:validatorcalloutextender id="ValidatorCalloutExtenderTxtotp" runat="server" targetcontrolid="RequiredFieldValidatorTxtotp"></ajaxtoolkit:validatorcalloutextender>
                                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderTxtotp" runat="server" targetcontrolid="Txtotp" validchars="0123456789"></ajaxtoolkit:filteredtextboxextender>

                                                        <br />

                                                    </td>


                                                </tr>

                                                <tr id="tr_verifyotp" runat="server">


                                                    <td align="center" colspan="2">
                                                        <div class="row" style="margin: auto">
                                                            <div class="col-lg-12 col-md-12" style="padding: 10px" align="center" runat="server">

                                                                <asp:Button ID="Btnverifyotp" runat="server" Text="Verify OTP" OnClick="Btnverifyotp_Click1" Font-Size="Medium"
                                                                    class="btn select button112" Style="background-color: #99FFCC; color: Black; font-weight: bold" BorderColor="#CCCCCC" BorderStyle="Ridge" BorderWidth="2px" />
                                                                <br />
                                                                <asp:LinkButton ID="lnksendotpagain" runat="server" Font-Bold="True"
                                                                    Font-Size="Large" ForeColor="Blue" OnClick="lnksendotpagain_Click"
                                                                    Visible="true" CausesValidation="False">ReSend OTP</asp:LinkButton>
                                                            </div>
                                                            <%-- <div class="col-lg-6 col-md-6" style="padding-left: 10px" align="left" runat="server">
                                                               
                                                            </div>--%>
                                                        </div>

                                                    </td>

                                                </tr>

                                            </table>



                                        </div>



                                        &nbsp;</td>

                                </tr>


                                <%-- <asp:Panel ID="pnlcreatenewpassword" runat="server">--%>
                                <tr id="tr1" runat="server" style="width: 80%">

                                    <td runat="server" style="padding-right: 30px" colspan="2">

                                        <div id="div2" runat="server">


                                            <table id="Table1" runat="server" class="table table-bordered grad2">

                                                <tr id="trnewpassword" runat="server">

                                                    <td align="left" style="padding-left: 30px; font-weight: bold;">
                                                        <asp:Label ID="Label3" runat="server" Text="Enter New Password:" ForeColor="Black" class="font2"
                                                            Style="font-weight: bold;"></asp:Label>
                                                    </td>

                                                    <td align="left" style="padding-left: 30px">
                                                        <asp:TextBox ID="Txtnewpassword" runat="server" Height="28px" Font-Size="Medium" TextMode="Password" Width="90%" class="select widthofboxes1 padtext" autocomplete="off"></asp:TextBox>
                                                        <span style="padding-left: 7px">
                                                            <br />
                                                            <input onclick="myFunction()" type="checkbox" />
                                                            &nbsp;<span class="style1"><strong>Show Password</strong></span>
                                                        </span>
                                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderTxtnewpassword" runat="server"
                                                            targetcontrolid="Txtnewpassword" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&*!./\()!:;=^~?_-">
                                                        </ajaxtoolkit:filteredtextboxextender>

                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtnewpassword" runat="server" ControlToValidate="Txtnewpassword"
                                                            Display="Dynamic" ErrorMessage="Password Required!!" ForeColor="Black" SetFocusOnError="True"
                                                            ValidationGroup="pwd" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="Regex1" runat="server" ControlToValidate="Txtnewpassword" class="font"
                                                            Display="Dynamic" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@#]{6,20}$"
                                                            ErrorMessage="Password must contain Minimum 6  and Maximum 20 characters/digits with atleast 1 Alphabet and 1 Number."
                                                            ForeColor="Black" Font-Bold="True" Font-Size="Medium" />
                                                        <span class="style3"><span style="font-weight: 700; font-size: x-small;" class="auto-style1">
                                                            <br />
                                                        </span><span style="font-weight: 1200; font-size: large;" class="auto-style3">Password must contain Minimum 8  and Maximum 15 characters/digits with atleast 1 Alphabet and 1 Number</span></span></td>


                                                </tr>

                                                <tr id="trconfmpassword" runat="server">

                                                    <td align="left" style="padding-left: 30px; font-weight: bold;">
                                                        <asp:Label ID="Label5" runat="server" Text="Confirm Password:" ForeColor="Black" class="font2"
                                                            Style="font-weight: bold;"></asp:Label>

                                                    </td>
                                                    <td align="left" style="padding-left: 30px">
                                                        <asp:TextBox ID="Txtconfirmpassword" runat="server" Height="28px" Font-Size="Medium" Width="90%" TextMode="Password" class="select widthofboxes1 padtext" autocomplete="off"></asp:TextBox>
                                                        <%-- <span style="padding-left: 7px">
                                                            <br />
                                                            <input onclick="myFunction1()" type="checkbox" />
                                                            &nbsp;<span class="style1"><strong>Show Password</strong></span>
                                                        </span>--%>

                                                        <br />

                                                        <asp:CompareValidator ID="CompareValidatorpwd" runat="server" ControlToValidate="Txtconfirmpassword" ControlToCompare="Txtnewpassword" ForeColor="Red"
                                                            ErrorMessage="Password not Matched!!" Style="font-weight: 700; color: #000000" Font-Size="Small" SetFocusOnError="True" ValidationGroup="pwd" Display="Dynamic"></asp:CompareValidator>

                                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderTxtconfirmpassword" runat="server"
                                                            targetcontrolid="Txtconfirmpassword" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%^&*!">
                                                        </ajaxtoolkit:filteredtextboxextender>

                                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtconfirmpassword" runat="server" ControlToValidate="Txtconfirmpassword"
                                                            Display="Dynamic" ErrorMessage="Password Required!!" ForeColor="Red" SetFocusOnError="True"
                                                            ValidationGroup="pwd" Font-Bold="True" Style="color: #000000" Font-Size="Small"></asp:RequiredFieldValidator>



                                                    </td>


                                                </tr>

                                                <tr id="trbutton" runat="server">

                                                    <td align="center" runat="server" colspan="2">

                                                        <asp:Button ID="Btncreatepassword" runat="server" Text="Save Password" OnClick="Btncreatepassword_Click" Font-Size="Medium" class="btn select button111" Style="background-color: #99FFCC; color: Black; font-weight: bold" />
                                                    </td>

                                                </tr>
                                            </table>



                                        </div>
                                        &nbsp;</td>

                                </tr>




                                <%--  </asp:Panel>--%>
                            </table>


                            <br />
                        </div>


                    </div>
                    <div class="col-md-1 col-lg-1"></div>


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
                    <br />
                                Please send your Feedback / Suggestions to : hris@prasarbharati.gov.in<br />
                            </strong>
                        </h5>
                    </div>
                </div>


                <br />
            </div>
        </div>
    </form>
</body>
</html>
