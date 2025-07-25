<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MotivationalQuote.aspx.cs"
    Inherits="PrasarNet.MotivationalQuote" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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
        <div id="AdminMenuIT" runat="server" class="sticky">
            <nav class="navbar navbar-default row-no-padding">
                <%--<div class="nav-mobile"><a id="nav-toggle" href="#!"><span></span></a></div>--%>
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                </div>


                <div class="collapse navbar-collapse ex3 navpriorscrolling navigation grad3 wid100menu" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li><a href="DashBoardNew.aspx" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-dashboard"></span>&nbsp;DashBoard</a></li>
                        <%--<li><a href="OrdernCircular.aspx" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Orders/Circulars</a></li>
                         
                         
                                                   
                          <li><a href="Policies.aspx" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>--%>   <%-- <ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Employee HandBook</span></a></li>
                                </ul>--%>
                        <%-- </li>--%>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: Black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-file"></span>
                            &nbsp;Documents <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">

                                <li><a href="OrdernCircular.aspx"><span style="color: #000000">Orders/Circulars</span></a></li>
                                <li><a href="Policies.aspx"><span style="color: #000000">Policies</span></a></li>

                            </ul>
                        </li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-wrench"></span>&nbsp;Trainings <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <%--<li><a href="#"><span style="color: #000000">Orders/Circulars</span></a></li>--%>
                                <li><a href="#"><span style="color: #000000">Training Materials/Videos</span></a></li>
                            </ul>
                        </li>
                        <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                        <li><a href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-calendar"></span>&nbsp;Events and Awards</a></li>
                        <%-- <li><a href="#" style="color:Black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-road"></span>&nbsp;Careers </a></li>--%>
                        <%-- <li><a href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-globe"></span> &nbsp;Forum</a></li>--%>

                        <%-- <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-certificate"></span>&nbsp;Welfares<span class="caret"></span></a>
                                <ul class="dropdown-menu grad3">
                                     <ul class="nav nav-list">
                                        <li><a href="#"><span style="color: #000000">Associations</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Harassments</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Medical</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Sports</span></a></li>
                                    </ul>
                                </ul>
                            </li>--%>

                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-cog"></span>&nbsp;Miscellaneous<span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <ul class="nav nav-list">
                                    <li><a href="RNFrequencySchedule.aspx"><span style="color: #000000">RN/Frequency Schedule</span></a></li>
                                    <%--<li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>--%>
                                </ul>
                            </ul>
                        </li>
                        <li><a href="utilityDownload.aspx" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-download-alt"></span>
                            &nbsp;Downloads</a></li>
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-upload"></span>&nbsp;Upload <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
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
                        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color: black; font-size: 11.5px; font-weight: bold"><span class="glyphicon glyphicon-user"></span>&nbsp;My Account <span class="caret"></span></a>
                            <ul class="dropdown-menu grad3">
                                <li><a href="myprofile.aspx"><span style="color: #000000">My Profile</span></a></li>
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div id="main" class="content gradbody containerh">
        <div class="row" style="padding: 10px 0px 0px 0px; margin: auto;">
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 30px;">
                <asp:Label ID="Label16" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label17" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
                <br />
                <br />
            </div>
        </div>
        <div class="row" style="margin: auto">
            <div id="Div1" runat="server" align="right" style="padding-right: 30px;">
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4" CausesValidation="False"
                    OnClick="btnback_Click">
                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-chevron-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>
                <br />
                <br />
            </div>
            <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="divyear">
            </div>
            <div align="center" class="col-md-6 col-sm-6 col-lg-6" runat="server" id="div3" style="padding-left: 10px; padding-right: 10px;">
                <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 4px; padding-bottom: 4px">
                    <asp:Label ID="Label4" runat="server" Text="Add Quotes" class="font2" Style="font-weight: bold; color: Black;"></asp:Label>
                    &nbsp;
                </div>
                <table class="table table-bordered grad2">
                    <tr>
                        <td align="right" style="padding-right: 30px">
                            <asp:Label ID="lblmsg" runat="server" Text="Motivational Quote" Style="font-weight: bold;"
                                class="font2"></asp:Label>
                            &nbsp;
                        </td>
                        <td align="left" style="padding-left: 15px">
                            <asp:TextBox ID="txtmsg" class="select widthofboxes" Height="75px" runat="server"
                                TextMode="MultiLine">
                            </asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvtitle" runat="server" ErrorMessage="Motivational Quote Required!!"
                                ControlToValidate="txtmsg" ForeColor="Red" SetFocusOnError="True" Style="font-size: small; font-weight: 700;"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revtitle" runat="server" ErrorMessage="Motivational Quote can not exceed the 350 letters!!"
                                Style="color: #FF0000; font-weight: 700;" ControlToValidate="txtmsg" ValidationExpression="^[\s\S\d]{1,350}$"
                                Display="Dynamic" SetFocusOnError="True">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="padding-right: 30px">
                            <asp:Label ID="Label8" runat="server" Text="Author" Style="font-weight: bold;" class="font2"></asp:Label>
                            &nbsp;
                        </td>
                        <td align="left" style="padding-left: 15px">
                            <asp:TextBox ID="TextBox1" class="select widthofboxes" Height="22px" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter the Name of Author!!"
                                ControlToValidate="TextBox1" ForeColor="Red" SetFocusOnError="True" Style="font-size: small; font-weight: 700;"
                                Display="Dynamic">
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Author's Name can not exceed the 70 letters!!"
                                Style="color: #FF0000; font-weight: 700;" ControlToValidate="TextBox1" ValidationExpression="^[\s\S\d]{1,70}$"
                                Display="Dynamic" SetFocusOnError="True">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="padding-right: 10px">
                            <asp:Button ID="btnadd" runat="server" Text="Add" class="btn" Style="background-color: #99FFCC; color: Black; font-weight: bold"
                                Width="90px" OnClick="btnadd_Click" />
                        </td>
                        <td align="left" style="padding-left: 10px">
                            <asp:Button ID="btncncl" runat="server" Text="Cancel" class="btn select gradbody button111"
                                Style="color: Black; font-weight: bold" Width="90px" CausesValidation="False"
                                OnClick="btncncl_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div4">
            </div>
        </div>
        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto">
            <div align="center" class="col-md-3 col-sm-2 col-lg-2" runat="server" id="div6">
            </div>
            <div align="center" class="col-md-6 col-sm-8 col-xs-12 col-lg-8" style="padding-left: 30px; padding-right: 25px;"
                runat="server" id="div7">
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="font-weight: bold; color: Black" class="font2">:: Motivational Quotes ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <div style="text-align: center">
                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn gradbody"
                                CausesValidation="False" OnClick="btnprint1_Click">
                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                            <br />
                            <br />
                        </div>
                        <asp:GridView ID="grdmsg" runat="server" DataKeyNames="Qid" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="20" HeaderStyle-Font-Bold="true" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="92%"
                            RowStyle-Wrap="true" OnRowDataBound="grdmsg_RowDataBound" OnRowCommand="grdmsg_RowCommand"
                            OnPageIndexChanging="grdmsg_PageIndexChanging" ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px">
                            <alternatingrowstyle backcolor="White" />
                            <columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="8%">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Motivational Quote" ItemStyle-Width="70%">
                                    <itemtemplate>
                                        <div style="padding: 8px">
                                            <asp:Label ID="lnkmsg" class="font2" ForeColor="Black" runat="server" Text='<%#Eval("Quote") %>'
                                                Font-Bold="True" CausesValidation="False" />
                                            <br />
                                            <span style="color: #717D7E">-</span>
                                            <asp:Label ID="lblauthor" class="groucho" ForeColor="#717D7E" runat="server" Text='<%#Eval("Author") %>'
                                                Font-Size="Smaller" />
                                            <span style="color: #717D7E">-</span>
                                            <br />
                                            <asp:Label ID="Label2" runat="server" Text="Upload-On" Font-Size="X-Small" ForeColor="Gray" />
                                            <asp:Label ID="Label5" runat="server" Text=" : " Font-Size="X-Small" ForeColor="Gray" />
                                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("Createdon") %>' Font-Size="X-Small"
                                                ForeColor="Gray" />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="Edited On" Font-Size="X-Small" ForeColor="Gray" />
                                            <asp:Label ID="Label6" runat="server" Text=" : " Font-Size="X-Small" ForeColor="Gray" />
                                            <asp:Label ID="Label7" runat="server" Text='<%#Eval("UpdatedOn") %>' Font-Size="X-Small"
                                                ForeColor="Gray" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Show On Dashboard" ItemStyle-Width="10%">
                                    <%--   <EditItemTemplate>
                                            <asp:CheckBox ID="chkverify" runat="server" 
                                                Checked='<%# Bind("showondashboard") %>' Font-Bold="True" Font-Size="XX-Small" 
                                                ForeColor="Black" Text="  Checked to Display Msg." Visible="False" />
                                        </EditItemTemplate>--%>
                                    <itemtemplate>
                                        <%--<asp:CheckBox ID="chkverify1" runat="server" Text="Checked to Display Msg." Font-Size="XX-Small"
                                                Font-Bold="True" ForeColor="Black" Visible="False" Checked='<%# Bind("Show") %>' />--%>
                                        <%-- <asp:DropDownList ID="ddlshow" runat="server" CssClass="select" Visible="false">
                                                <asp:ListItem Value="1">Yes</asp:ListItem>
                                                <asp:ListItem Value="0">No</asp:ListItem>
                                            </asp:DropDownList>--%>
                                        <asp:Label ID="lblshwmsg" runat="server" Visible="true" Text='<%#Eval("Show") %>'></asp:Label>
                                        <itemstyle horizontalalign="Center"></itemstyle>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit/Delete" ItemStyle-Width="12%">
                                    <itemtemplate>
                                        <asp:LinkButton ID="lnkedit" CommandName="msgEdit" runat="server"
                                            CausesValidation="false" CssClass="btn btn-primary" ToolTip="Edit">
                                            <span align="center">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkdelete" CommandName="msgDelete"
                                            runat="server" CausesValidation="false" CssClass="btn btn-danger" ToolTip="Delete"
                                            OnClientClick="return confirm('Are you sure to delete?');">
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
                            <footerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" />
                            <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" horizontalalign="Center"
                                cssclass="centerHeaderText fontingrid" wrap="True"></headerstyle>
                            <pagersettings position="TopAndBottom" />
                            <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                borderwidth="2" />
                            <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                verticalalign="Middle" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div align="center" class="col-md-2 col-sm-2 col-lg-2" runat="server" id="div9">
            </div>
        </div>
    </div>
</asp:Content>
