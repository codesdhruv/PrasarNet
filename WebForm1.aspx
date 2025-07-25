<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PrasarNet.WebForm1"
    MasterPageFile="~/Site1.Master" %>

<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">--%>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        body
        {
            padding-top: 70px;
        }
        
        /* responsive text queries */
        @media screen and (max-width: 992px)
        {
        
            #headericon
            {
            }
            legend /*panel header text*/
            {
                font-size: 15px;
                font-weight: bold;
            }
        
            .linkbutton
            {
                font-size: 12.5px;
            }
            p
            {
                font-size: 12.5px;
            }
            h1
            {
                font-size: 24px;
            }
            h2
            {
                font-size: 22px;
            }
            h3
            {
                font-size: 18px;
            }
            h5
            {
                font-size: 12px;
            }
        }
        .visible-md-block
        {
            display: block !important;
        }
        @media screen and (max-width: 600px)
        {
            .divpadding
            {
                padding-top: 0px;
            }
            legend
            {
                font-size: 13px;
                font-weight: bold;
            }
            .linkbutton
            {
                font-size: 10.5px;
            }
            p
            {
                font-size: 10.5px;
            }
            h1
            {
                font-size: 18.5px;
            }
            h2
            {
                font-size: 18px;
            }
            h3
            {
                font-size: 16px;
            }
            h5
            {
                font-size: 10px;
            }
        }
        
        
        @media screen and (max-width: 256px)
        {
            .hidden-hide
            {
                display: none !important;
            }
        }
        .scrol
        {
            background-color: lightblue;
            width: 100%;
            overflow-y: auto;
        }
        .container1
        {
            min-height: 430px;
        }
        .container2
        {
            min-height: 500px;
        }
        .container3
        {
            min-height: 400px;
        }
        .containerwidth
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
    <div id="headericon" runat="server" style="padding: 50px 0px 10px 0px;" class="container-fluid">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="row" style="background-color: #FAD7A0">
                    <div class="col-xs-4 col-lg-4 text-center" style="padding-top:8px">
                       
                         <asp:Image ID="img1" runat="server" class="img-responsive pull-left" Height="100%" ImageAlign="Left"
                            ImageUrl="~/images/AIR.png" Width="100px" />
                         <%--<img src="images/AIRlogo.jpg" alt="AIR LOGO" width="120px" height="107px" />--%>
                    </div>
                    <div class="col-xs-4 col-lg-4 text-center">
                        <%-- <h2 style="color: Blue; font-weight: bolder">--%>
            <asp:Label ID="Label10" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="PrasarNet"></asp:Label>
              <%--  PrasarNet--%>
                <br />
                <asp:Label ID="Label12" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="(प्रसार नेट)"></asp:Label>
                <%--(प्रसार नेट)--%>
          <%--  </h2>--%>
          <br />
           <asp:Label ID="Label14" runat="server" class="fontheader1" ForeColor="Blue" Font-Bold="false" Text=" An Intranet for Prasar Bharati Employees"></asp:Label>
            <%--<h4 style="color: Blue; font-weight: normal">
                An Intranet for Prasar Bharati Employees
            </h4>--%>
                    </div>
                    <div class="col-xs-4 col-lg-4 text-center">
                        <asp:Image ID="Image1" runat="server" class="img-responsive pull-right" Height="100%" ImageAlign="Right"
                            ImageUrl="~/images/Doordarshan.png" Width="125px" />
                    </div>
                </div>
                <div class="row" 
                    style=" background-color:#58D68D; padding-right: 45px; padding-left: 10px;">
                <div id="Div1" runat="server" class="col-xs-10 col-lg-10 text-left text-capitalize">
                       
                         <span style="font-size: small;color:Black ;font-weight: bold">Welcome</span>
                         <asp:Label ID="lbluser" runat="server" Font-Bold="True" Font-Size="Medium" 
                                 ForeColor="Black"></asp:Label>
                    </div>
                    <div id="Div2" class="col-xs-2 col-lg-2 text-right"  runat="server">
                                                <asp:LinkButton class="linkbutton" ID="lnklogout" runat="server" 
                             ForeColor="Black" Font-Size="Small" Font-Bold="True" onclick="lnklogout_Click" 
                                                    CausesValidation="False"><span class="glyphicon glyphicon-off"></span>&nbsp;LogOut</asp:LinkButton>
                    </div>
                </div>
                <div id="empmenu" runat="server" visible="false" class="row container-fluid" style='background-color: #F8F9F9;'>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                            </span>
                        </button>
                        <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                    </div>
                    <%--    oiwqepiepqiep--%>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav">
                            <li><a href="WebForm1.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-dashboard">
                            </span>&nbsp;DashBoard</a></li>
                            <li><a href="OrdernCircular.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Orders/Circulars</a></li>
                         
                           
                            <li><a href="Policies.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>
                               <%-- <ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Information Technology</span></a></li>
                                         <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                </ul>--%>
                            </li>
                             <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Trainings <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <%-- <li><a href="#"><span style="color: #000000">Orders/Circulars</a></li>--%>
                                        <li><a href="#"><span style="color: #000000">Training Materials/Videos</a></li>
                                </ul>
                            </li>
                          <%--  <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-tasks"></span>
                                &nbsp;Rosters</a></li>--%>
                                 <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-calendar">
                            </span>&nbsp;Events and Awards</a></li>
                            <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
      <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-globe"></span> &nbsp;Forum</a></li>
   

       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-certificate"></span>&nbsp;Welfare<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                   
                                        <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                                  
                                </ul>
                            </li>

                        <li><a href="utilityDownload.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-download-alt"></span>
                                &nbsp;Downloads</a></li>
                             <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-cog"></span>&nbsp;Miscellaneous<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                                                       
                                        <li><a href="#"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>                                   
                                   
                                </ul>
                            </li>
                            <li><a href="ChangePassword.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Change Password</a></li>
                        </ul>                       
                    </div>
                </div>
<div id="StationSectionMenu" runat="server" visible="false" class="row container-fluid" style='background-color: #F8F9F9;'>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbarstation">
                            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                            </span>
                        </button>
                        <%--    oiwqepiepqiep--%>
                    </div>
                    <%--  <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-tasks"></span>
                                &nbsp;Rosters</a></li>--%>
                    <div class="collapse navbar-collapse" id="myNavbarstation">
                        <ul class="nav navbar-nav">
                            <li><a href="WebForm1.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-dashboard">
                            </span>&nbsp;DashBoard</a></li>
                            <li><a href="OrdernCircular.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Orders/Circulars</a></li>
                              
                                                 
                       <li><a href="Policies.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a><%--<ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Information Technology</span></a></li>
                                         <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                </ul>--%>
                         </li>
                         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Trainings <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                                        <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                                </ul>
                            </li>
                             <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                         <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-calendar">
                            </span>&nbsp;Events and Awards</a></li>
                             <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
      <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-globe"></span> &nbsp;Forum</a></li>
      
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-certificate"></span>&nbsp;Welfares<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <ul class="nav nav-list">
                                        <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                                    </ul>
                                </ul>
                            </li>

                         
                             <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-cog"></span>&nbsp;Miscellaneous<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <ul class="nav nav-list"> 
                                      <li><a href="#"><span style="color: #000000">Staff</span></a></li>                                    
                                        <li><a href="#"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>                                   
                                    </ul>
                                </ul>
                            </li> 
                                 <li><a href="utilityDownload.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-download-alt"></span>
                                &nbsp;Downloads</a></li>
                           <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-upload"></span>&nbsp;Upload <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                      <li><a href="DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                       <%--<li><a href="#"><span style="color: #000000">Policies</span></a></li>--%>
                                        <%--<li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                                        <li><a href="PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>                                   
                                </ul>
                         </li>
                          <li><a href="ChangePassword.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Change Password</a></li>
                             </ul>

            </div>
            </div>
           <div id="AdminMenu" runat="server" class="row container-fluid" style='background-color: #F8F9F9;'>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbarsection">
                            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                            </span>
                        </button>
                        <%--    oiwqepiepqiep--%>
                    </div>
                    <%--  <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-tasks"></span>
                                &nbsp;Rosters</a></li>--%>
                    <div class="collapse navbar-collapse" id="myNavbarsection">
                        <ul class="nav navbar-nav">
                            <li><a href="WebForm1.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-dashboard">
                            </span>&nbsp;DashBoard</a></li>
                            <li><a href="OrdernCircular.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Orders/Circulars</a></li>
                         
                         
                                                   
                         <li><a href="Policies.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>  <%--<ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                       <li><a href="#"><span style="color: #000000">Information Technology</span></a></li>
                                         <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                </ul>--%>
                         </li>
                         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Trainings <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                                        <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                                </ul>
                            </li>
                             <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                         <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-calendar">
                            </span>&nbsp;Events and Awards</a></li>
                            <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
      <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-globe"></span> &nbsp;Forum</a></li>
      
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-certificate"></span>&nbsp;Welfares<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <ul class="nav nav-list">
                                        <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                                    </ul>
                                </ul>
                            </li>

                             <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-cog"></span>&nbsp;Miscellaneous<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <ul class="nav nav-list">                                    
                                        <li><a href="#"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>                                   
                                    </ul>
                                </ul>
                            </li> 
                              <li><a href="utilityDownload.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-download-alt"></span>
                                &nbsp;Downloads</a></li>
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-upload"></span>&nbsp;Upload <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                      <li><a href="DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                       <%--<li><a href="#"><span style="color: #000000">Policies</span></a></li>--%>
                                       <%-- <li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                                        <li><a href="PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>     
                                        <%--<li><a href="AdminCalender.aspx"><span style="color: #000000">Calender</span></a></li>   --%>                                 
                                </ul>
                         </li>
                          <li><a href="ChangePassword.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Change Password</a></li>
                             </ul>
            </div>
            </div>   
            <div id="AdminMenuIT" runat="server" class="row container-fluid" style='background-color: #F8F9F9;'>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbarsection">
                            <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar">
                            </span>
                        </button>
                        <%--    oiwqepiepqiep--%>
                    </div>
                    <%--  <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-tasks"></span>
                                &nbsp;Rosters</a></li>--%>
                    <div class="collapse navbar-collapse" id="myNavbarsection">
                        <ul class="nav navbar-nav">
                            <li><a href="WebForm1.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-dashboard">
                            </span>&nbsp;DashBoard</a></li>
                            <li><a href="OrdernCircular.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Orders/Circulars</a></li>
                         
                         
                                                   
                         <li><a href="Policies.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>  <%--<ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Information Technology</span></a></li>
                                         <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                </ul>--%>
                         </li>
                         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Trainings <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                                        <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                                </ul>
                            </li>
                             <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                         <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-calendar">
                            </span>&nbsp;Events and Awards</a></li>
                            <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
      <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-globe"></span> &nbsp;Forum</a></li>
      
       <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-certificate"></span>&nbsp;Welfares<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <ul class="nav nav-list">
                                        <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                                    </ul>
                                </ul>
                            </li>

                             <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-cog"></span>&nbsp;Miscellaneous<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                     <ul class="nav nav-list">                                    
                                        <li><a href="#"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>                                   
                                    </ul>
                                </ul>
                            </li> 
                              <li><a href="utilityDownload.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-download-alt"></span>
                                &nbsp;Downloads</a></li>
                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-upload"></span>&nbsp;Upload <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                       <li><a href="DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                       <li><a href="PoliciesUpload.aspx"><span style="color: #000000">Policies</span></a></li>
                                       <li><a href="UtilityUpload.aspx"><span style="color: #000000">Utilities</span></a></li>
                                        <li><a href="TrainingMaterial.aspx"><span style="color: #000000">Training Material</span></a></li>
                                        <li><a href="PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>     
                                        <li><a href="AdminCalender.aspx"><span style="color: #000000">Calender</span></a></li>                                    
                                </ul>
                         </li>
                          <li><a href="ChangePassword.aspx" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Change Password</a></li>
                             </ul>
            </div>
            </div>
            
            </div>
        </nav>
        <%-- <script src="Scripts/jquery-3.2.1.js"></script>
        <script src="Scripts/bootstrap.js"></script>--%>
    </div>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="container-fluid" style="background-color: white; padding: 95px 0px 10px 0px;
        background-image: url('images/free_wood.jpg');">
        <div class="row col-md-10 col-lg-10">
            <div class="row">
                <div class="col-lg-12 col-md-12" style="padding: 0px 30px 0px 30px;">
                    <div class="table-responsive">
                        <table class="table">
                            <tr bgcolor="#E5E7E9">
                                <td style="border: solid 1px black; height: 10px" align="center">
                                    <div align="center" id="divmotquote" runat="server" visible="false">
                                        <asp:Label ID="Label1" runat="server" Text="Click" Style="font-weight: 700"></asp:Label>
                                        <asp:LinkButton ID="lnkhere" runat="server" OnClick="lnkhere_Click">&nbsp;Here&nbsp;</asp:LinkButton>
                                        <asp:Label ID="Label2" runat="server" Text="to Add/Edit/Change the Motivational Quote"
                                            Style="font-weight: 700"></asp:Label>
                                    </div>
                                    <asp:Label ForeColor="Blue" Font-Italic="true" ID="lblquote" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <%--<div class="col-lg-1 col-md-1">
                    <div align="center">
                        <h3 style="color: #F4F6F7; font-weight: bold">
                            Employee Profile</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <tr class="active">
                                <td>
                                    <asp:Label ID="lbln" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblname" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr class="active">
                                <td>
                                    <asp:Label ID="lblc" runat="server" Text="Contact No"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblcontact" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr class="active">
                                <td>
                                    <asp:Label ID="lble" runat="server" Text="Email-ID"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblemail" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>--%>
                <div class="col-lg-12 col-md-12" style="padding: 0px 30px 0px 30px">
                    <%--<div align="center">
                        <h3 style="color: #F4F6F7; font-weight: bold">
                            Photo Gallery</h3>
                    </div>--%>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="5000">
                        <div class="carousel-inner" align="center">
                            <%--Wrapper for slides--%>
                            <asp:Repeater ID="Rgallary" runat="server">
                                <ItemTemplate>
                                    <div class="item <%# (Container.ItemIndex == 0 ? "active" : "") %>">
                                        <asp:Image ID="Image3" runat="server" ImageUrl='<%#Eval("imagepath").ToString()%>'
                                            Width="600px" Height="300px" />
                                        <%--      <img src="<%# Eval("imagepath").ToString() %>" />--%>
                                        <div class="carousel-caption" align="center">
                                            <%--  <asp:Label ID="lblsub" runat="server" Text="Subject" Font-Bold="True" Font-Size="Medium"
                                                ForeColor="White"></asp:Label>
                                            <br />--%>
                                            <asp:Label ID="lblcaption" runat="server" Text='<%#Eval("PicDescription") %>' Font-Bold="True"
                                                Font-Size="Large" ForeColor="White"></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span><span class="sr-only">Previous</span>
                            </a><a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span><span class="sr-only">Next</span>
                            </a>
                        </div>
                        <%--  //This is used for manual navigation like for next or previous--%>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-lg-4">
                    <div align="center">
                        <h3 style="color: #F4F6F7; font-weight: bold">
                            From the Desk of CEO</h3>
                    </div>
                    <div class="table-responsive" style="padding: 0px 10px 0px 10px">
                        <table class="table">
                            <tr bgcolor="#F4ECF7">
                                <td style="border: solid 1px black; height: 170px">
                                    <div id="divceo" runat="server" visible="false" align="center">
                                        <asp:LinkButton ID="btnaddnew" Style="background-color: #F1948A" runat="server" CssClass="btn"
                                            CausesValidation="False" OnClick="btnaddnew_Click">
                                            <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-plus-sign"></span>&nbsp;
                                            <span style="font-weight: bold; color: #000000">Add New Message</span></asp:LinkButton>
                                        <br />
                                    </div>
                                    <div id="divviewdoc" runat="server" visible="false" align="center">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:LinkButton ID="lnkviewdoc" Font-Bold="true" CssClass="btn" Font-Size="Smaller"
                                                    ForeColor="Black" Style="background-color: #E59866" runat="server" ToolTip="View/Download"
                                                    OnClick="lnkviewdoc_Click"><span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-download"></span>&nbsp;View/Download</asp:LinkButton>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                        </asp:UpdateProgress>
                                    </div>
                                    <asp:Label ID="lblceomessage" runat="server" Text=""></asp:Label>
                                    <%--<asp:LinkButton ID="lnkceomsg" Style="background-color: white" runat="server" CssClass="btn"
                                            CausesValidation="False" onclick="btnaddnew_Click" Text="test">
                                            <span aria-hidden="true" style="color: Black"></span>&nbsp;
                                            </asp:LinkButton>--%>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <%--<div class="col-md-4 col-lg-4">
                    <div align="center">
                        <h3 style="color: #F4F6F7; font-weight: bold">
                            Motivational Quote</h3>
                    </div>
                    <div class="table-responsive scrol">
                        <table class="table">
                            <tr class="active">
                                <td style="border:solid 1px black;height:350px">
                                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>--%>
                <div class="col-md-4 col-lg-4">
                    <div align="center">
                        <h3 style="color: #F4F6F7; font-weight: bold">
                            From the Desk of DG:AIR</h3>
                    </div>
                    <div style="padding: 0px 10px 0px 10px">
                        <table class="table">
                            <tr bgcolor="#F4ECF7">
                                <td style="border: solid 1px black; height: 170px">
                                    <div id="divdgair" runat="server" visible="false" align="center">
                                        <asp:LinkButton ID="lnkdgair" Style="background-color: #F1948A" runat="server" CssClass="btn"
                                            CausesValidation="False" OnClick="lnkdgair_Click">
                                            <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-plus-sign"></span>&nbsp;
                                            <span style="font-weight: bold; color: #000000">Add New Message</span></asp:LinkButton>
                                        <br />
                                    </div>
                                    <div id="divviewdgair" runat="server" visible="false" align="center">
                                        <asp:LinkButton ID="lnkviewdgair" Font-Bold="true" CssClass="btn" Font-Size="Smaller"
                                            ForeColor="Black" Style="background-color: #E59866" runat="server" ToolTip="View/Download"
                                            OnClick="lnkviewdgair_Click"><span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-download"></span>&nbsp;View/Download</asp:LinkButton>
                                    </div>
                                    <asp:Label ID="lbldgair" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-4 col-lg-4">
                    <div align="center">
                        <h3 style="color: #F4F6F7; font-weight: bold">
                            From the Desk of DG:DD</h3>
                    </div>
                    <div class="table-responsive" style="padding: 0px 10px 0px 10px">
                        <table class="table">
                            <tr bgcolor="#F4ECF7">
                                <td style="border: solid 1px black; height: 170px">
                                    <div id="divdgdd" runat="server" visible="false" align="center">
                                        <asp:LinkButton ID="lnkdgdd" Style="background-color: #F1948A" runat="server" CssClass="btn"
                                            CausesValidation="False" OnClick="lnkdgdd_Click">
                                            <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-plus-sign"></span>&nbsp;
                                            <span style="font-weight: bold; color: #000000">Add New Message</span></asp:LinkButton>
                                        <br />
                                    </div>
                                    <div id="divviewdgdd" runat="server" visible="false" align="center">
                                        <asp:LinkButton ID="lnkviewdgdd" Font-Bold="true" CssClass="btn" Font-Size="Smaller"
                                            ForeColor="Black" Style="background-color: #E59866" runat="server" ToolTip="View/Download"
                                            OnClick="lnkviewdgdd_Click"><span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-download"></span>&nbsp;View/Download</asp:LinkButton>
                                    </div>
                                    <asp:Label ID="lbldgdd" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row container2 col-md-2 col-lg-2" style="margin: 20px 10px 20px 20px;
            border: medium solid #FBFCFC; padding-top: 5px; padding-bottom: 20px; background-color: #76D7C4;">
            <div class="row col-md-12 col-lg-12" align="center" style="padding: 20px" id="divapprove"
                runat="server" visible="false">
                <div align="center">
                    <h5 style="color: #922B21; font-weight: bold">
                        Approve</h5>
                </div>
                <div align="center">
                    <asp:ImageButton ID="ImageButton3" runat="server" class="img-responsive" Height="100%"
                        ImageUrl="~/images/Approve.jpg" Width="90px" OnClick="ImageButton3_Click" />
                </div>
            </div>
            <div class="row col-md-12 col-lg-12" align="center" style="padding: 20px">
                <div align="center">
                    <h5 style="color: #922B21; font-weight: bold">
                        Today Birthdays</h5>
                </div>
                <div align="center">
                    <asp:ImageButton ID="Image2" runat="server" class="img-responsive" Height="100%"
                        ImageUrl="~/images/birt3.png" Width="90px" OnClick="Image2_Click" />
                </div>
            </div>
            <div class="row col-md-12 col-lg-12">
                <div align="center">
                    <h5 style="color: #922B21; font-weight: bold">
                        Retirements</h5>
                </div>
                <div align="center">
                    <asp:ImageButton ID="ImageButton2" runat="server" class="img-responsive" Height="100%"
                        ImageUrl="~/images/ret4.jpg" Width="80px" OnClick="ImageButton2_Click" />
                </div>
            </div>
            <div class="row col-md-12 col-lg-12">
                <div align="center">
                    <h5 style="color: #922B21; font-weight: bold">
                        Prasar Bharati Calender</h5>
                </div>
                <div align="center">
                    <%-- <a href="#"><asp:Image ImageUrl="images/cal3.png" runat="server" Height="100%" Width="80px"/></a>--%>
                    <asp:ImageButton ID="ImageButton1" runat="server" class="img-responsive" Height="100%"
                        ImageUrl="~/images/cal3.png" Width="80px" OnClick="ImageButton1_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
