<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shared_Documents.aspx.cs" Inherits="PrasarNet.PBB_Members.Shared_Documents" MasterPageFile="~/Site1.Master" EnableEventValidation="false" %>

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
        .visible-md-block {
            display: block !important;
        }

        .container1 {
            min-height: 500px;
        }

        .grad2 {
            /* background-color: red; /* For browsers that do not support gradients */
            /*background-image: linear-gradient(90deg, orange, yellow);  /*Standard syntax (must be last) */
            /*background: radial-gradient(#F9FBE7, #FFF3E0);*/
            background: linear-gradient(to right, #CACFD2, #E67E22);
            -webkit-radial-gradient;
        }

        .grad4 {
            background: radial-gradient(#CACFD2, #E67E22);
            -webkit-radial-gradient;
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

                    <asp:Label ID="Label5" runat="server" class="fontheader" ForeColor="Blue" Font-Bold="true" Text="(प्रसार नेट)"></asp:Label>

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
        <div id="BoardMembersMenu" visible="true" runat="server" class="sticky">
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
                        <li><a href="../PBB_Members/Members_LogOut.aspx" style="color: Black; font-size: 11.5px; font-weight: bold">
                            <span class="glyphicon glyphicon-off"></span>&nbsp;LogOut</a></li>
                        <%-- <li><a href="Logout.aspx" id="lgout" style="color: #000000" runat="server">LogOut</a></li>--%>
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
        <div id="divgrd" runat="server" visible="true" class="row" style="margin: auto; padding-top: 30px; padding-bottom: 50px">
            <div align="center" class=" col-md-1 col-sm-1 col-lg-1" runat="server" id="div5">
            </div>
            <div align="center" class=" col-md-10 col-sm-10 col-xs-12 col-lg-10" runat="server"
                id="div6" style="padding-left: 30px; padding-right: 25px;">
                <div class="panel panel-primary">
                    <div class="panel-heading grad3">
                        <span style="color: Black; font-weight: 700" class="font2">Shared Prasar Bharati Board Meeting Document(s)</span>
                    </div>

                    <div class="panel-body grad2 table-responsive">
                        <div style="text-align: center">
                            <br />
                            <asp:LinkButton ID="btnprint1" runat="server" CssClass="btn gradbody" CausesValidation="False" OnClick="btnprint1_Click">
                                <span aria-hidden="true" style="color: Black" class="glyphicon glyphicon-print"></span>&nbsp;
                    <span style="font-weight: bold; color: #000000">Print</span></asp:LinkButton>
                            <br />
                            <br />
                            <br />
                        </div>

                        <%--<asp:Label ID="Label16" Font-Bold="true" ForeColor="Blue" Font-Size="Small" runat="server" Text="* For some Documents, Direct view may be sluggish, due to their large size."></asp:Label>--%>
                        <asp:Label ID="Label16" Font-Bold="true" ForeColor="Blue" Font-Size="Small" runat="server" Text="* View facility is restricted to pdf files,only. "></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="grddoc" runat="server" DataKeyNames="otherdocid" AutoGenerateColumns="false"
                            AllowPaging="true" PageSize="25" HeaderStyle-BackColor="#61A6F8" HeaderStyle-Font-Bold="true"
                            HeaderStyle-ForeColor="White" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"
                            EmptyDataText=".. Records Not Found .." ShowHeaderWhenEmpty="True" Width="85%"
                            ForeColor="#333333" BorderStyle="Solid" BorderWidth="2px" OnPageIndexChanging="grddoc_PageIndexChanging" OnRowCommand="grddoc_RowCommand" OnRowDataBound="grddoc_RowDataBound">
                            <alternatingrowstyle backcolor="White" />
                            <columns>
                                <asp:TemplateField HeaderText="S.No.">
                                    <itemtemplate>
                                        <asp:Label ID="lblSNo" Font-Size="Medium" Font-Bold="true" runat="server" Text='<%#Container.DataItemIndex+1 %>' />
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Shared Document(s) Information">
                                    <itemtemplate>
                                        <div style="padding: 10px">
                                            <asp:Label ID="Label3" runat="server" Text="Subject" class="font2" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label4" runat="server" Text=": " class="font2" Font-Bold="true" />
                                            <asp:Label ID="lnktitle" runat="server" ForeColor="Black"
                                                Font-Underline="false" Text='<%#Eval("Title") %>' class="font2" Font-Bold="True"
                                                CausesValidation="False" />
                                            <br />
                                            <asp:Label ID="Label9" runat="server" Text=" File Extension" Font-Size="10pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label12" runat="server" Text=": " Font-Size="10pt" Font-Bold="true" />
                                            <asp:Label ID="Label13" runat="server" ForeColor="Black"
                                                Font-Underline="false" Text='<%#Eval("Docextension") %>' Font-Size="9pt" Font-Bold="True" Font-Italic="true"
                                                CausesValidation="False" />
                                            <br />
                                            <asp:Label ID="lbluplon" runat="server" Text="Shared On" Font-Size="10pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="lbluplon1" runat="server" Text=": " Font-Size="9pt" Font-Bold="true" />
                                            <asp:Label ID="lbluplon2" Font-Italic="true" runat="server" Text='<%#Eval("sharedon", "{0:dd-MMM-yyyy}")%>'
                                                Font-Size="9pt" Font-Bold="true" ForeColor="Black" />
                                            <%--<br />--%>
                                            <%-- <asp:Label ID="Label24" runat="server" Text="Category" Font-Size="10pt" Font-Bold="true" 
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label25" runat="server" Text=": " Font-Size="9pt" Font-Bold="true" />
                                            <asp:Label ID="Label26" Font-Italic="true" runat="server" Text='<%#Eval("Category") %>'
                                                Font-Size="9pt" Font-Bold="true" />--%>
                                            <%-- <br />--%>
                                            <%--       <asp:Label ID="Label5" runat="server" Text="Document-Type" Font-Size="10pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label7" runat="server" Text=": " Font-Size="9pt" Font-Bold="true" />
                                            <asp:Label ID="Label8" Font-Italic="true" runat="server" Text='<%#Eval("DocumentType") %>'
                                                Font-Size="9pt" Font-Bold="true" />--%>
                                            <br />
                                            <asp:Label ID="lblfile" Font-Italic="true" Visible="false" runat="server" Text='<%#Eval("filename") %>' Font-Size="8pt" Font-Bold="true" />

                                            <asp:Label ID="lblext" Font-Italic="true" Visible="false" runat="server" Text='<%#Eval("Docextension") %>' Font-Size="8pt" Font-Bold="true" />

                                            <%--  <asp:Label ID="Label3" runat="server" Text="Document-Extension" Font-Size="9pt" Font-Bold="true"
                                                ForeColor="Maroon" />
                                            <asp:Label ID="Label9" runat="server" Text=": " Font-Size="8pt" Font-Bold="true" />
                                            <asp:Label ID="Label16" Font-Italic="true" runat="server" Text='<%#Eval("Docextension") %>'
                                                Font-Size="8pt" Font-Bold="true" />--%>
                                        </div>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Left" />
                                    <headerstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Shared by">
                                    <itemtemplate>
                                        <asp:Label ID="Label11" Font-Bold="true" ForeColor="Black" runat="server" Text='<%#Eval("sharedby") %>'
                                            class="fontingrid" />
                                        <%--Text='<%# Eval("tDate", "{0:dd-MMM-yyyy}") %>'--%>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View">
                                    <itemtemplate>
                                        <asp:LinkButton ID="lnkviewdownload" CommandName="Download" runat="server" Font-Bold="true" BackColor="#99FFCC" CssClass="btn font2" ForeColor="Black"
                                            CausesValidation="False" Text="View">
                                        </asp:LinkButton>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Download">
                                    <itemtemplate>
                                        <asp:LinkButton ID="lnkdownload" CommandName="Download2" runat="server" Font-Bold="true" BackColor="#F1948A" CssClass="btn font2" ForeColor="Black"
                                            CausesValidation="False" Text="Download">
                                        </asp:LinkButton>
                                    </itemtemplate>
                                    <itemstyle horizontalalign="Center" />
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
    <br />
    <br />
</asp:Content>
