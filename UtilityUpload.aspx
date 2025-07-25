<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UtilityUpload.aspx.cs"
    Inherits="PrasarNet.UtilityUpload" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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
                if ($(window).scrollTop() >= $("header").height() + 23) {
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
                                    <%--   <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>   --%>
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
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 35px;">
                <asp:Label ID="Label16" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label17" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
            </div>
        </div>
        <div class="row" style="padding-right: 20px; margin: auto;">
            <div id="Div2" class="col-md-12 col-sm-12 col-xs-12 col-lg-12" runat="server" align="right">
                <br />
                <asp:LinkButton ID="btnback" Style="background-color: #99FFCC" runat="server" CssClass="btn grad4" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px"
                    CausesValidation="False" OnClick="btnback_Click">
                    <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-home"></span>&nbsp; <span style="font-weight: bold; color: #000000">Home</span></asp:LinkButton>
                <br />
                <br />
            </div>
        </div>
        <div class="row" id="divsearch" runat="server" style="margin: auto;">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1">
            </div>
            <div align="center" class="col-md-10 col-sm-10 col-lg-10" runat="server" id="div3" style="padding-left: 30px; padding-right: 25px;">
                <div class="table-hover table">
                    <div id="Div8" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 4px">
                        <asp:Label ID="Label4" runat="server" Text="Utilities Upload" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                        &nbsp;
                    </div>
                    <table class="table table-bordered grad2">
                        <tr>
                            <td align="right" style="padding-right: 30px; width: 35%">
                                <asp:Label ID="lbldoctype" runat="server" Text="Category" Style="font-weight: bold;"
                                    class="font2"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px; width: 65%">
                                <asp:DropDownList ID="ddlutilitytype" runat="server" AutoPostBack="false" class="select widthofboxes1"
                                    Height="28px" Width="90%" Font-Bold="true" Font-Size="Small" AppendDataBoundItems="true">
                                </asp:DropDownList>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtyear"
                                        Display="Dynamic" ErrorMessage="Pl. Fill the Year" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtyear"
                                        Display="Dynamic" ErrorMessage="Pl. Enter a Valid Year" ForeColor="Red" ValidationExpression="\d{4}"></asp:RegularExpressionValidator>--%>
                                <asp:RequiredFieldValidator ID="rfvuttype" runat="server" ControlToValidate="ddlutilitytype"
                                    Display="Dynamic" ErrorMessage="*" ForeColor="Black" SetFocusOnError="True"
                                    class="font" Font-Bold="true" Font-Size="Small">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 30px; width: 35%">
                                <asp:Label ID="lbltitle" runat="server" Text="Title/Subject" Style="font-weight: bold;"
                                    class="font2"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 15px; width: 65%">
                                <asp:TextBox ID="txttitle" runat="server" class="select widthofboxes1" Height="100px" Width="90%" Font-Bold="true" Font-Size="Small"
                                    TextMode="MultiLine">
                                </asp:TextBox>
                                <ajaxtoolkit:filteredtextboxextender id="FilteredTextBoxExtender72" runat="server"
                                    targetcontrolid="txttitle" validchars="1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@#+_-)(&%$!|\}{] [/?';:,.">
                                </ajaxtoolkit:filteredtextboxextender>

                                <asp:RequiredFieldValidator ID="rfvtitle" runat="server" ErrorMessage="*"
                                    ControlToValidate="txttitle" ForeColor="Black" SetFocusOnError="True" Style="font-size: small" Font-Bold="true" Font-Size="Small"
                                    class="font" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <br />
                                <asp:RegularExpressionValidator ID="revtitle" runat="server" ErrorMessage="Title can not exceed the 200 Letters!!" Font-Bold="true" Font-Size="Small"
                                    Style="color: Black" ControlToValidate="txttitle" ValidationExpression="^[\s\S\d]{1,200}$"
                                    Display="Dynamic" class="font">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 30px; width: 35%">
                                <asp:Label ID="lblcal" runat="server" Text="Upload" Style="font-weight: bold;" class="font2"></asp:Label>
                                &nbsp;
                            </td>
                            <td align="left" style="padding-left: 10px; width: 65%">
                                <asp:FileUpload ID="FileUpload1" runat="server" class="select widthofboxes1" Height="28px" Font-Bold="true" Font-Size="Small" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="padding-right: 10px; width: 35%">
                                <asp:Button ID="btnupload" runat="server" Text="Upload" class="btn select " BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" width="140px"
                                    Style="background-color: #99FFCC; color: Black; font-weight: bold" OnClick="btnupload_Click" />
                            </td>
                            <td align="left" style="padding-left: 10px; width: 65%">
                                <asp:Button ID="btncncl" runat="server" Text="Cancel" class="btn select gradbody" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" width="140px"
                                    Style="color: Black; font-weight: bold" CausesValidation="False" OnClick="btncncl_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1">
            </div>
        </div>
        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto;">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div5">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-xs-12 col-lg-10" runat="server"
                id="div6" style="padding-left: 30px; padding-right: 25px;">
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="font-weight: bold; color: Black" class="font2">:: Uploaded Utilites/Forms
                            ::</span>
                    </div>
                    <div class="panel-body  grad2 table-responsive" align="center">
                        <div style="text-align: center">
                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn gradbody" CausesValidation="False" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px" width="140px"
                                OnClick="btnprint1_Click">
                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                            <br />
                            <br />
                        </div>
                        <asp:GridView ID="grdutility" runat="server" DataKeyNames="fileid" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="15" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                            HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="90%"
                            OnPageIndexChanging="grdutility_PageIndexChanging" OnRowCommand="grdutility_RowCommand"
                            OnRowDeleted="grdutility_RowDeleted" OnRowDeleting="grdutility_RowDeleting" OnRowEditing="grdutility_RowEditing"
                            ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px">
                            <alternatingrowstyle backcolor="White" />
                            <columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="10%">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title/Subject" ItemStyle-Width="70%">
                                    <itemtemplate>
                                        <div style="padding: 10px">
                                            <asp:LinkButton ID="lnktitle" runat="server" ForeColor="Blue" CommandName="Download" Font-Underline="false"
                                                Text='<%#Eval("Sub") %>' class="font2" Font-Bold="True" CausesValidation="False" />
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="(" Font-Size="X-Small" />
                                            <asp:Label ID="lbldoctypename" Font-Italic="true" runat="server" Text='<%#Eval("utilityname") %>'
                                                Font-Size="X-Small" />
                                            <asp:Label ID="Lbbrac" runat="server" Text=")" Font-Size="X-Small" />
                                            <br />
                                            <asp:Label ID="Label2" Font-Italic="true" runat="server" Text="Uploaded On" Font-Size="X-Small" />
                                            <asp:Label ID="Label5" Font-Italic="true" runat="server" Text=" - " Font-Size="X-Small" />
                                            <asp:Label ID="Label3" Font-Italic="true" runat="server" Text='<%#Eval("createdon", "{0:dd-MMM-yyyy}") %>'
                                                Font-Size="X-Small" />
                                            <br />
                                            <asp:Label ID="Label6" Font-Italic="true" runat="server" Text="Last Updated On" Font-Size="X-Small" />
                                            <asp:Label ID="Label7" Font-Italic="true" runat="server" Text=" - " Font-Size="X-Small" />
                                            <asp:Label ID="Label8" Font-Italic="true" runat="server" Text='<%#Eval("lastupdatedon", "{0:dd-MMM-yyyy}") %>'
                                                Font-Size="X-Small" />
                                            <asp:Label ID="lblfileid" runat="server" Text='<%#Eval("fileid") %>' Visible="false"
                                                Font-Size="Smaller" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit" ItemStyle-Width="20%">
                                    <itemtemplate>
                                        <asp:LinkButton ID="imgedit" CommandName="Edit" runat="server" CausesValidation="false"
                                            CssClass="btn btn-primary" ToolTip="Edit">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
                                            <span style="font-weight: bold; color: #000000"></span>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="Imgdelete" CommandName="Delete" runat="server" CausesValidation="false" Visible="true"
                                            CssClass="btn btn-danger" ToolTip="Delete" OnClientClick="return confirm('Are you sure to delete?');">
                                            <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-trash"></span>
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
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div7">
            </div>
        </div>
    </div>
</asp:Content>
