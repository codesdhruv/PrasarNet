<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="PrasarNet.AboutUs" %>

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

        .style1 {
            padding-right: 15px;
            padding-left: 15px;
            text-align: center;
        }

        .grad3 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            background: radial-gradient(yellow, orange);
            -webkit-radial-gradient
            /* background: linear-gradient(to right, orange, red);*/
        }

        #gradfooter {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            background: radial-gradient(#F5DA81, #D8D8D8);
            -webkit-radial-gradient
            /* background: linear-gradient(to right, orange, red);*/
        }

        #gradhead {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            /* background: radial-gradient(#CEECF5, #E6E6E6);*/
            background: radial-gradient(#F5DA81, #D8D8D8);
            -webkit-radial-gradient
        }

        .divjustify {
            text-align: justify;
            text-justify: inter-word;
            font-family: Times New Roman Baltic,Calibri;
        }

        .divheight {
            min-height: 680px;
            background: linear-gradient(to right, #F9FBE7, #FFF3E0);
            -webkit-radial-gradient
        }

        .divhei {
            min-height: 80px;
        }

        .divvisfalse {
            display: none;
        }

        .divvistrue {
            visibility: visible;
            display: block;
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
        function myFunction() {
            var x = document.getElementById("LinkButton1");
            if (x.innerText == "see more..") {
                x.innerText = "see less..";
                x.style.color = 'Blue';

            } else {
                x.innerText = "see more..";
            }
        }
        function myFunction2() {
            var x = document.getElementById("LinkButton2");
            if (x.innerText == "see more..") {
                x.innerText = "see less..";
                x.style.color = 'Blue';

            } else {
                x.innerText = "see more..";
            }
        }
        function myFunction3() {
            var x = document.getElementById("LinkButton3");
            if (x.innerText == "see more..") {
                x.innerText = "see less..";
                x.style.color = 'Blue';

            } else {
                x.innerText = "see more..";
            }
        }
        function myFunction4() {
            var x = document.getElementById("LinkButton4");
            if (x.innerText == "see more..") {
                x.innerText = "see less..";
                x.style.color = 'Blue';

            } else {
                x.innerText = "see more..";
            }
        }
    </script>
</head>
<body>
    <form id="Form1" runat="server">
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
                <div class="container-fluid">
                    <div class="row">
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
                                    <%--<li class="dropdown"><a class="dropdown-toggle"  style="color:Black; font-size:12px;font-weight:bold" data-toggle="dropdown" href="#">Our
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
                                            <li><a href="http://www.prasarbharati.gov.in/" target="_blank" style="color: Black">Prasar Bharati
                                            </a></li>
                                            <li><a href="http://allindiaradio.gov.in/Default.aspx" target="_blank" style="color: Black">AIR </a></li>
                                            <li><a href="http://doordarshan.gov.in/#" target="_blank" style="color: Black">DD </a></li>
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
                </div>

            </nav>
            <%-- <script src="Scripts/jquery-3.2.1.js"></script>
        <script src="Scripts/bootstrap.js"></script>--%>
        </div>
        <div id="gradbody" runat="server" class="divheight container-fluid">
            <div align="right" runat="server" style="padding-top: 190px; padding-right: 25px">
                <asp:ImageButton ID="imghome" runat="server" ImageUrl="~/images/home.png" CssClass="imground img-responsive"
                    CausesValidation="false" Height="100%" Width="50px" OnClick="imghome_Click" ToolTip="Navigate to Home"
                    AlternateText="Navigate to Home" />
            </div>
            <div class="row" style="padding-left: 20px; padding-right: 20px; margin: auto">
                <div class="col-lg-1 col-md-1 col-sm-1">
                </div>
                <div class="col-lg-10 col-md-10 col-sm-10">
                    <asp:Label ID="Label1" runat="server" Font-Bold="true" class="fontheader" Text="About Prasar Bharati"></asp:Label>
                    <hr />
                    <div class="divjustify">
                        <asp:Label ID="Label2" runat="server" class="fontheader1" Text="Prasar Bharati is a statutory autonomous body established under the Prasar Bharati Act and came into existence on 23.11.1997. It is the Public Service Broadcaster of the country. The objectives of public service broadcasting are achieved in terms of Prasar Bharati Act through All India Radio and Doordarshan, which earlier were working as media units under the Ministry of I&B and since the above said date became constituents of Prasar Bharati."></asp:Label>
                    </div>
                </div>
                <div class="col-lg-1 col-md-1 col-sm-1">
                </div>
            </div>
            <br />
            <div class="row" id="Div1" runat="server" style="padding-top: 20px; padding-left: 120px; padding-right: 120px; margin: auto">
                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 40px; padding-left: 20px; padding-right: 20px">
                    <asp:Label ID="Label3" runat="server" Font-Bold="true" class="fontheader" Text="All India Radio"></asp:Label>
                    <hr />
                    <div class="divjustify">
                        <div class="fontheader1">
                            All India Radio, India’s Public Service Broadcaster, the Radio vertical of Prasar
                        Bharati has been serving to inform, educate and entertain its audiences since its
                        inception, living up to its motto – ‘Bahujan Hitaya : Bahujan Sukhaya’. One of the
                        largest broadcasting organisations in the world in terms of the number of languages of
                        <div id="demo" class="collapse">
                            broadcast and the spectrum of socio-economic and cultural diversity
                            it serves, AIR’s home service comprises of 591 Broadcasting centres located across
                            the country, covering nearly 90% of the country’s area and 98% of the total
                            population. Terrestrially, AIR originates programming in 23 languages and 179 dialects.
                        </div>
                            <asp:LinkButton ID="LinkButton1" runat="server" data-toggle="collapse" data-target="#demo"
                                Font-Underline="false" ForeColor="Blue" OnClientClick="myFunction();return false;"
                                CausesValidation="False" Font-Bold="True" Text="see more.."></asp:LinkButton>
                            <%-- <button type="button" data-toggle="collapse" data-target="#demo">
                            see more..</button>--%>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 40px; padding-left: 20px; padding-right: 20px">
                    <asp:Label ID="Label4" runat="server" Font-Bold="true" class="fontheader" Text="Doordarshan"></asp:Label>
                    <hr />
                    <div class="divjustify">
                        <div class="fontheader1">
                            Doordarshan is India's Public Service Television network, the TV vertical of Prasar
                        Bharati. It is one of the largest broadcasting organisations in the world in terms
                        of the studios and transmitters. Doordarshan has started replacing its analogue
                        transmitters to digital transmitters, which will allow up to 8 channels to be carried from a single
                        <div id="Div2" class="collapse">
                            transmitter.Doordarshan has a three tier programme services
                            – National, Regional and Local. The National programmes emphasises on events and
                            issues of interest to the entire nation. These programmes includes news, current
                            affairs, magazine programmes and documentaries on science, art, culture, environment,
                            social issues, serials, music, dance, drama and feature films.
                        </div>
                            <asp:LinkButton ID="LinkButton2" runat="server" data-toggle="collapse" data-target="#Div2"
                                Font-Underline="false" ForeColor="Blue" OnClientClick="myFunction2();return false;"
                                CausesValidation="False" Font-Bold="True" Text="see more.."></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="row" id="Div4" runat="server" style="padding-top: 20px; padding-left: 120px; padding-right: 120px; margin: auto">
                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 40px; padding-left: 20px; padding-right: 20px">
                    <asp:Label ID="Label5" runat="server" Font-Bold="true" class="fontheader" Text="DD News"></asp:Label>
                    <hr />
                    <div class="divjustify">
                        <div class="fontheader1">
                            DD News, the Television News Channel of Prasar Bharati is the only terrestrial cum
                        satellite News Channel of the country. The News Channel of India's Public Service
                        Broadcaster has been successfully discharging its responsibility to give balanced,
                        fair and accurate news without sensationalizing as well as by 
                        <div id="Div3" class="collapse">
                            carrying different
                        shades of opinion.DD-News channel was launched on 3 November 2003 by converting DD-Metro into a 24-hours
                            news channel. Its satellite footprint is available across the country. DD News terrestrial
                            reach is 49% by population and 25% by area of the country. DD News is currently
                            producing news content in Hindi, English, Urdu and Sanskrit languages. Over 17 hours
                            of LIVE transmission include telecast of more than 30 news bulletins in these languages.
                        </div>
                            <asp:LinkButton ID="LinkButton3" runat="server" data-toggle="collapse" data-target="#Div3"
                                Font-Underline="false" ForeColor="Blue" OnClientClick="myFunction3();return false;"
                                CausesValidation="False" Font-Bold="True" Text="see more.."></asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6" style="padding-bottom: 40px; padding-left: 20px; padding-right: 20px">
                    <asp:Label ID="Label6" runat="server" Font-Bold="true" class="fontheader" Text="AIR News"></asp:Label>
                    <hr />
                    <div class="divjustify">
                        <div class="fontheader1">
                            The history of news broadcasting in India is much older than that of All India Radio.
                        The first news bulletin in thecountry went on the air from the Bombay Station on
                        July 23, 1927 under aprivate company, the Indian Broadcasting Company. A month lateron
                        August 26, 1927 another bulletin in Bengali was started from theCalcutta Station.
                        <div id="Div5" class="collapse">
                            Until 1935, two bulletins, one each in English andHindustani were broadcast from
                            Bombay and a bulletin in Bengali wasbroadcast from Calcutta. The Indian Broadcasting
                            Company wentinto liquidation in March, 1930 following which broadcasting came under
                            thedirect control of the Government of India. The service wasdesignated as the Indian
                            State Broadcasting Service. It was renamedAll India Radio on June 8, 1936.
                        </div>
                            <asp:LinkButton ID="LinkButton4" runat="server" data-toggle="collapse" data-target="#Div5"
                                Font-Underline="false" ForeColor="Blue" OnClientClick="myFunction4();return false;"
                                CausesValidation="False" Font-Bold="True" Text="see more.."></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
            <br />
            <div class="style1" id="gradfooter" runat="server">
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
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
