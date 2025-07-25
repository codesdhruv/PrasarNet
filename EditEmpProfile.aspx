<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditEmpProfile.aspx.cs"
    Inherits="PrasarNet.EditEmpProfile" MasterPageFile="~/Site1.Master" %>

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
        
    </style>
    <script type='text/javascript'>
        function clearmodal() {
            $('#loginModal4').on('hide.bs.modal', function () {
                var emp = document.getElementById("txtemployee");
                var grd = document.getElementById("divgrd");
                emp.value = "";
                grd.style.display = "none";
            })
        }
        function popupfunction() {
            var popup = document.getElementById("myPopup");
            popup.classList.toggle("show");
        }
        function popupfunction2() {
            var popup = document.getElementById("myPopup2");
            popup.classList.toggle("show");
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server" class="containernew">
    <div class="row" style="background-color: White">
        <div class="col-xs-4 col-lg-4 text-center" style="padding-left: 25px; padding-top: 8px;
            padding-bottom: 5px">
            <asp:Image ID="img1" runat="server" class="img-responsive pull-left" Height="93%"
                ImageAlign="Left" ImageUrl="~/images/AIR.png" Width="100px" />
            <%--<img src="images/AIRlogo.jpg" alt="AIR LOGO" width="120px" height="107px" />--%>
        </div>
        <div class="col-xs-4 col-lg-4 text-center" style="padding-top:8px">
           <%-- <h2 style="color: Blue; font-weight: bolder">--%>
            <asp:Label ID="Label17" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="PrasarNet"></asp:Label>
              <%--  PrasarNet--%>
                <br />
                <asp:Label ID="Label18" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="(प्रसार नेट)"></asp:Label>
                <%--(प्रसार नेट)--%>
          <%--  </h2>--%>
          <br />
           <asp:Label ID="Label19" runat="server" class="fontheader1" ForeColor="Blue" Font-Bold="false" Text=" An Intranet for Prasar Bharati Employees"></asp:Label>
            <%--<h4 style="color: Blue; font-weight: normal">
                An Intranet for Prasar Bharati Employees
            </h4>--%>
        </div>
        <div class="col-xs-4 col-lg-4 text-center" style="padding-right: 25px; padding-top: 10px;
            padding-bottom: 4px">
            <asp:Image ID="Image1" runat="server" class="img-responsive pull-right" Height="105%"
                ImageAlign="Right" ImageUrl="~/images/Doordarshan.png" Width="125px" />
        </div>
    </div>
    <div class="row">
        <div id="empmenu" visible="false" runat="server" class="sticky">
            <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
            <nav class="navbar navbar-default row-no-padding"> <%--nav and nav default hav a default magin and padding--%>
          <div class="navbar-header" style="background-color:#d8cef6">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar1" style="background-color: white">
                            <span class="icon-bar" style="background-color: #000000"></span><span style="background-color: #000000" class="icon-bar"></span><span style="background-color: #000000" class="icon-bar">
                            </span>
                        </button>
                        <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
          </div>
            <%--    oiwqepiepqiep--%>
            
            <div class="collapse navbar-collapse ex3 navpriorscrolling navigation" id="myNavbar1" style='background-color: #0084ff;'>
                <ul class="nav navbar-nav">
                    <li><a href="WebForm1.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                    <%--<li><a href="OrdernCircular.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-list-alt"></span>&nbsp;Orders/Circulars</a></li>
                    <li><a href="Policies.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>--%>
                        <%-- <ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Information Technology</span></a></li>
                                         <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                </ul>--%>
                    <%--</li>--%>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                        &nbsp;Documents <span class="caret"></span></a>
                                <ul class="dropdown-menu grad3">
                                     
                                        <li><a href="OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                        <li><a href="Policies.aspx"><span style="color: #000000">Policies</span></a></li>
                                
                                </ul>
                            </li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-wrench"></span>
                        &nbsp;Trainings <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <%-- <li><a href="#"><span style="color: #000000">Orders/Circulars</a></li>--%>
                            <li><a href="#"><span style="color: #000000">Training Materials/Videos</a></li>
                        </ul>
                    </li>
                    <%--  <li><a href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-tasks"></span>
                                &nbsp;Rosters</a></li>--%>
                    <li><a href="#" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                    <%-- <li><a href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                    <%--<li><a href="#" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-globe"></span>&nbsp;Forum</a></li>--%>
                   <%-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-certificate">
                        </span>&nbsp;Welfare<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                            <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                            <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                            <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                        </ul>
                    </li>--%>
                    <li><a href="utilityDownload.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>
                        &nbsp;Miscellaneous<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                        &nbsp;My Account <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <%--<li><a href="#"><span style="color: #000000">My Profile</span></a></li>--%>
                            <li><a href="ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                            <li><a href="Logout.aspx" id="lgout" runat="server">LogOut</a></li>
                           <%-- <li><a href="#" runat="server" onserverclick="logout_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                        </ul>
                    </li>
                </ul>
            </div>
            </nav>
        </div>
        <div id="StationSectionMenu" visible="false" runat="server" class="sticky">
            <nav class="navbar navbar-default">
          <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
          <div class="navbar-header" style="background-color:#CED8F6">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar2">
                            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                            </span>
                        </button>
                        <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                    </div>
            <%--  <li><a href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-tasks"></span>
                                &nbsp;Rosters</a></li>--%>
            <div class="collapse navbar-collapse ex3 navpriorscrolling navigation" id="myNavbar2" style='background-color: #0084ff;'>
                <ul class="nav navbar-nav">
                    <li><a href="WebForm1.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                   <%-- <li><a href="OrdernCircular.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-list-alt"></span>&nbsp;Orders/Circulars</a></li>
                    <li><a href="Policies.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>--%><%--<ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Information Technology</span></a></li>
                                         <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                </ul>--%><%--</li>--%>
                                  
                               <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                        &nbsp;Documents <span class="caret"></span></a>
                                <ul class="dropdown-menu grad3">
                                     
                                        <li><a href="OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                        <li><a href="Policies.aspx"><span style="color: #000000">Policies</span></a></li>
                                
                                </ul>
                            </li>
                         
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-wrench"></span>
                        &nbsp;Trainings <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                            <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                        </ul>
                    </li>
                    <%-- <li><a href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                    <li><a href="#" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                 <%--   <li><a href="#" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-globe"></span>&nbsp;Forum</a></li>--%>
                    <%--<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-certificate">
                        </span>&nbsp;Welfares<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <ul class="nav nav-list">
                                <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                            </ul>
                        </ul>--%>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>
                        &nbsp;Miscellaneous<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <ul class="nav nav-list">
                                <li><a href="#"><span style="color: #000000">Staff</span></a></li>
                                <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>
                            </ul>
                        </ul>
                    </li>
                    <li><a href="utilityDownload.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>
                        &nbsp;Upload <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                            <%--<li><a href="#"><span style="color: #000000">Policies</span></a></li>--%>
                            <%--<li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                            <li><a href="PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>
                        </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                        &nbsp;My Account <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <%--<li><a href="#"><span style="color: #000000">My Profile</span></a></li>--%>
                            <li><a href="ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                             <li><a href="Logout.aspx" id="A1" runat="server">LogOut</a></li>
                             <%--<li><a href="#" runat="server" onserverclick="logoutstn_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                           
                        </ul>
            </div>
            </nav>
        </div>
        <div id="AdminMenu" visible="false" runat="server" class="sticky">
            <nav class="navbar navbar-default">
          <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
          <div class="navbar-header" style="background-color:#CED8F6">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar3">
                            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                            </span>
                        </button>
                        <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                    </div>
            <%--    oiwqepiepqiep--%>
            <div class="collapse navbar-collapse ex3 navpriorscrolling navigation" id="myNavbar3" style='background-color: #0084ff;'>
                <ul class="nav navbar-nav">
                    <li><a href="WebForm1.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                    <%--<li><a href="OrdernCircular.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-list-alt"></span>&nbsp;Orders/Circulars</a></li>
                    <li><a href="Policies.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>--%>
                        <%--<ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                       <li><a href="#"><span style="color: #000000">Information Technology</span></a></li>
                                         <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                </ul>--%>
                    <%--</li>--%>
                      
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                        &nbsp;Documents <span class="caret"></span></a>
                                <ul class="dropdown-menu grad3">
                                     
                                        <li><a href="OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                        <li><a href="Policies.aspx"><span style="color: #000000">Policies</span></a></li>
                                
                                </ul>
                            </li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-wrench"></span>
                        &nbsp;Trainings <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                            <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                        </ul>
                    </li>
                    <%-- <li><a href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                    <li><a href="#" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                    <%-- <li><a href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                   <%-- <li><a href="#" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-globe"></span>&nbsp;Forum</a></li>--%>
                   <%-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-certificate">
                        </span>&nbsp;Welfares<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <ul class="nav nav-list">
                                <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                            </ul>
                        </ul>
                    </li>--%>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>
                        &nbsp;Miscellaneous<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <ul class="nav nav-list">
                                <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                      <%--          <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>--%>
                            </ul>
                        </ul>
                    </li>
                    <li><a href="utilityDownload.aspx" style="color: #f1f1f1; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>
                        &nbsp;Upload <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                            <%--<li><a href="#"><span style="color: #000000">Policies</span></a></li>--%>
                            <%-- <li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                            <li><a href="PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>
                            <%--<li><a href="AdminCalender.aspx"><span style="color: #000000">Calender</span></a></li>   --%>
                        </ul>
                    </li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: #f1f1f1;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                        &nbsp;My Account <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                           <%-- <li><a href="#"><span style="color: #000000">My Profile</span></a></li>--%>
                            <li><a href="ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                             <li><a href="Logout.aspx" id="A2" runat="server">LogOut</a></li>
                          <%--  <li><a href="#" runat="server" onserverclick="logoutadmin_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                        </ul>
            </div>
            </nav>
        </div>
        <div id="AdminMenuIT" visible="false" runat="server" class="sticky">
            <nav class="navbar navbar-default">
          <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
          <div class="navbar-header" style="background-color:#CED8F6">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                            </span>
                        </button>
                        <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                    </div>
               
                                 
                    <div class="collapse navbar-collapse ex3 navpriorscrolling navigation" id="myNavbar" style='background-color:#0084ff;'>
          <ul class="nav navbar-nav">
                            <li><a href="WebForm1.aspx" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-dashboard">
                            </span>&nbsp;DashBoard</a></li>
                           <%-- <li><a href="OrdernCircular.aspx" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Orders/Circulars</a></li>
                         
                         
                                                   
                          <li><a href="Policies.aspx" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a> --%>  <%-- <ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Employee HandBook</span></a></li>
                                </ul>--%>
                         <%--</li>--%>
                             <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black;
                                font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                                &nbsp;Documents <span class="caret"></span></a>
                                <ul class="dropdown-menu grad3">
                                        <li><a href="OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                        <li><a href="Policies.aspx"><span style="color: #000000">Policies</span></a></li>
                                </ul>
                            </li>
                         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Trainings <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                                        <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                                </ul>
                            </li>
                             <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                         <li><a href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-calendar">
                            </span>&nbsp;Events and Awards</a></li>
                            <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
      <%--<li><a href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-globe"></span> &nbsp;Forum</a></li>--%>
      
         <%-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-certificate"></span>&nbsp;Welfares<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <ul class="nav nav-list">
                                        <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                                    </ul>
                                </ul>
                            </li>--%>

                             <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-cog"></span>&nbsp;Miscellaneous<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <ul class="nav nav-list">                                    
                                        <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                    <%--    <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>   --%>                                
                                    </ul>
                                </ul>
                            </li> 
                              <li><a href="utilityDownload.aspx" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-download-alt"></span>
                                &nbsp;Downloads</a></li>
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-upload"></span>&nbsp;Upload <span class="caret"></span></a>
                                <ul class="dropdown-menu">
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
                         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:#f1f1f1; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-user"></span>&nbsp;My Account <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                      <%-- <li><a href="#"><span style="color: #000000">My Profile</span></a></li>--%>
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
    <!-- /container -->
</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="content" style="background-color: #F2F3F4">
        <div class="row container-fluid" style="padding: 10px 0px 0px 20px">
            <%--<div class="row" style="padding-top: 15px">--%>
            <div runat="server" align="center" class="col-lg-12 col-md-12 sm-12 xs-12" 
                style="padding: 0px 0px 0px 0px; font-size: medium; text-decoration: underline; color: #800000;">
                <strong>Update/ Edit Profile
                <br />
                </strong>
            </div>
        </div>
        <div class="row container-fluid" style="padding: 10px 0px 0px 20px">
            <%--<div class="row" style="padding-top: 15px">--%>
            <div class="col-lg-4 col-md-4 sm-4 xs-4" style="padding: 0px 0px 0px 0px;">
            </div>
            <div class="col-lg-4 col-md-4 sm-4 xs-4" style="padding: 0px 0px 0px 0px;">
                <div class="table-responsive">
                    <table class="table">
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label1" runat="server" Text="First Name" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtfirstname" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label2" runat="server" Text="Middle Name" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtmiddlenme" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label3" runat="server" Text="Last Name" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtlastnme" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label4" runat="server" Text="Email-Id" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label5" runat="server" Text="Contact No" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtcontact" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label6" runat="server" Text="Gender" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="ddlgender" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label7" runat="server" Text="Date Of Birth" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtdob" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" />
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label8" runat="server" Text="Date Of Joining" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtdoj" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" />
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label9" runat="server" Text="Category" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="ddlcategory" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label10" runat="server" Text="Employee Type" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="ddlemptype" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label11" runat="server" Text="Present Pay Scale" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="ddlpayscale" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label12" runat="server" Text="Date Of Joining at Present Place" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtDOJpresentPlace" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" />
                            </td>
                        </tr>
                         <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label13" runat="server" Text="Is Disability" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="ddldisability" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label14" runat="server" Text="Ex-Serviceman" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:DropDownList ID="ddlexservice" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label15" runat="server" Text="Adhaar No" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtadhaar" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr bgcolor="#D7DBDD">
                            <td align="center">
                                <asp:Label ID="Label16" runat="server" Text="PRAN No" Style="font-weight: 700"></asp:Label>
                            </td>
                            <td align="center">
                                <asp:TextBox ID="txtpran" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 sm-4 xs-4" style="padding: 0px 0px 0px 0px;">
            </div>
            <div class="col-lg-4 col-md-4 sm-4 xs-4" style="padding: 0px 0px 0px 0px;">
            </div>
            <%--</div>--%>
        </div>
    </div>
</asp:Content>
