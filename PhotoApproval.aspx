<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoApproval.aspx.cs"
    Inherits="PrasarNet.PhotoApproval" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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

        .modal {
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            background-color: black;
            z-index: 100;
            opacity: 0.8;
            filter: alpha(opacity=60);
            -moz-opacity: 0.8;
            min-height: 100%;
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
    <script type="text/javascript">
        function LoadDiv(url) {
            var img = new Image();
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            var imgLoader = document.getElementById("imgLoader");
            imgLoader.style.display = "block";
            img.onload = function () {
                imgFull.src = img.src;
                imgFull.style.display = "block";
                imgLoader.style.display = "none";
            };
            img.src = url;
            var width = document.body.clientWidth;
            if (document.body.clientHeight > document.body.scrollHeight) {
                bcgDiv.style.height = document.body.clientHeight + "px";
            }
            else {
                bcgDiv.style.height = document.body.scrollHeight + "px";
            }
            imgDiv.style.left = (width - 650) / 2 + "px";
            imgDiv.style.top = "20px";
            bcgDiv.style.width = "100%";

            bcgDiv.style.display = "block";
            imgDiv.style.display = "block";
            return false;
        }
        function HideDiv1() {
            var bcgDiv = document.getElementById("divBackground");
            var imgDiv = document.getElementById("divImage");
            var imgFull = document.getElementById("imgFull");
            if (bcgDiv != null) {
                bcgDiv.style.display = "none";
                imgDiv.style.display = "none";
                imgFull.style.display = "none";
            }
        }
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

                    <asp:Label ID="Label4" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="(प्रसार नेट)"></asp:Label>

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
    <div class="row" style="margin: auto;">
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
                        <%-- <li><a href="OrdernCircular.aspx" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-list-alt"></span>
                                &nbsp;Orders/Circulars</a></li>
                         
                         
                                                   
                          <li><a href="Policies.aspx" style="color:black; font-size:11.5px;font-weight:bold"><span class="glyphicon glyphicon-lock"></span>&nbsp;Policies</a>  --%> <%-- <ul class="dropdown-menu">
                                      <li><a href="#"><span style="color: #000000">Admin</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Finance</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Human Resource</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Security</span></a></li>
                                        <li><a href="#"><span style="color: #000000">Employee HandBook</span></a></li>
                                </ul>--%>
                        <%--</li>--%>

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
                                    <%--         <li><a href="#"><span style="color: #000000">Resource Bookings</span></a></li>  --%>
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
        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto">
            <div id="Div1" runat="server" align="right" style="padding-right: 30px; padding-bottom: 15px; padding-bottom: 15px; margin: auto">
                <asp:LinkButton ID="btnback" runat="server" CssClass="btn grad4"
                    CausesValidation="False" OnClick="btnback_Click"> <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-chevron-left"></span>&nbsp; <span style="font-weight: bold; color: #000000">Back</span></asp:LinkButton>

            </div>
            <div align="center" class="col-md-1 col-sm-1 col-lg-1" runat="server" id="div5">
            </div>
            <div align="center" class="col-md-10 col-sm-10 col-lg-10" runat="server" id="div6">
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="color: Black; font-weight: bold;" class="font2">:: Select Photos to be on Shown on
                            Slider ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <div style="text-align: center">
                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn gradbody"
                                CausesValidation="False" OnClick="btnprint1_Click"> <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                            <br />
                            <br />
                        </div>
                        <asp:GridView ID="grdgallery" DataKeyNames="PicId" runat="server" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="20" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="85%"
                            OnRowCommand="grdgallery_RowCommand" OnPageIndexChanging="grdgallery_PageIndexChanging"
                            OnRowDataBound="grdgallery_RowDataBound" ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px">
                            <alternatingrowstyle backcolor="White" />
                            <columns>
                                <asp:TemplateField HeaderText="S.No." ItemStyle-Width="5%">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Uploaded By">
                                    <itemtemplate>
                                        <div style="padding: 8px" align="center">
                                            <asp:Label ID="lblsecstn" runat="server" class="font" Text='<%#Eval("stn_sec") %>' />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject/Description">
                                    <itemtemplate>
                                        <div style="padding: 8px" align="left">
                                            <asp:Label ID="Label2" runat="server" class="font2" Text="Title" ForeColor="Brown" Font-Bold="True" />
                                            <asp:Label ID="Label4m" class="font2" ForeColor="Brown" Font-Bold="True" runat="server"
                                                Text=":" />
                                            &nbsp;
                                            <asp:Label ID="lblsub" runat="server" class="font2" Text='<%#Eval("Sub") %>' ForeColor="Black" Font-Bold="True" />
                                            <br />
                                            <asp:Label ID="Label12" class="font2" ForeColor="Brown" Font-Bold="True" runat="server"
                                                Text="Sub-Title" />
                                            <asp:Label ID="Label13" class="font2" ForeColor="Brown" Font-Bold="True" runat="server"
                                                Text=":" />
                                            &nbsp;
                                            <asp:Label ID="Label18" class="font" ForeColor="Black" Font-Bold="True" runat="server"
                                                Text='<%#Eval("category") %>' />
                                            <br />

                                            <asp:Label ID="Label3" runat="server" class="font2" Text="Description" ForeColor="Brown" Font-Bold="True" />
                                            <asp:Label ID="Label4mk" class="font2" ForeColor="Brown" Font-Bold="True" runat="server"
                                                Text=":" />
                                            &nbsp;
                                            <asp:Label ID="Label1" runat="server" class="font" ForeColor="Black" Font-Bold="True" Text='<%#Eval("PicDescription") %>' />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Photo">
                                    <itemtemplate>
                                        <div style="padding: 8px" align="center">
                                            <asp:ImageButton ID="Image1" Height="110" Width="110" runat="server" ImageUrl='<%#Eval("imagepath") %>'
                                                CausesValidation="False" OnClientClick="return LoadDiv(this.src);" ClientIDMode="Static" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Show On Dashboard" ItemStyle-Width="10%">
                                    <%--   <EditItemTemplate>
                                            <asp:CheckBox ID="chkverify" runat="server" 
                                                Checked='<%# Bind("showondashboard") %>' Font-Bold="True" Font-Size="XX-Small" 
                                                ForeColor="Black" Text="  Checked to Display Msg." Visible="False" />
                                        </EditItemTemplate>--%>
                                    <itemtemplate>
                                        <div style="padding: 8px" align="center">
                                            <asp:CheckBox ID="chkverify1" runat="server" Text="Checked to Display on Photoslider."
                                                Font-Bold="True" ForeColor="Black" Visible="False" Checked='<%# Bind("Pic_tobe_Display") %>' Font-Size="X-Small" />
                                            <asp:Label ID="lblshwmsg" runat="server" Visible="true" class="font2" Text='<%#Eval("show") %>'></asp:Label>
                                            <itemstyle horizontalalign="Center"></itemstyle>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Approve" ItemStyle-Width="15%">
                                    <itemtemplate>
                                        <div style="padding: 8px" align="center">
                                            <asp:LinkButton ID="lnkedit" CommandName="msgEdit" runat="server" CausesValidation="false"
                                                CssClass="btn btn-primary" ToolTip="Edit">
                                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-pencil"></span>
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
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                            </columns>
                            <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                wrap="True" font-size="Small" verticalalign="Middle" horizontalalign="Center"></headerstyle>
                            <rowstyle backcolor="White" font-bold="True" height="30px" horizontalalign="Center"
                                verticalalign="Middle" />
                            <pagersettings position="TopAndBottom" />
                            <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                borderwidth="2" />
                            <footerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" />

                            <rowstyle backcolor="#EFF3FB" font-bold="True" height="30px" horizontalalign="Center"
                                verticalalign="Middle" />
                        </asp:GridView>
                    </div>
                </div>
            </div>
            <div align="center" class="col-md-1 col-sm-1 col-lg-1" runat="server" id="div3">
            </div>
        </div>
        <div id="divBackground" class="modal">
        </div>
        <div id="divImage" class="divImage" align="center">
            <table style="height: 100%; width: 100%">
                <tr>
                    <td valign="middle" align="center">
                        <asp:Image ID="imgLoader" runat="server" AlternateText="Loading...." ImageUrl="images/Loading1.gif"
                            class="img-responsive" ClientIDMode="Static" />
                        <asp:Image ID="imgFull" runat="server" AlternateText="...No Image..." ImageUrl=""
                            class="img-responsive" ClientIDMode="Static" />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <input id="btnClose" type="button" value="X Close" onclick="HideDiv1()" class="btn select button111"
                            style="color: Black; font-weight: bold; background-color: #D6DBDF" width="90px" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
