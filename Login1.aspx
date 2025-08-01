﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="PrasarNet.Login1" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
    <%--<link href="Content/bootstrap.css" rel="Stylesheet" />--%>
    <meta charset="utf-8">
    <%-- Mobile-first styles are part of the core framework.To ensure proper rendering and touch zooming, add the following <meta> tag inside the <head> element--%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="~/Content/login.css">
    <link rel="stylesheet" href="style/responsive.css" type="text/css" media="screen" />
    <script>
        !function (a) { function b(b, d) { function e() { if (w) { $canvas = a('<canvas class="pg-canvas"></canvas>'), v.prepend($canvas), p = $canvas[0], q = p.getContext("2d"), f(); for (var b = Math.round(p.width * p.height / d.density), c = 0; b > c; c++) { var e = new l; e.setStackPos(c), x.push(e) } a(window).on("resize", function () { h() }), a(document).on("mousemove", function (a) { y = a.pageX, z = a.pageY }), B && !A && window.addEventListener("deviceorientation", function () { D = Math.min(Math.max(-event.beta, -30), 30), C = Math.min(Math.max(-event.gamma, -30), 30) }, !0), g(), o("onInit") } } function f() { p.width = v.width(), p.height = v.height(), q.fillStyle = d.dotColor, q.strokeStyle = d.lineColor, q.lineWidth = d.lineWidth } function g() { if (w) { s = a(window).width(), t = a(window).height(), q.clearRect(0, 0, p.width, p.height); for (var b = 0; b < x.length; b++) x[b].updatePosition(); for (var b = 0; b < x.length; b++) x[b].draw(); E || (r = requestAnimationFrame(g)) } } function h() { for (f(), i = x.length - 1; i >= 0; i--) (x[i].position.x > v.width() || x[i].position.y > v.height()) && x.splice(i, 1); var a = Math.round(p.width * p.height / d.density); if (a > x.length) for (; a > x.length;) { var b = new l; x.push(b) } else a < x.length && x.splice(a); for (i = x.length - 1; i >= 0; i--) x[i].setStackPos(i) } function j() { E = !0 } function k() { E = !1, g() } function l() { switch (this.stackPos, this.active = !0, this.layer = Math.ceil(3 * Math.random()), this.parallaxOffsetX = 0, this.parallaxOffsetY = 0, this.position = { x: Math.ceil(Math.random() * p.width), y: Math.ceil(Math.random() * p.height) }, this.speed = {}, d.directionX) { case "left": this.speed.x = +(-d.maxSpeedX + Math.random() * d.maxSpeedX - d.minSpeedX).toFixed(2); break; case "right": this.speed.x = +(Math.random() * d.maxSpeedX + d.minSpeedX).toFixed(2); break; default: this.speed.x = +(-d.maxSpeedX / 2 + Math.random() * d.maxSpeedX).toFixed(2), this.speed.x += this.speed.x > 0 ? d.minSpeedX : -d.minSpeedX } switch (d.directionY) { case "up": this.speed.y = +(-d.maxSpeedY + Math.random() * d.maxSpeedY - d.minSpeedY).toFixed(2); break; case "down": this.speed.y = +(Math.random() * d.maxSpeedY + d.minSpeedY).toFixed(2); break; default: this.speed.y = +(-d.maxSpeedY / 2 + Math.random() * d.maxSpeedY).toFixed(2), this.speed.x += this.speed.y > 0 ? d.minSpeedY : -d.minSpeedY } } function m(a, b) { return b ? void (d[a] = b) : d[a] } function n() { v.find(".pg-canvas").remove(), o("onDestroy"), v.removeData("plugin_" + c) } function o(a) { void 0 !== d[a] && d[a].call(u) } var p, q, r, s, t, u = b, v = a(b), w = !!document.createElement("canvas").getContext, x = [], y = 0, z = 0, A = !navigator.userAgent.match(/(iPhone|iPod|iPad|Android|BlackBerry|BB10|mobi|tablet|opera mini|nexus 7)/i), B = !!window.DeviceOrientationEvent, C = 0, D = 0, E = !1; return d = a.extend({}, a.fn[c].defaults, d), l.prototype.draw = function () { q.beginPath(), q.arc(this.position.x + this.parallaxOffsetX, this.position.y + this.parallaxOffsetY, d.particleRadius / 2, 0, 2 * Math.PI, !0), q.closePath(), q.fill(), q.beginPath(); for (var a = x.length - 1; a > this.stackPos; a--) { var b = x[a], c = this.position.x - b.position.x, e = this.position.y - b.position.y, f = Math.sqrt(c * c + e * e).toFixed(2); f < d.proximity && (q.moveTo(this.position.x + this.parallaxOffsetX, this.position.y + this.parallaxOffsetY), d.curvedLines ? q.quadraticCurveTo(Math.max(b.position.x, b.position.x), Math.min(b.position.y, b.position.y), b.position.x + b.parallaxOffsetX, b.position.y + b.parallaxOffsetY) : q.lineTo(b.position.x + b.parallaxOffsetX, b.position.y + b.parallaxOffsetY)) } q.stroke(), q.closePath() }, l.prototype.updatePosition = function () { if (d.parallax) { if (B && !A) { var a = (s - 0) / 60; pointerX = (C - -30) * a + 0; var b = (t - 0) / 60; pointerY = (D - -30) * b + 0 } else pointerX = y, pointerY = z; this.parallaxTargX = (pointerX - s / 2) / (d.parallaxMultiplier * this.layer), this.parallaxOffsetX += (this.parallaxTargX - this.parallaxOffsetX) / 10, this.parallaxTargY = (pointerY - t / 2) / (d.parallaxMultiplier * this.layer), this.parallaxOffsetY += (this.parallaxTargY - this.parallaxOffsetY) / 10 } switch (d.directionX) { case "left": this.position.x + this.speed.x + this.parallaxOffsetX < 0 && (this.position.x = v.width() - this.parallaxOffsetX); break; case "right": this.position.x + this.speed.x + this.parallaxOffsetX > v.width() && (this.position.x = 0 - this.parallaxOffsetX); break; default: (this.position.x + this.speed.x + this.parallaxOffsetX > v.width() || this.position.x + this.speed.x + this.parallaxOffsetX < 0) && (this.speed.x = -this.speed.x) } switch (d.directionY) { case "up": this.position.y + this.speed.y + this.parallaxOffsetY < 0 && (this.position.y = v.height() - this.parallaxOffsetY); break; case "down": this.position.y + this.speed.y + this.parallaxOffsetY > v.height() && (this.position.y = 0 - this.parallaxOffsetY); break; default: (this.position.y + this.speed.y + this.parallaxOffsetY > v.height() || this.position.y + this.speed.y + this.parallaxOffsetY < 0) && (this.speed.y = -this.speed.y) } this.position.x += this.speed.x, this.position.y += this.speed.y }, l.prototype.setStackPos = function (a) { this.stackPos = a }, e(), { option: m, destroy: n, start: k, pause: j } } var c = "particleground"; a.fn[c] = function (d) { if ("string" == typeof arguments[0]) { var e, f = arguments[0], g = Array.prototype.slice.call(arguments, 1); return this.each(function () { a.data(this, "plugin_" + c) && "function" == typeof a.data(this, "plugin_" + c)[f] && (e = a.data(this, "plugin_" + c)[f].apply(this, g)) }), void 0 !== e ? e : this } return "object" != typeof d && d ? void 0 : this.each(function () { a.data(this, "plugin_" + c) || a.data(this, "plugin_" + c, new b(this, d)) }) }, a.fn[c].defaults = { minSpeedX: .1, maxSpeedX: .7, minSpeedY: .1, maxSpeedY: .7, directionX: "center", directionY: "center", density: 1e4, dotColor: "#666666", lineColor: "#666666", particleRadius: 7, lineWidth: 1, curvedLines: !1, proximity: 100, parallax: !0, parallaxMultiplier: 5, onInit: function () { }, onDestroy: function () { } } }(jQuery), /**
 * requestAnimationFrame polyfill by Erik Möller. fixes from Paul Irish and Tino Zijdel
 * @see: http://paulirish.com/2011/requestanimationframe-for-smart-animating/
 * @see: http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating
 * @license: MIT license
 */
function () { for (var a = 0, b = ["ms", "moz", "webkit", "o"], c = 0; c < b.length && !window.requestAnimationFrame; ++c) window.requestAnimationFrame = window[b[c] + "RequestAnimationFrame"], window.cancelAnimationFrame = window[b[c] + "CancelAnimationFrame"] || window[b[c] + "CancelRequestAnimationFrame"]; window.requestAnimationFrame || (window.requestAnimationFrame = function (b) { var c = (new Date).getTime(), d = Math.max(0, 16 - (c - a)), e = window.setTimeout(function () { b(c + d) }, d); return a = c + d, e }), window.cancelAnimationFrame || (window.cancelAnimationFrame = function (a) { clearTimeout(a) }) }();

        $(function () {

            $('#particles').particleground({
                minSpeedX: 0.1,
                maxSpeedX: 0.7,
                minSpeedY: 0.1,
                maxSpeedY: 0.7,
                directionX: 'center', // 'center', 'left' or 'right'. 'center' = dots bounce off edges
                directionY: 'center', // 'center', 'up' or 'down'. 'center' = dots bounce off edges
                density: 10000, // How many particles will be generated: one particle every n pixels
                dotColor: '#eee',
                lineColor: '#eee',
                particleRadius: 7, // Dot size
                lineWidth: 1,
                curvedLines: true,
                proximity: 100, // How close two dots need to be before they join
                parallax: false
            });

        });

        function myFunction() {
            var x = document.getElementById("txtpassword");
            if (x.type == "password") {
                x.type = "text";
            } else {
                x.type = "password";
            }
        }
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <style type="text/css">
        .avatar1 {
            border-radius: 50%;
        }

        .style1 {
            font-size: small;
        }

        .grad2 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .auto-style1 {
            color: #FF0000;
        }

        .auto-style2 {
            color: #000000;
        }

        .auto-style3 {
            color: #000000;
            text-decoration: underline;
            font-size: medium;
        }
    </style>
</head>

<body class="gradbody">

    <form id="form1" runat="server">
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
        <div class="row" style="margin: auto" runat="server">
            <div class=" col-lg-3 col-md-2 col-sm-2"></div>
            <div class=" col-lg-6 col-md-8 col-sm-8">

                <div id="loginbox" class="mainbox">
                    <div class="style1" style="text-align: center">
                        <%-- <marquee direction="left" scrolldelay="122" behavior="slide">--%>
                        <span><strong>* Guest login is no longer available. Employee (Un-Registered) may follow the SignUp process, for their login credentials.
            <br />
                        </strong></span>
                        <%--</marquee>--%>
                    </div>
                    <div class="row" align="center" style="margin: auto">

                        <%--<div class="iconmelon">--%>
                        <div class="imgcontainer">
                            <asp:Image ID="Image1" runat="server" class="avatar1" ImageUrl="~/images/avatarn1.png" alt="Avatar"
                                Height="100%" Width="130px" />
                            <%--  <img src="images/login2.png" alt="Avatar" class="avatar" height="100%" width="130px" />--%>
                        </div>
                        <%--    <svg viewBox="0 0 32 32">
                <g filter="">
                  <use xlink:href="~/images/login.png"></use>
                </g>
              </svg>--%>
                        <%-- </div>--%>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading grad3" style="font-weight: bold;">
                            <div class="panel-title text-center">
                                Login to PrasarNet
                            </div>
                        </div>
                        <div class="panel-body grad2">

                            <asp:ScriptManager ID="Script" runat="server"></asp:ScriptManager>

                            <form name="form" id="form" class="form-horizontal" enctype="multipart/form-data"
                                method="POST">
                                <div align="center" id="rbllogintype" runat="server">
                                    <asp:RadioButtonList ID="rblusertype" runat="server" class="radiobuttonlistcls" RepeatDirection="Horizontal"
                                        TabIndex="1" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged">
                                        <%--<asp:ListItem Selected="True" Value="1">Employee&nbsp;</asp:ListItem>
                            <asp:ListItem Value="2">Station&nbsp;</asp:ListItem>
                            <asp:ListItem Value="3">Section&nbsp;</asp:ListItem>
                            <asp:ListItem Value="4">Management&nbsp;</asp:ListItem>--%>
                                    </asp:RadioButtonList>
                                </div>
                                <br />
                                <div id="divstn" runat="server" visible="false" align="center">
                                    <div id="div1" runat="server" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-briefcase"></i></span>
                                        <asp:DropDownList ID="ddlorg" runat="server" class="form-control" AutoPostBack="true"
                                            OnSelectedIndexChanged="ddlorg_selectedindex">
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="rfvorg" runat="server" ControlToValidate="ddlorg"
                                        Display="Dynamic" ErrorMessage="Pl. Select The Organisation" ForeColor="Red"
                                        SetFocusOnError="True" Style="font-size: small"></asp:RequiredFieldValidator>
                                    <br />
                                    <div id="div2" runat="server" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                                        <asp:DropDownList ID="ddlstn" runat="server" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                    <asp:RequiredFieldValidator ID="rfvstn" runat="server" ControlToValidate="ddlstn"
                                        Display="Dynamic" ErrorMessage="Pl. Select The Station" ForeColor="Red" SetFocusOnError="True"
                                        Style="font-size: small"></asp:RequiredFieldValidator>
                                </div>
                                <div id="divusr" runat="server" visible="true" align="center">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <asp:TextBox ID="txtusr" type="text" runat="server" class="form-control" placeholder="UserName"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender72" runat="server"
                                            TargetControlID="txtusr" ValidChars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#._-()/\:;&"></ajaxToolkit:FilteredTextBoxExtender>
                                        <%--<input id="user" type="text" class="form-control" name="user" value="" placeholder="User">--%>
                                    </div>
                                    <div align="left" runat="server">
                                        <asp:RequiredFieldValidator ID="rfvusr" runat="server" ErrorMessage="UserName Required!!"
                                            ControlToValidate="txtusr" ForeColor="Red" SetFocusOnError="True" Style="font-size: small"
                                            Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>

                                </div>
                                <br />
                                <div id="divpswd" runat="server" class="input-group" visible="false" align="center">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <asp:TextBox ID="txtpassword" type="text" runat="server" class="form-control" placeholder="Password"
                                        TextMode="Password" ClientIDMode="Static"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server"
                                        TargetControlID="txtpassword" ValidChars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&*!./\()!:;=^~?_-"></ajaxToolkit:FilteredTextBoxExtender>

                                    <%--<input id="user" type="text" class="form-control" name="user" value="" placeholder="User">--%>
                                </div>
                                <div align="left" runat="server">
                                    <asp:RequiredFieldValidator ID="rfvpswd" runat="server" ErrorMessage="Password Required!!"
                                        ControlToValidate="txtpassword" ForeColor="Red" SetFocusOnError="True" Style="font-size: small"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div style="padding-left: 7px">
                                    <input type="checkbox" onclick="myFunction()">&nbsp;<span class="style1">Show
                            Password</span>
                                </div>
                                <br />
                                <div class="form-group" align="center">
                                    <!-- Button -->
                                    <asp:Button ID="btnlogin" runat="server" Text="LogIn" class="btn" Style="background-color: #99FFCC; color: Black; font-weight: bold" Visible="false"
                                        OnClick="btnlogin_Click" Width="90px" />
                                    <asp:Button ID="btnloginParichay" runat="server" Text="Parichay LogIn" class="btn" Style="background-color: #ffd800; color: Black; font-weight: bold"
                                         Width="190px" OnClick="btnloginParichay_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Close" class="btn" Style="background-color: #99FFCC; color: Black; font-weight: bold"
                            Width="90px" OnClick="btnclose_Click" CausesValidation="False" />
                                    <%--     <button type="submit" class="btn btn-primary pull-right"  style="background-color: #99FFCC">
                                <i class="glyphicon glyphicon-log-in" style="color: #000000"></i><span style="color: Black;font-weight:bold">&nbsp;Log in</span></button>--%>
                                </div>
                                <div class="form-group" align="center">
                                    <div class="row" style="margin: auto;">
                                        <div class="col-lg-6 col-md-6" style="padding-bottom: 5px" runat="server" visible="false">
                                            <asp:LinkButton ID="lnkloginguest" runat="server" Font-Size="Large" Font-Underline="true" Visible="false"
                                                ForeColor="Blue" OnClick="lnkloginguest_Click" CausesValidation="False"
                                                Font-Bold="True">Click here to Login as guest</asp:LinkButton>
                                        </div>
                                        <div class="col-lg-2 col-md-2" style="padding-bottom: 5px"></div>
                                        <div class="col-lg-4 col-md-4" style="padding-bottom: 5px">
                                            <span style="text-align: right;">
                                                <asp:LinkButton ID="Lnkforgetpassword" runat="server" Font-Size="Large" PostBackUrl="~/Forget_Password.aspx"
                                                    ForeColor="Blue" CausesValidation="False" Font-Underline="true" Visible="false"
                                                    Font-Bold="True">Forgot Password?</asp:LinkButton>
                                            </span>
                                        </div>
                                        <div class="col-lg-4 col-md-4" style="padding-bottom: 5px">
                                            <span style="text-align: right;">
                                                <asp:LinkButton ID="lnkfeedback" runat="server" Font-Size="Large" PostBackUrl="~/Feedback.aspx"
                                                    ForeColor="Blue" CausesValidation="False" Font-Underline="true"
                                                    Font-Bold="True">Write a FeedBack</asp:LinkButton>
                                            </span>
                                        </div>
                                        <div class="col-lg-2 col-md-2" style="padding-bottom: 5px"></div>
                                    </div>
                                    <%--<asp:LinkButton ID="lnlfrgtpswd" runat="server" Font-Size="Small" ForeColor="Blue">Forget Password</asp:LinkButton>--%>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div runat="server" align="left" class="auto-style1" style="border: medium groove #000000; padding: 10px;">
                        <strong><span class="auto-style3">Instructions:</span><br />
                            <br />
                            * <span class="auto-style2">The section category is only for the sections in DG:AIR,DG:DD and Prasar Bharati Sectt.&nbsp; They can login with same ceredentials as they was using on AIRNET.</span><br />
                            <br />
                            **<span class="auto-style2"> The stations can login through the same credentials as they are using on HRIS.</span><br />
                            <br />
                            *** <span class="auto-style2">Under Management option, The Login facility has been provided for O/o CEO,O/o DG:DD,O/o DG:AIR,O/o&nbsp; Mem(P),O/o&nbsp; Mem(F) etc.These offices may contact IT Division, for their login ceredentials.</span><br />
                            <br />
                            **** <span class="auto-style2">Employee needs to signup before login. In signup they can generate their Username and Password. </span></strong>
                    </div>

                </div>
            </div>
            <div class="col-lg-3 col-md-2 col-sm-2"></div>

        </div>
        <br />
        <br />
        <div id="particles">
        </div>
        <svg id="svg-source" height="0" version="1.1" xmlns="http://www.w3.org/2000/svg"
            style="position: absolute; margin-left: -100%" xmlns:xlink="http://www.w3.org/1999/xlink">
            <g id="git" data-iconmelon="Iconmelon:c88d710192f240e49b7f92912997850e">
                <path fill="#40B7AE" d="M16.176,31.751c4.82,0,8.764-3.196,9.08-7.242H7.096C7.413,28.555,11.355,31.751,16.176,31.751z"></path>
                <g opacity="0.1">
                    <path fill="#FFFFFF" d="M20.893,30.672c-0.006-0.014-0.013-0.026-0.019-0.04c-0.004,0.003-0.009,0.005-0.013,0.007
    	C20.871,30.65,20.883,30.66,20.893,30.672z">
                    </path>
                    <path fill="#FFFFFF" d="M25.251,24.514h-0.009c0,0.021,0,0.041,0,0.062C25.244,24.555,25.25,24.534,25.251,24.514z"></path>
                    <path fill="#FFFFFF" d="M22.508,26.766c0.229,0.683,0.398,1.385,0.518,2.093c0.012,0.07,0.012,0.143,0.022,0.213
		c1.243-1.224,2.045-2.781,2.194-4.496c0-0.021,0-0.041,0-0.062h-3.72c0.057,0.107,0.123,0.21,0.177,0.319
		C22.015,25.456,22.289,26.103,22.508,26.766z">
                    </path>
                    <path fill="#FFFFFF" d="M19.32,29.158c-0.924-0.711-2-1.235-3.148-1.456c-0.725-0.141-1.47-0.167-2.205-0.086
		c-0.899,0.095-1.779,0.34-2.614,0.681c0.606-0.061,1.221-0.063,1.825,0.027c0.505,0.074,1.002,0.21,1.473,0.41
		c0.917,0.383,1.719,0.993,2.427,1.682c0.379,0.366,0.73,0.756,1.081,1.146c0.969-0.185,1.878-0.499,2.702-0.924
		C20.395,30.1,19.888,29.593,19.32,29.158z">
                    </path>
                    <path fill="#FFFFFF" d="M15.433,31.05c-0.008-0.012-0.023-0.034-0.032-0.045c0.078,0.246,0.167,0.488,0.258,0.729
		c0.093,0.005,0.185,0.01,0.278,0.012C15.759,31.521,15.59,31.29,15.433,31.05z">
                    </path>
                    <path fill="#FFFFFF" d="M13.057,25.795c0.88,0.164,1.765,0.308,2.632,0.528c0.622,0.16,1.237,0.362,1.815,0.645
		c0.494,0.239,0.961,0.538,1.379,0.896c0.373,0.315,0.707,0.677,1.002,1.067c0.321,0.429,0.6,0.89,0.836,1.372
		c0.054,0.108,0.106,0.218,0.153,0.329c0.628-0.324,1.205-0.712,1.722-1.152c-0.115-0.415-0.238-0.829-0.379-1.236
		c-0.308-0.895-0.676-1.768-1.115-2.604c-0.201-0.384-0.42-0.759-0.648-1.126h-2.55c0.124,0.318,0.243,0.639,0.346,0.964
		c-0.122-0.088-0.243-0.178-0.37-0.264c-0.384-0.264-0.791-0.49-1.207-0.7H8.873c0.443,0.225,0.899,0.426,1.369,0.587
		C11.157,25.416,12.106,25.618,13.057,25.795z">
                    </path>
                    <path fill="#FFFFFF" d="M12.222,26.922c0.104-0.012,0.207-0.019,0.309-0.038c-0.413-0.039-0.824-0.093-1.229-0.181
		c-1.553-0.324-3.019-1.06-4.202-2.118c0.034,0.38,0.105,0.75,0.201,1.112c0.245,0.326,0.512,0.637,0.839,0.88
		c0.093,0.072,0.194,0.131,0.292,0.194c-0.211,0.083-0.407,0.195-0.601,0.312c0.126,0.248,0.266,0.49,0.421,0.724
		c0.616-0.235,1.254-0.418,1.898-0.556C10.835,27.106,11.528,27.004,12.222,26.922z">
                    </path>
                    <path fill="#FFFFFF" d="M12.986,30.213c-0.216-0.195-0.467-0.354-0.742-0.451c-0.382-0.14-0.799-0.167-1.2-0.115
		c-0.271,0.034-0.531,0.124-0.777,0.243c1.036,0.756,2.271,1.315,3.633,1.614c-0.165-0.325-0.343-0.642-0.572-0.927
		C13.225,30.445,13.109,30.325,12.986,30.213z">
                    </path>
                    <path fill="#FFFFFF" d="M9.595,28.736c-0.212-0.032-0.426-0.034-0.64-0.023c0.076,0.085,0.155,0.167,0.235,0.248
		C9.323,28.882,9.454,28.798,9.595,28.736z">
                    </path>
                </g>
                <path fill="#F39C9E" d="M25.25,24.503c0-1.737-4.064-3.155-9.077-3.155s-9.076,1.418-9.076,3.155c0,1.75,4.064,3.168,9.076,3.168
	C21.186,27.671,25.25,26.253,25.25,24.503z">
                </path>
                <path fill="#E9437F" d="M24.303,24.357c0-1.477-3.641-2.682-8.129-2.682c-4.489,0-8.129,1.205-8.129,2.682
	c0,1.486,3.64,2.69,8.129,2.69C20.662,27.049,24.303,25.846,24.303,24.357z">
                </path>
                <path fill="#3C3C3B" d="M21.541,24.598c0,0,0.497-0.226,0.82-0.142c0.334,0.086,0.168,0.377-0.197,0.303
	c0.338,0.112,0.102,0.38-0.232,0.294C21.607,24.969,21.541,24.598,21.541,24.598z">
                </path>
                <g>
                    <path fill="#3C3C3B" d="M16.104,26.333l0.012-0.013c0.042-0.043,0.138-0.096,0.214-0.115l0.102-0.025
		c0.166-0.044,0.231-0.176,0.145-0.295c-0.086-0.121-0.29-0.183-0.456-0.14c-0.001,0-0.103,0.026-0.103,0.026
		c-0.077,0.021-0.206,0.025-0.287,0.015l-0.024-0.004c-0.081-0.011-0.122,0.017-0.087,0.062l0.349,0.483
		C16.001,26.374,16.063,26.376,16.104,26.333z">
                    </path>
                    <path fill="#3C3C3B" d="M15.614,26.134c0.04,0.054,0.124,0.085,0.197,0.076l-0.154-0.214
		C15.595,26.021,15.575,26.079,15.614,26.134z">
                    </path>
                </g>
                <path fill="#3C3C3B" d="M19.816,25.689v-0.045c0-0.004,0.002-0.006,0.002-0.008c0.014-0.003,0.022-0.006,0.037-0.009
	c0.002,0.001,0.006,0.002,0.009,0.004l0.054,0.032c0.025,0.018,0.068,0.018,0.096,0l0.092-0.057c0.025-0.015,0.025-0.041,0-0.056
	l-0.055-0.032c-0.002-0.002-0.006-0.004-0.007-0.006c0.005-0.007,0.011-0.015,0.015-0.021c0.004,0,0.008,0,0.014,0h0.074
	c0.037,0,0.067-0.018,0.067-0.04v-0.078c0-0.022-0.03-0.04-0.067-0.04h-0.074c-0.006,0-0.01,0-0.014-0.001
	c-0.006-0.008-0.01-0.015-0.015-0.021c0.001-0.002,0.005-0.004,0.007-0.006l0.055-0.033c0.025-0.016,0.025-0.041,0-0.056
	l-0.092-0.057c-0.027-0.017-0.068-0.017-0.096,0l-0.054,0.032c-0.003,0.002-0.007,0.004-0.009,0.006
	c-0.015-0.004-0.023-0.008-0.037-0.01c0-0.002-0.002-0.004-0.002-0.008v-0.046c0-0.021-0.029-0.038-0.065-0.038h-0.132
	c-0.036,0-0.066,0.017-0.066,0.038v0.046c0,0.004,0,0.006-0.002,0.008c-0.012,0.002-0.023,0.006-0.037,0.01
	c-0.002-0.001-0.005-0.004-0.008-0.006l-0.056-0.032c-0.024-0.017-0.067-0.017-0.093,0l-0.094,0.057
	c-0.025,0.017-0.025,0.04,0,0.056l0.055,0.033c0.004,0.002,0.006,0.004,0.008,0.006c-0.006,0.006-0.012,0.015-0.016,0.021
	c-0.004,0.001-0.009,0.001-0.013,0.001h-0.077c-0.035,0-0.066,0.018-0.066,0.04v0.078c0,0.022,0.031,0.04,0.066,0.04h0.077
	c0.004,0,0.009,0,0.013,0c0.004,0.008,0.01,0.016,0.016,0.021c-0.002,0.002-0.004,0.004-0.008,0.006l-0.055,0.032
	c-0.025,0.017-0.025,0.041,0,0.056l0.094,0.057c0.024,0.018,0.067,0.018,0.093,0l0.056-0.032c0.003-0.002,0.006-0.003,0.008-0.004
	c0.014,0.003,0.025,0.006,0.037,0.009c0.002,0.002,0.002,0.004,0.002,0.008v0.045c0,0.022,0.03,0.041,0.066,0.041h0.132
	C19.787,25.73,19.816,25.713,19.816,25.689z M19.486,25.414c0-0.064,0.088-0.118,0.197-0.118c0.108,0,0.198,0.054,0.198,0.118
	s-0.09,0.119-0.198,0.119C19.574,25.533,19.486,25.479,19.486,25.414z">
                </path>
                <path fill="#3C3C3B" d="M16.109,22.757v-0.046c0-0.003,0.001-0.006,0.001-0.007c0.014-0.003,0.024-0.006,0.037-0.011
	c0.003,0.002,0.007,0.004,0.01,0.006l0.054,0.031c0.026,0.017,0.068,0.017,0.094,0l0.093-0.056c0.025-0.016,0.025-0.041,0-0.056
	l-0.055-0.032c-0.002-0.002-0.006-0.005-0.007-0.006c0.005-0.007,0.01-0.015,0.014-0.022c0.003,0,0.007,0,0.013,0h0.076
	c0.037,0,0.067-0.018,0.067-0.039v-0.08c0-0.021-0.03-0.039-0.067-0.039h-0.076c-0.006,0-0.01,0-0.013,0
	c-0.005-0.008-0.01-0.017-0.014-0.022c0.001-0.001,0.004-0.003,0.007-0.005l0.055-0.032c0.025-0.016,0.025-0.041,0-0.056
	l-0.093-0.057c-0.025-0.017-0.068-0.017-0.094,0l-0.054,0.033c-0.003,0.002-0.006,0.002-0.01,0.004
	c-0.013-0.004-0.023-0.007-0.037-0.01c0-0.002-0.001-0.005-0.001-0.007v-0.046c0-0.021-0.03-0.04-0.066-0.04h-0.132
	c-0.036,0-0.066,0.019-0.066,0.04v0.046c0,0.002,0,0.005-0.001,0.007c-0.012,0.003-0.023,0.006-0.037,0.01
	c-0.002-0.002-0.006-0.002-0.009-0.004l-0.055-0.033c-0.024-0.017-0.067-0.017-0.093,0l-0.093,0.057
	c-0.026,0.016-0.026,0.04,0,0.056l0.055,0.032c0.003,0.002,0.006,0.004,0.007,0.005c-0.006,0.008-0.01,0.017-0.015,0.022
	c-0.003,0-0.008,0-0.012,0h-0.077c-0.036,0-0.066,0.018-0.066,0.039v0.08c0,0.021,0.03,0.039,0.066,0.039h0.077
	c0.004,0,0.009,0,0.012,0c0.004,0.008,0.01,0.017,0.015,0.022c-0.001,0.001-0.004,0.003-0.007,0.006l-0.055,0.032
	c-0.026,0.016-0.026,0.04,0,0.056l0.093,0.056c0.026,0.017,0.069,0.017,0.093,0l0.055-0.031c0.003-0.002,0.006-0.004,0.009-0.006
	c0.013,0.005,0.024,0.008,0.037,0.011c0.001,0.001,0.001,0.004,0.001,0.007v0.046c0,0.022,0.031,0.04,0.066,0.04h0.132
	C16.08,22.797,16.109,22.779,16.109,22.757z M15.778,22.479c0-0.063,0.088-0.117,0.198-0.117c0.109,0,0.198,0.054,0.198,0.117
	c0,0.066-0.089,0.119-0.198,0.119C15.867,22.6,15.778,22.546,15.778,22.479z">
                </path>
                <path fill="#3C3C3B" d="M10.752,24.665c0.001-0.003,0.001-0.005,0.002-0.006c0.001-0.002,0.001-0.005,0.001-0.007
	c0.073-0.166-0.096-0.338-0.373-0.381c-0.277-0.043-1,0.172-1,0.172s0.456,0.4,0.731,0.445
	C10.39,24.932,10.678,24.832,10.752,24.665z M9.983,24.539c0.036-0.087,0.182-0.139,0.324-0.114c0.143,0.021,0.228,0.108,0.19,0.193
	s-0.183,0.137-0.324,0.114C10.031,24.711,9.946,24.623,9.983,24.539z">
                </path>
                <path fill="#3C3C3B" d="M12.61,25.641c0.001,0.049-0.03,0.076-0.068,0.103c0.002,0.021,0.023,0.05,0.038,0.065
	c0.004,0.006,0.01,0.01,0.014,0.017c-0.042-0.009-0.077-0.021-0.102-0.041c-0.005-0.005-0.013-0.009-0.017-0.015l0,0
	c0,0.027,0.021,0.051,0.033,0.073l0,0c-0.03-0.013-0.062-0.026-0.084-0.044c-0.009-0.007-0.018-0.014-0.027-0.021
	c-0.05,0-0.098,0-0.14-0.006c-0.245-0.032-0.411-0.119-0.482-0.254c-0.026-0.05-0.036-0.127-0.013-0.184
	c0.012-0.027,0.025-0.055,0.042-0.077c0.009-0.013,0.02-0.024,0.032-0.036c0.004-0.004,0.007-0.008,0.012-0.012
	c-0.001,0.014-0.007,0.027-0.002,0.042c0.003,0.013,0.002,0.024,0.006,0.036c0.011,0.029,0.025,0.056,0.047,0.078
	c0.011,0.011,0.023,0.027,0.039,0.035c0-0.016,0.005-0.028,0.012-0.039c0.025-0.041,0.07-0.066,0.139-0.082
	c-0.002,0.013-0.008,0.05,0.004,0.059c0.001-0.018,0.017-0.031,0.029-0.043c0.036-0.034,0.095-0.062,0.187-0.061
	c-0.003,0.004-0.008,0.009-0.011,0.014c-0.006,0.007-0.009,0.016-0.013,0.025c-0.001,0.004-0.006,0.014-0.003,0.019v-0.001
	c0.013-0.007,0.021-0.018,0.035-0.023c0.046-0.021,0.116-0.041,0.198-0.028c0.021,0.003,0.04,0.009,0.057,0.014l0,0
	c-0.009,0.003-0.015,0.009-0.023,0.013c-0.023,0.012-0.043,0.024-0.062,0.039c-0.062,0.047-0.101,0.09-0.128,0.157
	c-0.007,0.019-0.013,0.038-0.013,0.06c0.028-0.006,0.076-0.004,0.103,0c0.069,0.013,0.119,0.037,0.146,0.074
	c0.006,0.008,0.011,0.019,0.014,0.027C12.608,25.629,12.609,25.635,12.61,25.641z">
                </path>
                <path fill="#3C3C3B" d="M21.988,23.285c0-0.176-0.191-0.317-0.428-0.317c-0.129,0-0.244,0.042-0.322,0.106
	c-0.031,0.007-0.064,0.004-0.11-0.012c-0.051-0.019-0.094-0.051-0.128-0.096c0.014,0.112,0.062,0.209,0.137,0.266
	c-0.004,0.017-0.006,0.033-0.006,0.053c0,0.175,0.191,0.314,0.43,0.314C21.797,23.602,21.988,23.46,21.988,23.285">
                </path>
                <path fill="#3C3C3B" d="M11.153,23.197V23.15c0-0.002,0-0.004,0-0.006c0.014-0.004,0.025-0.006,0.037-0.01
	c0.003,0.001,0.007,0.004,0.009,0.004l0.055,0.033c0.026,0.016,0.068,0.016,0.094,0l0.093-0.057c0.025-0.016,0.025-0.041,0-0.057
	l-0.054-0.031c-0.003-0.002-0.006-0.004-0.007-0.006c0.005-0.008,0.01-0.016,0.014-0.022c0.003,0,0.007,0,0.013,0h0.076
	c0.037,0,0.067-0.019,0.067-0.039v-0.079c0-0.021-0.03-0.04-0.067-0.04h-0.076c-0.005,0-0.009,0-0.013-0.001
	c-0.005-0.007-0.01-0.015-0.014-0.021c0.001,0,0.004-0.004,0.007-0.004l0.054-0.033c0.025-0.016,0.025-0.041,0-0.057l-0.093-0.057
	c-0.026-0.016-0.068-0.016-0.094,0L11.2,22.702c-0.002,0.002-0.006,0.004-0.009,0.005c-0.012-0.003-0.023-0.007-0.037-0.009
	c0-0.003,0-0.005,0-0.009v-0.045c0-0.021-0.03-0.039-0.066-0.039h-0.132c-0.036,0-0.067,0.017-0.067,0.039v0.045
	c0,0.004,0,0.006-0.001,0.009c-0.012,0.002-0.024,0.006-0.037,0.009c-0.002-0.001-0.005-0.003-0.009-0.005l-0.055-0.033
	c-0.024-0.017-0.067-0.017-0.093,0L10.6,22.727c-0.026,0.016-0.026,0.039,0,0.056l0.054,0.032c0.003,0.002,0.006,0.004,0.007,0.006
	c-0.006,0.008-0.01,0.015-0.014,0.021c-0.004,0.001-0.008,0.001-0.012,0.001h-0.078c-0.036,0-0.066,0.018-0.066,0.04v0.079
	c0,0.021,0.03,0.039,0.066,0.039h0.078c0.004,0,0.008,0,0.012,0c0.004,0.008,0.009,0.016,0.014,0.021
	c-0.001,0.002-0.004,0.004-0.007,0.006L10.6,23.061c-0.026,0.017-0.026,0.041,0,0.057l0.093,0.057c0.026,0.016,0.069,0.016,0.093,0
	l0.055-0.033c0.003,0,0.006-0.002,0.009-0.004c0.013,0.004,0.024,0.006,0.037,0.01c0.001,0.002,0.001,0.004,0.001,0.006v0.047
	c0,0.021,0.031,0.041,0.067,0.041h0.132C11.123,23.238,11.153,23.221,11.153,23.197z M10.822,22.921
	c0-0.065,0.088-0.118,0.199-0.118c0.109,0,0.198,0.053,0.198,0.118s-0.089,0.119-0.198,0.119
	C10.91,23.04,10.822,22.986,10.822,22.921z">
                </path>
                <path fill="#202020" d="M8.035,0.278C8.46,0.204,8.892,0.284,9.304,0.394c1.042,0.295,1.982,0.855,2.879,1.448
	c1.724-0.475,3.54-0.593,5.317-0.412c0.621,0.067,1.24,0.171,1.848,0.326c0.779-0.51,1.594-0.984,2.48-1.28
	c0.492-0.158,1.018-0.283,1.537-0.198c0.469,1.174,0.621,2.505,0.256,3.729c0.508,0.511,0.936,1.106,1.23,1.765
	c0.369,0.814,0.53,1.713,0.522,2.605c-0.006,1.092-0.062,2.198-0.349,3.258c2.33-0.089,4.681,0.015,6.974,0.465
	c-0.006,0.03-0.019,0.09-0.022,0.12c-2.297-0.45-4.65-0.553-6.986-0.46c-0.061,0.192-0.124,0.382-0.199,0.569
	c2.412,0.08,4.828,0.365,7.156,1.014c-0.008,0.029-0.024,0.087-0.032,0.117c-2.335-0.646-4.758-0.934-7.177-1.009
	c-0.242,0.548-0.581,1.056-1.014,1.472c-0.605,0.588-1.367,0.992-2.158,1.269c-0.961,0.333-1.969,0.512-2.979,0.606
	c-1.104,0.047-2.209,0.043-3.315,0.041c-0.44-0.007-0.881-0.004-1.321-0.032c-0.258-0.041-0.521,0.004-0.778-0.039
	c-1.371-0.174-2.754-0.494-3.957-1.199c-0.862-0.501-1.59-1.233-2.059-2.115c-2.383,0.082-4.771,0.368-7.072,1.006
	c-0.008-0.029-0.024-0.088-0.032-0.117c2.291-0.639,4.667-0.924,7.041-1.01C7,12.141,6.916,11.948,6.839,11.751
	c-2.279-0.081-4.575,0.028-6.816,0.467c-0.005-0.03-0.017-0.09-0.022-0.12c2.233-0.439,4.521-0.548,6.792-0.472
	c-0.296-0.852-0.43-1.753-0.467-2.652C6.295,8.331,6.3,7.679,6.435,7.046c0.205-1.038,0.72-2.003,1.438-2.777
	C7.39,2.984,7.533,1.534,8.035,0.278 M10.606,7.814c-0.5,0.221-0.888,0.627-1.212,1.056c-0.369,0.506-0.637,1.117-0.628,1.752
	c-0.021,0.89,0.152,1.821,0.672,2.561c0.446,0.644,1.131,1.085,1.857,1.353c1.024,0.38,2.123,0.499,3.207,0.557
	c1.026,0.048,2.055,0.036,3.081,0.012c1.036-0.039,2.09-0.111,3.076-0.453c0.672-0.231,1.303-0.637,1.711-1.229
	c0.479-0.684,0.653-1.532,0.69-2.354c0-0.171,0.032-0.346-0.006-0.516c0.014-0.561-0.229-1.1-0.531-1.561
	c-0.369-0.522-0.834-1.018-1.446-1.245c-0.675-0.256-1.41-0.263-2.121-0.229c-0.517,0.001-1.029,0.066-1.543,0.089
	c-1.011,0.078-2.028,0.074-3.037,0c-0.741-0.047-1.481-0.117-2.225-0.092C11.625,7.519,11.09,7.6,10.606,7.814z">
                </path>
                <path fill="#202020" d="M5.689,15.222c0.281-0.113,0.597-0.088,0.885-0.022c0.561,0.138,1.05,0.49,1.416,0.93
	c0.227,0.265,0.375,0.587,0.598,0.854c0.385,0.49,0.934,0.859,1.552,0.971c0.687,0.132,1.391-0.033,2.024-0.305
	c-0.023,0.082-0.042,0.164-0.057,0.248c-0.125,0.006-0.301,0.035-0.317,0.189c-0.003,0.146,0.168,0.163,0.275,0.186
	c-0.021,0.371-0.023,0.744,0.025,1.11c-0.826,0.159-1.701,0.222-2.513-0.046c-0.674-0.215-1.256-0.674-1.656-1.254
	c-0.332-0.475-0.552-1.023-0.932-1.466c-0.237-0.284-0.541-0.507-0.872-0.668c-0.211-0.115-0.45-0.228-0.571-0.447
	C5.481,15.386,5.578,15.261,5.689,15.222 M6.766,15.525c-0.169,0.155,0.227,0.372,0.293,0.164
	C7.059,15.552,6.881,15.466,6.766,15.525 M7.334,15.876c-0.246,0.104,0.092,0.482,0.259,0.308
	C7.671,16.032,7.49,15.852,7.334,15.876 M7.836,16.465c-0.202,0.146,0.064,0.54,0.278,0.406C8.254,16.705,8.042,16.392,7.836,16.465
	 M8.358,17.204c-0.143,0.192,0.146,0.511,0.352,0.387C8.879,17.4,8.563,17.055,8.358,17.204 M9.042,17.855
	c-0.19,0.231,0.316,0.52,0.439,0.259C9.517,17.9,9.211,17.736,9.042,17.855 M9.972,18.136c-0.092,0.031-0.136,0.155-0.066,0.23
	c0.113,0.144,0.415,0.172,0.483-0.026C10.391,18.143,10.126,18.066,9.972,18.136 M10.974,18.157
	c-0.072,0.028-0.142,0.103-0.121,0.187c0.079,0.217,0.499,0.199,0.52-0.044C11.336,18.131,11.111,18.098,10.974,18.157z">
                </path>
                <path fill="#202020" d="M12.795,16.384c0.558-0.21,1.157-0.26,1.747-0.292c0.77-0.038,1.542-0.049,2.312-0.025
	c0.767,0.039,1.595,0.158,2.191,0.685c0.325,0.271,0.514,0.656,0.725,1.014c0.047,0.232,0.054,0.474,0.061,0.709
	c0.002,1.026,0,2.053,0.002,3.077c0.02,0.416-0.062,0.851,0.096,1.248c0.129,0.351,0.375,0.668,0.719,0.826
	c0.15,0.065,0.308,0.161,0.355,0.327c0.027,0.083-0.027,0.162-0.072,0.227c-0.098,0.045-0.201,0.082-0.31,0.08
	c-0.423,0.002-0.851-0.057-1.244-0.212c-0.308-0.125-0.593-0.321-0.782-0.598c-0.193-0.278-0.273-0.619-0.279-0.953
	c-0.006-0.377,0-0.754-0.002-1.131c0-0.608,0-1.218,0-1.824c0-0.319-0.028-0.64-0.112-0.946c-0.066-0.229-0.159-0.466-0.353-0.617
	c-0.024,1.115-0.004,2.233-0.012,3.352c0,0.659,0.004,1.318-0.002,1.979c-0.008,0.394,0.018,0.809,0.216,1.157
	c0.087,0.163,0.253,0.255,0.392,0.366c0.059,0.104,0.104,0.227,0.059,0.343c-0.032,0.097-0.123,0.15-0.207,0.196
	c-0.079,0.018-0.159,0.027-0.238,0.037c-0.455-0.062-0.896-0.242-1.259-0.526c-0.228-0.185-0.412-0.425-0.508-0.702
	c-0.082-0.225-0.095-0.466-0.093-0.701c0.006-0.734,0.001-1.471,0.003-2.205c-0.003-1.162,0.006-2.322,0.001-3.484
	c0.018-0.152-0.137-0.273-0.281-0.219c-0.117,0.027-0.121,0.164-0.12,0.26c0.004,1.148-0.001,2.299-0.001,3.447
	c0,0.705-0.001,1.412,0,2.117c0.033,0.549-0.149,1.125-0.582,1.482c-0.411,0.342-0.942,0.533-1.475,0.539l-0.02-0.009
	c-0.08-0.04-0.176-0.072-0.212-0.162c-0.064-0.14-0.007-0.294,0.064-0.418c0.14-0.123,0.323-0.199,0.423-0.362
	c0.147-0.229,0.164-0.51,0.168-0.771c0-0.781,0-1.562,0-2.344c-0.007-1.138,0.013-2.273-0.01-3.41
	c-0.361,0.267-0.413,0.76-0.456,1.172c-0.023,0.761-0.004,1.521-0.011,2.279c-0.001,0.369,0.003,0.738-0.001,1.107
	c-0.005,0.325-0.082,0.656-0.265,0.93c-0.186,0.284-0.473,0.487-0.784,0.615c-0.471,0.189-0.988,0.238-1.492,0.208
	c-0.086-0.049-0.201-0.103-0.2-0.218c-0.005-0.202,0.189-0.319,0.356-0.381c0.419-0.162,0.77-0.529,0.842-0.981
	c0.05-0.356,0.016-0.718,0.025-1.075c0.001-0.746,0-1.49,0-2.236c0.015-0.588-0.005-1.18,0.092-1.764
	c0.091-0.435,0.277-0.845,0.531-1.208L12.795,16.384z">
                </path>
                <g id="_x23_c49b86ff">
                    <path fill="#C49C87" d="M10.606,7.814C11.09,7.6,11.625,7.519,12.15,7.517c0.744-0.025,1.484,0.045,2.225,0.092
		c1.009,0.074,2.026,0.078,3.037,0c0.514-0.023,1.027-0.088,1.543-0.089c0.711-0.034,1.447-0.027,2.121,0.229
		c0.613,0.227,1.078,0.723,1.447,1.245c0.303,0.461,0.543,1,0.529,1.561c-0.074-0.27-0.138-0.545-0.26-0.8
		c-0.223-0.486-0.562-0.912-0.957-1.27c-0.554-0.517-1.339-0.668-2.074-0.677c-1.173-0.01-2.335,0.187-3.506,0.208
		c-1.002,0.028-2-0.079-2.997-0.159c-0.596-0.042-1.196-0.079-1.791-0.001c-0.486,0.062-0.974,0.219-1.359,0.53
		C9.764,8.67,9.465,9.013,9.229,9.393c-0.239,0.373-0.368,0.8-0.463,1.229C8.757,9.988,9.025,9.377,9.394,8.871
		C9.719,8.441,10.106,8.036,10.606,7.814z">
                    </path>
                </g>
                <g id="_x23_f4cab1ff">
                    <path fill="#F4CBB2" d="M11.47,7.856c0.594-0.078,1.195-0.041,1.791,0.001c0.997,0.08,1.995,0.187,2.997,0.159
		c1.172-0.021,2.333-0.218,3.506-0.208c0.735,0.008,1.521,0.16,2.074,0.677c0.395,0.358,0.735,0.784,0.957,1.27
		c0.122,0.254,0.186,0.53,0.26,0.8c0.039,0.169,0.008,0.344,0.006,0.516c-0.035,0.822-0.209,1.669-0.689,2.354
		c-0.408,0.592-1.039,0.998-1.711,1.229c-0.986,0.342-2.04,0.414-3.076,0.453c-1.025,0.024-2.054,0.036-3.081-0.012
		c-1.084-0.058-2.182-0.177-3.207-0.557c-0.726-0.268-1.411-0.709-1.857-1.353c-0.52-0.74-0.693-1.671-0.672-2.561
		c0.095-0.429,0.224-0.856,0.463-1.229c0.236-0.38,0.535-0.723,0.881-1.006C10.496,8.076,10.983,7.919,11.47,7.856 M11.736,8.825
		c-0.4,0.125-0.699,0.459-0.886,0.823c-0.295,0.588-0.357,1.28-0.222,1.921c0.106,0.483,0.337,0.964,0.741,1.267
		c0.283,0.217,0.671,0.299,1.011,0.183c0.409-0.136,0.707-0.488,0.89-0.866c0.285-0.603,0.336-1.305,0.181-1.95
		c-0.114-0.459-0.345-0.911-0.733-1.197C12.442,8.799,12.069,8.719,11.736,8.825 M19.73,8.822c-0.41,0.123-0.715,0.466-0.902,0.838
		c-0.301,0.609-0.355,1.326-0.199,1.983c0.115,0.47,0.355,0.933,0.758,1.217c0.291,0.21,0.687,0.274,1.023,0.142
		c0.4-0.153,0.689-0.511,0.865-0.893c0.272-0.612,0.313-1.32,0.143-1.966c-0.119-0.444-0.354-0.877-0.734-1.149
		C20.414,8.797,20.055,8.723,19.73,8.822 M15.757,12.501c-0.253,0.123-0.255,0.531-0.002,0.655c0.235,0.145,0.571-0.054,0.554-0.331
		C16.319,12.554,15.99,12.362,15.757,12.501 M15.162,13.613c-0.066,0.007-0.121,0.084-0.096,0.148
		c0.094,0.304,0.366,0.54,0.675,0.604c0.438,0.104,0.929-0.172,1.059-0.605c0.038-0.107-0.114-0.201-0.194-0.12
		c-0.084,0.141-0.15,0.302-0.299,0.389c-0.304,0.217-0.777,0.11-0.951-0.222C15.303,13.734,15.278,13.594,15.162,13.613z">
                    </path>
                </g>
                <g id="_x23_ffffffff">
                    <path fill="#FFFFFF" d="M11.736,8.825c0.333-0.106,0.706-0.026,0.982,0.181c0.388,0.286,0.619,0.737,0.733,1.197
		c0.155,0.645,0.104,1.347-0.181,1.95c-0.183,0.378-0.481,0.729-0.89,0.866c-0.34,0.116-0.729,0.035-1.011-0.183
		c-0.404-0.303-0.635-0.783-0.741-1.267c-0.135-0.641-0.073-1.333,0.222-1.921C11.038,9.284,11.336,8.95,11.736,8.825 M11.954,9.56
		c-0.255,0.089-0.444,0.304-0.565,0.539c-0.197,0.388-0.238,0.845-0.153,1.268c0.064,0.305,0.203,0.605,0.44,0.813
		c0.171,0.152,0.411,0.236,0.64,0.19c0.267-0.049,0.479-0.248,0.616-0.473c0.234-0.391,0.292-0.871,0.213-1.315
		c-0.064-0.342-0.22-0.685-0.501-0.901C12.452,9.531,12.185,9.477,11.954,9.56z">
                    </path>
                    <path fill="#FFFFFF" d="M19.73,8.822c0.322-0.099,0.684-0.024,0.953,0.172c0.381,0.272,0.614,0.705,0.733,1.149
		c0.172,0.646,0.131,1.354-0.144,1.966c-0.174,0.382-0.463,0.74-0.864,0.893c-0.339,0.133-0.732,0.068-1.023-0.142
		c-0.401-0.284-0.643-0.748-0.758-1.217c-0.155-0.657-0.103-1.374,0.199-1.983C19.016,9.288,19.32,8.944,19.73,8.822 M19.654,9.557
		c-0.236,0.08-0.418,0.269-0.539,0.48c-0.197,0.348-0.26,0.764-0.213,1.158c0.039,0.339,0.166,0.678,0.406,0.926
		c0.17,0.177,0.418,0.29,0.666,0.253c0.282-0.037,0.512-0.246,0.653-0.483c0.229-0.386,0.288-0.856,0.215-1.294
		c-0.062-0.347-0.218-0.695-0.502-0.915C20.15,9.533,19.885,9.477,19.654,9.557z">
                    </path>
                    <path fill="#FFFFFF" d="M11.612,10.066c0.164-0.113,0.415,0.002,0.435,0.2c0.04,0.206-0.191,0.391-0.384,0.308
		C11.449,10.504,11.418,10.178,11.612,10.066z">
                    </path>
                    <path fill="#FFFFFF" d="M19.482,10.069c0.172-0.073,0.379,0.091,0.343,0.275c-0.019,0.186-0.261,0.286-0.405,0.168
		C19.26,10.404,19.3,10.128,19.482,10.069z">
                    </path>
                </g>
                <g id="_x23_ac5c51ff">
                    <path fill="#3C3C3B" d="M11.954,9.56c0.231-0.083,0.498-0.029,0.69,0.121c0.282,0.216,0.437,0.559,0.501,0.901
		c0.079,0.444,0.021,0.925-0.213,1.315c-0.137,0.225-0.35,0.424-0.616,0.473c-0.229,0.046-0.469-0.038-0.64-0.19
		c-0.237-0.208-0.376-0.509-0.44-0.813c-0.085-0.423-0.044-0.88,0.153-1.268C11.509,9.863,11.699,9.648,11.954,9.56 M11.612,10.066
		c-0.194,0.112-0.163,0.438,0.051,0.508c0.193,0.083,0.424-0.103,0.384-0.308C12.027,10.068,11.776,9.953,11.612,10.066z">
                    </path>
                    <path fill="#3C3C3B" d="M19.654,9.557c0.229-0.08,0.496-0.024,0.688,0.126c0.284,0.22,0.439,0.568,0.502,0.915
		c0.073,0.438,0.016,0.909-0.215,1.294c-0.143,0.237-0.371,0.446-0.654,0.483c-0.248,0.037-0.496-0.077-0.666-0.253
		c-0.24-0.248-0.365-0.587-0.406-0.926c-0.045-0.395,0.017-0.81,0.214-1.158C19.236,9.826,19.418,9.637,19.654,9.557 M19.482,10.069
		c-0.184,0.06-0.224,0.335-0.062,0.443c0.145,0.118,0.389,0.018,0.405-0.168C19.861,10.16,19.654,9.996,19.482,10.069z">
                    </path>
                    <path fill="#3C3C3B" d="M15.757,12.501c0.232-0.14,0.562,0.053,0.552,0.325c0.017,0.276-0.319,0.475-0.554,0.331
		C15.502,13.032,15.504,12.625,15.757,12.501z">
                    </path>
                    <path fill="#3C3C3B" d="M15.162,13.613c0.116-0.019,0.141,0.122,0.193,0.195c0.174,0.332,0.647,0.439,0.951,0.222
		c0.149-0.086,0.215-0.248,0.299-0.389c0.08-0.082,0.232,0.012,0.194,0.12c-0.13,0.433-0.62,0.708-1.059,0.605
		c-0.31-0.064-0.581-0.301-0.675-0.604C15.042,13.697,15.096,13.62,15.162,13.613z">
                    </path>
                </g>
                <path fill="#FFFFFF" d="M6.766,15.525c0.115-0.059,0.293,0.027,0.293,0.164C6.993,15.896,6.597,15.68,6.766,15.525z"></path>
                <path fill="#FFFFFF" d="M7.334,15.876c0.156-0.024,0.337,0.156,0.259,0.308C7.426,16.358,7.088,15.98,7.334,15.876z"></path>
                <path fill="#E9437F" d="M5.614,16.766c0.083-0.299,0.171-0.596,0.255-0.894c0.084,0.296,0.172,0.592,0.254,0.889
	c0.03,0.113,0.03,0.249-0.045,0.345c-0.084,0.097-0.242,0.121-0.348,0.047C5.601,17.074,5.574,16.898,5.614,16.766z">
                </path>
                <path fill="#FFFFFF" d="M7.836,16.465c0.206-0.073,0.418,0.24,0.278,0.406C7.901,17.005,7.634,16.611,7.836,16.465z"></path>
                <path fill="#FFFFFF" d="M8.358,17.204c0.205-0.149,0.521,0.196,0.352,0.387C8.504,17.715,8.216,17.396,8.358,17.204z"></path>
                <path fill="#FFFFFF" d="M9.042,17.855c0.169-0.119,0.475,0.045,0.439,0.259C9.358,18.375,8.851,18.088,9.042,17.855z"></path>
                <path fill="#FFFFFF" d="M11.79,18.089c0.016-0.153,0.192-0.185,0.317-0.19c-0.018,0.125-0.033,0.25-0.042,0.377
	C11.958,18.252,11.786,18.234,11.79,18.089z">
                </path>
                <path fill="#FFFFFF" d="M9.972,18.136c0.154-0.069,0.418,0.007,0.417,0.204c-0.068,0.198-0.37,0.17-0.483,0.026
	C9.836,18.291,9.88,18.167,9.972,18.136z">
                </path>
                <path fill="#FFFFFF" d="M10.974,18.157c0.137-0.06,0.362-0.026,0.398,0.143c-0.021,0.243-0.441,0.261-0.52,0.044
	C10.833,18.26,10.902,18.188,10.974,18.157z">
                </path>
                <path fill="#010202" d="M12.795,16.384c0.163-0.224,0.365-0.42,0.593-0.577c0.188,0.008,0.375,0.007,0.562-0.003
	c0.44,0.027,0.881,0.025,1.321,0.032c1.105,0.002,2.209,0.007,3.315-0.041c0.652,0.446,1.091,1.188,1.184,1.969
	c-0.211-0.356-0.398-0.742-0.725-1.014c-0.597-0.527-1.425-0.646-2.191-0.685c-0.771-0.024-1.542-0.012-2.312,0.025
	C13.952,16.124,13.353,16.173,12.795,16.384z">
                </path>
                <path fill="#010202" d="M12.164,17.65c0.024-0.015,0.073-0.043,0.097-0.058c-0.098,0.583-0.078,1.175-0.092,1.765l-0.079,0.026
	c-0.049-0.366-0.046-0.739-0.025-1.11c0.009-0.125,0.024-0.25,0.042-0.375C12.122,17.814,12.141,17.732,12.164,17.65z">
                </path>
            </g>
        </svg>
    </form>
</body>
</html>
