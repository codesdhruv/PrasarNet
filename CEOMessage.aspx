<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CEOMessage.aspx.cs" Inherits="PrasarNet.CEOMessage"
    MasterPageFile="~/Site1.Master" EnableEventValidation="false" Culture="en-GB" %>

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
        .visible-md-block {
            display: block !important;
        }

        .container1 {
            min-height: 430px;
        }

        .grad2 {
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .grad4 {
            background: radial-gradient(#CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .grad5 {
            background: linear-gradient(to right, #F5DA81, #D8D8D8);
            min-height: 100px;
        }

        .style1 {
            font-size: x-small;
            color: #FF0000;
        }

        .style2 {
            text-decoration: underline;
            color: #000000;
        }

        .style3 {
            font-size: x-small;
        }

        .auto-style1 {
            font-size: small;
            color: #FF0000;
        }

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
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
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
    <div id="Div2" class="row gradhead" runat="server" style="margin: auto">
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
    <div class="row" style="margin: auto;">

        <div id="AdminMenu" visible="true" runat="server" class="sticky">
            <nav class="navbar navbar-default  row-no-padding">
                <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar3">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                </div>
                <%--    oiwqepiepqiep--%>
                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar3">
                    <ul class="nav navbar-nav">
                        <li><a href="DashBoardNew.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                        <%-- <li><a href="OrdernCircular.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-list-alt"></span>&nbsp;Orders/Circulars</a></li>
                    <li><a href="Policies.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>--%>
                        <%--<ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                       <li><a href="#"><span style="color: #000000">Information Technology</span></a></li>
                                         <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                </ul>--%>
                        <%-- </li>--%>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                            &nbsp;Documents <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">

                                <li><a href="OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                <li><a href="Policies.aspx"><span style="color: #000000">Policies</span></a></li>

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
                        <%-- <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                        <%--  <li><a href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-globe"></span>&nbsp;Forum</a></li>--%>
                        <%--<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black;
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
                                    <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                    <li id="divmeetingrecordadmin" runat="server" visible="false"><a href="PBB_reports.aspx"><span style="color: #000000">Meeting Records</span></a></li>

                                    <%-- <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>--%>
                                </ul>
                            </ul>
                        </li>
                        <li><a href="utilityDownload.aspx" style="color: black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                        <li id="divuploadadmin" runat="server" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>
                            &nbsp;Upload <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="DocumentUpload.aspx"><span style="color: #000000">Order/Circulars</span></a></li>
                                <%--<li><a href="#"><span style="color: #000000">Policies</span></a></li>--%>
                                <%-- <li><a href="#"><span style="color: #000000">Training Material</span></a></li>--%>
                                <li><a href="PhotogalleryUpload.aspx"><span style="color: #000000">Photos</span></a></li>
                                <%--<li><a href="AdminCalender.aspx"><span style="color: #000000">Calender</span></a></li>   --%>
                            </ul>
                        </li>
                        <li runat="server" id="divstatementsmanagement" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-book"></span>
                            &nbsp;Statements <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li id="divRRReports_UM" runat="server" visible="false"><a href="R_Roster/RR_Reports.aspx"><span style="color: #000000">Reservation Roster</span></a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <%-- <li><a href="#"><span style="color: #000000">My Profile</span></a></li>--%>
                                <li><a href="ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="Logout.aspx" id="A2" runat="server">LogOut</a></li>
                                <%--  <li><a href="#" runat="server" onserverclick="logoutadmin_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="containerh gradbody">
        <div class="row" style="padding: 10px 0px 10px 0px; margin: auto">
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 35px;">
                <asp:Label ID="Label16" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label17" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
            </div>
        </div>
        <div class="row" style="margin: auto;">
            <div id="Div1" runat="server" align="right" style="padding-right: 30px; padding-bottom: 15px; margin: auto">
                <asp:LinkButton ID="btnback" Style="background-color: #99FFCC" runat="server" CssClass="btn grad4"
                    CausesValidation="False" OnClick="btnback_Click">
                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-chevron-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>
            <div align="center" class=" col-md-2 col-sm-2 col-lg-2" runat="server" id="divyear">
            </div>
            <div align="center" class="col-md-8 col-sm-8 col-lg-8" runat="server" id="div3">
                <div class="table-responsive">
                    <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 4px; padding-bottom: 4px">
                        <asp:Label ID="Label4" runat="server" Text="Add New Message" Style="font-weight: bold; color: Black;"
                            class="font2"></asp:Label>
                        &nbsp;
                    </div>
                    <table class="table table-bordered grad2">
                        <tr>
                            <td align="right" style="padding-right: 30px;">
                                <asp:Label ID="lblmsg" runat="server" Text="Message" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px">
                                <asp:TextBox ID="txtmsg" class="select widthofboxes" Height="170px" runat="server" Width="92%"
                                    TextMode="MultiLine" Font-Size="Medium">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvtitle" runat="server" ErrorMessage="Message Required!!"
                                    class="font" ControlToValidate="txtmsg" ForeColor="Red" SetFocusOnError="True"
                                    Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revtitle" runat="server" ErrorMessage="Message can not exceed the 500 Letters!!"
                                    Style="color: #FF0000" ControlToValidate="txtmsg" ValidationExpression="^[\s\S\d]{1,500}$"
                                    class="font2" Display="Dynamic" SetFocusOnError="True">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="40%" style="padding-right: 30px">
                                <asp:Label ID="lblfile" runat="server" Text="Attach a File" ForeColor="Black" class="font2"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" width="60%" style="padding-left: 10px">
                                <asp:FileUpload ID="FileUpload1" runat="server" class="select widthofboxes1" Height="28px" Font-Size="Medium" Font-Bold="true" />
                                <strong><span class="auto-style1">*Attaching a File is not mandatory.</span><span class="style1">
                                    <br />
                                </span><span class="auto-style1">** Only PDF files can be uploaded.</span></strong></td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 10px">
                                <asp:Button ID="btnadd" runat="server" Text="Add" class="btn select" Width="135px"
                                    Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnupload_Click" />
                            </td>
                            <td align="left" style="padding-left: 10px">
                                <asp:Button ID="btncncl" runat="server" Text="Cancel" class="btn select gradbody" Width="135px"
                                    Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div align="center" class=" col-md-2 col-sm-2 col-lg-2" runat="server" id="div4">
            </div>
        </div>
        <div id="divgrd" runat="server" visible="true" class="row" width="500px" style="margin: auto">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div5">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-xs-12 col-lg-10" runat="server"
                id="div6" style="padding-left: 30px; padding-right: 25px;">
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="color: Black; font-weight: 700" class="font2">:: Message List ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <div style="text-align: center">
                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn gradbody" CausesValidation="False"
                                OnClick="btnprint1_Click">
                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                            <br />
                            <br />
                            <strong><span class="style1">* </span><span class="style3"><span class="style2">After Adding a message, If you want that message should&nbsp; be shown on 
                            Dashboard (to all the users) , then click on the Edit button (inside a 
                            Edit/Delete column) against that message (in a same row of table shown below) 
                            and then check/click on the box inside a show on dashboard column and then 
                            update.</span></span></strong><br />
                            <br />
                        </div>
                        <asp:GridView ID="grdmsg" runat="server" DataKeyNames="msgid" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="40" EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True"
                            Width="90%" RowStyle-Wrap="true" OnRowCommand="grdmsg_RowCommand" OnRowDataBound="grdmsg_RowDataBound"
                            OnRowEditing="grdmsg_RowEditing" OnPageIndexChanging="grdmsg_PageIndexChanging"
                            ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px">
                            <alternatingrowstyle backcolor="White" />
                            <columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Messages" ItemStyle-Width="65%">
                                    <itemtemplate>
                                        <div style="padding: 10px">
                                            <asp:LinkButton ID="lnkmsg" runat="server" ForeColor="Blue" CommandName="Download" Font-Underline="false"
                                                class="font2" Text='<%#Eval("ceomessage") %>' Font-Bold="True" CausesValidation="False" />
                                            <br />
                                            <asp:Label ID="Label2" runat="server" Text="Uploaded-On" Font-Size="X-Small" ForeColor="Black" />
                                            <asp:Label ID="Label5" runat="server" Text=" : " Font-Size="X-Small" ForeColor="Black" />
                                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("createdon") %>' Font-Size="X-Small"
                                                ForeColor="Black" />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="Edited On" Font-Size="X-Small" ForeColor="Black" />
                                            <asp:Label ID="Label6" runat="server" Text=" : " Font-Size="X-Small" ForeColor="Black" />
                                            <asp:Label ID="Label7" runat="server" Text='<%#Eval("lastUpdatedon") %>' Font-Size="X-Small"
                                                ForeColor="Black" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Show On Dashboard" ItemStyle-Width="15%">
                                    <%--   <EditItemTemplate>
                                            <asp:CheckBox ID="chkverify" runat="server" 
                                                Checked='<%# Bind("showondashboard") %>' Font-Bold="True" Font-Size="XX-Small" 
                                                ForeColor="Black" Text="  Checked to Display Msg." Visible="False" />
                                        </EditItemTemplate>--%>
                                    <itemtemplate>
                                        <asp:CheckBox ID="chkverify1" runat="server" Text="Checked to Display Msg." Font-Size="XX-Small"
                                            Font-Bold="True" ForeColor="Black" Visible="False" Checked='<%# Bind("showondashboard") %>' />
                                        <%-- <asp:DropDownList ID="ddlshow" runat="server" CssClass="select" Visible="false">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="0">No</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        <asp:Label ID="lblshwmsg" runat="server" Visible="true" Text='<%#Eval("showonmsg") %>'></asp:Label>
                                        <itemstyle horizontalalign="Center"></itemstyle>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit/Delete" ItemStyle-Width="15%">
                                    <itemtemplate>
                                        <asp:LinkButton ID="lnkedit" CommandName="msgEdit" runat="server" CausesValidation="false"
                                            CssClass="btn btn-primary" ToolTip="Edit">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkdelete" CommandName="msgDelete" runat="server" CausesValidation="false"
                                            CssClass="btn btn-danger" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete?');">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-trash"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkupdate" Visible="false" CommandName="msgUpdate" runat="server"
                                            CausesValidation="false" CssClass="btn btn-success" ToolTip="Update" OnClientClick="return confirm('Are you sure to Update?');">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-ok-circle"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkcancel" Visible="false" CommandName="msgcancel" runat="server"
                                            CausesValidation="false" CssClass="btn btn-warning" ToolTip="Cancel">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-remove-circle"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                            </columns>
                            <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                wrap="True"></headerstyle>
                            <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                verticalalign="Middle" />
                            <pagersettings position="TopAndBottom" />
                            <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                borderwidth="2" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div7">
            </div>
        </div>

    </div>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
