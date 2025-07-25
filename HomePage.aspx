<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="PrasarNet.HomePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="style/responsive.css" type="text/css" media="screen" />
    <style type="text/css">
        .container1 {
            min-height: 430px;
        }

        .style1 {
            padding-right: 15px;
            padding-left: 15px;
            text-align: center;
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

        #gradhead {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            /* background: radial-gradient(#CEECF5, #E6E6E6);*/
            background: radial-gradient(#F5DA81, #D8D8D8);
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
</head>
<body>
    <div style="padding: 0px 0px 0px 0px;" class="container-fluid">
        <nav class="navbar navbar-default navbar-fixed-top row-no-padding">

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
                            </li>--%>
                            <%--<li><a href="#" style="color:Black; font-size:12px;font-weight:bold">Poll/Feedback</a></li>--%>
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 12px; font-weight: bold">Other
                                Links <span class="caret"></span></a>
                                <ul class="dropdown-menu grad3">
                                    <li><a href="https://www.mib.gov.in/" target="_blank" style="color: Black">MIB </a></li>
                                    <li><a href="http://www.prasarbharati.gov.in/" target="_blank" style="color: Black">Prasar Bharati</a></li>
                                    <li><a href="http://allindiaradio.gov.in/Default.aspx" target="_blank" style="color: Black">AIR </a></li>
                                    <li><a href="http://doordarshan.gov.in/#" target="_blank" style="color: Black">DD </a></li>
                                    <li><a href="https://musicauditions.prasarbharati.org/stationlogin.aspx" target="_blank" style="color: Black">Music Auditions(For Stations)</a></li>
                                    <li><a href="https://email.gov.in" target="_blank" style="color: Black">E-Mail</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 12px; font-weight: bold">Mobile Apps <span class="caret"></span></a>
                                <ul class="dropdown-menu grad3">
                                    <li><a href="https://play.google.com/store/apps/details?id=com.parsarbharti.airnews" target="_blank" style="color: Black">NewsOnAir (Android) </a></li>
                                    <li><a href="https://apps.apple.com/in/app/newsonair/id1450030867" target="_blank" style="color: Black">NewsOnAir (iOS) </a></li>

                                </ul>
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
    <div class="container-fluid" id="gradbody" runat="server" style="padding-top: 140px;">
        <%--<div class="row container1">
            <div class="col-xs-4 col-sm-4 col-lg-4">
                priyank</div>
            <div class="col-xs-4 col-sm-4 col-lg-4">
                <p>
                    checking</p>
            </div>
            <div class="col-xs-4 col-sm-4 col-lg-4">
                new</div>
        </div>--%>
        <div class="row container1" visible="false">
            <div class="col-lg-4 col-md-4 col-sm-4" visible="false">
                <asp:Panel ID="panelair" runat="server" GroupingText="All India Radio Tweets">
                    <a class="twitter-timeline" href="https://twitter.com/airnewsalerts" data-widget-id="392973359970934784">Tweets by @airnewsalerts</a>
                    <script type="text/javascript">
                        !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>
                </asp:Panel>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4" visible="false">
                <asp:Panel ID="panelPb" runat="server" GroupingText="Prasar Bharati Tweets">
                    <a class="twitter-timeline" href="https://twitter.com/prasarbharati" data-widget-id="696588355245441024">Tweets by @prasarbharati</a>
                    <script type="text/javascript">
                        !function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ?
                                'http' : 'https'; if (!d.getElementById(id)) {
                                    js = d.createElement(s); js.id = id;
                                    js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs);
                                }
                        }(document, "script", "twitter-wjs");</script>
                </asp:Panel>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4" visible="false">
                <asp:Panel ID="paneldd" runat="server" GroupingText="Doordarshan Tweets">
                    <a class="twitter-timeline" href="https://twitter.com/DDNewsLive" data-widget-id="440755332164227072">Tweets by @DDNewsLive</a>
                    <script>                        !function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + "://platform.twitter.com/widgets.js"; fjs.parentNode.insertBefore(js, fjs); } }(document, "script", "twitter-wjs");</script>
                </asp:Panel>
            </div>
        </div>
        <%--   <div class="row container1">
            <div class="col-xs-4 col-sm-4 col-lg-4">
                priyank</div>
            <div class="col-xs-4 col-sm-4 col-lg-4">
                saxena</div>
            <div class="col-xs-4 col-sm-4 col-lg-4">
                new</div>
        </div>--%>
    </div>
    <%--<nav class="navbar navbar-default navbar-fixed-bottom">--%>
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
                    Please send your Feedback / Suggestions to : itsw.helpdesk@prasarbharati.gov.in
                                        <br />
                    For Technical Issues: 011-23118461 
                </strong>
            </h5>
        </div>
    </div>
    <br />
</body>
</html>
