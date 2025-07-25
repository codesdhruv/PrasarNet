<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HOS.aspx.cs" Inherits="PrasarNet.HOS" Culture = "en-GB"
    MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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
        .groucho {
            position: relative;
            font-family: 'Sanchez', serif;
            font-size: $base-font-size;
            line-height: $base-line-height;
            footer

        {
            font-family: 'Noto Sans', sans-serif;
            font-size: 0.6em;
            font-weight: 700;
            color: darken($white, 15%);
            float: right;
            &:before

        {
            content: '\2015';
        }

        }

        &:after {
            content: '\201D';
            position: Relative;
            top: 0em;
            right: 0;
            font-size: 6em;
            font-style: italic;
            color: darken($white, 7%);
            z-index: -1;
        }

        }

        .divforwhatsnew1 {
            background-color: #ECF0F1;
            height: 400px;
            width: 100%;
            overflow-y: scroll;
            overflow-x: auto;
        }

        .profilescroll {
            overflow-y: auto;
            overflow-x: auto;
        }

        .toc {
            margin: 0;
        }

        .grad2 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient
        }

        .grad4 {
            background: radial-gradient(#CACFD2, #E67E22);
            -webkit-radial-gradient
        }

        .grad5 {
            background: linear-gradient(to right, #F5DA81, #D8D8D8);
            min-height: 100px;
        }

        .gradnew {
            background: radial-gradient(#F4ECF7, #5DADE2);
        }

        .gradnew2 {
            background: linear-gradient(to right, #F5B7B1, #E8F8F5);
        }

        .gradformessage {
            background: linear-gradient(to bottom, #FAD7A0, #EAFAF1);
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
        function MouseEvents(objRef, evt) {
            if (evt.type == "mouseover") {
                objRef.style.cursor = 'pointer';
                objRef.style.backgroundColor = "#EEEED1";
            }
            else {
                if (evt.type == "mouseout") objRef.style.backgroundColor = "#F7F7F7";
            }
        }
        function MouseEvent(objRef, evt) {
            if (evt.type == "mouseover") {
                objRef.style.cursor = 'default';
                objRef.style.backgroundColor = "#EEEED1";
            }
            else {
                if (evt.type == "mouseout") objRef.style.backgroundColor = "#F7F7F7";
            }
        }

        function submitTest() {
            Page_ClientValidate();
            if (Page_IsValid) {

                if (confirm('Are you sure to Submit??'))
                    return true;
                else
                    return false;
            }
        }
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
    </script>
    <style type="text/css">
        .style1 {
            width: 14%;
        }

        caption {
            font-weight: bold;
            font-size: medium;
            font-family: "Baskerville Old Face";
        }

        .style4 {
            color: #FF0000;
            background-color: #FFFFCC;
        }

        .style5 {
            font-size: x-large;
            font-family: "Baskerville Old Face";
        }

        .style6 {
            width: 100%;
        }

        .style9 {
            width: 140px;
            text-align: right;
        }

        .style10 {
            width: 141px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
    <div class="row gradhead" style="margin: auto;">
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
    <div id="Div2" class="row" style="margin: auto" runat="server">
        <div id="empmenu" runat="server" class="sticky">
            <nav class="navbar navbar-default row-no-padding">
                <%--nav and nav default hav a default magin and padding--%>
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar1">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                </div>
                <%--    oiwqepiepqiep--%>

                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar1">
                    <ul class="nav navbar-nav">
                        <li><a href="DashBoardNew.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                        <%--<li><a href="OrdernCircular.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-list-alt"></span>&nbsp;Orders/Circulars</a></li>
                    <li><a href="Policies.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                        <span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>--%>
                        <%-- <ul class="dropdown-menu">
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

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-wrench"></span>
                            &nbsp;Trainings <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <%-- <li><a href="#"><span style="color: #000000">Orders/Circulars</a></li>--%>
                                <li><a href="#"><span style="color: #000000">Training Materials/Videos</a></li>
                            </ul>
                        </li>
                        <%--  <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-tasks"></span>
                                &nbsp;Rosters</a></li>--%>
                        <li><a href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span
                            class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                        <%-- <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                        <%--<li><a href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span
                        class="glyphicon glyphicon-globe"></span>&nbsp;Forum</a></li>--%>
                        <%-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black;
                        font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-certificate">
                        </span>&nbsp;Welfare<span class="caret"></span></a>
                        <ul class="dropdown-menu grad3">
                            <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                            <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                            <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                            <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                        </ul>
                    </li>--%>
                        <li><a href="utilityDownload.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-download-alt"></span>&nbsp;Downloads</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>
                            &nbsp;Miscellaneous<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                <%--  <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>--%>
                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>
                            &nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="myprofile.aspx"><span style="color: #000000">My Profile</span></a></li>
                                <li><a href="ChangePassword.aspx"><span style="color: #000000">Change Password</span></a></li>
                                <li><a href="Logout.aspx" id="lgout" style="color: #000000" runat="server">LogOut</a></li>
                                <%-- <li><a href="#" runat="server" onserverclick="logout_Click"><span style="color: #000000">LogOut</span></a></li>--%>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="content gradbody containerh">
        <div class="row" style="padding: 10px 0px 0px 0px; margin: auto;">
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 35px;">
                <asp:Label ID="Label16" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label17" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
            </div>
        </div>
        <%--Grid View To Show the Employee Details--%>
        <div class="row" style="margin: auto;">
            <%--<div id="Div1" runat="server" align="right" style="padding-right: 30px; padding-bottom:15px; margin: auto">
                <asp:LinkButton ID="LinkButton1" Style="background-color: #99FFCC" runat="server" CssClass="btn grad4"
                    CausesValidation="False" OnClick="btnback_Click"> <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-chevron-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>--%>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="divyear">
            </div>
            <div align="center" class="col-md-10 col-sm-10 col-lg-10" runat="server" id="div3">
                <div id="divemp" runat="server" visible="true">
                    <div align="center">
                        <div align="right" style="padding-right: 50px; padding-top: 5px">
                            <asp:Button ID="Button1" runat="server" BackColor="#FADBD8" OnClick="Button1_Click"
                                Style="font-weight: 700; font-size: medium" Text="Home" Width="80px" />
                        </div>
                        <asp:RadioButtonList ID="rblwing" runat="server" BackColor="#FFFFCC" BorderColor="Black"
                            BorderStyle="Groove" RepeatDirection="Horizontal" AutoPostBack="True" Font-Bold="True"
                            OnSelectedIndexChanged="rblwing_SelectedIndexChanged">
                        </asp:RadioButtonList>
                        <br />
                    </div>
                    <asp:Panel ID="Panel2" runat="server" Width="95%" ScrollBars="Vertical" Visible="false">
                        <div align="center">
                            <asp:TextBox ID="txtsearch" runat="server" Height="22px" Width="200px"></asp:TextBox>
                            &nbsp; &nbsp;
                            <asp:Button ID="btnsearch" runat="server" Text=" Search " Style="font-weight: 700; font-size: medium; color: #0000FF; background-color: #CCFFFF"
                                OnClick="btnsearch_Click" />
                            &nbsp;&nbsp;&nbsp; <span class="style4">** Search a Employee By Name </span>
                            <br />
                        </div>
                        <asp:GridView ID="grddesgn" runat="server" AutoGenerateColumns="False" HeaderStyle-BackColor="#61A6F8"
                            EmptyDataText="No Records Found" Width="50%" HeaderStyle-Font-Bold="true" AllowPaging="True"
                            PageSize="15" HeaderStyle-ForeColor="White" Caption=":: List of Employees ::"
                            CellPadding="0" OnPageIndexChanging="grddesgn_PageIndexChanging" OnRowDataBound="grddesgn_RowDataBound"
                            Style="font-size: small" ShowHeaderWhenEmpty="True" OnRowUpdating="grddesgn_RowUpdating"
                            OnRowCommand="grddesgn_RowCommand" OnRowUpdated="grddesgn_RowUpdated">
                            <columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Center">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' Font-Bold="false" />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center"></itemstyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name/Designation" ItemStyle-HorizontalAlign="Center">
                                    <itemtemplate>
                                        <asp:LinkButton ID="lblempname" runat="server" Text='<%#Eval("Fullname") %>' CommandName="select"
                                            ForeColor="Blue" Font-Size="Small" Font-Bold="false" BackColor="#FFCCCC" />
                                        <br />
                                        <asp:Label ID="lbldesgn" runat="server" Text='<%#Eval("DesignationName") %>' Font-Size="Smaller"
                                            Font-Bold="false" />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center"></itemstyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Empid" ItemStyle-HorizontalAlign="Center" Visible="false">
                                    <itemtemplate>
                                        <asp:Label ID="lblempid" runat="server" Text='<%#Eval("EmployeeId") %>' ForeColor="Black" />
                                        <itemstyle horizontalalign="Center"></itemstyle>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Whether Completed?" ItemStyle-HorizontalAlign="Center">
                                    <itemtemplate>
                                        <asp:CheckBox ID="chkverify" runat="server" Text=" Completed" Checked='<%# Bind("HOS_verified")%>'
                                            Font-Bold="true" ForeColor="Black" />
                                        <asp:Label ID="lblhistoryverifydate" runat="server" Visible="false" Text='<%#Eval("dt_upd_history") %>'></asp:Label>
                                        <itemstyle horizontalalign="Center"></itemstyle>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Update" ItemStyle-HorizontalAlign="Center">
                                    <itemtemplate>
                                        <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/ATS/Images/Update2-icon.png"
                                            ToolTip="Update" Height="25px" Width="25px" OnClientClick="return confirm('Once you Updated then you will be unable to modifiy it. Are you sure to Update??')" />
                                        <asp:Label ID="lblupdate" runat="server" Visible="false" Text='<%#Eval("HOSUpdate") %>'></asp:Label>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                            </columns>
                            <headerstyle backcolor="#61A6F8" font-bold="True" forecolor="White" bordercolor="Black"
                                borderstyle="Solid" borderwidth="1px"></headerstyle>
                            <rowstyle backcolor="#F7F7F7" horizontalalign="Center" verticalalign="Middle" height="30px"
                                font-bold="True" />
                        </asp:GridView>
                    </asp:Panel>
                </div>
                <div id="divHOS" runat="server" visible="false">
                    <div id="divbackemp" runat="server" visible="false" align="right" style="padding: 5px 30px 5px 20px; text-align: right">
                        &nbsp;&nbsp;
                        <asp:Button ID="btnbackemp" runat="server" Width="80px" Text="Back" Style="font-weight: 700; background-color: #FFCC99; font-size: medium;"
                            CausesValidation="False" OnClick="btnbackemp_Click" />
                    </div>
                    <div id="divback" runat="server" align="right" style="padding: 5px 30px 5px 20px; text-align: right">
                        &nbsp;&nbsp;
                        <asp:Button ID="btnback" runat="server" Width="80px" Text="Back" Style="font-weight: 700; background-color: #FFCC99; font-size: medium;"
                            OnClick="btnback_Click" CausesValidation="False" />
                    </div>
                    <%-- <div align="left" width="80%" style="padding: 5px 100px 5px 20px">
                <table cellpadding="5" cellspacing="3">
                    <tr>
                        <td style="text-align: right">
                            <strong>Name</strong> :
                        </td>
                        <td style="text-align: left">
                            <asp:Label ID="lblempname" runat="server" Text="" Style="font-weight: 700; font-size: large"></asp:Label>
                            ,
                            <asp:Label ID="lbldesignation" runat="server" Text="" Style="font-weight: 700; font-size: large"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right">
                            <strong>Designation</strong>&nbsp;:&nbsp;
                        </td>
                        <td style="text-align: left">
                            &nbsp;</td>
                    </tr>
                </table>
            </div>--%>
                    <div id="lnkadddetails" runat="server">
                        <%--<asp:LinkButton ID="lnkadd" runat="server" Style="font-size: large; font-weight: 700"
                    OnClick="lnkadddetails_Click" CausesValidation="False"> Add Posting Details </asp:LinkButton>--%>
                        <asp:Button ID="lnkadd" runat="server" Text="Add Posting Details" OnClick="lnkadddetails_Click"
                            CausesValidation="False" Style="font-weight: 700; background-color: #CCFFFF; font-size: medium; color: #0000FF;"
                            Width="200px" />
                        <br />
                    </div>
                    <div id="entry" runat="server" visible="false" style="border: medium solid #0000FF; width: 700px;"
                        class="gradformessage">
                        <table align="center" cellpadding="3" cellspacing="3" rules="none" class="table table-hover">
                            <tr>
                                <td style="text-align: left" colspan="2">
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                        <progresstemplate>
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/images/wait.gif" />
                                        </progresstemplate>
                                    </asp:UpdateProgress>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <contenttemplate>
                                            <table class="table table-hover gradformessage">
                                                <tr>
                                                    <td align="right" style="padding-right: 30px">
                                                        <asp:Label ID="Label1" class="fontstyle font2" runat="server" Text="Organisation"></asp:Label>
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" style="padding-left: 15px">
                                                        <asp:DropDownList ID="ddlorg_add_details" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlorg_add_details_SelectedIndexChanged"
                                                            class="select widthofboxes1" Height="22px">
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlorg_add_details"
                                                            Display="Dynamic" ErrorMessage="Pl. Select The Organisation" ForeColor="Red"
                                                            SetFocusOnError="True" Style="font-size: small">
                                                        </asp:RequiredFieldValidator>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" style="padding-right: 30px">
                                                        <asp:Label ID="Label2" class="fontstyle font2" runat="server" Text="Station"></asp:Label>
                                                        &nbsp;
                                                    </td>
                                                    <td align="left" style="padding-left: 15px">
                                                        <ajaxtoolkit:combobox id="comstation" runat="server" autocompletemode="SuggestAppend"
                                                            class="select widthofboxes1" height="22px">
                                                        </ajaxtoolkit:combobox>
                                                        <asp:RequiredFieldValidator ID="rfdstn" runat="server" ControlToValidate="comstation"
                                                            EnableTheming="False" ErrorMessage="Pl. Select The Station" ForeColor="Red" InitialValue="--Select--"
                                                            SetFocusOnError="True" Style="font-size: small">
                                                        </asp:RequiredFieldValidator>
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </contenttemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>

                                <td align="right" style="padding-right: 30px">
                                    <asp:Label ID="Label3" class="fontstyle font2" runat="server" Text="Designation"></asp:Label>
                                    &nbsp;
                                   
                                </td>
                                <td align="left" style="padding-left: 15px">
                                    <asp:DropDownList ID="ddldesgn" runat="server" class="select widthofboxes1" Height="22px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddldesgn"
                                        ErrorMessage="Pl. Select The Designation" ForeColor="Red" SetFocusOnError="True"
                                        Display="Dynamic" Style="font-size: small">
                                    </asp:RequiredFieldValidator>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-right: 30px" align="right">
                                    <asp:Label ID="Label4" class="fontstyle font2" runat="server" Text="Date of Joining"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px">
                                    <asp:TextBox ID="txtfromdate" placeholder="DD-MM-YYYY" runat="server"
                                        class="select widthofboxes1" Height="22px">
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Pl. fill up the Date of Join"
                                        ControlToValidate="txtfromdate" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"
                                        Style="font-size: small">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ClientIDMode="Static"
                                        ErrorMessage="<br>Date must be in DD-MM-YYYY Format" ForeColor="Red" ValidationExpression="(^(((0[1-9]|1[0-9]|2[0-8])[-](0[1-9]|1[012]))|((29|30|31)[-](0[13578]|1[02]))|((29|30)[-](0[4,6,9]|11)))[-](19|[2-9][0-9])\d\d$)|(^29[-]02[-](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)"
                                        ControlToValidate="txtfromdate" Display="Dynamic" SetFocusOnError="True" Style="font-size: small">
                                    </asp:RegularExpressionValidator>
                                    <asp:CompareValidator ID="cValFrom" runat="server" ErrorMessage="<br>From date must not be later than today"
                                        Operator="LessThanEqual" ControlToValidate="txtfromdate" Type="Date"  Display="Dynamic"
                                        SetFocusOnError="True" Style="color: #FF0000; font-size: small">
                                    </asp:CompareValidator>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 30px">
                                    <asp:Label ID="Label5" class="fontstyle font2" runat="server" Text="Date of Relieving"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px">
                                    <asp:TextBox ID="txttodate" placeholder="DD-MM-YYYY" runat="server" class="select widthofboxes1" Height="22px"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator2" ForeColor="Red" runat="server" ControlToValidate="txttodate"
                                        ControlToCompare="txtfromdate" Display="Dynamic" Operator="GreaterThanEqual"
                                        Type="Date" ErrorMessage="DoR must be later than the DoJ" SetFocusOnError="True"
                                        Style="font-size: small">
                                    </asp:CompareValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txttodate"
                                        Display="Dynamic" ErrorMessage="<br>Date must be in DD-MM-YYYY Format" ValidationExpression="(^(((0[1-9]|1[0-9]|2[0-8])[-](0[1-9]|1[012]))|((29|30|31)[-](0[13578]|1[02]))|((29|30)[-](0[4,6,9]|11)))[-](19|[2-9][0-9])\d\d$)|(^29[-]02[-](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)"
                                        ForeColor="Red" SetFocusOnError="True" Style="font-size: small">
                                    </asp:RegularExpressionValidator>
                                    <asp:CompareValidator ID="cValTo" runat="server" ErrorMessage="<br>To date must not be later than today"
                                        Operator="LessThanEqual" ControlToValidate="txttodate" Type="Date" Display="Dynamic"
                                        SetFocusOnError="True" Style="color: #FF0000; font-size: small">
                                    </asp:CompareValidator>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 30px">
                                    <asp:Label ID="Label6" class="fontstyle font2" runat="server" Text="Remarks"></asp:Label>
                                    &nbsp;
                                </td>
                                <td align="left" style="padding-left: 15px">
                                    <asp:TextBox ID="txtrmks" runat="server" TextMode="MultiLine" Height="50px" class="select widthofboxes1"></asp:TextBox>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle" align="center" colspan="2">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnadd" runat="server" Text=" Submit " Style="font-weight: 700; font-size: medium; background-color: #FF6600; height: 29px; color: #000000;"
                                        OnClick="btnadd_Click"
                                        OnClientClick="return submitTest()" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnclose" runat="server" Text="  Close  " Style="font-weight: 700; font-size: medium; background-color: #FF6600; color: #000000;"
                                        OnClick="btnclose_Click"
                                        CausesValidation="False" />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <br />
                        <%--<asp:Label ID="lblEmployeename" runat="server" Text=""></asp:Label>--%>
                        <%--<asp:Panel ID="Panelempdetails" runat="server" Width="100%" ScrollBars="Vertical"
                    Visible="true">--%>
                        <div id="Panelempdetails" runat="server" visible="true" class="panel panel-primary">
                            <div class="panel-heading grad3">
                                <span style="color: Black; font-weight: 700" class="font2">:: Posting Details ::</span>
                            </div>
                            <div class="panel-body grad2 table-responsive">
                                <div id="divempdetprint" runat="server" style="text-align: center">
                                    <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn gradbody" CausesValidation="False"
                                        OnClick="btnprint1_Click">
                                        <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                                    <%--<asp:Button ID="btnprint" Width="80px" runat="server" Text=" Print " OnClick="btnprint_Click"
                                        Style="font-weight: 700; font-size: medium; color: #0000CC; background-color: #CCFFCC; height: 29px;"
                                        CausesValidation="False" />--%>
                                    <br />
                                </div>
                                <asp:GridView ID="grdempdetails" runat="server" AutoGenerateColumns="False" HeaderStyle-BackColor="#61A6F8"
                                    EmptyDataText="No Records Found" Width="95%" HeaderStyle-Font-Bold="true" AllowPaging="True"
                                    PageSize="15" HeaderStyle-ForeColor="White" CellPadding="0" OnPageIndexChanging="grdempdetails_PageIndexChanging"
                                    OnRowCancelingEdit="grdempdetails_RowCancelingEdit" OnRowDeleting="grdempdetails_RowDeleting"
                                    OnRowEditing="grdempdetails_RowEditing" OnRowUpdating="grdempdetails_RowUpdating"
                                    OnRowDataBound="grdempdetails_RowDataBound" Style="font-size: small">
                                    <columns>
                                        <asp:TemplateField HeaderText="S.No." ItemStyle-HorizontalAlign="Center">
                                            <itemtemplate>
                                                <asp:Label ID="lblSNo" runat="server" class="fontingrid" Text='<%#Container.DataItemIndex+1 %>' />
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center"></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Designationid" ItemStyle-HorizontalAlign="Center"
                                            Visible="false">
                                            <itemtemplate>
                                                <asp:Label ID="lbldesignid" runat="server" Text='<%#Eval("IT_DesigId") %>' ForeColor="Black"
                                                    Font-Bold="True" />
                                            </itemtemplate>
                                            <edititemtemplate>
                                                <asp:Label ID="lbldesignid1" runat="server" Text='<%#Eval("IT_DesigId") %>' ForeColor="Black"
                                                    Font-Bold="True" />
                                            </edititemtemplate>
                                            <itemstyle horizontalalign="Center"></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="orgid" ItemStyle-HorizontalAlign="Center" Visible="false">
                                            <itemtemplate>
                                                <asp:Label ID="lblorgid1" runat="server" Text='<%#Eval("OrganizationID") %>' ForeColor="Black"
                                                    Font-Bold="True" />
                                            </itemtemplate>
                                            <edititemtemplate>
                                                <asp:Label ID="lblorgid2" runat="server" Text='<%#Eval("OrganizationID") %>' ForeColor="Black"
                                                    Font-Bold="True" />
                                            </edititemtemplate>
                                            <itemstyle horizontalalign="Center"></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="stnid" ItemStyle-HorizontalAlign="Center" Visible="false">
                                            <itemtemplate>
                                                <asp:Label ID="lblstnid" runat="server" Text='<%#Eval("stationid") %>' ForeColor="Black"
                                                    Font-Bold="True" />
                                            </itemtemplate>
                                            <edititemtemplate>
                                                <asp:Label ID="lblstnid1" runat="server" Text='<%#Eval("stationid") %>' ForeColor="Black"
                                                    Font-Bold="True" />
                                            </edititemtemplate>
                                            <itemstyle horizontalalign="Center"></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Station" ItemStyle-HorizontalAlign="Center">
                                            <itemtemplate>
                                                <asp:Label ID="lblstation" runat="server" Text='<%#Eval("StationName") %>' ForeColor="Black"
                                                    class="fontingrid" Font-Bold="True" />
                                            </itemtemplate>
                                            <edititemtemplate>
                                                <table cellpadding="2" cellspacing="2">
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="ddlorg" runat="server" Height="22px" class="fontingrid widthofboxes select"
                                                                AutoPostBack="True" OnSelectedIndexChanged="ddlorg_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                            <%--<asp:RequiredFieldValidator ID="rfdstngrd" runat="server" ControlToValidate="ddlorg"
                                                    EnableTheming="False" ErrorMessage="Pl. Select The Station" ForeColor="Red" InitialValue="--Select--"
                                                    SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" ControlToValidate="ddlorg"
                                                                Display="Dynamic" ErrorMessage="Pl. Select The Station" ForeColor="Red" SetFocusOnError="True">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:DropDownList ID="ddlstation" runat="server" class="fontingrid widthofboxes select"
                                                                Height="22px">
                                                            </asp:DropDownList>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator78" runat="server" ControlToValidate="ddlstation"
                                                                Display="Dynamic" ErrorMessage="Pl. Select The Organisation" ForeColor="Red"
                                                                SetFocusOnError="True">
                                                            </asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </edititemtemplate>
                                            <itemstyle horizontalalign="Center"></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date Of Joining" ItemStyle-HorizontalAlign="Center">
                                            <itemtemplate>
                                                <asp:Label ID="lblfrom" runat="server" Text='<%#Eval("DateFrom", "{0:dd-MMM-yyyy}") %>'
                                                    class="fontingrid" ForeColor="Black" Font-Bold="True" />
                                            </itemtemplate>
                                            <edititemtemplate>
                                                <asp:TextBox ID="txtfromdategrd" class=" widthofboxes select fontingrid" Height="22px"
                                                    placeholder="DD-MM-YYYY" Text='<%#Eval("DateFrom", "{0:dd-MM-yyyy}") %>' runat="server">
                                                </asp:TextBox>
                                                <%--<ajaxToolkit:CalendarExtender ID="calfromdate1" runat="server" Format="DD/MM/YYYY"
                                        TargetControlID="txtfromdategrd" />--%>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4grd" runat="server" ErrorMessage="Pl fill up Date of Join"
                                                    ControlToValidate="txtfromdategrd" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"
                                                    Style="font-size: small">
                                                </asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2grd" runat="server"
                                                    ClientIDMode="Static" ErrorMessage="<br>Date must be in DD-MM-YYYY Format" ForeColor="Red"
                                                    ValidationExpression="(^(((0[1-9]|1[0-9]|2[0-8])[-](0[1-9]|1[012]))|((29|30|31)[-](0[13578]|1[02]))|((29|30)[-](0[4,6,9]|11)))[-](19|[2-9][0-9])\d\d$)|(^29[-]02[-](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)"
                                                    ControlToValidate="txtfromdategrd" Display="Dynamic" SetFocusOnError="True" Style="font-size: small">
                                                </asp:RegularExpressionValidator>
                                                <asp:CompareValidator ID="cValFromgrd" runat="server" ErrorMessage="<br>From date must not be later than today"
                                                    Operator="LessThanEqual" ControlToValidate="txtfromdategrd" Display="Dynamic"
                                                    Type="date" ValueToCompare='<%# DateTime.Today.ToShortDateString() %>' SetFocusOnError="True"
                                                    Style="color: #FF0000; font-size: small">
                                                </asp:CompareValidator>
                                            </edititemtemplate>
                                            <itemstyle horizontalalign="Center"></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date of Relieving" ItemStyle-HorizontalAlign="Center">
                                            <itemtemplate>
                                                <asp:Label ID="lblto" runat="server" Text='<%#Eval("DateTo", "{0:dd-MMM-yyyy}") %>'
                                                    class="fontingrid" ForeColor="Black" Font-Bold="True" />
                                            </itemtemplate>
                                            <edititemtemplate>
                                                <%-- <Ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"/>--%>
                                                <asp:TextBox ID="txttodategrd" class="fontingrid select widthofboxes" placeholder="DD-MM-YYYY"
                                                    Text='<%#Eval("DateTo", "{0:dd-MM-yyyy}") %>' runat="server">
                                                </asp:TextBox>
                                                <asp:CompareValidator ID="CompareValidator2grd2" ForeColor="Red" runat="server" ControlToValidate="txttodategrd"
                                                    ControlToCompare="txtfromdategrd" Display="Dynamic" Operator="GreaterThanEqual"
                                                    Type="Date" ErrorMessage="DoR must be later than the DoJ" SetFocusOnError="True"
                                                    Style="font-size: small">
                                                </asp:CompareValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4grd2" runat="server"
                                                    ControlToValidate="txttodategrd" Display="Dynamic" ErrorMessage="<br>Date must be in DD-MM-YYYY Format"
                                                    ValidationExpression="(^(((0[1-9]|1[0-9]|2[0-8])[-](0[1-9]|1[012]))|((29|30|31)[-](0[13578]|1[02]))|((29|30)[-](0[4,6,9]|11)))[-](19|[2-9][0-9])\d\d$)|(^29[-]02[-](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)"
                                                    ForeColor="Red" SetFocusOnError="True" Style="font-size: small">
                                                </asp:RegularExpressionValidator>
                                                <asp:CompareValidator ID="cValTo1grd" runat="server" ErrorMessage="<br>To date must not be later than today"
                                                    Operator="LessThanEqual" ControlToValidate="txttodategrd" Display="Dynamic" Type="date"
                                                    ValueToCompare='<%# DateTime.Today.ToShortDateString() %>' SetFocusOnError="True"
                                                    Style="color: #FF0000; font-size: small">
                                                </asp:CompareValidator>
                                            </edititemtemplate>
                                            <itemstyle horizontalalign="Center"></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Designation" ItemStyle-HorizontalAlign="Center">
                                            <itemtemplate>
                                                <asp:Label ID="lbldesign" runat="server" Text='<%#Eval("DesignationName") %>' ForeColor="Black"
                                                    class="fontingrid" Font-Bold="True" />
                                            </itemtemplate>
                                            <edititemtemplate>
                                                <asp:DropDownList ID="ddldesign1" class="fontingrid select widthofboxes" runat="server"
                                                    Height="22px">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddldesign1"
                                                    ErrorMessage="Pl. Select The Designation" ForeColor="Red" SetFocusOnError="True"
                                                    Display="Dynamic">
                                                </asp:RequiredFieldValidator>
                                            </edititemtemplate>
                                            <itemstyle horizontalalign="Center"></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Empid" ItemStyle-HorizontalAlign="Center" Visible="false">
                                            <itemtemplate>
                                                <asp:Label ID="lblempid" runat="server" Text='<%#Eval("EmployeeId") %>' ForeColor="Black"
                                                    Font-Bold="True" />
                                                <asp:Label ID="lblhisid" runat="server" Text='<%#Eval("HistoryServiceID") %>' ForeColor="Black"
                                                    Font-Bold="True" />
                                                <itemstyle horizontalalign="Center"></itemstyle>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks" ItemStyle-HorizontalAlign="Center">
                                            <itemtemplate>
                                                <asp:Label ID="lblrmk" runat="server" Text='<%#Eval("ATS_Remarks") %>' ForeColor="Black"
                                                    class="fontingrid" Font-Bold="True" />
                                            </itemtemplate>
                                            <edititemtemplate>
                                                <asp:TextBox ID="txtrmk" runat="server" Text='<%#Eval("ATS_Remarks") %>' TextMode="MultiLine"
                                                    Height="40px" class="fontingrid select widthofboxes">
                                                </asp:TextBox>
                                            </edititemtemplate>
                                            <itemstyle horizontalalign="Center"></itemstyle>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Edit/Delete" ItemStyle-HorizontalAlign="Center">
                                            <edititemtemplate>
                                                <asp:LinkButton ID="imgbtnUpdate" CommandName="Update" runat="server" CausesValidation="false"
                                                    CssClass="btn btn-success" ToolTip="Update" OnClientClick="return confirm('Are you sure to Update?');">
                                                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-ok-circle"></span>
                                                    <span style="font-weight: bold; color: #000000"></span>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="imgbtnCancel" CommandName="Cancel" runat="server" CausesValidation="false"
                                                    CssClass="btn btn-warning" ToolTip="Cancel">
                                                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-remove-circle"></span>
                                                    <span style="font-weight: bold; color: #000000"></span>
                                                </asp:LinkButton>
                                                <%-- <asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/images/update.jpg"
                                        ToolTip="Update" Height="20px" Width="20px" OnClientClick="return submitTest()" />
                                    &nbsp;&nbsp;
                                    <asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/ATS/Images/Cancel.png"
                                        ToolTip="Cancel" Height="20px" Width="20px" CausesValidation="false" />--%>
                                            </edititemtemplate>
                                            <itemtemplate>
                                                <asp:LinkButton ID="imgbtnEdit" CommandName="Edit" runat="server" CausesValidation="false"
                                                    CssClass="btn btn-primary" ToolTip="Edit" OnClientClick="return confirm('Are you sure to Edit?');">
                                                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                                    <span style="font-weight: bold; color: #000000"></span>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="imgbtnDelete" CommandName="Delete" runat="server" CausesValidation="false"
                                                    CssClass="btn btn-danger" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete?');">
                                                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-trash"></span>
                                                    <span style="font-weight: bold; color: #000000"></span>
                                                </asp:LinkButton>
                                                <%-- <asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="~/ATS/Images/Edit.png"
                                        ToolTip="Edit" Height="20px" Width="20px" />
                                    &nbsp;&nbsp;
                                    <asp:ImageButton ID="imgbtnDelete" CommandName="Delete"  runat="server"
                                        ImageUrl="~/ATS/Images/delete.jpg" ToolTip="Delete" Height="20px" Width="20px"
                                        OnClientClick="return confirm('Are you sure to delete?');" />--%>
                                            </itemtemplate>
                                            <itemstyle horizontalalign="Center" />
                                        </asp:TemplateField>
                                    </columns>
                                    <editrowstyle backcolor="#2461BF" />
                                    <footerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" />
                                    <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" horizontalalign="Center"
                                        cssclass="centerHeaderText fontingrid" wrap="True"></headerstyle>
                                    <pagersettings position="TopAndBottom" />
                                    <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                        horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                        borderwidth="2" />
                                    <rowstyle backcolor="#EFF3FB" />
                                    <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
                                    <sortedascendingcellstyle backcolor="#F5F7FB" />
                                    <sortedascendingheaderstyle backcolor="#6D95E1" />
                                    <sorteddescendingcellstyle backcolor="#E9EBEF" />
                                    <sorteddescendingheaderstyle backcolor="#4870BE" />
                                </asp:GridView>
                                <%-- </asp:Panel>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div1">
    </div>
    </div> </div>
</asp:Content>
