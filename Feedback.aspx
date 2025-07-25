<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="PrasarNet.Feedback" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome to PrasarNet Feedback</title>
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
                                    <%--<li><a href="HomePage.aspx" style="color: Black; font-size: 12px; font-weight: bold">&nbsp;Home</a></li>--%>
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


                <div align="right" runat="server" style="padding-top: 10px; padding-right: 25px">
                    <asp:ImageButton ID="imghome" runat="server" ImageUrl="~/images/home.png" CssClass="imground img-responsive"
                        CausesValidation="false" Height="100%" Width="50px" OnClick="imghome_Click" ToolTip="Navigate to Home"
                        AlternateText="Navigate to Home" />
                </div>
                <div class="row" style="margin: auto">
                    <div align="center" class="col-md-12 col-sm-12 col-lg-12" runat="server" width="70%" id="div5" style="padding-bottom: 20px; top: 0px; left: 0px;">

                        <asp:Panel ID="Panel2" runat="server" Style="margin: 10px; min-height: 310px" class="grad2">

                            <br />
                            <div id="Div6" class="gradhead" runat="server" style="padding-top: 10px; padding-bottom: 10px">
                                <asp:Label ID="Label6" runat="server" Text="Feedback Form" Style="font-weight: bold; color: Black;"
                                    class="font2"></asp:Label>

                            </div>
                            <br />


                            <table id="Table1" runat="server" class="table table-bordered grad2">


                                <tr>
                                    <td align="right" style="padding-right: 30px" width="50%">
                                        <asp:Label ID="Label8" runat="server" Text="Feedback Topic: *" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>&nbsp;
                                    </td>
                                    <td align="left" style="padding-left: 15px" width="50%">
                                        <asp:DropDownList ID="ddlfeedback" Height="32px" CssClass="select widthofboxes1" runat="server" Font-Bold="True" Font-Size="Medium">
                                            <asp:ListItem>--Select--</asp:ListItem>
                                            <asp:ListItem>Content</asp:ListItem>
                                            <asp:ListItem>Design</asp:ListItem>
                                            <asp:ListItem>Server</asp:ListItem>
                                            <asp:ListItem>Other</asp:ListItem>
                                        </asp:DropDownList>



                                    </td>
                                </tr>


                                <tr>

                                    <td align="right" style="padding-right: 30px" width="50%">
                                        <asp:Label ID="Label9" runat="server" Text="Name: *" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>&nbsp;
                                    </td>

                                    <td align="left" style="padding-left: 15px" width="50%">
                                        <asp:TextBox ID="TxtName" class="select widthofboxes1" Height="32px" runat="server" Font-Size="Medium"
                                            autocomplete="off" MaxLength="50" TextMode="SingleLine"></asp:TextBox>

                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderTxtName" runat="server"
                                            targetcontrolid="TxtName" filtertype="LowercaseLetters, UppercaseLetters,Custom" validchars=" ">
                                        </ajaxtoolkit:filteredtextboxextender>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtName" runat="server" ErrorMessage="Name Required!!"
                                            class="font" ControlToValidate="TxtName" ForeColor="Red" SetFocusOnError="True" ValidationGroup="reg" Font-Bold="true"
                                            Display="Dynamic"></asp:RequiredFieldValidator>&nbsp;

                                    </td>

                                </tr>


                                <tr>

                                    <td align="right" style="padding-right: 30px" width="50%">
                                        <asp:Label ID="LblMobile" runat="server" Text="Mobile: *" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>&nbsp;
                                    </td>

                                    <td align="left" style="padding-left: 15px" width="50%">

                                        <asp:TextBox ID="TxtMobile" class="select widthofboxes1" Height="32px" runat="server" Font-Size="Medium"
                                            autocomplete="off" MaxLength="10" TextMode="SingleLine"></asp:TextBox>

                                        <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtenderTxtMobile" runat="server"
                                            targetcontrolid="TxtMobile" validchars="0123456789">
                                        </ajaxtoolkit:filteredtextboxextender>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtMobile" runat="server" ErrorMessage="Mobile No. Required!!"
                                            class="font" ControlToValidate="TxtMobile" ForeColor="Red" SetFocusOnError="True" ValidationGroup="reg" Font-Bold="true"
                                            Display="Dynamic"></asp:RequiredFieldValidator>&nbsp;

                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorTxtMobile" runat="server" ControlToValidate="TxtMobile" class="font"
                                    ErrorMessage="10 digit mobile no. only" ForeColor="Red" SetFocusOnError="True" Font-Bold="true"
                                    ValidationExpression="\d{10,10}" ValidationGroup="reg"></asp:RegularExpressionValidator>

                                    </td>

                                </tr>

                                <tr>

                                    <td align="right" style="padding-right: 30px" width="50%">
                                        <asp:Label ID="Label1" runat="server" Text="Email: *" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>&nbsp;
                                    </td>

                                    <td align="left" style="padding-left: 15px" width="50%">
                                        <asp:TextBox ID="TxtEmail" class="select widthofboxes1" Height="32px" runat="server" Font-Size="Medium"
                                            autocomplete="off" TextMode="SingleLine"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtEmail" runat="server" ErrorMessage="Email Required!!"
                                            class="font" ControlToValidate="TxtEmail" ForeColor="Red" SetFocusOnError="True" ValidationGroup="reg" Font-Bold="true"
                                            Display="Dynamic"></asp:RequiredFieldValidator>&nbsp;

                                 <asp:RegularExpressionValidator ID="RegularExpressionValidatorTxtEmail" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Enter Correct Emailid" ForeColor="Red" SetFocusOnError="True" Font-Bold="true"
                                     Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>

                                    </td>

                                </tr>


                                <tr>

                                    <td align="right" style="padding-right: 30px" width="50%">
                                        <asp:Label ID="Label2" runat="server" Text="Enter Feedback: *" ForeColor="Black" class="font2"
                                            Style="font-weight: bold;"></asp:Label>&nbsp;
                                    </td>

                                    <td align="left" style="padding-left: 15px" width="50%">
                                        <asp:TextBox ID="Txtfeedback" class="select" Width="78%" Height="200px" runat="server" Font-Size="Medium"
                                            autocomplete="off" MaxLength="10" TextMode="MultiLine"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTxtfeedback" runat="server" ErrorMessage="Feedback Required!!"
                                            class="font" ControlToValidate="Txtfeedback" ForeColor="Red" SetFocusOnError="True" ValidationGroup="reg" Font-Bold="true"
                                            Display="Dynamic"></asp:RequiredFieldValidator>&nbsp;

                                    </td>

                                </tr>


                                <tr>



                                    <td align="center" runat="server" style="padding-left: 15px" colspan="2">

                                        <asp:Button ID="Btnsavefeedback" runat="server" class="btn select gradhead font2 button112" Style="background-color: #99FFCC; color: Black; font-weight: bold" Text="Submit Feedback" OnClick="Btnsavefeedback_Click" Font-Bold="True" />

                                    </td>

                                </tr>






                            </table>


                        </asp:Panel>



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
                    <br />
                                Please send your Feedback / Suggestions to : hris@prasarbharati.gov.in
                    <br />
                            </strong>
                        </h5>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </div>
        </div>
    </form>
</body>
</html>
