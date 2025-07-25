<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RR_Reports_Ministry.aspx.cs" Inherits="PrasarNet.R_Roster.RR_Reports_Ministry" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <%--link of style sheet--%>
    <link rel="stylesheet" href="../style/responsive.css" type="text/css" media="screen" />
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js"></script>
    <style type="text/css">
        #main {
            transition: margin-left .5s;
            padding: 16px;
        }


        .grad2 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        #block_container {
            text-align: center;
        }

            #block_container > div {
                display: inline-block;
                vertical-align: middle;
            }

        .grad4 {
            background: radial-gradient(#CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .grad5 {
            background: linear-gradient(to right, #F5DA81, #D8D8D8);
            min-height: 100px;
        }
    </style>
    <script type='text/javascript' src='https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js'></script>
    <script type='text/javascript'>
        function preventBack() { window.history.forward(); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
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

        })(jQuery);

        (function ($) {

            $(document).width(function (e) {
                if ($(document).width() <= 768) {
                    document.getElementById("lnksearch").style.display = "none"
                    document.getElementById("lblsearchw").style.visibility = 'visible'

                } else {
                    document.getElementById("lnksearch").style.visibility = "visible"
                    document.getElementById("lblsearchw").style.visibility = 'none'
                }

            });

        })(jQuery);
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MenuContent" runat="server">
    <div id="Div9" class="row gradhead" runat="server" style="margin: auto">
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
    <div id="Div10" class="row row-no-padding" style="margin: auto" runat="server">
        <div id="RRMinistryMenu" visible="true" runat="server" class="sticky">
            <nav class="navbar navbar-default row-no-padding">
                <%--nav and nav default hav a default magin and padding--%>
                <div class="navbar-header grad3">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar1">
                        <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                    </button>
                    <%-- <a class="navbar-brand" href="#">WebSiteName</a>--%>
                </div>
                <%--    oiwqepiepqiep--%>

                <div class="collapse navbar-collapse ex3_2 navpriorscrolling navigation grad3 wid100menu" id="myNavbar1">
                    <ul class="nav navbar-nav">
                        <li><a href="../R_Roster/M_Logout.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-off"></span>&nbsp;LogOut</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentSection" runat="server">
    <div class="content gradbody">
        <div class="row" style="padding: 10px 0px 0px 0px; margin: auto">
            <div class="col-lg-12 col-md-12 sm-12 xs-12" style="padding-left: 25px; padding-right: 35px;">
                <asp:Label ID="Label1" class="font2 pull-right captalisefirstLetter" ForeColor="Black"
                    Font-Bold="true" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label2" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server"><span>&nbsp;</span></asp:Label>
                <asp:Label ID="Label15" class="font pull-right" ForeColor="Black" Font-Bold="true"
                    runat="server" Text="Welcome"></asp:Label>
            </div>
        </div>

        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto">
            <div align="center" class=" col-md-3 col-sm-3 col-lg-3" runat="server" id="div5">
                <div id="divsearch2" class="table-responsive grad5 table-hover" runat="server" visible="true"
                    style="padding: 20px">
                    <div id="Div2" runat="server" align="center" class="grad3" style="padding-top: 8px; padding-bottom: 8px">
                        <asp:Label ID="Label4" runat="server" Text="Search Document" Style="font-weight: bold; font-size: medium; color: Black;"></asp:Label>
                        &nbsp;
                    </div>
                    <table class="table table-bordered grad2">
                        <tr runat="server">
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="Label3" runat="server" Text="Wing" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:DropDownList ID="ddlwing" runat="server" AutoPostBack="True" class="select widthofboxes" ValidationGroup="search"
                                    Height="28px" OnSelectedIndexChanged="ddlwing_SelectedIndexChanged">
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr runat="server">
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="Label7" runat="server" Text="Designation" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:DropDownList ID="ddldesgn" runat="server" AutoPostBack="True" class="select widthofboxes" ValidationGroup="search"
                                    Height="28px">
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lbldeptt" runat="server" class="font" Text="Department" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:DropDownList ID="ddldept" runat="server" AutoPostBack="True" class="select widthofboxes" ValidationGroup="search"
                                    Height="28px" OnSelectedIndexChanged="ddldept_SelectedIndexChanged">
                                </asp:DropDownList>
                                <%-- <br />--%>
                                <%--<asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="ddldept" ValidationGroup="search"
                                    Display="Dynamic" ErrorMessage="Pls. Select a Deptt." ForeColor="Red" SetFocusOnError="True"
                                    class="font" Style="font-size: small; font-weight: 700"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>

                        <tr runat="server">
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="lblsecstn" runat="server" Text="Section/Station/Office" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:DropDownList ID="ddlsection" runat="server" AutoPostBack="True" class="select widthofboxes" ValidationGroup="search"
                                    Height="28px">
                                </asp:DropDownList>
                                <%--<br />
                                <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="ddlsection" ValidationGroup="search"
                                    Display="Dynamic" ErrorMessage="Pls. Select a Deptt." ForeColor="Red" SetFocusOnError="True"
                                    class="font" Style="font-size: small; font-weight: 700"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td align="left" style="padding-right: 30px">
                                <asp:Label ID="Label8" runat="server" Text="Zone" class="font" ForeColor="Black"
                                    Style="font-weight: bold;"></asp:Label>
                                &nbsp;
                                <br />
                                <asp:DropDownList ID="ddlzone" runat="server" AutoPostBack="True" class="select widthofboxes" ValidationGroup="search"
                                    Height="28px">
                                </asp:DropDownList>

                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding-right: 10px">
                                <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn select buttondocumentupload" ValidationGroup="search"
                                    Style="background-color: #99FFCC; color: Black; font-weight: bold"
                                    ToolTip="Search" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" OnClick="btnsearch_Click" />

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btncncl" runat="server" BorderColor="Black" BorderStyle="Ridge" BorderWidth="2px" CausesValidation="False" class="btn select gradbody buttondocumentupload" OnClick="btncncl_Click" Style="color: Black; font-weight: bold" Text="Cancel" />

                            </td>
                        </tr>
                    </table>
                </div>

                <br />
                <br />
            </div>
            <div align="center" class=" col-md-9 col-sm-9 col-lg-9" runat="server" id="div6">

                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="font-size: medium; font-weight: bold; color: Black;">:: Documents ::</span>
                    </div>
                    <div class="panel-body grad2 table-responsive">
                        <%-- <div style="text-align: center">
                          
                        <asp:LinkButton ID="btnprint1" Style="background-color: #F1948A" runat="server" 
                                CssClass="btn" CausesValidation="False"> <span aria-hidden="true" style="color: Black"class="glyphicon glyphicon-print"></span>&nbsp; <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>                   
                        </div>--%>
                        <div class="row" id="divshow" runat="server" visible="false" style="margin: auto;">
                            <div style="padding-left: 50px" class="col-md-6 col-sm-6 col-xs-12 col-lg-6">
                                <asp:Label ID="Label5" Visible="false" runat="server" class="font2 pull-left" Text="Selected Document Type: "
                                    Style="font-weight: 700; font-family: 'Baskerville Old Face'; color: #800000"></asp:Label>
                                <asp:Label ID="lblcat" runat="server" Text="" class="font2 pull-left" Style="font-weight: 700; color: #800000; font-family: 'Baskerville Old Face'; background-color: #FFFFCC"></asp:Label>
                            </div>
                            <div style="padding-right: 50px" class="col-md-6 col-sm-6 col-xs-12 col-lg-6 pull-right">
                            </div>
                        </div>
                        <div runat="server" align="center">
                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn" CausesValidation="False"
                                Width="160px" BackColor="#F5B7B1" OnClick="btnprint1_Click" BorderColor="Black" BorderStyle="Ridge" BorderWidth="1px">
                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>
                                <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                        </div>
                        <br />
                        <asp:GridView ID="grddoc" runat="server" AutoGenerateColumns="false" AllowPaging="true"
                            DataKeyNames="rrid" PageSize="25" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                            HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="98%"
                            ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnPageIndexChanging="grddoc_PageIndexChanging" OnRowCommand="grddoc_RowCommand">
                            <%--  <AlternatingRowStyle BackColor="White" />--%>
                            <columns>
                                <asp:TemplateField HeaderText="S.No.">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" runat="server" Text='<%#Container.DataItemIndex+1 %>' ForeColor="Black" CssClass="fontingrid" />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Wing">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">

                                            <asp:Label ID="lblwing" runat="server" Font-Italic="true" Text='<%#Eval("Wing")  %>' CssClass="fontingrid"
                                                ForeColor="Black" Font-Bold="true" />

                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Designation">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <asp:Label ID="lbldesgn" Font-Italic="true" runat="server" Text='<%#Eval("DesignationName") %>'
                                                ForeColor="Black" class="fontingrid" Font-Bold="true" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <asp:Label ID="lbltitle" Font-Italic="true" runat="server" Text='<%#Eval("title") %>'
                                                ForeColor="Black" class="fontingrid" Font-Bold="true" />
                                            <asp:Label ID="lbldocname" Font-Italic="true" runat="server" Text='<%#Eval("doctitle") %>' Visible="false"
                                                ForeColor="Black" class="fontingrid" Font-Bold="true" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View">
                                    <itemtemplate>
                                        <asp:LinkButton ID="lnkviewdownload" CommandName="view" runat="server" Font-Bold="true" CssClass="btn font2" ForeColor="Blue" Font-Underline="true"
                                            CausesValidation="False" Text="View">
                                        </asp:LinkButton>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Download">
                                    <itemtemplate>
                                        <asp:LinkButton ID="lnkdownload" CommandName="download" runat="server" Font-Bold="true" ForeColor="Blue" Font-Underline="true" CssClass="btn font2"
                                            CausesValidation="False" Text="Download">
                                        </asp:LinkButton>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Information Given By">
                                    <itemtemplate>
                                        <div style="padding-left: 10px">
                                            <asp:Label ID="lblinfogivenby" Font-Italic="true" runat="server" Text='<%#Eval("InformationGivenBy") %>'
                                                ForeColor="Black" class="fontingrid" Font-Bold="true" />
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                            </columns>
                            <headerstyle backcolor="#E67E22" font-bold="True" forecolor="Black" cssclass="centerHeaderText fontingrid"
                                wrap="True"></headerstyle>
                            <rowstyle backcolor="White" font-bold="True" height="30px" horizontalalign="Center"
                                verticalalign="Middle" />
                            <pagersettings position="TopAndBottom" />
                            <pagerstyle backcolor="#E67E22" cssclass="cssPager pag" forecolor="White" font-size="Small"
                                horizontalalign="Left" verticalalign="Middle" font-bold="True" bordercolor="Black"
                                borderwidth="2" />
                        </asp:GridView>
                        <asp:Literal ID="ltEmbed" runat="server" />
                    </div>
                </div>
            </div>

        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>
